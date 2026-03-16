---
title: Orders API
source: https://developer-docs.amazon.com/sp-api/docs/orders-api-v0-use-case-guide
version: v2026-01-01 (current), v0 (legacy)
---

# Orders API

查询和管理亚马逊订单。

## 版本

- **v2026-01-01**（当前版本）: `searchOrders`, `getOrder`
- **v0**（旧版，逐步弃用）: 更多细粒度操作

## 端点

基础路径: `/orders`

### v2026-01-01 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| searchOrders | GET | `/orders/v2026-01-01/orders` | 按条件搜索订单 |
| getOrder | GET | `/orders/v2026-01-01/orders/{orderId}` | 获取单个订单详情 |

### v0 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| getOrders | GET | `/orders/v0/orders` | 列出订单 |
| getOrder | GET | `/orders/v0/orders/{orderId}` | 订单详情 |
| getOrderAddress | GET | `/orders/v0/orders/{orderId}/address` | 收货地址（需 RDT） |
| getOrderBuyerInfo | GET | `/orders/v0/orders/{orderId}/buyerInfo` | 买家信息（需 RDT） |
| getOrderItems | GET | `/orders/v0/orders/{orderId}/orderItems` | 订单商品列表 |
| getOrderItemsBuyerInfo | GET | `/orders/v0/orders/{orderId}/orderItems/buyerInfo` | 商品级买家信息（需 RDT） |
| confirmShipment | POST | `/orders/v0/orders/{orderId}/shipmentConfirmation` | 确认发货 |
| updateShipmentStatus | POST | `/orders/v0/orders/{orderId}/shipment` | 更新物流状态 |

## 常用查询参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `MarketplaceIds` | string[] | **必填**，Marketplace ID 列表 |
| `CreatedAfter` | ISO 8601 | 订单创建时间起始 |
| `CreatedBefore` | ISO 8601 | 订单创建时间截止 |
| `LastUpdatedAfter` | ISO 8601 | 最后更新时间起始 |
| `OrderStatuses` | string[] | 按订单状态过滤 |
| `FulfillmentChannels` | string[] | `AFN`（FBA）或 `MFN`（自发货） |
| `MaxResultsPerPage` | int | 每页结果数（默认 100） |
| `NextToken` | string | 分页 token |

> `CreatedAfter`/`CreatedBefore` 和 `LastUpdatedAfter`/`LastUpdatedBefore` 不能同时使用。

## 订单状态（OrderStatus）

| 状态 | 说明 |
|------|------|
| `Pending` | 订单已下单，未付款 |
| `Unshipped` | 已付款，未发货 |
| `PartiallyShipped` | 部分发货 |
| `Shipped` | 已发货 |
| `Canceled` | 已取消 |
| `Unfulfillable` | 无法履约（如 FBA 库存不足） |
| `InvoiceUnconfirmed` | 等待发票确认 |
| `PendingAvailability` | 预售，等待上架 |

## 配送渠道（FulfillmentChannel）

| 值 | 说明 |
|----|------|
| `AFN` | Amazon Fulfillment Network（FBA） |
| `MFN` | Merchant Fulfillment Network（自发货） |

## 数据保留

- 大部分站点：**2 年**
- SG、JP、AU：从 **2016 年** 起

## 需要 RDT 的操作

以下操作返回 PII 数据，需要 Restricted Data Token：
- `getOrderAddress`
- `getOrderBuyerInfo`
- `getOrderItemsBuyerInfo`

## 所需角色（至少一个）

- Amazon Fulfillment
- Buyer Communication
- Finance and Accounting
- Inventory and Order Tracking
- Selling Partner Insights

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| getOrders | 0.0167/s | 20 |
| getOrder | 0.5/s | 30 |
| getOrderItems | 0.5/s | 30 |

## Python 示例

```python
# 获取最近 7 天的订单
from datetime import datetime, timedelta

created_after = (datetime.utcnow() - timedelta(days=7)).strftime("%Y-%m-%dT%H:%M:%SZ")

orders = sp_api_request(
    "GET", "/orders/v0/orders",
    access_token,
    params={
        "MarketplaceIds": "ATVPDKIKX0DER",
        "CreatedAfter": created_after,
        "OrderStatuses": "Unshipped,PartiallyShipped",
    },
)

# 分页获取所有订单
all_orders = orders["payload"]["Orders"]
next_token = orders["payload"].get("NextToken")

while next_token:
    page = sp_api_request(
        "GET", "/orders/v0/orders",
        access_token,
        params={
            "MarketplaceIds": "ATVPDKIKX0DER",
            "CreatedAfter": created_after,
            "NextToken": next_token,
        },
    )
    all_orders.extend(page["payload"]["Orders"])
    next_token = page["payload"].get("NextToken")
```
