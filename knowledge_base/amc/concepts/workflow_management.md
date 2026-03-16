# AMC Workflow Management

## Overview

In AMC, queries are managed as **workflows** — reusable query templates with configurable parameters. A workflow is essentially a SQL query mapped to a unique identifier (`workflowId`). Workflows can be executed on-demand or scheduled to run at specified times.

AMC reporting is built around three core resources:

| Resource | Description | API Path |
|----------|-------------|----------|
| **Workflows** | Reusable SQL query definitions | `/amc/reporting/{instanceId}/workflows` |
| **WorkflowExecutions** | On-demand or ad hoc execution of a workflow | `/amc/reporting/{instanceId}/workflowExecutions` |
| **Schedules** | Recurring execution of a workflow on a cadence | `/amc/reporting/{instanceId}/schedules` |

---

## Creating a Workflow

Use the POST operation of the workflows resource:

```
POST /amc/reporting/{instanceId}/workflows
```

### Required Parameters

| Parameter | Description |
|-----------|-------------|
| `workflowId` | Unique alphanumeric identifier (allows periods, dashes, underscores; no spaces). Used to reference the workflow for execution or scheduling. |
| `sqlQuery` | The SQL query string. Must be a **single-line query** with tabs and newline delimiters removed. Semicolons are not required. |

### Optional Parameters for Aggregation Threshold Columns

| Parameter | Description |
|-----------|-------------|
| `filteredMetricsDiscriminatorColumn` | Adds a Boolean column to output indicating whether rows had values removed due to aggregation threshold (TRUE = values removed, FALSE = unchanged). |
| `distinctUserCountColumn` | Adds a column showing the distinct user count for each row. |
| `filteredReasonColumn` | Adds a column showing the reason for filtering. |

### Sample Request

```bash
curl --location 'https://advertising-api.amazon.com/amc/reporting/{instanceId}/workflows' \
  --header 'Authorization: Bearer {token}' \
  --header 'Amazon-Advertising-API-ClientID: {clientId}' \
  --header 'Amazon-Advertising-API-AdvertiserId: {advertiserId}' \
  --header 'Amazon-Advertising-API-MarketplaceId: ATVPDKIKX0DER' \
  --header 'Content-Type: application/json' \
  --data '{
    "workflowId": "my-first-workflow",
    "sqlQuery": "SELECT campaign, SUM(total_purchases) AS total_orders_9d FROM amazon_attributed_events_by_traffic_time WHERE SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60 * 60 * 24 * 9 GROUP BY campaign",
    "distinctUserCountColumn": "du_count",
    "filteredMetricsDiscriminatorColumn": "filtered",
    "filteredReasonColumn": "filtered_reason"
  }'
```

A successful call returns HTTP `200 OK`.

### Custom Parameters

Workflows support **custom parameters** that allow injecting values at execution time, reducing the need for hard-coded values in queries.

**Supported simple data types**: BINARY, BOOLEAN, BYTE, DATE, DOUBLE, FLOAT, INTEGER, LONG, SHORT, STRING, TIMESTAMP

**Supported complex data types**: ARRAY of any supported simple type

#### Defining Custom Parameters in a Workflow

```json
{
  "workflowId": "workflowWithCustomParams",
  "sqlQuery": "Insert SQL query using CUSTOM_PARAMETER('paramName')",
  "inputParameters": [
    {
      "name": "myParam1",
      "dataType": "INTEGER",
      "columnType": "DIMENSION",
      "defaultValue": 20,
      "description": "Description for the parameter"
    },
    {
      "name": "myParam2",
      "dataType": "STRING",
      "columnType": "DIMENSION",
      "defaultValue": "default_value",
      "description": "Description for the parameter"
    }
  ]
}
```

#### Using Custom Parameters in SQL

Reference custom parameters in SQL queries with:

```sql
CUSTOM_PARAMETER('myParam1')
```

#### Overriding at Execution Time

In the workflow execution request, override default values using `parameterValues`:

```json
{
  "workflowId": "workflowWithCustomParams",
  "parameterValues": {
    "myParam1": 9001,
    "myParam2": "new_value"
  }
}
```

