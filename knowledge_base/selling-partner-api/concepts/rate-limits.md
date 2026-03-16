---
title: SP-API Rate Limits
source: https://developer-docs.amazon.com/sp-api/docs/usage-plans-and-rate-limits
---

# SP-API Rate Limits

## Token Bucket 算法

SP-API 使用 **Token Bucket**（令牌桶）算法进行限流：

```
┌──────────────────────────────────────┐
│  Token Bucket                        │
│                                      │
│  [●][●][●][●][●][ ][ ][ ][ ][ ]     │
│   ↑ 当前可用 token                    │
│                                      │
│  Rate: 每秒补充 N 个 token            │
│  Burst: 桶最大容量 M 个 token         │
│  每次 API 调用消耗 1 个 token          │
└──────────────────────────────────────┘
```

- **Rate Limit**: 每秒补充的 token 数量
- **Burst Limit**: 桶的最大容量（可以短时间内突发请求）
- 每个 **Selling Partner + Application** 组合有独立的桶

## 限流响应

当 token 耗尽时，API 返回 **HTTP 429 Too Many Requests**。

### Rate Limit 响应头

```
x-amzn-RateLimit-Limit: 0.5
```

返回当前操作的 rate limit（每秒 token 数）。注意：
- 并非所有响应都包含此 Header
- 认证失败（401/403）通常不返回此 Header

## 两种 Usage Plan

| 类型 | 说明 | Rate 来源 |
|------|------|----------|
| **Standard Plan** | 固定速率，对所有调用者一致 | API 文档中标注 |
| **Dynamic Plan** | 根据卖家业务量自动调整 | 交易量、账号规模等 |

Dynamic Plan 的速率与**卖家业务量**正相关（订单量越大，限额越高），与历史 API 请求频率无关。

## 常见 API Rate Limit（参考值）

| API | Rate (req/s) | Burst |
|-----|-------------|-------|
| Orders - getOrders | 0.0167 | 20 |
| Orders - getOrder | 0.5 | 30 |
| Catalog - searchCatalogItems | 2 | 2 |
| Catalog - getCatalogItem | 2 | 2 |
| Listings - putListingsItem | 5 | 10 |
| Listings - patchListingsItem | 5 | 10 |
| Reports - createReport | 0.0167 | 15 |
| Reports - getReport | 2 | 15 |
| Feeds - createFeed | 0.0083 | 15 |
| Notifications - createSubscription | 1 | 5 |
| Pricing - getCompetitiveSummary | 0.033 | 1 |

> 注意：以上为参考值，实际限额以官方文档和响应头为准。Dynamic Plan 的实际值可能不同。

## 限流处理策略

### 1. 指数退避（Exponential Backoff）

```python
import time
import random

def call_with_retry(func, max_retries=5):
    for attempt in range(max_retries):
        response = func()
        if response.status_code != 429:
            return response
        wait = (2 ** attempt) + random.uniform(0, 1)
        time.sleep(wait)
    raise Exception("Max retries exceeded")
```

### 2. 使用 Notifications 替代轮询

不要轮询订单状态，而是订阅 `ORDER_STATUS_CHANGE` 通知。

### 3. 使用批量操作

- `searchCatalogItems` — 一次查多个 ASIN
- `getItemOffersBatch` — 批量获取 Offer
- `getMyFeesEstimates` — 批量获取费用估算
- Feeds API — 批量更新价格/库存

### 4. 本地缓存

对变化不频繁的数据（如商品目录信息）做本地缓存，减少 API 调用。

## 与 Ads API Rate Limit 的对比

| | SP-API | Ads API |
|--|--------|---------|
| **算法** | Token Bucket | Token Bucket |
| **限流响应** | 429 | 429 |
| **Rate 响应头** | `x-amzn-RateLimit-Limit` | `x-amzn-RateLimit-Limit` |
| **Dynamic Plan** | 有（基于业务量） | 无 |
| **粒度** | 每个 Seller + App | 每个 Advertiser + App |
