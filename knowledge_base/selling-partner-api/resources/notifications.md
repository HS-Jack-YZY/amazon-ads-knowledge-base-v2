---
title: Notifications API
source: https://developer-docs.amazon.com/sp-api/docs/notifications-api-v1-use-case-guide
version: v1
---

# Notifications API

订阅事件通知，替代轮询模式，实时接收业务事件推送。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| createDestination | POST | `/notifications/v1/destinations` | 创建通知目标（SQS/EventBridge） |
| getDestinations | GET | `/notifications/v1/destinations` | 列出目标 |
| getDestination | GET | `/notifications/v1/destinations/{destinationId}` | 获取目标详情 |
| deleteDestination | DELETE | `/notifications/v1/destinations/{destinationId}` | 删除目标 |
| createSubscription | POST | `/notifications/v1/subscriptions/{notificationType}` | 创建订阅 |
| getSubscription | GET | `/notifications/v1/subscriptions/{notificationType}` | 获取订阅 |
| deleteSubscription | DELETE | `/notifications/v1/subscriptions/{notificationType}/{subscriptionId}` | 删除订阅 |

## 通知推送方式

| 方式 | 说明 | 适用场景 |
|------|------|---------|
| **Amazon SQS** | 消息队列 | 简单的消息消费 |
| **Amazon EventBridge** | 事件总线 | 复杂路由、多目标分发 |

## 常用通知类型

### 订单相关

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `ORDER_STATUS_CHANGE` | 订单状态变更 | SQS / EventBridge |
| `ORDER_CHANGE` | 订单信息变更 | SQS / EventBridge |

### 价格与 Offer

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `ANY_OFFER_CHANGED` | Top 20 Offer 变化（价格/Buy Box） | SQS |
| `B2B_ANY_OFFER_CHANGED` | B2B Offer 变化（含数量阶梯价） | SQS |
| `PRICING_HEALTH` | 价格健康状态变化 | SQS / EventBridge |

### 库存与物流

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `FBA_OUTBOUND_SHIPMENT_STATUS` | FBA 发货状态变化 | SQS / EventBridge |
| `FULFILLMENT_ORDER_STATUS` | 多渠道配送订单状态 | SQS / EventBridge |
| `FEE_PROMOTION` | 费用促销通知 | SQS / EventBridge |

### Listing 与商品

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `LISTINGS_ITEM_STATUS_CHANGE` | Listing 状态变化 | SQS / EventBridge |
| `LISTINGS_ITEM_ISSUES_CHANGE` | Listing 问题变化 | SQS / EventBridge |
| `PRODUCT_TYPE_DEFINITIONS_CHANGE` | 产品类型定义变化 | SQS / EventBridge |

### 账号

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `ACCOUNT_STATUS_CHANGED` | 账户状态变更 | SQS |

### 报告

| 通知类型 | 说明 | 推送方式 |
|---------|------|---------|
| `REPORT_PROCESSING_FINISHED` | 报告处理完成 | SQS / EventBridge |

## 设置流程

### 1. 创建 SQS 目标

```json
POST /notifications/v1/destinations
{
  "name": "MyOrderQueue",
  "resourceSpecification": {
    "sqs": {
      "arn": "arn:aws:sqs:us-east-1:123456789012:sp-api-notifications"
    }
  }
}
```

### 2. 创建订阅

```json
POST /notifications/v1/subscriptions/ORDER_STATUS_CHANGE
{
  "destinationId": "dest-xxxxx",
  "payloadVersion": "1.0"
}
```

## Grantless 操作

Notifications API 的 `createDestination`、`getDestinations`、`deleteDestination` 是 **Grantless 操作**，不需要卖家授权，只需要 `client_credentials` grant：

```
grant_type=client_credentials
scope=sellingpartnerapi::notifications
```

## 通知 vs 轮询

| | 通知（推荐） | 轮询 |
|--|---|---|
| **实时性** | 秒级 | 取决于轮询间隔 |
| **API 消耗** | 零（推送模式） | 持续消耗 Rate Limit |
| **复杂度** | 需要 SQS/EventBridge 基础设施 | 只需 HTTP 客户端 |
| **可靠性** | SQS 保证至少一次投递 | 可能错过快速状态变化 |

> **最佳实践**: 优先使用通知替代轮询，节省 API 配额，获得实时响应。
