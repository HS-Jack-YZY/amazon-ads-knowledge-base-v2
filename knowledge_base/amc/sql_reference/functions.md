# AMC SQL Functions Reference

## String Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `CHARINDEX` | `CHARINDEX(substring, string)` | Returns the position of the first occurrence of a substring |
| `CONCAT` | `CONCAT(string1, string2, ...)` | Concatenates two or more strings |
| `FORMAT` | `FORMAT(value, format_string)` | Formats a value according to a format string |
| `INSTR` | `INSTR(string, substring)` | Returns the position of a substring within a string |
| `LEFT` | `LEFT(string, length)` | Returns the leftmost characters of a string |
| `LENGTH` | `LENGTH(string)` | Returns the length of a string |
| `LIKE` | `string LIKE pattern` | Pattern matching with `%` (any chars) and `_` (single char) |
| `LOCATE` | `LOCATE(substring, string [, start])` | Returns position of substring, optionally starting from a position |
| `LOWER` | `LOWER(string)` | Converts string to lowercase |
| `LTRIM` | `LTRIM(string)` | Removes leading whitespace |
| `POSITION` | `POSITION(substring IN string)` | Returns the position of a substring |
| `REGEXP_REPLACE` | `REGEXP_REPLACE(string, pattern, replacement)` | Replaces substrings matching a regex pattern |
| `REGEXP_SUBSTR` | `REGEXP_SUBSTR(string, pattern)` | Extracts the first substring matching a regex pattern |
| `REGEXP_SPLIT` | `REGEXP_SPLIT(string, pattern)` | Splits a string by a regex pattern into an array |
| `REPLACE` | `REPLACE(string, old, new)` | Replaces all occurrences of a substring |
| `RIGHT` | `RIGHT(string, length)` | Returns the rightmost characters of a string |
| `RTRIM` | `RTRIM(string)` | Removes trailing whitespace |
| `SIMILAR TO` | `string SIMILAR TO pattern` | Regex-like pattern matching (SQL standard) |
| `STRPOS` | `STRPOS(string, substring)` | Returns the position of a substring (1-based) |
| `STRTOMAP` | `STRTOMAP(string, entry_delim, kv_delim)` | Converts a delimited string into a key-value map |
| `SUBSTRING` | `SUBSTRING(string FROM start [FOR length])` | Extracts a portion of a string |
| `TRIM` | `TRIM([LEADING\|TRAILING\|BOTH] char FROM string)` | Removes characters from string ends |
| `UPPER` | `UPPER(string)` | Converts string to uppercase |

## Math Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `ABS` | `ABS(number)` | Absolute value |
| `CEIL` | `CEIL(number)` | Rounds up to nearest integer |
| `E()` | `E()` | Returns Euler's number (2.71828...) |
| `EXP` | `EXP(number)` | Returns e raised to the power of number |
| `FLOOR` | `FLOOR(number)` | Rounds down to nearest integer |
| `LN` | `LN(number)` | Natural logarithm |
| `LOG` | `LOG(base, number)` | Logarithm with specified base |
| `LOG10` | `LOG10(number)` | Base-10 logarithm |
| `POWER` | `POWER(base, exponent)` | Raises base to exponent |
| `RANDOM` | `RANDOM()` | Returns a random number between 0 and 1 |
| `ROUND` | `ROUND(number [, decimal_places])` | Rounds to specified decimal places |
| `SQRT` | `SQRT(number)` | Square root |
| `TRUNC` | `TRUNC(number [, decimal_places])` | Truncates to specified decimal places |

## Aggregate Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `AVG` | `AVG(expression)` | Average value |
| `COUNT` | `COUNT(expression)` or `COUNT(*)` | Count of rows/values |
| `COUNT DISTINCT` | `COUNT(DISTINCT expression)` | Count of unique values |
| `MIN` | `MIN(expression)` | Minimum value |
| `MAX` | `MAX(expression)` | Maximum value |
| `SUM` | `SUM(expression)` | Sum of values |

