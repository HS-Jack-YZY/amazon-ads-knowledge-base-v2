---
title: Listings Items API
source: https://developer-docs.amazon.com/sp-api/docs/listings-items-api-v2021-08-01-use-case-guide
version: v2021-08-01
---

# Listings Items API

创建、更新、删除和查询 Amazon 商品 Listing。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| getListingsItem | GET | `/listings/2021-08-01/items/{sellerId}/{sku}` | 获取 Listing 详情 |
| putListingsItem | PUT | `/listings/2021-08-01/items/{sellerId}/{sku}` | 创建或**完全替换** Listing |
| patchListingsItem | PATCH | `/listings/2021-08-01/items/{sellerId}/{sku}` | **部分更新** Listing |
| deleteListingsItem | DELETE | `/listings/2021-08-01/items/{sellerId}/{sku}` | 删除 Listing |
| searchListingsItems | GET | `/listings/2021-08-01/items/{sellerId}` | 搜索 Listing（按 SKU/ASIN） |

## PUT vs PATCH 的关键区别

| | PUT (putListingsItem) | PATCH (patchListingsItem) |
|--|---|---|
| **行为** | 完全替换整个 Listing | 只更新指定字段 |
| **未提供的字段** | **会被删除** | 保持不变 |
| **使用场景** | 创建新 Listing / 完全重写 | 更新价格、库存、个别属性 |
| **风险** | 遗漏字段会导致数据丢失 | 低风险 |

> **重要**: `putListingsItem` 会**替换全部内容**。如果之前有 5 个 bullet point 但新请求只传了 3 个，另外 2 个会被删除。日常更新请用 `patchListingsItem`。

## 常用查询参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `sellerId` | string | **必填**（路径参数），卖家 ID |
| `sku` | string | **必填**（路径参数），SKU |
| `marketplaceIds` | string[] | **必填** |
| `includedData` | string[] | `summaries`, `attributes`, `issues`, `offers`, `fulfillmentAvailability`, `procurement` |

## PATCH 操作类型

PATCH 请求体中的 `op` 字段：

| op | 说明 |
|----|------|
| `add` | 添加属性值 |
| `replace` | 替换属性值 |
| `delete` | 删除属性值 |

### PATCH 示例 — 更新价格

```json
{
  "productType": "PRODUCT",
  "patches": [
    {
      "op": "replace",
      "path": "/attributes/purchasable_offer",
      "value": [
        {
          "marketplace_id": "ATVPDKIKX0DER",
          "currency": "USD",
          "our_price": [{"schedule": [{"value_with_tax": 29.99}]}]
        }
      ]
    }
  ]
}
```

### PATCH 示例 — 更新库存（Merge 操作）

```json
{
  "productType": "PRODUCT",
  "patches": [
    {
      "op": "replace",
      "path": "/attributes/fulfillment_availability",
      "value": [
        {
          "fulfillment_channel_code": "DEFAULT",
          "quantity": 100
        }
      ]
    }
  ]
}
```

## Product Type

- 不是所有产品类型都支持完整的 Listings Items API
- 不支持的类型可以使用 `PRODUCT` 类型做 offer-only 提交（仅更新价格和库存）
- 使用 Product Type Definitions API 查询支持的类型

## 所需角色（至少一个）

- Inventory and Order Tracking
- Product Listing

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| getListingsItem | 5/s | 10 |
| putListingsItem | 5/s | 10 |
| patchListingsItem | 5/s | 10 |
| deleteListingsItem | 5/s | 10 |
| searchListingsItems | 5/s | 10 |
