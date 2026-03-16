---
title: Campaigns - v1 API CRUD Reference
description: Complete campaign CRUD operations with JSON examples for Amazon Ads API v1
---

# Campaigns (v1 API)

> See [common-models/campaigns.md](../common-models/campaigns.md) for full field reference by ad product.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/campaigns` | Create (batch) |
| GET | `/campaigns` | List (paginated) |
| GET | `/campaigns/{campaignId}` | Get single |
| PUT | `/campaigns/{campaignId}` | Update single |
| PUT | `/campaigns` | Batch update |

---

## Create Campaign

```
POST /campaigns
Content-Type: application/json
```

### Sponsored Products Example

```json
[
  {
    "adProduct": "SPONSORED_PRODUCTS",
    "name": "SP Campaign - Auto Targeting",
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
        "bidStrategy": "LEGACY_FOR_SALES",
        "bidAdjustments": {
          "placementBidAdjustments": [
            {
              "placement": "TOP_OF_SEARCH",
              "percentage": 50
            }
          ]
        }
      }
    },
    "autoCreationSettings": {
      "autoCreateTargets": true
    }
  }
]
```

### Sponsored Brands Example

```json
[
  {
    "adProduct": "SPONSORED_BRANDS",
    "name": "SB Campaign - Brand Awareness",
    "state": "PAUSED",
    "startDateTime": "2026-04-01",
    "marketplaceScope": "SINGLE_MARKETPLACE",
    "costType": "CPC",
    "budgets": [
      {
        "budgetType": "DAILY",
        "budget": 30.00
      }
    ],
    "optimizations": {
      "bidSettings": {
        "bidStrategy": "MANUAL"
      },
      "goalSettings": {
        "goal": "BRAND_AWARENESS"
      }
    },
    "brandId": "BRAND123"
  }
]
```

### Amazon DSP Example

```json
[
  {
    "adProduct": "AMAZON_DSP",
    "name": "DSP Campaign - Retargeting",
    "state": "PAUSED",
    "flights": [
      {
        "startDateTime": "2026-04-01",
        "endDateTime": "2026-04-30",
        "budget": 5000.00,
        "budgetType": "TOTAL"
      }
    ],
    "optimizations": {
      "bidSettings": {
        "bidStrategy": "MAXIMIZE_PERFORMANCE"
      },
      "goalSettings": {
        "goal": "CONVERSIONS",
        "kpi": "ROAS",
        "targetValue": 4.0
      }
    }
  }
]
```

### Response (207 Multi-Status)

```json
{
  "success": [
    {
      "index": 0,
      "campaign": {
        "campaignId": "CAMP123456789",
        "adProduct": "SPONSORED_PRODUCTS",
        "name": "SP Campaign - Auto Targeting",
        "state": "PAUSED",
        "status": "PAUSED",
        "budgets": [{"budgetType": "DAILY", "budget": 50.0}],
        "optimizations": {
          "bidSettings": {"bidStrategy": "LEGACY_FOR_SALES"}
        },
        "creationDateTime": "2026-03-16T10:00:00Z",
        "lastUpdatedDateTime": "2026-03-16T10:00:00Z"
      }
    }
  ],
  "error": [],
  "partialSuccess": []
}
```

---

## List Campaigns

```
GET /campaigns?maxResults=50&campaignStateFilter=ENABLED,PAUSED&campaignAdProductFilter=SPONSORED_PRODUCTS
```

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | int | 11-50 (default 50) |
| `nextToken` | string | Pagination token |
| `campaignIdFilter` | string | Comma-separated campaign IDs |
| `campaignNameFilter` | string | Name filter |
| `campaignStateFilter` | string | ENABLED, PAUSED, ARCHIVED |
| `campaignAdProductFilter` | string | SPONSORED_PRODUCTS, SPONSORED_BRANDS, AMAZON_DSP |

### Response (200)

```json
{
  "campaigns": [
    {
      "campaignId": "CAMP123456789",
      "adProduct": "SPONSORED_PRODUCTS",
      "name": "SP Campaign - Auto Targeting",
      "state": "PAUSED",
      "status": "PAUSED",
      "budgets": [{"budgetType": "DAILY", "budget": 50.0}],
      "creationDateTime": "2026-03-16T10:00:00Z",
      "lastUpdatedDateTime": "2026-03-16T10:00:00Z"
    }
  ],
  "nextToken": "eyJhbGciOiJIUzI1NiJ9..."
}
```

---

## Get Single Campaign

```
GET /campaigns/{campaignId}
```

Returns single Campaign object (same structure as list item).

---

## Update Campaign

### Single Update

```
PUT /campaigns/{campaignId}
```

```json
{
  "campaignId": "CAMP123456789",
  "state": "ENABLED",
  "budgets": [
    {
      "budgetType": "DAILY",
      "budget": 75.00
    }
  ]
}
```

### Batch Update

```
PUT /campaigns
```

```json
[
  {"campaignId": "CAMP001", "state": "PAUSED"},
  {"campaignId": "CAMP002", "budgets": [{"budgetType": "DAILY", "budget": 100.0}]},
  {"campaignId": "CAMP003", "state": "ARCHIVED"}
]
```

**Response (207):** Same multi-status format as create.

---

## Key Enums

### Campaign State
| Value | Description |
|-------|-------------|
| `ENABLED` | Active and delivering |
| `PAUSED` | Paused by advertiser |
| `ARCHIVED` | Permanently archived (irreversible) |

### Bid Strategy (SP)
| Value | Description |
|-------|-------------|
| `LEGACY_FOR_SALES` | Dynamic bids - down only |
| `AUTO_FOR_SALES` | Dynamic bids - up and down |
| `MANUAL` | Fixed bids |

### Marketplace Scope
| Value | Description |
|-------|-------------|
| `SINGLE_MARKETPLACE` | Campaign runs in profile's marketplace only |
| `GLOBAL` | Campaign with marketplace-level configurations |
