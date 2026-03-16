# Amazon Ads & SP-API Knowledge Base for Claude Code

一个为 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 设计的 Amazon Advertising + Selling Partner API 综合知识库。安装后，Claude 可以回答 Amazon Ads API 问题、编写 AMC SQL 查询、查询 SP-API 端点用法、解释广告和卖家平台概念。

[English](#english)

---

## 项目简介

本知识库整合了三大领域：

- **Amazon Ads API** — 所有广告产品的 API 端点、认证方式、数据模型、实操指南（83 个文档）
- **Amazon Marketing Cloud (AMC)** — 19 张数据表 schema、SQL 语法参考、平台概念（27 个文档）
- **Selling Partner API (SP-API)** — 卖家运营核心 API：订单、库存、Listing、报告、Feeds 等（17 个文档）

## 目录结构

```
knowledge_base/
├── amazon-ads-api/          # Ads API 文档（83 个文件）
│   ├── INDEX.md             # 总索引
│   ├── QUICK-REFERENCE.md   # 快速参考
│   ├── concepts/            # 错误处理、限流、配额、版本策略
│   ├── common-models/       # Campaigns、Ad Groups、Targets、Ads
│   ├── guides/              # OAuth 认证、端点参考、代码示例、Entity 参数、Reporting v3、Exports、Marketing Stream
│   ├── resources/           # 各产品 API 端点（SP、SB、SD、DSP、AMC 等）+ v1 CRUD 参考
│   └── amazon-ads-v1/       # v1 通用模型
├── amc/                     # AMC 领域知识（27 个文件）
│   ├── README.md            # 表索引 + SQL 技巧 + 示例查询
│   ├── concepts/            # 概述、聚合阈值、API 指南、工作流管理
│   ├── sql_reference/       # 函数、表达式、限制
│   ├── dsp/                 # DSP 流量表 schema
│   ├── conversions/         # 转化表 schema
│   ├── sponsored_ads/       # 赞助广告表 schema
│   ├── paid_features/       # 付费功能表 schema
│   └── amazon_live/         # Amazon Live 表 schema
└── selling-partner-api/     # SP-API 文档（17 个文件）
    ├── INDEX.md             # SP-API 总索引 + 快速参考
    ├── concepts/            # 概述、认证、端点、限流、错误处理
    └── resources/           # 核心业务 API（Orders、Reports、Catalog 等）

.claude/
├── agents/
│   ├── ads-expert.md        # ads-expert agent（Ads API + AMC，自动调度）
│   └── sp-expert.md         # sp-expert agent（SP-API，自动调度）
├── commands/
│   ├── ads.md               # /ads 命令（手动调用）
│   └── sp.md                # /sp 命令（手动调用）
└── skills/learned/          # 已学技能
```

## 包含内容

### Amazon Ads API（83 个文件）

| 分类 | 内容 |
|------|------|
| API 概览 | 区域端点（NA/EU/FE）、版本策略 |
| 核心概念 | 错误处理、限流、配额、Computed Status |
| 认证 | OAuth 2.0 / Login with Amazon（完整流程指南） |
| 数据模型 | Campaigns、Ad Groups、Targets、Ads、Enums |
| 产品 API | Sponsored Products、Sponsored Brands (v3/v4)、Sponsored Display、Sponsored TV |
| DSP API | Measurement、Audiences、Frequency、Forecasts、Conversions |
| AMC API | Administration、Reporting、Rule-based Audiences、Custom Models、SQL 语法 |
| 实操指南 | 端点参考表、代码示例、Entity 参数矩阵、Reporting v3、Exports、Marketing Stream |
| v1 CRUD | Campaign/AdGroup/Target/Ad/AdAssociation 的完整 CRUD 文档 |
| 其他 | Billing、Portfolios、Profiles、Attribution |

### AMC 数据表（19 张表）

| 分类 | 表 |
|------|-----|
| **DSP 流量** | `dsp_impressions`, `dsp_clicks`, `dsp_views`, `dsp_impressions_by_segments`, `dsp_video_events_feed` |
| **转化** | `conversions`, `conversions_with_relevance`, `amazon_attributed_events_by_conversion_time`, `amazon_attributed_events_by_traffic_time` |
| **赞助广告** | `sponsored_ads_traffic` |
| **Amazon Live** | `amazon_live_traffic` |
| **付费功能** | `conversions_all`, `audience_segment_membership`, `amazon_your_garage`, `brand_store_insights`, `amazon_retail_purchase`, `prime_video_channel_insights`, `experian_vehicle_purchases`, `cpg_insights_stream` |

每张表包含：完整字段列表、数据类型、字段描述、聚合阈值等级（NONE / LOW / MEDIUM / HIGH / VERY_HIGH / INTERNAL）。

### Selling Partner API（17 个文件）

| 分类 | API | 说明 |
|------|-----|------|
| **概念** | — | SP-API 概述、与 Ads API 对比、OAuth 认证、区域端点、限流、错误处理 |
| **订单 & 履约** | Orders / FBA Inventory / Fulfillment Inbound | 订单查询、FBA 库存、入仓发货 |
| **商品 & Listing** | Catalog Items / Listings Items | ASIN 详情、Listing CRUD |
| **定价** | Product Pricing | 竞品价格、Buy Box |
| **数据 & 报告** | Reports / Data Kiosk / Notifications | 报告下载、GraphQL 查询、事件推送 |
| **批量操作** | Feeds | 批量上传（价格/库存/商品） |
| **财务** | Finances | 财务交易、结算 |

## 安装

### 方式一：安装到已有项目（推荐）

```bash
cd ~/your-project
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
./amazon-ads-knowledge-base-v2/install.sh
```

安装脚本会自动将知识库、agent、command 复制到项目根目录的正确位置，并更新 `CLAUDE.md`。安装完成后可以删除 clone 的子目录：

```bash
rm -rf amazon-ads-knowledge-base-v2
```

### 更新

当知识库有新版本时，重新 clone 并使用 `--update` 参数：

```bash
cd ~/your-project
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
./amazon-ads-knowledge-base-v2/install.sh --update
rm -rf amazon-ads-knowledge-base-v2
```

`--update` 会覆盖所有已安装的文件（知识库、agent、command、CLAUDE.md 配置块），确保与最新版本一致。

### 方式二：直接作为独立项目使用

```bash
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
cd amazon-ads-knowledge-base-v2
# 直接在此目录下使用 Claude Code
```

## 使用方式

### `/ads` 命令

Amazon Ads + AMC 统一入口，自动判断问题类型：

```
/ads Sponsored Products 的 API endpoint 是什么？
/ads 写一个查询 DSP 广告 ROAS 的 AMC SQL
/ads 什么是聚合阈值？
/ads 如何通过 API 提交 AMC 查询？
```

### `/sp` 命令

Selling Partner API 统一入口：

```
/sp 如何查询订单列表？
/sp FBA 入仓的 API 流程是什么？
/sp 怎么用 Reports API 下载库存报告？
/sp Listing 更新用 PUT 还是 PATCH？
```

### `ads-expert` / `sp-expert` Agent

对话中提到广告或卖家运营相关话题时自动调度，无需手动触发：

```
你：帮我写一个分析 SP 广告每日表现的 AMC SQL
Claude：（自动调度 ads-expert agent，读取知识库，编写 SQL）

你：帮我查一下 Orders API 的 rate limit
Claude：（自动调度 sp-expert agent，查阅知识库，给出答案）
```

### 在线查询

当本地知识库没有相关信息时，agent 会自动通过 Playwright 浏览 Amazon 官方文档获取最新内容。

## AMC SQL 关键规则

| 规则 | 说明 |
|------|------|
| 聚合阈值 | `VERY_HIGH` 字段（如 `user_id`）不能出现在最终 SELECT，只能在 CTE 中聚合 |
| 费用单位 | Microcents ÷ 100,000,000 得美元；Millicents ÷ 100,000 得美元 |
| 时区 | 默认 UTC，跨表关联用 `_utc` 后缀字段 |
| 归因窗口 | 使用 `SECONDS_BETWEEN()` 实现自定义归因 |
| JOIN | 不用 `request_tag` 做 JOIN 键，优先 `UNION ALL` 合并数据源 |
| 转化表 | SP/SD → `by_traffic_time`，SB → `by_conversion_time` |

## 数据来源

- Ads API 文档：[Amazon Ads API Documentation](https://advertising.amazon.com/API/docs/en-us/)
- AMC 表 schema：[AMC Data Sources](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/datasources/overview)
- SP-API 文档：[Selling Partner API Documentation](https://developer-docs.amazon.com/sp-api/)

## 许可证

MIT

---

<a id="english"></a>

## English

[中文说明](#amazon-ads--sp-api-knowledge-base-for-claude-code)

A comprehensive Amazon Advertising + Selling Partner API knowledge base designed for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Once installed, Claude can answer Amazon Ads API questions, write AMC SQL queries, look up SP-API endpoint usage, and explain advertising and seller platform concepts.

### What's Included

| Component | Count | Description |
|-----------|-------|-------------|
| Amazon Ads API docs | 83 files | API endpoints, authentication, data models, practical guides for all ad products |
| AMC table schemas | 19 tables | Full field definitions with data types and aggregation thresholds |
| AMC concepts & SQL | 8 docs | Overview, aggregation thresholds, API guide, workflow management, functions, expressions |
| Selling Partner API docs | 17 files | Core seller APIs: Orders, Inventory, Listings, Reports, Feeds, etc. |
| Agents | 2 | `ads-expert` (Ads + AMC), `sp-expert` (SP-API) — auto-dispatched |
| Commands | 2 | `/ads` and `/sp` — unified entry points |

### AMC Tables

| Category | Tables |
|----------|--------|
| **DSP Traffic** | `dsp_impressions`, `dsp_clicks`, `dsp_views`, `dsp_impressions_by_segments`, `dsp_video_events_feed` |
| **Conversions** | `conversions`, `conversions_with_relevance`, `amazon_attributed_events_by_conversion_time`, `amazon_attributed_events_by_traffic_time` |
| **Sponsored Ads** | `sponsored_ads_traffic` |
| **Amazon Live** | `amazon_live_traffic` |
| **Paid Features** | `conversions_all`, `audience_segment_membership`, `amazon_your_garage`, `brand_store_insights`, `amazon_retail_purchase`, `prime_video_channel_insights`, `experian_vehicle_purchases`, `cpg_insights_stream` |

### Selling Partner API

| Category | APIs | Description |
|----------|------|-------------|
| **Concepts** | — | Overview, authentication, endpoints, rate limits, error handling |
| **Orders & Fulfillment** | Orders / FBA Inventory / Fulfillment Inbound | Order queries, FBA inventory, inbound shipments |
| **Listings & Catalog** | Catalog Items / Listings Items | ASIN details, listing CRUD |
| **Pricing** | Product Pricing | Competitive prices, Buy Box |
| **Data & Reporting** | Reports / Data Kiosk / Notifications | Report downloads, GraphQL queries, event subscriptions |
| **Batch Operations** | Feeds | Bulk uploads (pricing/inventory/listings) |
| **Finances** | Finances | Financial transactions, settlements |

### Installation

#### Option 1: Install into an existing project (recommended)

```bash
cd ~/your-project
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
./amazon-ads-knowledge-base-v2/install.sh
```

The install script copies the knowledge base, agents, and commands to the correct locations in your project root, and updates `CLAUDE.md`. You can remove the cloned subdirectory after installation:

```bash
rm -rf amazon-ads-knowledge-base-v2
```

#### Updating

When a new version is available, re-clone and use `--update`:

```bash
cd ~/your-project
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
./amazon-ads-knowledge-base-v2/install.sh --update
rm -rf amazon-ads-knowledge-base-v2
```

`--update` overwrites all installed files (knowledge base, agents, commands, CLAUDE.md config block) to match the latest version.

#### Option 2: Use as a standalone project

```bash
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
cd amazon-ads-knowledge-base-v2
# Use Claude Code directly in this directory
```

### Usage

#### `/ads` Command

```
/ads What are the Sponsored Products API endpoints?
/ads Write an AMC SQL query for DSP campaign ROAS
/ads What is aggregation threshold?
/ads How to submit an AMC query via API?
```

#### `/sp` Command

```
/sp How to query the order list?
/sp What is the FBA inbound shipment API workflow?
/sp How to download an inventory report via Reports API?
/sp Should I use PUT or PATCH for listing updates?
```

#### `ads-expert` / `sp-expert` Agent

Automatically dispatched when ad-related or seller-related topics are detected in conversation — no manual invocation needed.

#### Online Fallback

When the local knowledge base doesn't have the answer, agents automatically browse Amazon's official documentation via Playwright.

### Key AMC SQL Rules

- **Aggregation thresholds**: `VERY_HIGH` fields (e.g., `user_id`) cannot appear in final SELECT — use only in CTEs for aggregation
- **Cost units**: Microcents ÷ 100,000,000 for dollars; Millicents ÷ 100,000 for dollars
- **Time zones**: AMC defaults to UTC; use `_utc` suffix fields for cross-table joins
- **Attribution windows**: Use `SECONDS_BETWEEN()` for custom attribution periods
- **JOIN patterns**: Don't use `request_tag` as JOIN key — prefer `UNION ALL` to combine data sources
- **Conversion tables**: SP/SD → `by_traffic_time`, SB → `by_conversion_time`

### Data Sources

- Ads API docs: [Amazon Ads API Documentation](https://advertising.amazon.com/API/docs/en-us/)
- AMC schemas: [AMC Data Sources](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/datasources/overview)
- SP-API docs: [Selling Partner API Documentation](https://developer-docs.amazon.com/sp-api/)

### License

MIT
