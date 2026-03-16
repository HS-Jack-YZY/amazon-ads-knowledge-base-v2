---
title: Ads - v1 API CRUD Reference
description: Ad CRUD operations with JSON examples for Amazon Ads API v1
---

# Ads (v1 API)

> See [common-models/ads.md](../common-models/ads.md) for full field reference by ad product.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/ads` | Create ads (batch) |
| GET | `/ads` | List ads (paginated) |
| GET | `/ads/{adId}` | Get single ad |
| PUT | `/ads/{adId}` | Update single ad |
| PUT | `/ads` | Batch update ads |

---

## Create Ad

```
POST /ads
Content-Type: application/json
```

### Sponsored Products Ad Example

SP ads are linked to ASINs. After creating, use Ad Associations to link to ad groups.

```json
[
  {
    "adProduct": "SPONSORED_PRODUCTS",
    "adType": "PRODUCT_AD",
    "state": "PAUSED",
    "creative": {
      "asin": "B08N5WRWNW"
    }
  }
]
```

### Sponsored Brands Ad Example (Product Collection)

```json
[
  {
    "adProduct": "SPONSORED_BRANDS",
    "adType": "PRODUCT_COLLECTION",
    "state": "PAUSED",
    "creative": {
      "brandName": "My Brand",
      "brandLogoAssetId": "asset-logo-123",
      "headline": "Discover Premium Products",
      "asins": ["B08N5WRWNW", "B09XYZ1234", "B0ABCDEF12"],
      "landingPage": {
        "type": "PRODUCT_LIST",
        "url": null
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
      "ad": {
        "adId": "AD123456789",
        "adProduct": "SPONSORED_PRODUCTS",
        "adType": "PRODUCT_AD",
        "state": "PAUSED",
        "creative": {
          "asin": "B08N5WRWNW"
        },
        "creationDateTime": "2026-03-16T10:10:00Z",
        "lastUpdatedDateTime": "2026-03-16T10:10:00Z"
      }
    }
  ],
  "error": [],
  "partialSuccess": []
}
```

---

## List Ads

```
GET /ads?maxResults=50&adAdProductFilter=SPONSORED_PRODUCTS&adStateFilter=ENABLED,PAUSED
```

### Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `maxResults` | int | 11-50 (default 50) |
| `nextToken` | string | Pagination token |
| `adIdFilter` | string | Comma-separated ad IDs |
| `adAdGroupIdFilter` | string | Filter by ad group ID |
| `adAdProductFilter` | string | SPONSORED_PRODUCTS, SPONSORED_BRANDS, AMAZON_DSP |
| `adStateFilter` | string | ENABLED, PAUSED, ARCHIVED |

### Response (200)

```json
{
  "ads": [
    {
      "adId": "AD123456789",
      "adProduct": "SPONSORED_PRODUCTS",
      "adType": "PRODUCT_AD",
      "state": "PAUSED",
      "creative": {"asin": "B08N5WRWNW"},
      "creationDateTime": "2026-03-16T10:10:00Z"
    }
  ],
  "nextToken": null
}
```

---

## Update Ad

### Single Update
```
PUT /ads/{adId}
```

```json
{
  "adId": "AD123456789",
  "state": "ENABLED"
}
```

### Batch Update
```
PUT /ads
```

```json
[
  {"adId": "AD001", "state": "ENABLED"},
  {"adId": "AD002", "state": "PAUSED"},
  {"adId": "AD003", "state": "ARCHIVED"}
]
```

---

## SD Product Ads (v3 API)

SD uses separate product ad endpoints:

### Create SD Product Ads
```
POST /sd/productAds
```
```json
[
  {
    "adGroupId": 123456789,
    "state": "paused",
    "asin": "B08N5WRWNW"
  },
  {
    "adGroupId": 123456789,
    "state": "paused",
    "sku": "MY-SKU-001"
  }
]
```

### Response
```json
[
  {"adId": 111222333, "code": "SUCCESS", "details": ""},
  {"adId": 444555666, "code": "SUCCESS", "details": ""}
]
```

### Update SD Product Ads (state only)
```
PUT /sd/productAds
```
```json
[
  {"adId": 111222333, "state": "enabled"}
]
```

### Archive SD Product Ad
```
DELETE /sd/productAds/{adId}
```

> Note: SD archive operations are **irreversible**.

---

## SB Ads (v4 API)

SB v4 has type-specific creation endpoints:

| Ad Type | Create Endpoint |
|---------|----------------|
| Product Collection | `POST /sb/v4/ads/productCollection` |
| Extended Product Collection | `POST /sb/v4/ads/productCollectionExtended` |
| Brand Video | `POST /sb/v4/ads/brandVideo` |
| Video | `POST /sb/v4/ads/video` |
| Auto Collection | `POST /sb/v4/ads/autoCollection` |
| Manual Collection | `POST /sb/v4/ads/manualCollection` |
| Store Spotlight | `POST /sb/v4/ads/storeSpotlight` |

All return 207 Multi-Status. Update/List/Delete use unified endpoints:
- `PUT /sb/v4/ads`
- `POST /sb/v4/ads/list`
- `POST /sb/v4/ads/delete`
