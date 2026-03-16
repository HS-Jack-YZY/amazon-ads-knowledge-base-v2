# Selling Partner API (SP-API) - Knowledge Base Index

> Source: https://developer-docs.amazon.com/sp-api/
> Generated: 2026-03-16

## API Endpoints (Regional Hosts)

| URL | Region | Marketplaces |
|-----|--------|-------------|
| https://sellingpartnerapi-na.amazon.com | North America (NA) | US, CA, MX, BR |
| https://sellingpartnerapi-eu.amazon.com | Europe (EU) | UK, FR, DE, IT, ES, NL, SE, PL, TR, SA, AE, IN, IE, BE, ZA, EG |
| https://sellingpartnerapi-fe.amazon.com | Far East (FE) | JP, AU, SG |

## Navigation Structure

### 1. Concepts (Infrastructure)

| File | Description |
|------|-------------|
| [Overview](concepts/overview.md) | SP-API 概述，与 Ads API 对比，API 分类，适用用户 |
| [Endpoints & Marketplace IDs](concepts/endpoints.md) | 区域端点、沙箱端点、完整 Marketplace ID 表 |
| [Authentication](concepts/authentication.md) | OAuth 2.0 流程、Header 格式、RDT、Grantless、Python 示例 |
| [Rate Limits](concepts/rate-limits.md) | Token Bucket 算法、限流处理、Standard/Dynamic Plan |
| [Errors](concepts/errors.md) | HTTP 状态码、SP-API 特定错误码、重试策略 |

### 2. Resources (Core Business APIs)

#### Orders & Fulfillment

| File | API | Description |
|------|-----|-------------|
| [Orders](resources/orders.md) | Orders API v2026-01-01 / v0 | 订单查询、状态、发货确认、PII 访问 |
| [FBA Inventory](resources/fba-inventory.md) | FBA Inventory API v1 | FBA 库存水平、5 种库存状态分类 |
| [Fulfillment Inbound](resources/fulfillment-inbound.md) | Fulfillment Inbound API v2024-03-20 | FBA 入仓发货计划、装箱、分仓、运输 |

#### Listings & Catalog

| File | API | Description |
|------|-----|-------------|
| [Catalog Items](resources/catalog-items.md) | Catalog Items API v2022-04-01 | ASIN 详情、商品搜索、includedData |
| [Listings Items](resources/listings-items.md) | Listings Items API v2021-08-01 | Listing CRUD、PUT vs PATCH、价格/库存更新 |

#### Pricing

| File | API | Description |
|------|-----|-------------|
| [Product Pricing](resources/product-pricing.md) | Product Pricing API v2022-05-01 / v0 | 竞品价格、Featured Offer (Buy Box)、批量查询 |

#### Data & Reporting

| File | API | Description |
|------|-----|-------------|
| [Reports](resources/reports.md) | Reports API v2021-06-30 | 100+ 种报告类型、创建/下载流程 |
| [Data Kiosk](resources/data-kiosk.md) | Data Kiosk API v2023-11-15 | GraphQL 自定义查询、销售流量数据 |
| [Notifications](resources/notifications.md) | Notifications API v1 | 事件推送（SQS/EventBridge）、通知类型列表 |

#### Batch Operations

| File | API | Description |
|------|-----|-------------|
| [Feeds](resources/feeds.md) | Feeds API v2021-06-30 | 批量数据上传（价格/库存/商品）、JSON_LISTINGS_FEED |

#### Finances

| File | API | Description |
|------|-----|-------------|
| [Finances](resources/finances.md) | Finances API v2024-06-19 / v0 | 财务交易、结算、付款详情 |

## Quick Reference

### 认证 Header 对比（SP-API vs Ads API）

| Header | SP-API | Ads API |
|--------|--------|---------|
| Token | `x-amz-access-token: Atza\|...` | `Authorization: Bearer Atza\|...` |
| Client ID | 不需要 | `Amazon-Advertising-API-ClientId` |
| 身份标识 | 通过 Token 关联卖家 | `Amazon-Advertising-API-Scope` (Profile ID) |
| User-Agent | **必填** | 可选 |
| 日期 | `x-amz-date`（必填） | 不需要 |

### Token 端点（两套 API 共用）

```
POST https://api.amazon.com/auth/o2/token
```

### 异步操作模式（Reports / Feeds / Data Kiosk 通用）

```
1. 创建请求 → 获取 ID
2. 轮询状态 → 直到 DONE
3. 获取文档 → 下载结果
```

## URL Reference

所有文档页面: `https://developer-docs.amazon.com/sp-api/docs/`
API 参考: `https://developer-docs.amazon.com/sp-api/reference/`
GitHub 模型: `https://github.com/amzn/selling-partner-api-models`
