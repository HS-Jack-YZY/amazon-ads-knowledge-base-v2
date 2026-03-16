---
title: Data Kiosk API
source: https://developer-docs.amazon.com/sp-api/docs/data-kiosk-api-v2023-11-15-use-case-guide
version: v2023-11-15
---

# Data Kiosk API

通过 GraphQL 查询自定义数据报告（类似 AMC 的 SQL 查询，但用于卖家运营数据）。

## 操作

| 操作 | Method | Path | 说明 |
|------|--------|------|------|
| createQuery | POST | `/dataKiosk/2023-11-15/queries` | 提交 GraphQL 查询 |
| getQueries | GET | `/dataKiosk/2023-11-15/queries` | 列出查询 |
| getQuery | GET | `/dataKiosk/2023-11-15/queries/{queryId}` | 获取查询状态 |
| cancelQuery | DELETE | `/dataKiosk/2023-11-15/queries/{queryId}` | 取消查询 |
| getDocument | GET | `/dataKiosk/2023-11-15/documents/{documentId}` | 获取结果文档 |

## 查询流程

```
1. createQuery(query: "{ analytics_salesAndTraffic_2024_Q1 { ... } }")
       ↓
2. 轮询 getQuery(queryId) 直到 processingStatus = "DONE"
       ↓
3. 从响应中获取 dataDocumentId
       ↓
4. getDocument(documentId) 获取下载 URL
       ↓
5. 下载 JSONL 格式结果
```

### 查询状态

| processingStatus | 说明 |
|-----------------|------|
| `IN_QUEUE` | 排队中 |
| `IN_PROGRESS` | 处理中 |
| `DONE` | 完成 |
| `CANCELLED` | 已取消 |
| `FATAL` | 失败 |

完成后返回：
- `dataDocumentId` — 成功时的数据文档
- `errorDocumentId` — 失败时的错误文档

## 可用数据集

当前主要数据集：

| 数据集 | 说明 |
|--------|------|
| **Seller Sales and Traffic** | 卖家销售和流量数据 |

> 可用数据集持续扩展中，最新列表参见 Seller Central 中的 Schema Explorer。

## 关键限制

- **不支持定时调度**: 与 Reports API 不同，不能设置定时查询
- **并发限制**: 每个卖家 + 每种查询类型有并发上限
- **唯一性约束**: 同一个 query + sellerId + applicationId 组合不允许重复提交
- **结果格式**: JSONL（每行一个 JSON 对象）

## 与 Reports API 和 AMC 的对比

| | Data Kiosk | Reports API | AMC |
|--|---|---|---|
| **查询语言** | GraphQL | 预定义 reportType | SQL |
| **灵活性** | 中（可选字段/过滤） | 低（固定模板） | 高（自由 SQL） |
| **数据范围** | 卖家销售/流量 | 100+ 种预定义报告 | 广告事件级数据 |
| **结果格式** | JSONL | TSV/CSV/XML | CSV |
| **定时调度** | 不支持 | 支持 | 支持 |

## 所需角色

- Brand Analytics

## 适用用户

Seller 和 Vendor。
