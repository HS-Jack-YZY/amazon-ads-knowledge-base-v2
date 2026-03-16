---
title: SP-API Error Reference
source: https://developer-docs.amazon.com/sp-api/docs/sp-api-errors-faq
---

# SP-API Error Reference

## HTTP 状态码

| 状态码 | 含义 | 处理方式 |
|--------|------|---------|
| **200** | 成功 | 正常处理响应 |
| **400** | 请求参数无效 | 检查请求参数格式和值 |
| **401** | 未认证 | Access Token 过期或无效，重新获取 |
| **403** | 无权限 | 检查 Seller 授权、应用角色、API 权限 |
| **404** | 资源不存在 | 检查路径和资源 ID |
| **429** | 限流 | 实施指数退避重试 |
| **500** | 服务端错误 | 稍后重试 |
| **503** | 服务不可用 | 稍后重试 |

## SP-API 特定错误码

### MD1000 — OAuth 环境不匹配

**原因**: OAuth 流程指向生产环境，但应用尚未发布。

**解决**: 在 OAuth URL 中添加 `version=beta` 参数：
```
https://sellercentral.amazon.com/apps/authorize/consent?application_id={app_id}&version=beta
```
应用发布后移除 `version=beta`。

### MD5100 — OAuth URL 格式错误

**常见原因**:
- OAuth 授权 URL 格式错误
- Redirect URI 未配置或不匹配
- URL 包含 fragment（#）
- `version` 参数与应用状态不匹配

**解决**: 检查 Solution Provider Portal 中的应用配置，确认 login URI 和 redirect URI 正确。

### SPDC300 — 内容格式或账户问题

**常见原因**:
- 使用了禁止的 HTML 标签（`<h1>` - `<h4>`）
- 账户因不活跃而休眠

**解决**:
- 移除禁止的 HTML 标签
- 更新信用卡信息重新激活账户（约 48 小时生效）

### SPDC8143 — 非主账户授权

**原因**: 使用子账户尝试授权。

**解决**: 使用主账户进行授权操作。

## 常见 400 错误及解决

### 无效 MarketplaceId

```json
{
  "errors": [{"code": "InvalidInput", "message": "Invalid marketplace id"}]
}
```
→ 参考 [endpoints.md](endpoints.md) 中的 Marketplace ID 表。

### 缺少必需参数

```json
{
  "errors": [{"code": "InvalidInput", "message": "Missing required parameter: MarketplaceIds"}]
}
```
→ 检查 API 文档中的必需参数列表。

### SKU 特殊字符

SKU 中的 `/` 或 `\` 会导致路径解析错误。

**解决**: 对 SKU 进行 URL 编码（UTF-8）：
```python
from urllib.parse import quote
encoded_sku = quote(sku, safe='')
```

### 日期格式错误

SP-API 要求 **ISO 8601** 格式：
```
2024-01-01T00:00:00Z        ← 正确
2024-01-01                   ← 可能不被接受
01/01/2024                   ← 错误
```

## 可重试 vs 不可重试

| 状态码 | 可重试 | 策略 |
|--------|--------|------|
| 429 | 是 | 指数退避 |
| 500 | 是 | 固定间隔重试（3 次） |
| 503 | 是 | 固定间隔重试（3 次） |
| 400 | 否 | 修复请求参数 |
| 401 | 是* | 刷新 Token 后重试 |
| 403 | 否 | 检查权限配置 |
| 404 | 否 | 检查资源路径 |

## 重试示例（Python）

```python
import time
import requests

RETRYABLE = {429, 500, 503}

def sp_api_call(method, url, headers, params=None, max_retries=3):
    for attempt in range(max_retries + 1):
        resp = requests.request(method, url, headers=headers, params=params)

        if resp.status_code not in RETRYABLE:
            return resp

        if resp.status_code == 429:
            # 从 Header 读取 rate limit，计算等待时间
            rate = float(resp.headers.get("x-amzn-RateLimit-Limit", "0.5"))
            wait = 1.0 / rate if rate > 0 else 2.0
        else:
            wait = 2 ** attempt

        time.sleep(wait)

    return resp  # 最后一次的响应
```
