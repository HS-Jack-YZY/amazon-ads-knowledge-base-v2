---
title: Amazon Ads API - End-to-End Code Examples
description: Complete Python examples for common API operations
---

# End-to-End Code Examples (Python)

## Setup: Authentication Helper

```python
import requests
import time
import gzip
import json
from typing import Optional

# Configuration
CLIENT_ID = "amzn1.application-oa2-client.xxxxxxxx"
CLIENT_SECRET = "your-client-secret"
REFRESH_TOKEN = "your-refresh-token"
PROFILE_ID = "1234567890"

# Regional base URLs
BASE_URLS = {
    "NA": "https://advertising-api.amazon.com",
    "EU": "https://advertising-api-eu.amazon.com",
    "FE": "https://advertising-api-fe.amazon.com",
}
BASE_URL = BASE_URLS["NA"]


def get_access_token() -> str:
    """Refresh and return a valid access token."""
    resp = requests.post(
        "https://api.amazon.com/auth/o2/token",
        data={
            "grant_type": "refresh_token",
            "refresh_token": REFRESH_TOKEN,
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
        },
    )
    resp.raise_for_status()
    return resp.json()["access_token"]


def get_headers(access_token: str) -> dict:
    """Build standard API headers."""
    return {
        "Authorization": f"Bearer {access_token}",
        "Amazon-Advertising-API-ClientId": CLIENT_ID,
        "Amazon-Advertising-API-Scope": PROFILE_ID,
        "Content-Type": "application/json",
        "Accept": "application/json",
    }
```

---

## 1. List Profiles (Find Your Profile ID)

```python
def list_profiles(access_token: str) -> list:
    """List all advertising profiles for the account."""
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Amazon-Advertising-API-ClientId": CLIENT_ID,
        "Content-Type": "application/json",
    }
    resp = requests.get(f"{BASE_URL}/v2/profiles", headers=headers)
    resp.raise_for_status()
    return resp.json()


# Usage
token = get_access_token()
profiles = list_profiles(token)
for p in profiles:
    print(f"Profile ID: {p['profileId']}, "
          f"Country: {p['countryCode']}, "
          f"Type: {p['accountInfo']['type']}, "
          f"Name: {p['accountInfo'].get('name', 'N/A')}")
```

**Response example:**
```json
[
  {
    "profileId": 1234567890,
    "countryCode": "US",
    "currencyCode": "USD",
    "timezone": "America/Los_Angeles",
    "accountInfo": {
      "marketplaceStringId": "ATVPDKIKX0DER",
      "id": "ENTITY1AA1AA11AAA1",
      "type": "seller",
      "name": "My Store",
      "validPaymentMethod": true
    }
  }
]
```

---

## 2. Create a Sponsored Products Campaign (v1 API)

```python
def create_sp_campaign(access_token: str) -> dict:
    """Create a Sponsored Products campaign using v1 API."""
    headers = get_headers(access_token)
    payload = [
        {
            "adProduct": "SPONSORED_PRODUCTS",
            "name": "My SP Campaign - Auto",
            "state": "PAUSED",
            "startDateTime": "2026-04-01",
            "marketplaceScope": "SINGLE_MARKETPLACE",
            "budgets": [
                {
                    "budgetType": "DAILY",
                    "budget": 50.00
                }
            ],
            "optimizations": {
                "bidSettings": {
                    "bidStrategy": "LEGACY_FOR_SALES"
                },
                "budgetSettings": {
                    "budgetCap": {
                        "budgetCapType": "MONTHLY",
                        "budgetCapAmount": 1500.00
                    }
                }
            },
            "autoCreationSettings": {
                "autoCreateTargets": True
            }
        }
    ]
    resp = requests.post(f"{BASE_URL}/campaigns", headers=headers, json=payload)
    return resp.json()


# Usage
token = get_access_token()
result = create_sp_campaign(token)

# 207 Multi-Status response
for item in result.get("success", []):
    campaign = item["campaign"]
    print(f"Created campaign: {campaign['campaignId']} - {campaign['name']}")

for item in result.get("error", []):
    print(f"Error at index {item['index']}: {item['errors']}")
```

**Success response example:**
```json
{
  "success": [
    {
      "index": 0,
      "campaign": {
        "campaignId": "CAMP123456789",
        "adProduct": "SPONSORED_PRODUCTS",
        "name": "My SP Campaign - Auto",
        "state": "PAUSED",
        "budgets": [{"budgetType": "DAILY", "budget": 50.0}],
        "optimizations": {
          "bidSettings": {"bidStrategy": "LEGACY_FOR_SALES"}
        },
        "creationDateTime": "2026-03-16T10:00:00Z",
        "lastUpdatedDateTime": "2026-03-16T10:00:00Z",
        "status": "PAUSED"
      }
    }
  ],
  "error": [],
  "partialSuccess": []
}
```

---

## 3. Create Ad Group + Keyword Targets (v1 API)

