# Amazon Ads Knowledge Base for Claude Code

一个为 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 设计的 Amazon Advertising 综合知识库。安装后，Claude 可以回答 Amazon Ads API 问题、编写 AMC SQL 查询、解释广告平台概念。

[English](#english)

---

## 项目简介

本知识库整合了两大领域：

- **Amazon Ads API** — 所有广告产品的 API 端点、认证方式、数据模型（56 个文档）
- **Amazon Marketing Cloud (AMC)** — 19 张数据表 schema、SQL 语法参考、平台概念（27 个文档）

## 目录结构

```
knowledge_base/
├── amazon-ads-api/          # API 文档（56 个文件）
│   ├── INDEX.md             # 总索引
│   ├── QUICK-REFERENCE.md   # 快速参考
│   ├── concepts/            # 错误处理、限流、配额、版本策略
│   ├── common-models/       # Campaigns、Ad Groups、Targets、Ads
│   ├── guides/              # OAuth 认证指南
│   └── resources/           # 各产品 API 端点（SP、SB、SD、DSP、AMC 等）
└── amc/                     # AMC 领域知识（27 个文件）
    ├── README.md            # 表索引 + SQL 技巧 + 示例查询
    ├── concepts/            # 概述、聚合阈值、API 指南、工作流管理
    ├── sql_reference/       # 函数、表达式、限制
    ├── dsp/                 # DSP 流量表 schema
    ├── conversions/         # 转化表 schema
    ├── sponsored_ads/       # 赞助广告表 schema
    ├── paid_features/       # 付费功能表 schema
    └── amazon_live/         # Amazon Live 表 schema

.claude/
├── agents/ads-expert.md     # ads-expert agent（自动调度）
├── commands/ads.md          # /ads 命令（手动调用）
└── skills/learned/          # 已学技能
```

## 包含内容

### Amazon Ads API（56 个文件）

| 分类 | 内容 |
|------|------|
| API 概览 | 区域端点（NA/EU/FE）、版本策略 |
| 核心概念 | 错误处理、限流、配额、Computed Status |
| 认证 | OAuth 2.0 / Login with Amazon |
| 数据模型 | Campaigns、Ad Groups、Targets、Ads、Enums |
| 产品 API | Sponsored Products、Sponsored Brands (v3/v4)、Sponsored Display、Sponsored TV |
| DSP API | Measurement、Audiences、Frequency、Forecasts、Conversions |
| AMC API | Administration、Reporting、Rule-based Audiences、Custom Models、SQL 语法 |
| 其他 | Reporting v3、Billing、Portfolios、Profiles、Attribution、Marketing Stream |

### AMC 数据表（19 张表）

| 分类 | 表 |
|------|-----|
| **DSP 流量** | `dsp_impressions`, `dsp_clicks`, `dsp_views`, `dsp_impressions_by_segments`, `dsp_video_events_feed` |
| **转化** | `conversions`, `conversions_with_relevance`, `amazon_attributed_events_by_conversion_time`, `amazon_attributed_events_by_traffic_time` |
| **赞助广告** | `sponsored_ads_traffic` |
| **Amazon Live** | `amazon_live_traffic` |
| **付费功能** | `conversions_all`, `audience_segment_membership`, `amazon_your_garage`, `brand_store_insights`, `amazon_retail_purchase`, `prime_video_channel_insights`, `experian_vehicle_purchases`, `cpg_insights_stream` |

每张表包含：完整字段列表、数据类型、字段描述、聚合阈值等级（NONE / LOW / MEDIUM / HIGH / VERY_HIGH / INTERNAL）。

## 安装

1. 克隆仓库到你的项目目录：

```bash
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
cd amazon-ads-knowledge-base-v2
```

2. 安装完成。Claude Code 在该目录下会自动加载 `CLAUDE.md`、agent 和 command。

## 使用方式

### `/ads` 命令

统一入口，自动判断问题类型：

```
/ads Sponsored Products 的 API endpoint 是什么？
/ads 写一个查询 DSP 广告 ROAS 的 AMC SQL
/ads 什么是聚合阈值？
/ads 如何通过 API 提交 AMC 查询？
```

### `ads-expert` Agent

对话中提到广告相关话题时自动调度，无需手动触发：

```
你：帮我写一个分析 SP 广告每日表现的 AMC SQL
Claude：（自动调度 ads-expert agent，读取知识库，编写 SQL）
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

- API 文档：[Amazon Ads API Documentation](https://advertising.amazon.com/API/docs/en-us/)
- AMC 表 schema：[AMC Data Sources](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/datasources/overview)

## 许可证

MIT

---

<a id="english"></a>

## English

[中文说明](#amazon-ads-knowledge-base-for-claude-code)

A comprehensive Amazon Advertising knowledge base designed for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Once installed, Claude can answer Amazon Ads API questions, write AMC SQL queries, and explain advertising platform concepts.

### What's Included

| Component | Count | Description |
|-----------|-------|-------------|
| Amazon Ads API docs | 56 files | API endpoints, authentication, data models for all ad products |
| AMC table schemas | 19 tables | Full field definitions with data types and aggregation thresholds |
| AMC concepts | 4 docs | Overview, aggregation thresholds, API guide, workflow management |
| AMC SQL reference | 3 docs | Functions, expressions, limitations |
| Agent | 1 | `ads-expert` — auto-dispatched for ad-related conversations |
| Command | 1 | `/ads` — unified entry point for all queries |

### AMC Tables

| Category | Tables |
|----------|--------|
| **DSP Traffic** | `dsp_impressions`, `dsp_clicks`, `dsp_views`, `dsp_impressions_by_segments`, `dsp_video_events_feed` |
| **Conversions** | `conversions`, `conversions_with_relevance`, `amazon_attributed_events_by_conversion_time`, `amazon_attributed_events_by_traffic_time` |
| **Sponsored Ads** | `sponsored_ads_traffic` |
| **Amazon Live** | `amazon_live_traffic` |
| **Paid Features** | `conversions_all`, `audience_segment_membership`, `amazon_your_garage`, `brand_store_insights`, `amazon_retail_purchase`, `prime_video_channel_insights`, `experian_vehicle_purchases`, `cpg_insights_stream` |

### Installation

```bash
git clone https://github.com/HS-Jack-YZY/amazon-ads-knowledge-base-v2.git
cd amazon-ads-knowledge-base-v2
```

Claude Code automatically loads `CLAUDE.md`, the agent, and the command when working in this directory.

### Usage

#### `/ads` Command

```
/ads What are the Sponsored Products API endpoints?
/ads Write an AMC SQL query for DSP campaign ROAS
/ads What is aggregation threshold?
/ads How to submit an AMC query via API?
```

#### `ads-expert` Agent

Automatically dispatched when ad-related topics are detected in conversation — no manual invocation needed.

#### Online Fallback

When local knowledge base doesn't have the answer, the agent automatically browses Amazon's official documentation via Playwright.

### Key AMC SQL Rules

- **Aggregation thresholds**: `VERY_HIGH` fields (e.g., `user_id`) cannot appear in final SELECT — use only in CTEs for aggregation
- **Cost units**: Microcents ÷ 100,000,000 for dollars; Millicents ÷ 100,000 for dollars
- **Time zones**: AMC defaults to UTC; use `_utc` suffix fields for cross-table joins
- **Attribution windows**: Use `SECONDS_BETWEEN()` for custom attribution periods
- **JOIN patterns**: Don't use `request_tag` as JOIN key — prefer `UNION ALL` to combine data sources
- **Conversion tables**: SP/SD → `by_traffic_time`, SB → `by_conversion_time`

### Data Sources

- API docs: [Amazon Ads API Documentation](https://advertising.amazon.com/API/docs/en-us/)
- AMC schemas: [AMC Data Sources](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/datasources/overview)

### License

MIT
