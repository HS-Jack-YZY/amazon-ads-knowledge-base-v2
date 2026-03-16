---
name: amc-field-value-discovery
description: "Always run diagnostic queries to discover actual AMC field values before writing classification logic"
user-invocable: false
origin: auto-extracted
---

# AMC 字段值诊断优先模式

**Extracted:** 2026-03-11
**Context:** 编写 AMC SQL 分类/分析逻辑前，先验证字段的实际值

## Problem

AMC 文档描述的字段值与实际数据存在差异，直接基于文档编写 SQL 会导致分类失败：

- 文档说 `line_item_price_type` 可能为 `'CPM'`，实际值为 `'VCPM'`
- 文档说 `match_type` 对非关键词投放为 NULL，实际为 `'TARGETING_EXPRESSION'` 或 `'TARGETING_EXPRESSION_PREDEFINED'`
- 文档说 `creative_asin` 仅对"部分 SP 和 SD"有值，实际在某些账户中 SP 全部有值
- `targeting` 字段对商品投放的格式为 `asin="B0777L5YN6"`（带前缀和引号），非纯 ASIN

## Solution

在编写任何依赖字段值的分类逻辑前，先跑以下诊断查询模板：

### 1. 枚举字段的所有实际值

```sql
SELECT
  ad_product_type,
  <target_field>,
  SUM(impressions) AS impressions
FROM sponsored_ads_traffic
GROUP BY ad_product_type, <target_field>
```

### 2. 检查字段是否有值

```sql
SELECT
  ad_product_type,
  CASE
    WHEN <target_field> IS NOT NULL THEN 'HAS_VALUE'
    ELSE 'IS_NULL'
  END AS field_status,
  SUM(impressions) AS impressions
FROM sponsored_ads_traffic
GROUP BY
  ad_product_type,
  CASE
    WHEN <target_field> IS NOT NULL THEN 'HAS_VALUE'
    ELSE 'IS_NULL'
  END
```

### 3. 检查两个字段的格式和关联

```sql
SELECT
  ad_product_type,
  <field_a>,
  <field_b>,
  SUM(impressions) AS impressions
FROM sponsored_ads_traffic
WHERE <filter_condition>
GROUP BY ad_product_type, <field_a>, <field_b>
LIMIT 30
```

### 已验证的 match_type 实际值

| match_type | 含义 | 广告类型 |
|---|---|---|
| `BROAD` | 广泛匹配关键词 | SP, SB |
| `PHRASE` | 短语匹配关键词 | SP, SB |
| `EXACT` | 精确匹配关键词 | SP, SB |
| `TARGETING_EXPRESSION` | 手动商品/受众投放 | SP, SB, SD |
| `TARGETING_EXPRESSION_PREDEFINED` | 自动投放 | SP |
| `THEME` | 主题投放 | SB |

### 已验证的 targeting 格式

- 商品投放: `asin="B0777L5YN6"`（需用 `CONCAT('asin="', creative_asin, '"')` 匹配）
- 关键词投放: 纯文本关键词（如 `premium widgets`）

## When to Use

- 编写 AMC SQL 分类逻辑（如 Full Funnel 分类）时
- 基于字段值做 CASE WHEN 判断前
- 需要 JOIN 两个字段时（先验证格式是否一致）
- 文档说"部分事件有值"但不确定具体哪些有值时
