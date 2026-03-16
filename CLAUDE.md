# AdsAPI Project

Amazon Advertising API + AMC + Selling Partner API 综合知识库项目。

## Agents

- **ads-expert** (`.claude/agents/ads-expert.md`): Amazon Ads 综合专家，自动识别 API 和 AMC 相关对话，提供 API 问答、SQL 编写和知识问答
- **sp-expert** (`.claude/agents/sp-expert.md`): Amazon SP-API 综合专家，自动识别卖家运营 API 相关对话（订单、库存、Listing、FBA、报告等）

## Commands

- `/ads <question>`: Amazon Ads 综合助手，自动判断问题类型（API 调用 / AMC SQL / 概念问答）
- `/sp <question>`: Amazon SP-API 综合助手，自动判断问题类型（API 调用 / 业务操作 / 概念问答）

## Knowledge Base

### Amazon Ads API（API 层面）

位于 `knowledge_base/amazon-ads-api/`，涵盖：

- API 概览和区域端点
- 核心概念（错误处理、限流、配额、版本策略）
- 通用数据模型（Campaigns、Ad Groups、Targets、Ads）
- OAuth 认证指南
- 所有产品 API（SP、SB、SD、STV、DSP、AMC 等）
- AMC SQL 语法基础和概述（合并自 AMC 知识库的优化版）

#### 实操指南（guides/）

当用户需要实际调用 API 时，优先参考这些文件：

- **`guides/api-endpoints-reference.md`** — 所有产品的完整端点路径表（v1、SP、SB v4、SD、Reporting、AMC）
- **`guides/pagination-and-batch.md`** — 3 种分页模式、批量操作 207 响应处理、异步模式、限流重试
- **`guides/code-examples.md`** — Python 端到端代码示例（认证、Profile、Campaign CRUD、Report、AMC SQL）

#### 认证指南（guides/authorization-*）

OAuth 2.0 完整流程文档：

- **`guides/authorization-overview.md`** — OAuth 2.0 流程概述、三个必要 Header
- **`guides/authorization-grants.md`** — 授权码获取（Consent URL、区域端点、参数）
- **`guides/authorization-access-tokens.md`** — Token 获取/刷新（curl 示例、60 分钟有效期）
- **`guides/authorization-profiles.md`** — Profile 检索（区域行为、账户类型：vendor/seller/agency）

#### Campaign Management Entity 教程（guides/campaign-mgmt-*）

v1 通用模型下 5 个 entity 的参数矩阵和嵌套对象详解：

- **`guides/campaign-mgmt-entities-overview.md`** — 5 个 entity 概览和层级关系
- **`guides/campaign-mgmt-entities-campaign.md`** — Campaign 参数（SP/SB/DSP 对比表）
- **`guides/campaign-mgmt-entities-ad-group.md`** — AdGroup 参数（Bid、Targeting Settings）
- **`guides/campaign-mgmt-entities-ad.md`** — Ad 参数（6 种 Creative 类型详解）
- **`guides/campaign-mgmt-entities-target.md`** — Target 参数（24+ 种定向类型）
- **`guides/campaign-mgmt-entities-ad-association.md`** — AdAssociation（仅 DSP）

#### Reporting v3 教程（guides/reporting-v3-*）

- **`guides/reporting-v3-report-types.md`** — 19 种报告类型 × 5 个广告产品的可用性矩阵
- **`guides/reporting-v3-columns.md`** — 所有报告指标（~100KB），含类型、描述和适用报告类型

#### Exports API 教程（guides/exports-*）

异步批量导出 Campaign 元数据：

- **`guides/exports-overview.md`** — Exports vs Reports vs List，并发限制
- **`guides/exports-campaigns.md`** / **`exports-ad-groups.md`** / **`exports-targets.md`** / **`exports-ads.md`** — 各 entity 的导出 schema 和 JSON 示例

#### Marketing Stream 数据指南

- **`guides/marketing-stream-data-guide.md`** — 所有 Stream 数据集（DSP/SP/SD/SB Performance + 运营 + Campaign Management），订阅端点和区域可用性

#### v1 CRUD 参考（resources/）

带 JSON 请求/响应示例的 CRUD 操作文档：

