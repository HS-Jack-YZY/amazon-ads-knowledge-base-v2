---
title: Reports API
source: https://developer-docs.amazon.com/sp-api/docs/reports-api-v2021-06-30-use-case-guide
version: v2021-06-30
---

# Reports API

请求和下载各类报告（销售、库存、退货、财务等）。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| createReport | POST | `/reports/2021-06-30/reports` | 创建报告请求 |
| getReports | GET | `/reports/2021-06-30/reports` | 列出报告 |
| getReport | GET | `/reports/2021-06-30/reports/{reportId}` | 获取报告状态 |
| cancelReport | DELETE | `/reports/2021-06-30/reports/{reportId}` | 取消报告 |
| getReportDocument | GET | `/reports/2021-06-30/documents/{reportDocumentId}` | 获取报告下载链接 |
| createReportSchedule | POST | `/reports/2021-06-30/schedules` | 创建定时报告 |
| getReportSchedules | GET | `/reports/2021-06-30/schedules` | 列出定时报告 |
| getReportSchedule | GET | `/reports/2021-06-30/schedules/{reportScheduleId}` | 获取定时报告详情 |
| cancelReportSchedule | DELETE | `/reports/2021-06-30/schedules/{reportScheduleId}` | 取消定时报告 |

## 报告获取流程

```
1. createReport(reportType, marketplaceIds, dataStartTime, dataEndTime)
       ↓
2. 轮询 getReport(reportId) 直到 processingStatus = "DONE"
       ↓
3. 从响应中获取 reportDocumentId
       ↓
4. getReportDocument(reportDocumentId) 获取下载 URL
       ↓
5. 从 URL 下载报告文件（可能是 gzip 压缩）
```

### 处理状态

| processingStatus | 说明 |
|-----------------|------|
| `IN_QUEUE` | 排队中 |
| `IN_PROGRESS` | 处理中 |
| `DONE` | 完成，可下载 |
| `CANCELLED` | 已取消 |
| `FATAL` | 处理失败 |

## 报告类型分类

### Analytics（分析）— Seller

| 报告类型 | 说明 |
|---------|------|
| `GET_SALES_AND_TRAFFIC_REPORT` | 销售和流量报告 |
| `GET_BRAND_ANALYTICS_SEARCH_TERMS_REPORT` | 品牌分析 - 搜索词报告 |
| `GET_BRAND_ANALYTICS_MARKET_BASKET_REPORT` | 品牌分析 - 购物篮报告 |
| `GET_BRAND_ANALYTICS_REPEAT_PURCHASE_REPORT` | 品牌分析 - 复购报告 |
| `GET_BRAND_ANALYTICS_SEARCH_QUERY_PERFORMANCE_REPORT` | 品牌分析 - 搜索查询性能 |
| `GET_BRAND_ANALYTICS_SEARCH_CATALOG_PERFORMANCE_REPORT` | 品牌分析 - 搜索目录性能 |

### Inventory（库存）

| 报告类型 | 说明 |
|---------|------|
| `GET_FLAT_FILE_OPEN_LISTINGS_DATA` | 在售商品列表 |
| `GET_MERCHANT_LISTINGS_ALL_DATA` | 所有商品列表（含非活跃） |
| `GET_MERCHANT_LISTINGS_DATA` | 活跃商品列表 |
| `GET_MERCHANT_LISTINGS_INACTIVE_DATA` | 非活跃商品列表 |
| `GET_MERCHANTS_LISTINGS_FYP_REPORT` | FYP（修复商品）报告 |

### FBA（Fulfillment by Amazon）

| 报告类型 | 说明 |
|---------|------|
| `GET_AFN_INVENTORY_DATA` | FBA 库存数据 |
| `GET_AFN_INVENTORY_DATA_BY_COUNTRY` | 按国家的 FBA 库存 |
| `GET_FBA_MYI_UNSUPPRESSED_INVENTORY_DATA` | FBA 管理库存 |
| `GET_FBA_ESTIMATED_FBA_FEES_TXT_DATA` | FBA 费用估算 |
| `GET_FBA_FULFILLMENT_CUSTOMER_RETURNS_DATA` | FBA 退货数据 |
| `GET_FBA_FULFILLMENT_CUSTOMER_SHIPMENT_SALES_DATA` | FBA 发货销售数据 |
| `GET_FBA_STORAGE_FEE_CHARGES_DATA` | FBA 仓储费用 |
| `GET_FBA_INVENTORY_PLANNING_DATA` | FBA 库存计划 |
| `GET_RESTOCK_INVENTORY_RECOMMENDATIONS_REPORT` | 补货建议 |
| `GET_FBA_REIMBURSEMENTS_DATA` | FBA 赔偿数据 |
| `GET_FBA_FULFILLMENT_LONGTERM_STORAGE_FEE_CHARGES_DATA` | 长期仓储费 |

### Order（订单）

| 报告类型 | 说明 |
|---------|------|
| `GET_FLAT_FILE_ALL_ORDERS_DATA_BY_LAST_UPDATE_GENERAL` | 所有订单（按更新时间） |
| `GET_FLAT_FILE_ALL_ORDERS_DATA_BY_ORDER_DATE_GENERAL` | 所有订单（按下单时间） |
| `GET_FLAT_FILE_PENDING_ORDERS_DATA` | 待处理订单 |
| `GET_FLAT_FILE_ACTIONABLE_ORDER_DATA_SHIPPING` | 可操作订单 |

### Returns（退货）

| 报告类型 | 说明 |
|---------|------|
| `GET_FLAT_FILE_RETURNS_DATA_BY_RETURN_DATE` | 退货数据（按退货日期） |
| `GET_XML_RETURNS_DATA_BY_RETURN_DATE` | 退货数据（XML） |

### Settlement/Payment（结算）

| 报告类型 | 说明 |
|---------|------|
| `GET_V2_SETTLEMENT_REPORT_DATA_FLAT_FILE` | 结算报告 |
| `GET_V2_SETTLEMENT_REPORT_DATA_FLAT_FILE_V2` | 结算报告 v2 |

### Tax（税务）

| 报告类型 | 说明 |
|---------|------|
| `SC_VAT_TAX_REPORT` | VAT 税务报告 |
| `GET_VAT_TRANSACTION_DATA` | VAT 交易数据 |
| `GET_FLAT_FILE_SALES_TAX_DATA` | 销售税数据 |

### Performance（绩效）

| 报告类型 | 说明 |
|---------|------|
| `GET_SELLER_FEEDBACK_DATA` | 卖家反馈 |
| `GET_V2_SELLER_PERFORMANCE_REPORT` | 卖家绩效报告 |
| `GET_PROMOTION_PERFORMANCE_REPORT` | 促销绩效 |
| `GET_COUPON_PERFORMANCE_REPORT` | 优惠券绩效 |

> 完整列表参见: https://developer-docs.amazon.com/sp-api/docs/report-type-values

## 重要提示

- Amazon 会定期新增报告字段和字段值，解析器需要能处理未知字段
- 报告文档 ID 的格式和结构可能随时变化
- 部分报告由 Amazon 自动生成（如结算报告），无需手动创建

## Rate Limit

| 操作 | Rate | Burst |
|------|------|-------|
| createReport | 0.0167/s | 15 |
| getReport | 2/s | 15 |
| getReports | 0.0222/s | 10 |
| getReportDocument | 0.0167/s | 15 |
