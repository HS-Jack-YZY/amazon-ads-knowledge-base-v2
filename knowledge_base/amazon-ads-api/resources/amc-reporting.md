---
title: AMC Reporting API (Workflow Management)
description: Create, execute, and retrieve results from AMC SQL queries via API
source: https://advertising.amazon.com/API/docs/en-us/amazon-marketing-cloud/reporting
---

# AMC Reporting API

The AMC Reporting API lets you programmatically create SQL workflows, execute them, and retrieve results.

## Required Headers

| Header | Description |
|--------|-------------|
| `Authorization` | `Bearer {access_token}` |
| `Amazon-Advertising-API-ClientId` | Your LWA client ID |
| `Amazon-Advertising-API-AdvertiserId` | AMC Account ID or Sponsored Ads Entity ID |
| `Amazon-Advertising-API-MarketplaceId` | Target marketplace (e.g., `ATVPDKIKX0DER` for US) |
| `Content-Type` | `application/json` |

> Note: AMC uses `AdvertiserId` + `MarketplaceId` instead of `Amazon-Advertising-API-Scope` (profile ID).

---

## Endpoints

### 1. Workflow CRUD

#### Create Workflow
```
POST /amc/reporting/{instanceId}/workflows
```

**Request:**
```json
{
  "workflowId": "my_custom_query",
  "sqlQuery": "SELECT campaign_id, SUM(impressions) AS imps FROM sponsored_ads_traffic WHERE impression_dt BETWEEN TIMESTAMP '{start_date}' AND TIMESTAMP '{end_date}' GROUP BY campaign_id HAVING SUM(impressions) >= 100",
  "filteredMetricsDisclosureType": "NONE",
  "distinctUserCountColumn": null
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `workflowId` | string | Yes | Unique identifier for this workflow |
| `sqlQuery` | string | Yes | AMC SQL query. Use `{start_date}` and `{end_date}` placeholders |
| `filteredMetricsDisclosureType` | string | No | `NONE` or `HEADER`. Controls threshold disclosure |
| `distinctUserCountColumn` | string | No | Column name for distinct user counts |

**Response (200):**
```json
{
  "workflowId": "my_custom_query",
  "sqlQuery": "SELECT ...",
  "creationDateTime": "2026-03-16T10:00:00Z",
  "lastUpdatedDateTime": "2026-03-16T10:00:00Z"
}
```

#### List Workflows
```
GET /amc/reporting/{instanceId}/workflows
```

#### Get Workflow
```
GET /amc/reporting/{instanceId}/workflows/{workflowId}
```

#### Update Workflow
```
PUT /amc/reporting/{instanceId}/workflows/{workflowId}
```

#### Delete Workflow
```
DELETE /amc/reporting/{instanceId}/workflows/{workflowId}
```

---

### 2. Workflow Execution

#### Execute Workflow
```
POST /amc/reporting/{instanceId}/workflows/{workflowId}/execute
```

**Request:**
```json
{
  "timeWindowStart": "2026-03-01T00:00:00",
  "timeWindowEnd": "2026-03-15T23:59:59",
  "timeWindowTimeZone": "America/New_York",
  "ignoreDataGap": false
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `timeWindowStart` | string (ISO 8601) | Yes | Query time window start |
| `timeWindowEnd` | string (ISO 8601) | Yes | Query time window end |
| `timeWindowTimeZone` | string | Yes | IANA timezone (e.g., `America/New_York`, `Asia/Tokyo`) |
| `ignoreDataGap` | boolean | No | If true, run even if data is incomplete for the window |

**Response (200):**
```json
{
  "workflowExecutionId": "we-abc123def456",
  "workflowId": "my_custom_query",
  "status": "QUEUED",
  "creationDateTime": "2026-03-16T10:01:00Z",
  "timeWindowStart": "2026-03-01T00:00:00Z",
  "timeWindowEnd": "2026-03-15T23:59:59Z"
}
```

#### Execution Status Values

| Status | Description |
|--------|-------------|
| `QUEUED` | Waiting to start |
| `IN_PROGRESS` | Currently executing |
| `SUCCEEDED` | Completed successfully |
| `FAILED` | Failed (check `statusDetails` for reason) |
| `CANCELLED` | Cancelled by user |
| `EXPIRED` | Results expired and are no longer available |

#### List Executions
```
GET /amc/reporting/{instanceId}/workflowExecutions
```

Query parameters:
- `workflowId` — Filter by workflow
- `status` — Filter by status
- `maxResults` — Page size
- `nextToken` — Pagination token

#### Get Execution Status
```
GET /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}
```

**Response (200):**
```json
{
  "workflowExecutionId": "we-abc123def456",
  "workflowId": "my_custom_query",
  "status": "SUCCEEDED",
  "statusDetails": "",
  "creationDateTime": "2026-03-16T10:01:00Z",
  "completionDateTime": "2026-03-16T10:03:30Z",
  "timeWindowStart": "2026-03-01T00:00:00Z",
  "timeWindowEnd": "2026-03-15T23:59:59Z",
  "outputRowCount": 42
}
```

#### Download Results
```
GET /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}/downloadUrls
```

**Response (200):**
```json
{
  "downloadUrls": [
    {
      "url": "https://s3.amazonaws.com/amc-results/...",
      "expiresAt": "2026-03-16T11:03:30Z"
    }
  ]
}
```

> Result files are CSV format. Download URL expires after a period (typically 1 hour).

---

## Rate Limits & Concurrency

| Limit | Value |
|-------|-------|
| Parallel executions per instance | 10 |
| Parallel executions per account | 200 |
| Queued executions | No limit |
| API rate limit | Per-endpoint, returns 429 when exceeded |

---

## Complete Example: Create, Execute, Download

```python
import requests
import time
import csv
import io

BASE_URL = "https://advertising-api.amazon.com"
INSTANCE_ID = "amci-xxxxx"

headers = {
    "Authorization": f"Bearer {access_token}",
    "Amazon-Advertising-API-ClientId": client_id,
    "Amazon-Advertising-API-AdvertiserId": "ENTITY1AA1AA11AAA1",
    "Amazon-Advertising-API-MarketplaceId": "ATVPDKIKX0DER",
    "Content-Type": "application/json",
}

# 1. Create workflow
workflow = {
    "workflowId": "sp_daily_performance",
    "sqlQuery": """
        SELECT
            DATE(impression_dt) AS date,
            campaign_id,
            SUM(impressions) AS total_impressions,
            SUM(clicks) AS total_clicks,
            SUM(cost) AS total_cost
        FROM sponsored_ads_traffic
        WHERE impression_dt BETWEEN TIMESTAMP '{start_date}' AND TIMESTAMP '{end_date}'
        GROUP BY 1, 2
        HAVING SUM(impressions) >= 100
    """,
    "filteredMetricsDisclosureType": "NONE",
}
resp = requests.post(
    f"{BASE_URL}/amc/reporting/{INSTANCE_ID}/workflows",
    headers=headers,
    json=workflow,
)
print(f"Workflow created: {resp.status_code}")

# 2. Execute
execution = {
    "timeWindowStart": "2026-03-01T00:00:00",
    "timeWindowEnd": "2026-03-15T23:59:59",
    "timeWindowTimeZone": "America/New_York",
}
resp = requests.post(
    f"{BASE_URL}/amc/reporting/{INSTANCE_ID}/workflows/sp_daily_performance/execute",
    headers=headers,
    json=execution,
)
execution_id = resp.json()["workflowExecutionId"]
print(f"Execution started: {execution_id}")

# 3. Poll status
while True:
    resp = requests.get(
        f"{BASE_URL}/amc/reporting/{INSTANCE_ID}/workflowExecutions/{execution_id}",
        headers=headers,
    )
    status = resp.json()["status"]
    print(f"Status: {status}")
    if status == "SUCCEEDED":
        break
    elif status in ("FAILED", "CANCELLED"):
        raise Exception(f"Execution {status}: {resp.json().get('statusDetails')}")
    time.sleep(15)

# 4. Download results
resp = requests.get(
    f"{BASE_URL}/amc/reporting/{INSTANCE_ID}/workflowExecutions/{execution_id}/downloadUrls",
    headers=headers,
)
download_url = resp.json()["downloadUrls"][0]["url"]
result = requests.get(download_url)

# Parse CSV
reader = csv.DictReader(io.StringIO(result.text))
for row in reader:
    print(row)
```

---

## Error Handling

| Error | Cause | Solution |
|-------|-------|----------|
| 400: Invalid SQL | Syntax error in query | Check AMC SQL syntax in sql_reference/ |
| 400: Aggregation threshold | VERY_HIGH field in SELECT | Remove from final SELECT, use only in WHERE/HAVING |
| 403: Access denied | Wrong AdvertiserId or no AMC access | Verify AdvertiserId and API permissions |
| 409: Workflow exists | workflowId already in use | Use different ID or PUT to update |
| 429: Rate limited | Too many requests | Exponential backoff with Retry-After header |
| FAILED status | Query timeout or data issues | Simplify query, reduce time window |
