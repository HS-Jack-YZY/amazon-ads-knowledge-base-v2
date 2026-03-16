---
title: Selling Partner API Overview
source: https://developer-docs.amazon.com/sp-api/docs/what-is-the-selling-partner-api
---

# Selling Partner API (SP-API) Overview

The Selling Partner API (SP-API) enables Amazon sellers and vendors to programmatically manage their selling operations — orders, inventory, pricing, fulfillment, finances, and more.

## SP-API vs Amazon Ads API

| | Selling Partner API (SP-API) | Amazon Ads API |
|--|---|---|
| **用途** | 卖家运营（订单、库存、物流、财务） | 广告投放与分析 |
| **API 域名** | `sellingpartnerapi-{region}.amazon.com` | `advertising-api.amazon.com` |
| **认证 Header** | `x-amz-access-token` | `Authorization: Bearer` |
| **身份标识** | Marketplace ID + Seller/Vendor 授权 | Profile ID / Advertiser ID |
| **Token 端点** | `https://api.amazon.com/auth/o2/token`（共用） | 同左（共用） |
| **申请入口** | [Seller Central](https://sellercentral.amazon.com) | [Advertising Console](https://advertising.amazon.com) |
| **特殊机制** | Restricted Data Token (RDT), Grantless Operations | AMC SQL, Marketing Stream |
| **数据保留** | 订单 2 年（SG/JP/AU 从 2016 起） | 因产品而异 |

## API 分类

### 核心运营
- **Orders** — 订单查询、确认发货
- **Listings Items** — 商品上架、更新、删除
- **Catalog Items** — 商品目录搜索、ASIN 详情
- **Product Pricing** — 竞品价格、Featured Offer 价格

### 库存与物流
- **FBA Inventory** — FBA 库存水平监控
- **Fulfillment Inbound** — FBA 入仓发货计划
- **Fulfillment Outbound** — 多渠道配送
- **Shipping** — 发货和追踪

### 数据与报表
- **Reports** — 100+ 种报告（销售、库存、退货、税务等）
- **Data Kiosk** — GraphQL 自定义查询
- **Notifications** — 事件推送（订单创建、库存变化等）

### 财务
- **Finances** — 财务流水、交易明细
- **Invoices** — 发票管理

### 批量操作
- **Feeds** — 批量上传数据（价格、库存、商品）

### 账号管理
- **Sellers** — 卖家信息
- **Tokens** — Restricted Data Token 管理
- **Application Management** — 应用管理

## 适用用户类型

| 类型 | 说明 | 典型 API |
|------|------|---------|
| **Seller** | 第三方卖家（3P），在亚马逊平台上开店销售 | Orders, Listings, FBA, Finances |
| **Vendor** | 一方供应商（1P），直接向亚马逊批发供货 | Vendor Direct Fulfillment, Vendor Retail Procurement |

大部分 API 对 Seller 可用；Vendor 专用 API 标有 "Vendor only"。

## 官方资源

- 文档主页: https://developer-docs.amazon.com/sp-api/
- GitHub（模型 + 示例）: https://github.com/amzn/selling-partner-api-models
- Postman 集合: https://github.com/amzn/selling-partner-api-models/tree/main/clients
