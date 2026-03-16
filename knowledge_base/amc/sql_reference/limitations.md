# AMC SQL Limitations & Unsupported Features

## Unsupported Features

### RIGHT JOIN

**Not supported.** Swap the table order and use `LEFT JOIN` instead.

```sql
-- WRONG: RIGHT JOIN is not supported
SELECT a.*, b.*
FROM table_a a
RIGHT JOIN table_b b ON a.id = b.id

-- CORRECT: Use LEFT JOIN with tables swapped
SELECT a.*, b.*
FROM table_b b
LEFT JOIN table_a a ON a.id = b.id
```

### GETDATE()

**Not supported.** Use `CAST('today' AS DATE)` or `CURRENT_DATE` instead.

```sql
-- WRONG
SELECT GETDATE()

-- CORRECT
SELECT CURRENT_DATE
SELECT CAST('today' AS DATE)
```

### ORDER BY (Standalone)

**Not supported** as a standalone clause in the final query or subqueries/CTEs.

**Supported** within window function `PARTITION BY` clauses:

```sql
-- WRONG: standalone ORDER BY
SELECT campaign, SUM(impressions) AS total
FROM dsp_impressions
GROUP BY campaign
ORDER BY total DESC

-- CORRECT: ORDER BY within PARTITION BY
SELECT
  campaign,
  SUM(impressions) AS total,
  RANK() OVER (ORDER BY SUM(impressions) DESC) AS rank
FROM dsp_impressions
GROUP BY campaign
```

**Workaround:** Export results and sort downstream (Python, Excel, BI tool).

### SELECT *

**Not supported.** Always specify column names explicitly.

```sql
-- WRONG
SELECT * FROM dsp_impressions

-- CORRECT
SELECT campaign, impression_date, impressions, clicks
FROM dsp_impressions
```

## Mandatory Requirements

### Aggregation Required

Every AMC query **must** contain at least one aggregation function (`SUM`, `COUNT`, `AVG`, `MIN`, `MAX`, etc.). Queries without aggregation will fail.

```sql
-- WRONG: no aggregation
SELECT campaign, impressions
FROM dsp_impressions

-- CORRECT: includes aggregation
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY campaign
```

## Known Issues & Workarounds

### RANK Alias in HAVING

Using a `RANK()` window function alias directly in a `HAVING` clause may cause errors.

**Workaround:** Wrap the query in a sub-query and filter in the outer query:

```sql
-- WRONG: RANK alias in HAVING
SELECT
  campaign,
  RANK() OVER (ORDER BY SUM(impressions) DESC) AS rnk
FROM dsp_impressions
GROUP BY campaign
HAVING rnk <= 10

-- CORRECT: wrap in sub-query
SELECT * FROM (
  SELECT
    campaign,
    SUM(impressions) AS total_impressions,
    RANK() OVER (ORDER BY SUM(impressions) DESC) AS rnk
  FROM dsp_impressions
  GROUP BY campaign
) ranked
WHERE rnk <= 10
```

### EXTEND_TIME_WINDOW Restrictions

- Can only be used in CTEs (WITH clause), not in the main query
- The extended range must include the original time window
- Syntax requires the table name as first argument, followed by start and end timestamps

```sql
-- CORRECT usage in CTE
WITH extended AS (
  SELECT user_id, COUNT(*) AS cnt
  FROM EXTEND_TIME_WINDOW(
    dsp_impressions,
    BUILT_IN_PARAMETER('TIME_WINDOW_START') - INTERVAL '30' DAY,
    BUILT_IN_PARAMETER('TIME_WINDOW_END')
  )
  GROUP BY user_id
)
SELECT ...

-- WRONG: EXTEND_TIME_WINDOW in main query
SELECT COUNT(DISTINCT user_id)
FROM EXTEND_TIME_WINDOW(dsp_impressions, ...)
```

## Summary Table

| Feature | Status | Workaround |
|---------|--------|------------|
| `RIGHT JOIN` | Not supported | Swap tables, use `LEFT JOIN` |
| `GETDATE()` | Not supported | `CURRENT_DATE` or `CAST('today' AS DATE)` |
| `ORDER BY` (standalone) | Not supported | Use within `PARTITION BY`; sort downstream |
| `SELECT *` | Not supported | List columns explicitly |
| Aggregation | Required | Always include at least one aggregate function |
| `RANK` alias in `HAVING` | Buggy | Wrap in sub-query, filter in outer WHERE |
| `EXTEND_TIME_WINDOW` | CTE only | Use only within WITH clause |
