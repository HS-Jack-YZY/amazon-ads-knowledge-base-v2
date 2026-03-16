# AMC SQL Expressions

## CONTAINED_IN

Tests whether a value is contained within a list of expressions. Similar to `IN` but with a different syntax.

**Syntax:**
```sql
CONTAINED_IN(testExpr, expr1, expr2, ...)
```

**Example:**
```sql
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
WHERE CONTAINED_IN(ad_product_type, 'display', 'video', 'audio')
GROUP BY campaign
```

## BUILT_IN_PARAMETER

Accesses built-in query parameters that are set when the workflow is executed.

**Syntax:**
```sql
BUILT_IN_PARAMETER('parameter_name')
```

**Available parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `'TIME_WINDOW_START'` | `TIMESTAMP` | Start of the query execution time window |
| `'TIME_WINDOW_END'` | `TIMESTAMP` | End of the query execution time window |

**Example:**
```sql
-- Use in EXTEND_TIME_WINDOW to look back 30 days before the query window
WITH lookback AS (
  SELECT user_id, COUNT(*) AS prior_impressions
  FROM EXTEND_TIME_WINDOW(
    dsp_impressions,
    BUILT_IN_PARAMETER('TIME_WINDOW_START') - INTERVAL '30' DAY,
    BUILT_IN_PARAMETER('TIME_WINDOW_START')
  )
  GROUP BY user_id
)
SELECT ...
```

```sql
-- Filter by time window boundaries
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
WHERE impression_dt >= BUILT_IN_PARAMETER('TIME_WINDOW_START')
  AND impression_dt < BUILT_IN_PARAMETER('TIME_WINDOW_END')
GROUP BY campaign
```

## CUSTOM_PARAMETER

Accesses custom parameters defined when creating or executing a workflow. Allows parameterized queries.

**Syntax:**
```sql
CUSTOM_PARAMETER('parameterName')
```

**Example:**
```sql
-- Parameterized campaign filter
SELECT campaign, SUM(impressions) AS total_impressions
FROM dsp_impressions
WHERE campaign = CUSTOM_PARAMETER('target_campaign')
GROUP BY campaign
```

```sql
-- Parameterized attribution window (in days)
SELECT campaign, SUM(total_purchases) AS purchases
FROM amazon_attributed_events_by_traffic_time
WHERE SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc)
  <= CAST(CUSTOM_PARAMETER('attribution_days') AS INTEGER) * 24 * 60 * 60
GROUP BY campaign
```

Custom parameters are defined when creating a workflow via the API:
```json
{
  "workflowId": "my_workflow",
  "sqlQuery": "SELECT ...",
  "customParameters": {
    "target_campaign": { "type": "STRING" },
    "attribution_days": { "type": "STRING", "defaultValue": "14" }
  }
}
```

## UUID

Generates a universally unique identifier.

**Syntax:**
```sql
UUID()
```

**Example:**
```sql
SELECT
  UUID() AS record_id,
  campaign,
  SUM(impressions) AS total_impressions
FROM dsp_impressions
GROUP BY campaign
```

**Note:** Each call to `UUID()` generates a new unique value. Useful for creating unique identifiers in result sets.