**Important:** Every AMC query must include at least one aggregate function.

## Date/Time Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `CONVERT TIME ZONE FROM UTC` | `CONVERT TIME ZONE FROM UTC(timestamp, timezone)` | Converts UTC timestamp to specified timezone |
| `CURRENT_DATE` | `CURRENT_DATE` | Returns current date |
| `CURRENT_TIMESTAMP` | `CURRENT_TIMESTAMP` | Returns current date and time |
| `DATE_TRUNC` | `DATE_TRUNC('unit', timestamp)` | Truncates timestamp to specified unit (day, week, month, etc.) |
| `DAYOFMONTH` | `DAYOFMONTH(date)` | Returns day of month (1-31) |
| `DAYOFWEEK` | `DAYOFWEEK(date)` | Returns day of week (1=Sunday, 7=Saturday) |
| `EPOCH TO UTC TIMESTAMP` | `EPOCH TO UTC TIMESTAMP(seconds)` | Converts Unix epoch seconds to UTC timestamp |
| `EXTEND_TIME_WINDOW` | `EXTEND_TIME_WINDOW(table, start, end)` | Extends the query time window for a specific table |
| `EXTRACT` | `EXTRACT(field FROM timestamp)` | Extracts a field (year, month, day, hour, etc.) from timestamp |
| `HOUR` | `HOUR(timestamp)` | Returns hour (0-23) |
| `MINUTE` | `MINUTE(timestamp)` | Returns minute (0-59) |
| `MONTH` | `MONTH(date)` | Returns month (1-12) |
| `SECOND` | `SECOND(timestamp)` | Returns second (0-59) |
| `SECONDS_BETWEEN` | `SECONDS_BETWEEN(timestamp1, timestamp2)` | Returns seconds between two timestamps |
| `WEEK` | `WEEK(date)` | Returns week number of the year |
| `YEAR` | `YEAR(date)` | Returns year |

### EXTEND_TIME_WINDOW

A special AMC function that allows a CTE to access data outside the main query's time window. Useful for lookback analysis.

```sql
WITH historical_users AS (
  SELECT user_id, COUNT(*) AS past_impressions
  FROM EXTEND_TIME_WINDOW(
    dsp_impressions,
    BUILTIN_PARAMETER('TIME_WINDOW_START') - INTERVAL '30' DAY,
    BUILTIN_PARAMETER('TIME_WINDOW_START')
  )
  GROUP BY user_id
)
SELECT ...
```

### SECONDS_BETWEEN

Commonly used for custom attribution windows:

```sql
-- 7-day attribution
WHERE SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 7 * 24 * 60 * 60
```

## Conditional Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `CASE` | `CASE WHEN cond THEN result [ELSE default] END` | Conditional expression |
| `COALESCE` | `COALESCE(expr1, expr2, ...)` | Returns first non-NULL expression |
| `IF` | `IF(condition, true_value, false_value)` | Inline conditional |
| `IFNULL` | `IFNULL(expr, default)` | Returns default if expr is NULL |
| `IN` | `expr IN (value1, value2, ...)` | Tests membership in a list |
| `NULLIF` | `NULLIF(expr1, expr2)` | Returns NULL if expr1 = expr2 |
| `NVL` | `NVL(expr, default)` | Returns default if expr is NULL (same as IFNULL) |
| `NVL2` | `NVL2(expr, not_null_value, null_value)` | Returns not_null_value if expr is not NULL, else null_value |

