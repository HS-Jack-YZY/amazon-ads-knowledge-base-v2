---
title: Overview of SQL in Amazon Marketing Cloud
description: An overview of AMC SQL
type: guide
interface: api
---
# AMC SQL reference

AMC supports most of the basic query operations Structured Query Language (SQL) offers. We refer to the SQL used in AMC as AMC SQL. This topic provides a basic overview of most commonly used AMC SQL functionalities.

## Aggregation Threshold

Before we proceed, you must know that some common SQL commands may not work with AMC. Or, at times you may not find granular data you're looking for in your report. This is because, you can only access aggregated, pseudonymized outputs from AMC.  All information in your AMC instance is handled in strict accordance with Amazon's privacy policies, and your own signals cannot be exported or accessed by Amazon. The privacy safeguards prevent you from exporting information at a grain that would violate our privacy safeguards. AMC maintains all privacy policies through the application of aggregation thresholds.

Event-level data refers to individual events like an impression or click from a single user. Aggregated data refers to grouped data. For example: count of all unique users that were served an impression by a campaign.
AMC has configured thresholds for aggregated data.

Each column in an AMC table is classified into a category based on the combination of the aggregation threshold level and the filtering restrictions. For simplicity, this classification is referred to as the aggregation threshold. The aggregation threshold of a column determines the restrictions that are enforced to ensure customer privacy safeguards are not violated if a column is used in a workflow.

You can extract aggregated data, provided that it meets AMC\'s aggregation thresholds. AMC checks if the thresholds are met and ensures
data is pulled in a privacy safe way. For example, AMC does not support SELECT \* for any of the tables.

> [NOTE] All categories can be found in the documentation's excel file under the column 'aggregation threshold'. The classifications are also in the schema explorer. Refer to [AMC data aggregation thresholds](guides/amazon-marketing-cloud/aggregation-threshold) to understand more on aggregation thresholds.

## AMC SQL conventions

This section explains the conventions that are used to write the syntax for the SQL expressions, commands, and functions described in the SQL reference section.

This section explains the conventions that are used to write the syntax for the SQL expressions, commands, and functions described in the SQL reference section.

| Character | Description   |
| :---------: |: ---------: |
| \[ \]     | Brackets denote optional arguments\. Multiple arguments in brackets indicate that you can choose any number of the arguments\. In addition, arguments in brackets on separate lines indicate that the parser expects the arguments to be in the order that they are listed in the syntax. For an example, see SELECT. |
| \{ \}     | Braces indicate that you are required to choose one of the arguments inside the braces.                          |
| ![pipechar](/_images/amazon-marketing-cloud/amc_sql_pipechar.png)          | Pipes indicate that you can choose between the arguments.          |
| '         | Words in single quotation marks indicate that you must type the quotes.  |
| …        | An ellipsis indicates that you can repeat the preceding element\.         |



## Data types

Supported data types for casting columns or expressions to.

| Data Type | Description | Example |
|-----------|-------------|---------|
| `BOOLEAN` | Logical values | `TRUE`, `FALSE` |
| `TINYINT` | 1 byte signed integer (-128 to 127) | `-128` to `127` |
| `SMALLINT` | 2 byte signed integer | `-32768` to `32767` |
| `INTEGER` / `INT` | 4 byte signed integer | `-2147483648` to `2147483647` |
| `BIGINT` | 8 byte signed integer | Large integers |
| `DECIMAL(p, s)` | Fixed-point number with precision `p` and scale `s` | `DECIMAL(10, 2)` |
| `FLOAT` / `REAL` | 4 byte floating point number | `3.14` |
| `DOUBLE` | 8 byte floating point number | `3.14159265358979` |
| `DATE` | Calendar date (no time) | `DATE '2024-01-15'` |
| `TIMESTAMP` | Date and time | `TIMESTAMP '2024-01-15 10:30:00'` |
| `CHAR(n)` / `SYMBOL` | Fixed/variable-length character string | `'hello'` |
| `BINARY` | Binary data | Binary values |
| `ARRAY` | Ordered collection of same type elements | `ARRAY[1, 2, 3]` |
| `STRUCT` | Ordered collection of named elements (each may differ in type) | Structured data |
| `NULL` | Absence of a value | `NULL` |

## Logical operators

Logical operators will produce a Boolean result and will either operate
on one or two values or expressions.

| Operator | Description | Example |
|----------|-------------|---------|
| `AND` | Logical AND | `a > 1 AND b < 10` |
| `OR` | Logical OR | `a = 1 OR a = 2` |
| `NOT` | Logical negation | `NOT (a = 1)` |
| `IS NULL` | Test for NULL | `a IS NULL` |
| `IS NOT NULL` | Test for non-NULL | `a IS NOT NULL` |
| `=` | Equal | `a = 1` |
| `!=` / `<>` | Not equal | `a != 1` |
| `>` | Greater than | `a > 1` |
| `>=` | Greater than or equal | `a >= 1` |
| `<` | Less than | `a < 1` |
| `<=` | Less than or equal | `a <= 1` |

## AMC SQL grammar

AMC SQL queries use the following grammar:

```
query:
  WITH withItem [ , withItem]* query
| {
    select
  | query UNION [ ALL | DISTINCT ] query
  }
  
withItem:
  name
  [ '(' column [, column]* ')' ]
  AS '(' query ')'

select:
  SELECT [ ALL | DISTINCT ]
    projectItem [, projectItem]* 
  FROM dataSourceExpression
  [ WHERE booleanExpression ]  
  [ GROUP BY {expression [, expression]* } ]
  [ HAVING booleanExpression ]
  [ WINDOW windowName AS windowSpec [, windowName AS windowSpec ]* ]

projectItem:
   expression [ [ AS ] columnAlias ]
|  tableAlias . *

dataSourceExpression:
  dataSourceReference [, dataSourceReference]*
| dataSourceExpression [ LEFT | FULL OUTER ] JOIN dataSourceExpression [joinCondition] 
| EXTEND_TIME_WINDOW( 'dataSourceReference', iso8601DurationString, iso8601DurationString ) 

dataSourceReference:
 dsp_impressions 
|dsp_clicks
|sponsored_ads_traffic 
|amazon_attributed_events_by_conversion_time 
|amazon_attributed_events_by_traffic_time

joinCondition:
  ON booleanExpression
  
window:
  windowName
| windowSpec

windowSpec:
  '('
    [ ORDER BY orderItem [, orderItem ]* ]
    [ PARTITION BY expression [, expression]* ]
  ')' 

orderItem:
  expression [ ASC | DESC ]

```

For detailed syntax of each clause, see [AMC SQL Basics](amc-sql-basics.md).
For available functions, see the SQL reference in `knowledge_base/amc/sql_reference/functions.md`.
For limitations, see `knowledge_base/amc/sql_reference/limitations.md`.
