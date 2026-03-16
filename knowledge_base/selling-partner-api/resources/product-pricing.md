---
title: Product Pricing API
source: https://developer-docs.amazon.com/sp-api/docs/product-pricing-api-v2022-05-01-use-case-guide
version: v2022-05-01 (current), v0 (legacy)
---

# Product Pricing API

获取竞品价格、Featured Offer（Buy Box）价格，支持自动化定价策略。

## 操作

### v2022-05-01（当前版本）

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| getCompetitiveSummary | POST | `/batches/products/pricing/2022-05-01/items/competitiveSummary` | 批量获取竞争价格摘要 |
| getFeaturedOfferExpectedPriceBatch | POST | `/batches/products/pricing/2022-05-01/offer/featuredOfferExpectedPrice` | 批量获取 Featured Offer 预期价格 |

### v0（旧版）

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| getPricing | GET | `/products/pricing/v0/price` | 获取商品价格 |
| getCompetitivePricing | GET | `/products/pricing/v0/competitivePrice` | 获取竞争价格 |
| getListingOffers | GET | `/products/pricing/v0/listings/{SellerSKU}/offers` | 获取 Listing 的所有 Offer |
| getItemOffers | GET | `/products/pricing/v0/items/{Asin}/offers` | 获取 ASIN 的所有 Offer |
| getItemOffersBatch | POST | `/batches/products/pricing/v0/itemOffers` | 批量获取 Offer |
| getListingOffersBatch | POST | `/batches/products/pricing/v0/listingOffers` | 批量获取 Listing Offer |

## 批量操作限制

| 操作 | 单次批量最大请求数 |
|------|-------------------|
| getFeaturedOfferExpectedPriceBatch | **40 个 SKU** |
| getItemOffersBatch | **20 个 ASIN** |
| getListingOffersBatch | **20 个 SKU** |

## 核心概念

### Featured Offer (Buy Box)

- Amazon 商品页面上的主购买按钮对应的 Offer
- 拿到 Featured Offer 意味着大部分销售额归你
- `getFeaturedOfferExpectedPriceBatch` 返回获得 Featured Offer 的建议价格

### Competitive Pricing

- 展示你和竞品的价格对比
- 包含 Buy Box 价格、最低价、新品/二手价

## 使用场景

1. **自动调价**: 监控竞品价格，自动调整到有竞争力的价位
2. **Buy Box 优化**: 用 FOEP 数据了解获取 Buy Box 需要的价格
3. **市场分析**: 了解特定 ASIN 的所有卖家 Offer 分布

## 所需角色

- Pricing

## 适用用户

仅 Seller。

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| getCompetitiveSummary | 0.033/s | 1 |
| getFeaturedOfferExpectedPriceBatch | 0.033/s | 1 |
| getPricing (v0) | 0.5/s | 1 |
| getCompetitivePricing (v0) | 0.5/s | 1 |
| getItemOffers (v0) | 0.5/s | 1 |
