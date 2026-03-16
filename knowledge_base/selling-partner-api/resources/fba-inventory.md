---
title: FBA Inventory API
source: https://developer-docs.amazon.com/sp-api/docs/fba-inventory-api-v1-use-case-guide
version: v1
---

# FBA Inventory API

查询 FBA（Fulfillment by Amazon）库存水平和状态。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| getInventorySummaries | GET | `/fba/inventory/v1/summaries` | 获取库存汇总信息 |
| addInventory | POST | `/fba/inventory/v1/items/inventory` | 添加库存 |
| createInventoryItem | POST | `/fba/inventory/v1/items` | 创建库存项 |
| deleteInventoryItem | DELETE | `/fba/inventory/v1/items/{sellerSku}` | 删除库存项 |

## getInventorySummaries 参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `granularityType` | string | **必填**，`Marketplace` |
| `granularityId` | string | **必填**，Marketplace ID |
| `marketplaceIds` | string[] | **必填** |
| `sellerSkus` | string[] | 按 SKU 过滤（最多 50 个） |
| `details` | boolean | 是否返回详细库存分类 |
| `startDateTime` | ISO 8601 | 库存快照起始时间 |
| `nextToken` | string | 分页 token |

## 库存状态分类

| 状态 | 说明 | 字段名 |
|------|------|--------|
| **Fulfillable** | 可售库存，可以拣货、打包、发货 | `fulfillableQuantity` |
| **Inbound** | 正在运往 FBA 仓库的库存 | `inboundReceivingQuantity`, `inboundShippedQuantity`, `inboundWorkingQuantity` |
| **Reserved** | 被预留的库存（如正在处理的订单） | `reservedQuantity` |
| **Unfulfillable** | 不可售库存（损坏、过期等） | `unfulfillableQuantity` |
| **Researching** | 正在调查中的库存（可能丢失或损坏） | `researchingQuantity` |

### Inbound 细分

| 子状态 | 说明 |
|--------|------|
| `inboundWorkingQuantity` | 已创建发货计划但未发出 |
| `inboundShippedQuantity` | 已发出，运输途中 |
| `inboundReceivingQuantity` | 已到达仓库，正在入库处理 |

### Reserved 细分

| 子状态 | 说明 |
|--------|------|
| `pendingCustomerOrderQuantity` | 等待处理的客户订单 |
| `pendingTransshipmentQuantity` | 仓库间转运 |
| `fcProcessingQuantity` | FC 内部处理中 |

## 所需角色（至少一个）

- Amazon Fulfillment
- Product Listing

## Python 示例

```python
# 获取所有 FBA 库存汇总
inventory = sp_api_request(
    "GET",
    "/fba/inventory/v1/summaries",
    access_token,
    params={
        "granularityType": "Marketplace",
        "granularityId": "ATVPDKIKX0DER",
        "marketplaceIds": "ATVPDKIKX0DER",
        "details": "true",
    },
)

for item in inventory["payload"]["inventorySummaries"]:
    print(f"SKU: {item['sellerSku']}")
    print(f"  ASIN: {item.get('asin')}")
    print(f"  Fulfillable: {item.get('fulfillableQuantity', 0)}")
    print(f"  Inbound Receiving: {item.get('inboundReceivingQuantity', 0)}")
    print(f"  Inbound Shipped: {item.get('inboundShippedQuantity', 0)}")
    print(f"  Reserved: {item.get('reservedQuantity', {})}")
    print(f"  Unfulfillable: {item.get('unfulfillableQuantity', {})}")
```