```python
def create_ad_group(access_token: str, campaign_id: str) -> dict:
    """Create an ad group with default bid."""
    headers = get_headers(access_token)
    payload = [
        {
            "adProduct": "SPONSORED_PRODUCTS",
            "campaignId": campaign_id,
            "name": "Ad Group - Keywords",
            "state": "PAUSED",
            "bids": [
                {
                    "bidType": "DEFAULT_BID",
                    "bid": 1.50
                }
            ]
        }
    ]
    resp = requests.post(f"{BASE_URL}/adGroups", headers=headers, json=payload)
    return resp.json()


# Usage
result = create_ad_group(token, "CAMP123456789")
ad_group_id = result["success"][0]["adGroup"]["adGroupId"]
print(f"Created ad group: {ad_group_id}")
```

---

## 4. Create SD Campaign (Legacy v3 API)

```python
def create_sd_campaign(access_token: str) -> list:
    """Create a Sponsored Display campaign using SD v3 API."""
    headers = get_headers(access_token)
    payload = [
        {
            "name": "My SD Campaign",
            "state": "paused",
            "budget": 25.0,
            "startDate": "20260401",
            "tactic": "T00030",  # Views remarketing
            "budgetType": "daily"
        }
    ]
    resp = requests.post(f"{BASE_URL}/sd/campaigns", headers=headers, json=payload)
    return resp.json()


# Response: [{"code": "SUCCESS", "campaignId": 123456789, "details": ""}]
```

---

## 5. Create SB Campaign (v4 API)

```python
def create_sb_campaign(access_token: str) -> dict:
    """Create a Sponsored Brands campaign using SB v4 API."""
    headers = get_headers(access_token)
    payload = {
        "campaigns": [
            {
                "name": "My SB Campaign",
                "state": "PAUSED",
                "budget": {
                    "budgetType": "DAILY",
                    "budget": 30.0
                },
                "startDate": "2026-04-01",
                "bidding": {
                    "bidOptimization": "MANUAL"
                },
                "brandEntityId": "ENTITY123"
            }
        ]
    }
    resp = requests.post(f"{BASE_URL}/sb/v4/campaigns", headers=headers, json=payload)
    return resp.json()
```

---

## 6. Request and Download a Report

```python
def request_report(
    access_token: str,
    ad_product: str = "SPONSORED_PRODUCTS",
    report_type: str = "spCampaigns",
    start_date: str = "2026-03-01",
    end_date: str = "2026-03-15",
) -> str:
    """Request an async report and return report ID."""
    headers = get_headers(access_token)
    payload = {
        "name": f"{report_type} report",
        "startDate": start_date,
        "endDate": end_date,
        "configuration": {
            "adProduct": ad_product,
            "reportTypeId": report_type,
            "groupBy": ["campaign"],
            "columns": [
                "campaignName",
                "campaignId",
                "impressions",
                "clicks",
                "cost",
                "purchases1d",
                "sales1d",
            ],
            "timeUnit": "SUMMARY",
            "format": "GZIP_JSON",
        },
    }
    resp = requests.post(
        f"{BASE_URL}/reporting/reports", headers=headers, json=payload
    )
    resp.raise_for_status()
    return resp.json()["reportId"]


def wait_for_report(access_token: str, report_id: str, timeout: int = 3600) -> str:
    """Poll until report completes. Returns download URL."""
    headers = get_headers(access_token)
    start = time.time()

    while time.time() - start < timeout:
        resp = requests.get(
            f"{BASE_URL}/reporting/reports/{report_id}", headers=headers
        )
        data = resp.json()
        status = data["status"]

        if status == "COMPLETED":
            return data["url"]
        elif status == "FAILED":
            raise Exception(f"Report failed: {data.get('failureReason')}")

        time.sleep(30)

    raise TimeoutError(f"Report {report_id} did not complete within {timeout}s")


def download_report(url: str) -> list:
    """Download and decompress a GZIP_JSON report."""
    resp = requests.get(url)
    resp.raise_for_status()
    return json.loads(gzip.decompress(resp.content))


# Usage
token = get_access_token()
report_id = request_report(token)
print(f"Report ID: {report_id}")

download_url = wait_for_report(token, report_id)
print(f"Download URL: {download_url}")

data = download_report(download_url)
for row in data[:5]:
    print(row)
```

**Report response lifecycle:**
```json
// POST /reporting/reports → 200
{"reportId": "rpt-abc123", "status": "PENDING", ...}

// GET /reporting/reports/rpt-abc123 → 200 (after processing)
{
  "reportId": "rpt-abc123",
  "status": "COMPLETED",
  "url": "https://advertising-api-report.s3.amazonaws.com/...",
  "urlExpiresAt": "2026-03-16T12:00:00Z",
  "fileSize": 12345
}

// Downloaded GZIP_JSON content (decompressed):
[
  {
    "campaignName": "My Campaign",
    "campaignId": "123456789",
    "impressions": 15000,
    "clicks": 250,
    "cost": 125.50,
    "purchases1d": 12,
    "sales1d": 450.00
  }
]
```

---

## 7. Execute AMC SQL Query

