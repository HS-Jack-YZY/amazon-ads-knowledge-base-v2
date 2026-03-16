---
title: Ad Groups - v1 API CRUD Reference
description: Complete ad group CRUD operations with JSON examples for Amazon Ads API v1
---

# Ad Groups (v1 API)

> See [common-models/ad-groups.md](../common-models/ad-groups.md) for full field reference by ad product.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/adGroups` | Create (batch) |
| GET | `/adGroups` | List (paginated) |
| GET | `/adGroups/{adGroupId}` | Get single |
| PUT | `/adGroups/{adGroupId}` | Update single |
| PUT | `/adGroups` | Batch update |

---

## Create Ad Group

```
POST /adGroups
Content-Type: application/json
```

### Sponsored Products Example

```json
[
  {
    "adProduct": "SPONSORED_PRODUCTS",
    "campaignId": "CAMP123456789",
    "name": "Ad Group - Keyword Manual",
    "state": "PAUSED",
    "bids": [
      {
        "bidType": "DEFAULT_BID",
        "bid": 1.50
      }
    ]
  }
]
```

### Sponsored Brands Example

```json
[
  {
    "adProduct": "SPONSORED_BRANDS",
    "campaignId": "CAMP987654321",
    "name": "SB Ad Group - Product Collection",
    "state": "PAUSED",
    "bids": [
      {
        "bidType": "DEFAULT_BID",
        "bid": 2.00
      }
    ]
  }
]
```

### Amazon DSP Example

```json
[
  {
    "adProduct": "AMAZON_DSP",
    "campaignId": "CAMP_DSP_001",
    "name": "DSP Ad Group - Display",
    "state": "PAUSED",
    "bids": [
      {
        "bidType": "DEFAULT_BID",
        "bid": 5.00
      }
    ],
    "budgets": [
      {
        "budgetType": "DAILY",
        "budget": 200.00
      }
    ],
    "frequencies": [
      {
        "frequencyType": "UNCAPPED"
      }
    ]
  }
]
```

### Response (207 Multi-Status)

```json
{
  "success": [
    {
      "index": 0,
      "adGroup": {
        "adGroupId": "AG123456789",
        "adProduct": "SPONSORED_PRODUCTS",
        "campaignId": "CAMP123456789",
        "name": "Ad Group - Keyword Manual",
        "state": "PAUSED",
        "bids": [{"bidType": "DEFAULT_BID", "bid": 1.50}],
        "creationDateTime": "2026-03-16T10:05:00Z",
        "lastUpdatedDateTime": "2026-03-16T10:05:00Z"
      }
    }
  ],
  "error": [],
  "partialSuccess": []
}
```

---

## List Ad Groups

```
GET /adGroups?maxResults=50&adGroupCampaignIdFilter=CAMP123456789
```

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | int | 11-50 (default 50) |
| `nextToken` | string | Pagination token |
| `adGroupIdFilter` | string | Comma-separated ad group IDs |
| `adGroupCampaignIdFilter` | string | Filter by campaign ID |
| `adGroupStateFilter` | string | ENABLED, PAUSED, ARCHIVED |
| `adGroupAdProductFilter` | string | SPONSORED_PRODUCTS, SPONSORED_BRANDS, AMAZON_DSP |

### Response (200)

```json
{
  "adGroups": [
    {
      "adGroupId": "AG123456789",
      "adProduct": "SPONSORED_PRODUCTS",
      "campaignId": "CAMP123456789",
      "name": "Ad Group - Keyword Manual",
      "state": "PAUSED",
      "bids": [{"bidType": "DEFAULT_BID", "bid": 1.50}],
      "creationDateTime": "2026-03-16T10:05:00Z",
      "lastUpdatedDateTime": "2026-03-16T10:05:00Z"
    }
  ],
  "nextToken": null
}
```

---

## Update Ad Group

### Single Update
```
PUT /adGroups/{adGroupId}
```

```json
{
  "adGroupId": "AG123456789",
  "bids": [
    {
      "bidType": "DEFAULT_BID",
      "bid": 2.00
    }
  ]
}
```

### Batch Update
```
PUT /adGroups
```

```json
[
  {"adGroupId": "AG001", "state": "ENABLED"},
  {"adGroupId": "AG002", "bids": [{"bidType": "DEFAULT_BID", "bid": 3.00}]},
  {"adGroupId": "AG003", "state": "ARCHIVED"}
]
```

**Response (207):** Same multi-status format.
