---
title: Amazon Marketing Cloud SQL basics
description: The basics of AMC SQL
type: guide
interface: api
---

# AMC SQL Basics

**Important:** Every AMC query must contain at least one aggregation method (e.g., `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`).

## SELECT

The `SELECT` clause specifies which columns or expressions to include in the result.

```sql
SELECT column1, column2, SUM(column3) AS total
FROM table_name
GROUP BY column1, column2
```

**Note:** `SELECT *` is not supported in AMC due to privacy reasons. Always list specific columns.

### DISTINCT

Removes duplicate rows from the result:

```sql
SELECT DISTINCT campaign, ad_product_type
FROM sponsored_ads_traffic
```

## FROM

Specifies the table(s) to query:

```sql
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY campaign
```

## LIMIT

Limits the number of rows returned. Always applied after filtering (WHERE) and aggregation (GROUP BY):

```sql
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY campaign
LIMIT 100
```

## JOIN Types

### INNER JOIN

Returns rows where the join condition is met in both tables:

```sql
SELECT a.campaign, a.impressions, b.clicks
FROM dsp_impressions a
INNER JOIN dsp_clicks b ON a.user_id = b.user_id AND a.campaign = b.campaign
```

### LEFT JOIN (LEFT OUTER JOIN)

Returns all rows from the left table, and matched rows from the right table (NULL if no match):

```sql
SELECT imp.campaign, imp.impressions, clk.clicks
FROM dsp_impressions imp
LEFT JOIN dsp_clicks clk ON imp.user_id = clk.user_id
```

### FULL OUTER JOIN

Returns all rows from both tables, with NULLs where there is no match:

```sql
SELECT
  COALESCE(a.campaign, b.campaign) AS campaign,
  a.impressions,
  b.clicks
FROM dsp_impressions a
FULL OUTER JOIN dsp_clicks b ON a.campaign = b.campaign
```

### CROSS JOIN

Returns the Cartesian product of both tables (every combination of rows):

```sql
SELECT a.campaign, b.date_val
FROM campaigns a
CROSS JOIN date_range b
```

### Non-Equi JOIN

Joins on conditions other than equality:

```sql
SELECT a.campaign, b.event_type
FROM dsp_impressions a
JOIN conversions b ON a.user_id = b.user_id
  AND b.conversion_event_dt > a.impression_dt
```

### RIGHT JOIN

**Not supported.** Use LEFT JOIN with the tables swapped:

```sql
-- Instead of: SELECT ... FROM a RIGHT JOIN b ON ...
-- Use:        SELECT ... FROM b LEFT JOIN a ON ...
```

### JOIN vs UNION

| Feature | JOIN | UNION |
|---------|------|-------|
| Purpose | Combine columns from multiple tables | Combine rows from multiple queries |
| Result | Wider (more columns) | Taller (more rows) |
| Requirement | ON condition | Same number of columns, compatible types |

Use `UNION ALL` (not `UNION`) when combining traffic and conversion data to preserve all rows:

```sql
SELECT campaign, impressions, 0 AS conversions FROM sponsored_ads_traffic
UNION ALL
SELECT campaign, 0 AS impressions, total_purchases AS conversions FROM amazon_attributed_events_by_traffic_time
```

## WHERE

Filters rows before aggregation:

```sql
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
WHERE impression_date >= DATE '2024-01-01'
  AND ad_product_type = 'display'
GROUP BY campaign
```

## GROUP BY

Groups rows for aggregation:

```sql
SELECT campaign, ad_group, SUM(clicks) AS total_clicks
FROM dsp_clicks
GROUP BY campaign, ad_group
```

## HAVING

Filters groups after aggregation:

```sql
SELECT campaign, COUNT(DISTINCT user_id) AS unique_users
FROM dsp_impressions
GROUP BY campaign
HAVING COUNT(DISTINCT user_id) >= 1000
```

## Aliases

### Column Aliases

```sql
SELECT SUM(impressions) AS total_impressions
FROM dsp_impressions
```

### Table Aliases

```sql
SELECT i.campaign, i.impressions
FROM dsp_impressions AS i
```

## VALUES

Creates an inline table of literal values, commonly used with CTEs:

```sql
WITH campaign_list (campaign_name) AS (
  VALUES
    ('campaign_a'),
    ('campaign_b'),
    ('campaign_c')
)
SELECT campaign_name FROM campaign_list
```

## REGEX Patterns

AMC SQL supports regular expression matching. Key patterns:

| Pattern | Meaning | Example |
|---------|---------|---------|
| `^` | Start of string | `'^SP'` matches strings starting with "SP" |
| `(?!)` | Negative lookahead | `'^(?!SP)'` matches strings NOT starting with "SP" |
| `''` | Escaped single quote in strings | `'can''t'` |

Use with `REGEXP_SUBSTR`, `REGEXP_REPLACE`, `REGEXP_SPLIT`, or `SIMILAR TO`.

## Common Table Expressions (CTEs)

CTEs allow you to define temporary named result sets within a query. They are essential in AMC SQL for working with VERY_HIGH threshold fields like `user_id`.

```sql
WITH user_campaign_counts AS (
  SELECT
    campaign,
    COUNT(DISTINCT user_id) AS unique_users,
    SUM(impressions) AS total_impressions
  FROM dsp_impressions
  GROUP BY campaign
),
filtered AS (
  SELECT *
  FROM user_campaign_counts
  WHERE unique_users >= 100
)
SELECT campaign, unique_users, total_impressions
FROM filtered
```

### Why CTEs matter in AMC

- VERY_HIGH fields (like `user_id`) can only be used in CTEs with aggregation functions — they cannot appear in the final SELECT
- CTEs let you build multi-step analyses while respecting aggregation thresholds
- Multiple CTEs can reference each other (but not circularly)
- Note: there is a comma separating multiple CTE definitions and no comma prior to the terminal query
