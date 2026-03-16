---
title: Pagination & Batch Operations Guide
description: How to paginate results and use batch operations across Amazon Ads API
---

# Pagination & Batch Operations

## 1. Pagination Patterns

Amazon Ads API uses **two different pagination patterns** depending on the API version:

### Pattern A: nextToken Pagination (v1 API, Reporting)

Used by: v1 Campaign/AdGroup/Ad/Target endpoints, SP recommendations

```
GET /campaigns?maxResults=50&nextToken={token_from_previous_response}
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | int | Page size. Range: 11-50, default: 50 |
| `nextToken` | string | Opaque token from previous response. Omit for first page |

**Response structure:**
```json
{
  "campaigns": [...],
  "nextToken": "eyJhbGciOiJIUzI1NiJ9..."
}
```

When `nextToken` is `null` or absent, you've reached the last page.

**Example: Paginate all campaigns**
```python
campaigns = []
next_token = None

while True:
    params = {"maxResults": 50}
    if next_token:
        params["nextToken"] = next_token

    resp = requests.get(
        f"{BASE_URL}/campaigns",
        headers=headers,
        params=params
    )
    data = resp.json()
    campaigns.extend(data.get("campaigns", []))

    next_token = data.get("nextToken")
    if not next_token:
        break
```

### Pattern B: startIndex + count Pagination (Legacy v2/v3 APIs)

Used by: SD campaigns, SD ad groups, SD targets, SD product ads, Portfolios

```
GET /sd/campaigns?startIndex=0&count=100
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `startIndex` | int | Zero-based offset. Default: 0 |
| `count` | int | Page size. Max varies by endpoint (typically 100-1000) |

**Example: Paginate SD campaigns**
```python
campaigns = []
start_index = 0
count = 100

while True:
    resp = requests.get(
        f"{BASE_URL}/sd/campaigns",
        headers=headers,
        params={"startIndex": start_index, "count": count}
    )
    page = resp.json()

    if not page:
        break

    campaigns.extend(page)

    if len(page) < count:
        break
    start_index += count
```

### Pattern C: POST-based List with Filters (SB v4)

Used by: SB v4 campaigns, ad groups, ads

```
POST /sb/v4/campaigns/list
Content-Type: application/json

{
  "stateFilter": {
    "include": ["ENABLED", "PAUSED"]
  },
  "maxResults": 100,
  "nextToken": null
}
```

---

## 2. Filtering

### v1 API Filters (Query Parameters)

```
GET /campaigns?campaignStateFilter=ENABLED,PAUSED&campaignAdProductFilter=SPONSORED_PRODUCTS
```

Available filters vary by resource:

| Resource | Filters |
|----------|---------|
| Campaigns | campaignIdFilter, campaignNameFilter, campaignStateFilter, campaignAdProductFilter |
| Ad Groups | adGroupIdFilter, adGroupCampaignIdFilter, adGroupStateFilter, adGroupAdProductFilter |
| Ads | adIdFilter, adAdGroupIdFilter, adAdProductFilter, adStateFilter |
| Ad Associations | adAssociationAdIdFilter, adAssociationAdGroupIdFilter |

### SD Filters (Query Parameters)

```
GET /sd/campaigns?stateFilter=enabled,paused&campaignIdFilter=123,456
```

### SB v4 Filters (Request Body)

```json
{
  "stateFilter": {
    "include": ["ENABLED"]
  },
  "campaignIdFilter": {
    "include": ["campaign123"]
  }
}
```

---

## 3. Batch Operations

### v1 API Batch Pattern

Batch create and batch update return **HTTP 207 Multi-Status** with three arrays:

```json
{
  "success": [
    {
      "index": 0,
      "campaign": { "campaignId": "abc123", "name": "My Campaign", "state": "ENABLED" }
    }
  ],
  "error": [
    {
      "index": 1,
      "errors": [
        {
          "errorType": "INVALID_ARGUMENT",
          "field": "name",
          "message": "Campaign name already exists"
        }
      ]
    }
  ],
  "partialSuccess": [
    {
      "index": 2,
      "campaign": { "campaignId": "def456", "name": "Partial Campaign" },
      "errors": [
        {
          "errorType": "WARNING",
          "field": "budgets",
          "message": "Budget below recommended minimum"
        }
      ]
    }
  ]
}
```

| Field | Description |
|-------|-------------|
| `success` | Items fully created/updated. `index` maps to position in request array |
| `error` | Items that completely failed. Check `errors` for details |
| `partialSuccess` | Items created/updated with warnings or non-critical failures |

**Processing example:**
```python
resp = requests.post(f"{BASE_URL}/campaigns", headers=headers, json=campaigns_to_create)
result = resp.json()

# Check status code
assert resp.status_code == 207

# Process results
for item in result.get("success", []):
    print(f"Created: {item['campaign']['campaignId']}")

for item in result.get("error", []):
    idx = item["index"]
    errors = item["errors"]
    print(f"Failed at index {idx}: {errors}")

for item in result.get("partialSuccess", []):
    print(f"Partial: {item['campaign']['campaignId']} with warnings: {item['errors']}")
```

### SD/SB Batch Pattern

SD and SB endpoints accept arrays directly and return arrays of results:

**Request:**
```json
[
  {"name": "Campaign A", "state": "enabled", "budget": 10.0, ...},
  {"name": "Campaign B", "state": "enabled", "budget": 20.0, ...}
]
```

**Response (207):**
```json
[
  {"campaignId": 123, "code": "SUCCESS", "details": ""},
  {"campaignId": null, "code": "INVALID_ARGUMENT", "details": "Budget below minimum"}
]
```

### Batch Limits

| API | Endpoint | Max Items per Request |
|-----|----------|----------------------|
| v1 | Campaigns, Ad Groups, Ads | Array in request body (check spec) |
| SD | Campaigns, Ad Groups, Product Ads | 100 |
| SD | Targeting (T00030 tactic) | 200 |
| SD | Targeting (T00020 tactic) | 1,000 |
| SB v4 | Campaigns, Ad Groups, Ads | Array in request body |
| SP | Budget rules | 25 |
| SP | Budget usage | 100 campaign IDs |

---

## 4. Async Operations Pattern

Used by: Reporting API, Exports API, AMC Workflow Executions

### Step 1: Submit Request
```python
resp = requests.post(f"{BASE_URL}/reporting/reports", headers=headers, json=report_config)
report_id = resp.json()["reportId"]
# status: PENDING
```

### Step 2: Poll Status
```python
import time

while True:
    resp = requests.get(f"{BASE_URL}/reporting/reports/{report_id}", headers=headers)
    status = resp.json()["status"]

    if status == "COMPLETED":
        download_url = resp.json()["url"]
        break
    elif status == "FAILED":
        reason = resp.json().get("failureReason")
        raise Exception(f"Report failed: {reason}")

    time.sleep(30)  # Reports can take up to 3 hours
```

### Step 3: Download Result
```python
import gzip
import json

result = requests.get(download_url)
data = json.loads(gzip.decompress(result.content))
```

---

## 5. Rate Limiting & Retry Strategy

When you receive HTTP 429:

```python
import time
import random

def api_call_with_retry(method, url, headers, json=None, max_retries=5):
    for attempt in range(max_retries):
        resp = method(url, headers=headers, json=json)

        if resp.status_code == 429:
            retry_after = int(resp.headers.get("Retry-After", 1))
            wait = retry_after + random.uniform(0, 1)
            time.sleep(wait)
            continue

        if resp.status_code >= 500:
            wait = (2 ** attempt) + random.uniform(0, 1)
            time.sleep(wait)
            continue

        return resp

    raise Exception(f"Max retries exceeded for {url}")
```
