---
title: Fulfillment Inbound API
source: https://developer-docs.amazon.com/sp-api/docs/fulfillment-inbound-api-v2024-03-20-use-case-guide
version: v2024-03-20
---

# Fulfillment Inbound API

创建和管理 FBA 入仓发货计划。

## 核心流程

```
1. createInboundPlan        — 创建入仓计划（指定 SKU + 数量 + 发货地）
       ↓
2. generatePackingOptions   — 生成装箱方案
       ↓
3. confirmPackingOption     — 确认装箱方案
       ↓
4. setPackingInformation    — 设置装箱明细（每箱内容）
       ↓
5. generatePlacementOptions — 生成分仓方案（Amazon 决定发往哪些仓库）
       ↓
6. confirmPlacementOption   — 确认分仓方案
       ↓
7. generateTransportationOptions — 生成运输方案
       ↓
8. confirmTransportationOptions  — 确认运输方案
       ↓
9. 生成标签 / 安排取件
```

## 主要操作

| 操作 | 说明 |
|------|------|
| `createInboundPlan` | 创建入仓计划 |
| `cancelInboundPlan` | 取消入仓计划 |
| `getInboundPlan` | 获取计划详情 |
| `listInboundPlans` | 列出计划 |
| `generatePackingOptions` | 生成装箱方案 |
| `confirmPackingOption` | 确认装箱 |
| `setPackingInformation` | 设置每箱内容 |
| `generatePlacementOptions` | 生成分仓方案 |
| `confirmPlacementOption` | 确认分仓 |
| `generateTransportationOptions` | 生成运输方案 |
| `confirmTransportationOptions` | 确认运输 |
| `getShipment` | 获取发货详情 |
| `listShipmentItems` | 列出发货商品 |
| `listShipmentBoxes` | 列出发货箱 |

## 发货类型

### Small Parcel Delivery (SPD)

小包裹发货，适合少量商品：
- **Amazon 合作承运商**: Amazon 提供运费折扣
- **非合作承运商**: 卖家自选物流

### Less-Than-Truckload (LTL) / Full-Truckload (FTL)

托盘发货，适合大量商品：
- **Amazon 合作承运商**: Amazon 安排取件
- **非合作承运商**: 卖家安排物流
- 支持 **Pack Later**（先创建计划，稍后补充装箱信息）

## Amazon 推荐装箱

部分站点（ES、UK、FR、DE、IT）提供 Amazon 推荐的装箱方案：
- 适用于 15KG 以下的小包裹
- 可获得物流折扣
- Pack Group: 可以打包在一起的 SKU 组

## 限制

- **巴西站点不支持**通过此 API 创建发货
- 2026 年 1 月 1 日起，美国站的 FBA 不再提供 Prep 和贴标服务，卖家必须自行完成

## 所需角色

- Amazon Fulfillment

## 适用用户

仅 Seller。
