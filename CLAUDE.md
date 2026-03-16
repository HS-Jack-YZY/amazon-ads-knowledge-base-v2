# AdsAPI Project

Amazon Advertising API + AMC 综合知识库项目。

## Agents

- **ads-expert** (`.claude/agents/ads-expert.md`): Amazon Ads 综合专家，自动识别 API 和 AMC 相关对话，提供 API 问答、SQL 编写和知识问答

## Commands

- `/ads <question>`: Amazon Ads 综合助手，自动判断问题类型（API 调用 / AMC SQL / 概念问答）

## Knowledge Base

### Amazon Ads API（API 层面）

位于 `knowledge_base/amazon-ads-api/`，涵盖：

- API 概览和区域端点
- 核心概念（错误处理、限流、配额、版本策略）
- 通用数据模型（Campaigns、Ad Groups、Targets、Ads）
- OAuth 认证指南
- 所有产品 API（SP、SB、SD、STV、DSP、AMC 等）
- AMC SQL 语法基础和概述（合并自 AMC 知识库的优化版）

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

### 更新知识库

概念/指南页面可直接从 CloudFront CDN 获取原始 Markdown：
```bash
curl -s "https://d3a0d0y2hgofx6.cloudfront.net/en-us/reference/concepts/{page}.md"
```

OpenAPI 规范可从 contracts.json 索引获取：
```bash
curl -s "https://d3a0d0y2hgofx6.cloudfront.net/en-us/contracts.json"
```