Priority: `parameterValues` in execution > `defaultValue` in workflow definition.

> **Warning**: Never include personally identifiable information (email, phone number) in parameter descriptions or values.

---

## Executing a Workflow

Use the POST operation of the workflowExecutions resource:

```
POST /amc/reporting/{instanceId}/workflowExecutions
```

### Time Window Options

| Type | Description |
|------|-------------|
| `EXPLICIT` | Start and end dates must be provided in the request |
| `MOST_RECENT_DAY` | Most recent 1-day window with available data (default) |
| `MOST_RECENT_WEEK` | Most recent 1-week window with available data |
| `CURRENT_MONTH` | Start of current month to most recent available data |
| `PREVIOUS_MONTH` | Entire previous month |

### Data Freshness

AMC data is **not real-time**. As a best practice, select a date range **48 hours prior to the current date**, as data can take up to 48 hours to process.

### Sample Request

```json
{
  "workflowId": "my-first-workflow",
  "timeWindowStart": "2023-05-20T00:00:00",
  "timeWindowEnd": "2023-08-03T00:00:00",
  "timeWindowType": "EXPLICIT",
  "timeWindowTimeZone": "America/New_York"
}
```

### Sample Response

```json
{
  "workflowExecutionId": "2b04762b-cbdb-47c7-be39-42a585ecd40e",
  "workflowId": "my-first-workflow",
  "status": "PENDING",
  "createTime": "2023-09-18T22:01:56Z",
  "timeWindowStart": "2023-05-20T04:00:00Z",
  "timeWindowEnd": "2023-08-03T04:00:00Z",
  "workflowExecutionTimeoutSeconds": 21600
}
```

### Execution Statuses

| Status | Description |
|--------|-------------|
| `PENDING` | Not yet started; may be queuing, waiting for data, or waiting until a specified time |
| `RUNNING` | Currently executing |
| `SUCCEEDED` | Finished successfully |
| `FAILED` | Execution failed |
| `CANCELLED` | Cancelled before completion |

### Execution Limits

| Level | Limit |
|-------|-------|
| **Instance** | 10 parallel executions |
| **Account** | 200 parallel executions |
| **Queue** | No limit at account level |

If limits are reached, wait for existing executions to complete, or use `DELETE /workflowExecutions/{workflowExecutionId}` to clear the queue.

---

## Viewing Workflow Executions

### View a Specific Execution

```
GET /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}
```

### List All Executions for a Workflow

```
GET /amc/reporting/{instanceId}/workflowExecutions/
```

### Filter by Creation Time

```
GET /amc/reporting/{instanceId}/workflowExecutions?minCreationTime=2023-10-01T00:00:00
```

---

## Updating a Workflow Execution

```
PUT /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}
```

Uses the same structure as the POST request. Provide updated values for the parameters to modify.

---

## Deleting a Workflow Execution

```
DELETE /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}
```

---

## Getting Results

After a workflow execution reaches `SUCCEEDED` status, retrieve results in two ways:

### Option 1: Download URL

```
GET /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}/downloadUrls
```

Returns a temporary, signed URL to download the result file (CSV format).

### Option 2: S3 Bucket

If your instance is configured with an S3 bucket, results are automatically delivered. Each workflow has a dedicated folder in S3, created upon first execution or scheduling.

### S3 Folder Structure

```
s3://{bucket-name}/
  └── {workflowId}/
      └── {workflowExecutionId}/
          └── results.csv
```

> To set up S3 delivery, see [API Guide — S3 Bucket Configuration](api_guide.md#s3-bucket-configuration-optional).

---

## Ad Hoc Workflow Execution

You can create and execute a workflow in a single API call without saving it first:

```
POST /amc/reporting/{instanceId}/workflowExecutions
```

Include the `sqlQuery` directly in the execution request body along with the time window parameters. This is useful for one-off analyses.

---

## Workflow Scheduling

Use the Schedules resource to run workflows on a recurring cadence:

```
POST /amc/reporting/{instanceId}/schedules
```

Refer to the [AMC Reporting API reference](https://advertising.amazon.com/API/docs/en-us/amc-reporting#tag/Schedules) for schedule creation parameters and options.
