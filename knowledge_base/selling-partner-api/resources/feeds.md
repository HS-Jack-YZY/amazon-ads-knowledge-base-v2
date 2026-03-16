---
title: Feeds API
source: https://developer-docs.amazon.com/sp-api/docs/feeds-api-v2021-06-30-use-case-guide
version: v2021-06-30
---

# Feeds API

批量上传数据到 Amazon（价格更新、库存同步、商品信息等）。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| createFeedDocument | POST | `/feeds/2021-06-30/documents` | 创建上传文档（获取上传 URL） |
| createFeed | POST | `/feeds/2021-06-30/feeds` | 提交 Feed |
| getFeeds | GET | `/feeds/2021-06-30/feeds` | 列出 Feed |
| getFeed | GET | `/feeds/2021-06-30/feeds/{feedId}` | 获取 Feed 状态 |
| cancelFeed | DELETE | `/feeds/2021-06-30/feeds/{feedId}` | 取消 Feed |
| getFeedDocument | GET | `/feeds/2021-06-30/documents/{feedDocumentId}` | 获取处理结果 |

## Feed 提交流程

```
1. createFeedDocument(contentType: "text/xml")
       ↓  返回 feedDocumentId + upload URL
2. PUT 上传文件到 upload URL
       ↓
3. createFeed(feedType, feedDocumentId, marketplaceIds)
       ↓
4. 轮询 getFeed(feedId) 直到 processingStatus = "DONE"
       ↓
5. getFeedDocument(resultFeedDocumentId) 获取处理报告
       ↓
6. 下载处理报告，检查错误
```

### 处理状态

| processingStatus | 说明 |
|-----------------|------|
| `IN_QUEUE` | 排队中 |
| `IN_PROGRESS` | 处理中 |
| `DONE` | 完成 |
| `CANCELLED` | 已取消 |
| `FATAL` | 处理失败 |

## Feed 类型分类

### Listings Feed Types（商品）

| Feed Type | 说明 |
|-----------|------|
| `JSON_LISTINGS_FEED` | JSON 格式的商品更新（推荐） |
| `POST_PRODUCT_DATA` | XML 商品数据 |
| `POST_PRODUCT_PRICING_DATA` | XML 定价数据 |
| `POST_INVENTORY_AVAILABILITY_DATA` | XML 库存数据 |
| `POST_PRODUCT_IMAGE_DATA` | XML 商品图片 |
| `POST_PRODUCT_RELATIONSHIP_DATA` | XML 变体关系 |

### Order Feed Types（订单）

| Feed Type | 说明 |
|-----------|------|
| `POST_ORDER_ACKNOWLEDGEMENT_DATA` | 订单确认 |
| `POST_ORDER_FULFILLMENT_DATA` | 发货确认 |
| `POST_FLAT_FILE_ORDER_ACKNOWLEDGEMENT_DATA` | 批量订单确认（平面文件） |

### FBA Feed Types

| Feed Type | 说明 |
|-----------|------|
| `POST_FBA_INBOUND_CARTON_CONTENTS` | FBA 入仓箱内内容 |
| `POST_FULFILLMENT_ORDER_REQUEST_DATA` | 多渠道配送请求 |

## JSON_LISTINGS_FEED 示例

推荐使用 `JSON_LISTINGS_FEED` 配合 Listings Items API 的 JSON 格式：

```json
{
  "header": {
    "sellerId": "AXXXXXXXXXXXXX",
    "version": "2.0",
    "issueLocale": "en_US"
  },
  "messages": [
    {
      "messageId": 1,
      "sku": "MY-SKU-001",
      "operationType": "PATCH",
      "productType": "PRODUCT",
      "patches": [
        {
          "op": "replace",
          "path": "/attributes/purchasable_offer",
          "value": [
            {
              "marketplace_id": "ATVPDKIKX0DER",
              "currency": "USD",
              "our_price": [{"schedule": [{"value_with_tax": 24.99}]}]
            }
          ]
        }
      ]
    }
  ]
}
```

## Feeds vs Listings Items API

| | Feeds API | Listings Items API |
|--|---|---|
| **方式** | 批量上传文件 | 逐条 API 调用 |
| **适用场景** | 大量 SKU 批量更新 | 少量 SKU 实时更新 |
| **反馈速度** | 异步（分钟~小时级） | 同步（秒级） |
| **错误处理** | 下载处理报告查看 | 直接在响应中查看 |

## 重要提示

- XML 和 flat file 格式的商品 Feed 已**弃用**，推荐迁移到 `JSON_LISTINGS_FEED`
- Feed 处理是异步的，大量数据可能需要几小时
- 务必检查处理报告中的错误，部分记录可能失败

## 所需角色（至少一个）

- Amazon Fulfillment
- Brand Analytics
- Inventory and Order Tracking
- Pricing
- Product Listing
- Tax Invoicing (Restricted)

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| createFeedDocument | 0.5/s | 15 |
| createFeed | 0.0083/s | 15 |
| getFeed | 2/s | 15 |
| getFeeds | 0.0222/s | 10 |