- `resources/campaigns-v1.md` — Campaign 创建/列表/更新（SP/SB/DSP 示例）
- `resources/ad-groups-v1.md` — Ad Group CRUD
- `resources/targets-v1.md` — 关键词 + 产品定向 + 受众定向
- `resources/ads-v1.md` — Ad CRUD（含 SD/SB 广告类型）
- `resources/ad-associations-v1.md` — Ad Association + 典型工作流
- `resources/amc-reporting.md` — AMC Workflow 创建/执行/下载完整 API 文档

### AMC 知识库（领域层面）

位于 `knowledge_base/amc/`，包含 AMC 表结构 + 概念文档 + SQL 参考：

- **DSP 流量表**: `dsp_impressions`, `dsp_clicks`, `dsp_views`, `dsp_impressions_by_segments`, `dsp_video_events_feed`
- **转化表**: `conversions`, `conversions_with_relevance`, `amazon_attributed_events_by_conversion_time`
- **赞助广告表**: `sponsored_ads_traffic`
- **Amazon Live 表**: `amazon_live_traffic`
- **付费功能表**: `conversions_all`, `audience_segment_membership`, `amazon_your_garage`, `brand_store_insights`, `amazon_retail_purchase`, `prime_video_channel_insights`, `experian_vehicle_purchases`, `cpg_insights_stream`
- **概念文档**: 概述、聚合阈值、API 指南、工作流管理
- **SQL 参考**: 函数、表达式、限制

## AMC SQL 知识库

当用户提到 AMC、Amazon Marketing Cloud 或需要编写 AMC SQL 查询时：

1. 先读取 `knowledge_base/amc/README.md` 获取表索引和 SQL 技巧
2. 根据需求读取 `knowledge_base/amc/` 下对应的表结构文件
3. 编写 SQL 时严格遵守聚合阈值规则（VERY_HIGH 字段不能出现在最终 SELECT）

推荐使用 `ads-expert` agent（对话中提及广告相关话题时自动调度），也可以使用 `/ads` 命令手动进入助手模式。

### Selling Partner API（卖家运营层面）

位于 `knowledge_base/selling-partner-api/`，涵盖：

- 概念文档（SP-API 概述、与 Ads API 对比）
- 认证指南（OAuth 流程、Header 格式差异、RDT、Grantless Operations）
- 区域端点和 Marketplace ID 完整参考
- Rate Limit（Token Bucket 算法）和错误处理

#### 核心业务 API（resources/）

| 文件 | API | 说明 |
|------|-----|------|
| `resources/orders.md` | Orders API | 订单查询、状态、发货确认 |
| `resources/reports.md` | Reports API | 100+ 种报告类型、创建/下载流程 |
| `resources/catalog-items.md` | Catalog Items API | ASIN 详情、商品搜索 |
| `resources/listings-items.md` | Listings Items API | Listing CRUD、PUT vs PATCH |
| `resources/product-pricing.md` | Product Pricing API | 竞品价格、Buy Box |
| `resources/fba-inventory.md` | FBA Inventory API | FBA 库存 5 种状态 |
| `resources/fulfillment-inbound.md` | Fulfillment Inbound API | FBA 入仓 9 步流程 |
| `resources/finances.md` | Finances API | 财务交易查询 |
| `resources/data-kiosk.md` | Data Kiosk API | GraphQL 自定义数据查询 |
| `resources/feeds.md` | Feeds API | 批量数据上传 |
| `resources/notifications.md` | Notifications API | 事件推送订阅 |

推荐使用 `sp-expert` agent（对话中提及卖家运营 API 话题时自动调度），也可以使用 `/sp` 命令手动进入助手模式。

### 更新知识库

概念/指南页面可直接从 CloudFront CDN 获取原始 Markdown：
```bash
# Reference 页面（concepts, common-models 等）
curl -s "https://d3a0d0y2hgofx6.cloudfront.net/en-us/reference/concepts/{page}.md"

# Developer Guides 页面（未入库的教程可实时获取）
curl -s "https://d3a0d0y2hgofx6.cloudfront.net/en-us/guides/{path}.md"
# 例如：guides/sponsored-products/get-started/manual-campaigns.md
```

OpenAPI 规范可从 contracts.json 索引获取：
```bash
curl -s "https://d3a0d0y2hgofx6.cloudfront.net/en-us/contracts.json"
```