```python
# AMC uses different headers
def get_amc_headers(access_token: str, advertiser_id: str, marketplace_id: str) -> dict:
    return {
        "Authorization": f"Bearer {access_token}",
        "Amazon-Advertising-API-ClientId": CLIENT_ID,
        "Amazon-Advertising-API-AdvertiserId": advertiser_id,
        "Amazon-Advertising-API-MarketplaceId": marketplace_id,
        "Content-Type": "application/json",
    }


def create_amc_workflow(
    access_token: str,
    instance_id: str,
    advertiser_id: str,
    marketplace_id: str = "ATVPDKIKX0DER",
) -> dict:
    """Create and execute an AMC SQL workflow."""
    headers = get_amc_headers(access_token, advertiser_id, marketplace_id)

    # Step 1: Create workflow
    workflow_payload = {
        "workflowId": "my_sp_performance_query",
        "sqlQuery": """
            SELECT
                campaign_id,
                SUM(impressions) AS total_impressions,
                SUM(clicks) AS total_clicks,
                SUM(cost) AS total_cost,
                SUM(purchases_1d) AS total_purchases
            FROM sponsored_ads_traffic
            WHERE impression_dt BETWEEN TIMESTAMP '{start_date}' AND TIMESTAMP '{end_date}'
            GROUP BY campaign_id
            HAVING SUM(impressions) >= 100
        """,
        "filteredMetricsDisclosureType": "NONE",
    }
    resp = requests.post(
        f"{BASE_URL}/amc/reporting/{instance_id}/workflows",
        headers=headers,
        json=workflow_payload,
    )
    resp.raise_for_status()
    workflow = resp.json()

    # Step 2: Execute workflow
    execution_payload = {
        "timeWindowStart": "2026-03-01T00:00:00",
        "timeWindowEnd": "2026-03-15T23:59:59",
        "timeWindowTimeZone": "America/New_York",
    }
    resp = requests.post(
        f"{BASE_URL}/amc/reporting/{instance_id}/workflows/{workflow['workflowId']}/execute",
        headers=headers,
        json=execution_payload,
    )
    resp.raise_for_status()
    execution = resp.json()
    execution_id = execution["workflowExecutionId"]

    # Step 3: Poll status
    while True:
        resp = requests.get(
            f"{BASE_URL}/amc/reporting/{instance_id}/workflowExecutions/{execution_id}",
            headers=headers,
        )
        status = resp.json()["status"]
        if status == "SUCCEEDED":
            break
        elif status == "FAILED":
            raise Exception(f"AMC query failed: {resp.json()}")
        time.sleep(10)

    # Step 4: Download results
    resp = requests.get(
        f"{BASE_URL}/amc/reporting/{instance_id}/workflowExecutions/{execution_id}/downloadUrls",
        headers=headers,
    )
    urls = resp.json()
    return urls


# Usage
token = get_access_token()
result = create_amc_workflow(
    token,
    instance_id="amci-xxxxx",
    advertiser_id="ENTITY1AA1AA11AAA1",
)
print(result)
```

---

## 8. Update Campaign Bid Strategy

```python
def update_campaign_bid_strategy(
    access_token: str, campaign_id: str, strategy: str = "LEGACY_FOR_SALES"
) -> dict:
    """Update a campaign's bid strategy via v1 API."""
    headers = get_headers(access_token)
    payload = {
        "campaignId": campaign_id,
        "optimizations": {
            "bidSettings": {
                "bidStrategy": strategy
                # Options: LEGACY_FOR_SALES, AUTO_FOR_SALES, MANUAL
            }
        },
    }
    resp = requests.put(
        f"{BASE_URL}/campaigns/{campaign_id}", headers=headers, json=payload
    )
    resp.raise_for_status()
    return resp.json()
```

---

## 9. Batch Update Multiple Campaigns

```python
def batch_update_campaigns(
    access_token: str, updates: list[dict]
) -> dict:
    """Batch update campaigns. Returns 207 multi-status."""
    headers = get_headers(access_token)
    resp = requests.put(f"{BASE_URL}/campaigns", headers=headers, json=updates)
    # resp.status_code == 207
    return resp.json()


# Usage: Pause multiple campaigns
updates = [
    {"campaignId": "CAMP001", "state": "PAUSED"},
    {"campaignId": "CAMP002", "state": "PAUSED"},
    {"campaignId": "CAMP003", "state": "PAUSED"},
]
result = batch_update_campaigns(token, updates)

for s in result.get("success", []):
    print(f"Updated: {s['campaign']['campaignId']}")
for e in result.get("error", []):
    print(f"Failed: index {e['index']}, errors: {e['errors']}")
```

---

## Common Error Responses

```json
// 400 Bad Request
{
  "code": "INVALID_ARGUMENT",
  "details": "Campaign name is required",
  "requestId": "ABCD1234"
}

// 401 Unauthorized
{
  "code": "UNAUTHORIZED",
  "details": "The access token is expired or invalid"
}

// 429 Too Many Requests (check Retry-After header)
{
  "code": "TOO_MANY_REQUESTS",
  "details": "Rate limit exceeded. Retry after 2 seconds"
}

// 403 Forbidden
{
  "code": "ACCESS_DENIED",
  "details": "The profile does not have permission for this operation"
}
```
