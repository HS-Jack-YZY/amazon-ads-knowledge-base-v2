# Exports — Ads Model

> Source: https://advertising.amazon.com/API/docs/en-us/guides/exports/entities/ads

An ad is the smallest unit of an advertising campaign — the creative and products a customer sees.

## Ad Types

| Ad Type | Description | SP | SB | SD |
|---------|-------------|----|----|-----|
| PRODUCT_AD | Based on advertised product + optional headline | ✓ | | ✓ |
| IMAGE | One or more custom images | | | ✓ |
| VIDEO | One or more videos | | ✓ | ✓ |
| PRODUCT_COLLECTION | Collection of products + custom image | | ✓ | |
| STORE_SPOTLIGHT | Amazon Store + sub-pages | | ✓ | |

## Common Schema

| Field | Type | Required | Read-only | Description |
|-------|------|----------|-----------|-------------|
| adId | string | ✓ | ✓ | Unique identifier |
| adGroupId | string | ✓ | | Parent ad group |
| adProduct | Enum | ✓ | | SP, SB, SD |
| state | Enum | ✓ | | User-set state |
| name | string | | | Ad name |
| adType | Enum | ✓ | | See types above |
| creative | object | ✓ | | Creative details |
| creative.products | array | | | Advertised products (ASIN/SKU) |
| creative.headline | string | | | Custom headline |
| creative.brandName | string | | | Brand name |
| creative.brandLogo | object | | | Logo asset (assetId, assetVersion, formatProperties) |
| creative.customImages | array | | | Custom image assets |
| creative.videos | array | | | Video assets |
| creative.landingPage | object | | | Landing page (type + URL) |
| creative.cards | array | | | Card sections (SB Store Spotlight) |
| deliveryStatus | Enum | ✓ | ✓ | DELIVERING or NOT_DELIVERING |
| deliveryReasons | Enum[] | | ✓ | Non-delivery reasons |
| creationDateTime | datetime | ✓ | ✓ | Creation time |
| lastUpdatedDateTime | datetime | ✓ | ✓ | Last modification |
| adVersionId | string | | ✓ | Version of the ad |

## API Endpoints by Product

| Product | Endpoint |
|---------|----------|
| SP | `/sp/productAds` (v3) |
| SB | `/sb/v4/ads` |
| SD | `/sd/productAds`, `/sd/creatives` |
| STV | `/st/ads`, `/st/creatives` |
| Exports | `POST /ads/exports` |

## JSON Example (SP Product Ad)

```json
{
    "adId": "string",
    "adGroupId": "string",
    "adProduct": "SPONSORED_PRODUCTS",
    "state": "ENABLED",
    "adType": "PRODUCT_AD",
    "creative": {
        "headline": "string",
        "products": [
            {
                "productIdType": "ASIN",
                "productId": "string"
            }
        ]
    },
    "deliveryStatus": "NOT_DELIVERING",
    "deliveryReasons": ["CAMPAIGN_PAUSED"],
    "creationDateTime": "2018-11-08T15:41:14Z",
    "lastUpdatedDateTime": "2018-11-08T15:41:14Z"
}
```

## JSON Example (SB Product Collection)

```json
{
    "adGroupId": "string",
    "adId": "string",
    "adProduct": "SPONSORED_BRANDS",
    "state": "ENABLED",
    "adType": "PRODUCT_COLLECTION",
    "creative": {
        "products": [{"productIdType": "ASIN", "productId": "string"}],
        "headline": "string",
        "brandLogo": {
            "assetId": "string",
            "assetVersion": "string",
            "formatProperties": {"top": 0, "left": 0, "height": 0, "width": 0}
        },
        "brandName": "string",
        "landingPage": {"landingPageType": "PRODUCT_LIST", "landingPageUrl": "string"},
        "customImages": [
            {"assetId": "string", "assetVersion": "string"}
        ]
    },
    "deliveryStatus": "NOT_DELIVERING",
    "deliveryReasons": ["CAMPAIGN_PAUSED"],
    "creationDateTime": "2021-11-29T18:37:59.008Z",
    "lastUpdatedDateTime": "2024-01-03T01:31:40.346Z",
    "adVersionId": "string"
}
```
