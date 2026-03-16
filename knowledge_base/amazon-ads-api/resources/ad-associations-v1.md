---
title: Ad Associations - v1 API CRUD Reference
description: Ad association operations with JSON examples for Amazon Ads API v1
---

# Ad Associations (v1 API)

> See [common-models/ad-associations.md](../common-models/ad-associations.md) for full field reference.

Ad associations link ads to ad groups. In the v1 API, ads are created independently and then associated with ad groups.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/adAssociations` | Create associations (batch) |
| GET | `/adAssociations` | List associations (paginated) |
| GET | `/adAssociations/{adAssociationId}` | Get single association |
| PUT | `/adAssociations/{adAssociationId}` | Update single association |
| PUT | `/adAssociations` | Batch update associations |

---

## Create Ad Association

```
POST /adAssociations
Content-Type: application/json
```

```json
[
  {
    "adGroupId": "AG123456789",
    "adId": "AD123456789",
    "state": "ENABLED"
  },
  {
    "adGroupId": "AG123456789",
    "adId": "AD987654321",
    "state": "ENABLED",
    "startDateTime": "2026-04-01T00:00:00Z",
    "endDateTime": "2026-04-30T23:59:59Z",
    "weight": 1
  }
]
```

### Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `adGroupId` | string | Yes | Target ad group |
| `adId` | string | Yes | Ad to associate |
| `state` | string | Yes | ENABLED, PAUSED |
| `startDateTime` | string | No | When association becomes active |
| `endDateTime` | string | No | When association expires |
| `weight` | int | No | Relative weight for rotation |

### Response (207 Multi-Status)

```json
{
  "success": [
    {
      "index": 0,
      "adAssociation": {
        "adAssociationId": "ASSOC123",
        "adGroupId": "AG123456789",
        "adId": "AD123456789",
        "state": "ENABLED",
        "creationDateTime": "2026-03-16T10:15:00Z",
        "lastUpdatedDateTime": "2026-03-16T10:15:00Z"
      }
    }
  ],
  "error": [],
  "partialSuccess": []
}
```

---

## List Ad Associations

```
GET /adAssociations?adAssociationAdGroupIdFilter=AG123456789&maxResults=50
```

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | int | 11-50 (default 50) |
| `nextToken` | string | Pagination token |
| `adAssociationAdIdFilter` | string | Filter by ad ID |
| `adAssociationAdGroupIdFilter` | string | Filter by ad group ID |

### Response (200)

```json
{
  "adAssociations": [
    {
      "adAssociationId": "ASSOC123",
      "adGroupId": "AG123456789",
      "adId": "AD123456789",
      "state": "ENABLED"
    }
  ],
  "nextToken": null
}
```

---

## Update Ad Association

### Single Update
```
PUT /adAssociations/{adAssociationId}
```

```json
{
  "adAssociationId": "ASSOC123",
  "state": "PAUSED"
}
```

### Batch Update
```
PUT /adAssociations
```

```json
[
  {"adAssociationId": "ASSOC001", "state": "PAUSED"},
  {"adAssociationId": "ASSOC002", "state": "ENABLED"}
]
```

---

## Typical Workflow

```
1. Create Campaign    → POST /campaigns       → get campaignId
2. Create Ad Group    → POST /adGroups         → get adGroupId
3. Create Ad          → POST /ads              → get adId
4. Create Association → POST /adAssociations   → links ad to ad group
5. Add Targets        → POST /sp/keywords or /sp/targets → add keywords/targets to ad group
6. Enable Campaign    → PUT /campaigns/{id}    → state: ENABLED
```