## Array Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `ARRAY_CAT` | `ARRAY_CAT(array1, array2)` | Concatenates two arrays |
| `ARRAY_CONTAINS` | `ARRAY_CONTAINS(array, value)` | Tests if array contains a value |
| `ARRAY_COMPLEMENT` | `ARRAY_COMPLEMENT(array1, array2)` | Returns elements in array1 not in array2 |
| `ARRAY_DISTINCT` | `ARRAY_DISTINCT(array)` | Removes duplicate elements |
| `ARRAY_INTERSECT` | `ARRAY_INTERSECT(array1, array2)` | Returns common elements |
| `ARRAY_REMOVE` | `ARRAY_REMOVE(array, value)` | Removes a value from array |
| `ARRAY_SORT` | `ARRAY_SORT(array)` | Sorts array elements |
| `ARRAY_TO_STRING` | `ARRAY_TO_STRING(array, delimiter)` | Joins array elements into a string |
| `ARRAY_UNION` | `ARRAY_UNION(array1, array2)` | Returns union of two arrays |
| `CARDINALITY` | `CARDINALITY(array)` | Returns the number of elements in an array |
| `COLLECT` | `COLLECT(expression)` | Aggregate function that collects values into an array |
| `EXPLODE` | `EXPLODE(array)` | Expands an array into multiple rows |
| `FLATTEN` | `FLATTEN(array_of_arrays)` | Flattens nested arrays into a single array |

## Window Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `DENSE_RANK` | `DENSE_RANK() OVER (PARTITION BY ... ORDER BY ...)` | Rank without gaps |
| `RANK` | `RANK() OVER (PARTITION BY ... ORDER BY ...)` | Rank with gaps for ties |
| `ROW_NUMBER` | `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)` | Sequential row number |

**Note:** `ORDER BY` is supported **within** `PARTITION BY` window clauses, but NOT as a standalone clause.

```sql
SELECT
  campaign,
  impression_date,
  SUM(impressions) AS daily_impressions,
  ROW_NUMBER() OVER (PARTITION BY campaign ORDER BY impression_date) AS day_rank
FROM dsp_impressions
GROUP BY campaign, impression_date
```

## Comparison Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `GREATEST` | `GREATEST(expr1, expr2, ...)` | Returns the largest value |
| `LEAST` | `LEAST(expr1, expr2, ...)` | Returns the smallest value |

## Hash Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `HASH64` | `HASH64(value)` | Returns a 64-bit hash of the value |
| `MD5` | `MD5(value)` | Returns the MD5 hash |
| `SHA1` | `SHA1(value)` | Returns the SHA-1 hash |

## VARBINARY Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `FROM_VARBINARY` | `FROM_VARBINARY(binary, encoding)` | Converts binary to string with encoding |
| `TO_VARBINARY` | `TO_VARBINARY(string, encoding)` | Converts string to binary with encoding |

## JSON Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `JSON_EXTRACT` | `JSON_EXTRACT(json_string, path)` | Extracts a value from a JSON string |
| `JSON_SERIALIZE` | `JSON_SERIALIZE(value)` | Converts a value to a JSON string |

## Advanced Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `CAST` | `CAST(expression AS type)` | Converts expression to a different data type |
| `NAMED ROW` | `NAMED ROW(val1, val2, ...)` | Creates a struct/row with named fields |

### CAST Examples

```sql
-- String to date
CAST('2024-01-15' AS DATE)

-- Number to string
CAST(campaign_id AS CHAR)

-- Cost conversion with decimal precision
CAST(SUM(total_cost) AS DECIMAL(18, 2)) / 100000.0
```

## Statistical Functions

| Function | Syntax | Description |
|----------|--------|-------------|
| `STDDEV` / `STDDEV_SAMP` | `STDDEV(expression)` | Sample standard deviation |
| `STDDEV_POP` | `STDDEV_POP(expression)` | Population standard deviation |
| `VARIANCE` / `VAR_SAMP` | `VARIANCE(expression)` | Sample variance |
| `VAR_POP` | `VAR_POP(expression)` | Population variance |
| `SKEWNESS` | `SKEWNESS(expression)` | Skewness of values |
| `PERCENTILE` | `PERCENTILE(expression, percentile)` | Value at a given percentile |
| `MEDIAN` | `MEDIAN(expression)` | Median value (50th percentile) |
