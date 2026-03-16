# Aggregation Threshold Guide

## Overview

Every column in AMC has an **aggregation threshold level** that controls how the column can be used in queries. These thresholds exist to protect user privacy by ensuring that query results represent a sufficient number of users.

## Threshold Levels

| Level | Min Users | Filter Restrictions | Can SELECT? | Typical Fields |
|-------|-----------|-------------------|-------------|----------------|
| **NONE** | 1 | None | Yes | `impressions`, `clicks`, `event_type` |
| **LOW** | 2 | None | Yes | `campaign_id`, `ad_id`, `ad_group_id` |
| **MEDIUM** | 100 | None | Yes | `bid_price`, `winning_bid_cost`, `supply_cost` |
| **HIGH** | 100 | No literal value filters | Yes (if threshold met) | `postal_code`, `state`, `city` |
| **VERY_HIGH** | N/A | No literal value filters | **Never** in final output | `user_id` |
| **INTERNAL** | N/A | N/A | **Never** in final output | `advertiser`, `campaign` (internal fields) |

## Detailed Rules

### NONE / LOW / MEDIUM
- Can be used freely in SELECT, WHERE, GROUP BY, JOIN conditions
- Results are returned as long as the aggregated group meets the minimum user threshold
- No restrictions on filtering with literal values

### HIGH
- **Can** appear in the final SELECT, but rows that don't meet the 100-user threshold return **NULL**
- **Cannot** be filtered with literal values (e.g., `WHERE postal_code = '90210'` is NOT allowed)
- **Can** be used in GROUP BY and JOIN conditions
- Filtering with other columns is allowed (e.g., `WHERE postal_code = other_table.code`)

### VERY_HIGH
- **Cannot** appear in the final SELECT output
- **Can** be used inside CTEs for aggregation functions: `COUNT(user_id)`, `COUNT(DISTINCT user_id)`
- **Cannot** be filtered with literal values
- Most common use: counting unique users (`COUNT(DISTINCT user_id)`)

### INTERNAL
- Same restrictions as VERY_HIGH
- **Can** only be used inside CTEs with `COUNT` or `COUNT DISTINCT`
- Reserved for system-internal fields

## Practical Examples

### Correct: Counting unique users by campaign

```sql
SELECT
  campaign,
  COUNT(DISTINCT user_id) AS unique_users,
  SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY campaign
```

`user_id` is VERY_HIGH but is used inside `COUNT(DISTINCT ...)`, which is allowed.

### Correct: Geographic analysis with GROUP BY

```sql
SELECT
  state,
  COUNT(DISTINCT user_id) AS unique_users
FROM dsp_impressions
GROUP BY state
```

`state` is HIGH but appears in GROUP BY and SELECT — rows with fewer than 100 users will return NULL for `state`.

### Wrong: Filtering HIGH field with literal value

```sql
-- This will FAIL
SELECT COUNT(DISTINCT user_id) AS unique_users
FROM dsp_impressions
WHERE postal_code = '90210'
```

`postal_code` is HIGH and cannot be filtered with a literal value.

### Wrong: Selecting VERY_HIGH field in final output

```sql
-- This will FAIL
SELECT user_id, campaign
FROM dsp_impressions
```

`user_id` is VERY_HIGH and cannot appear in the final SELECT.

## Handling NULL Rows in Results

When using HIGH threshold fields like `postal_code` or `state` in GROUP BY, rows that don't meet the minimum user count will have the HIGH field set to NULL. This means your results may contain NULL rows representing aggregated data from below-threshold groups.

### Tips to reduce NULL rows:
1. **Extend the time window** — a longer date range increases the chance of meeting the user threshold per group
2. **Use less restrictive filters** — broader filters include more users per group
3. **Use coarser granularity** — group by `state` instead of `postal_code`, or by `week` instead of `day`
4. **Combine small groups** — use CASE expressions to bucket small categories together

### Example: Handling NULLs

```sql
SELECT
  COALESCE(state, 'Below Threshold') AS state,
  COUNT(DISTINCT user_id) AS unique_users,
  SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY state
```
