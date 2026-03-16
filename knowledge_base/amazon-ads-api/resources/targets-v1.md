---
title: Targets - v1 API CRUD Reference
description: Target/keyword CRUD operations with JSON examples for Amazon Ads API v1
---

# Targets (v1 API)

> See [common-models/targets.md](../common-models/targets.md) for full field reference by ad product.
>
> For SD targeting, see [sponsored-display.md](sponsored-display.md). For SB v3 keyword/product targeting, see [sponsored-brands-v3.md](sponsored-brands-v3.md).

## About Targets in v1

The v1 API uses a unified "target" concept that encompasses:
- **Keyword targets** — search terms (SP, SB)
- **Product targets** — ASINs and categories (SP, SB, SD)
- **Audience targets** — demographics, remarketing (SD, DSP)
- **Negative targets** — exclusions at ad group or campaign level

Targets are created within ad groups and linked to campaigns through the ad group hierarchy.

---

## SP Keyword Target Operations (v3 API)

SP uses dedicated keyword endpoints separate from v1:

### Create Keywords
```
POST /sp/keywords
```
```json
{
  "keywords": [
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "PAUSED",
      "keywordText": "wireless bluetooth speaker",
      "matchType": "BROAD",
      "bid": 1.25
    },
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "PAUSED",
      "keywordText": "portable speaker",
      "matchType": "PHRASE",
      "bid": 1.50
    },
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "PAUSED",
      "keywordText": "jbl speaker",
      "matchType": "EXACT",
      "bid": 2.00
    }
  ]
}
```

### Match Types
| Type | Description |
|------|-------------|
| `BROAD` | Matches broad variations, synonyms, related terms |
| `PHRASE` | Matches the exact phrase within a larger query |
| `EXACT` | Matches the exact search term only |

### Negative Keywords
```
POST /sp/negativeKeywords
```
```json
{
  "negativeKeywords": [
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "ENABLED",
      "keywordText": "cheap",
      "matchType": "NEGATIVE_PHRASE"
    }
  ]
}
```

### Campaign-level Negative Keywords
```
POST /sp/campaignNegativeKeywords
```
```json
{
  "campaignNegativeKeywords": [
    {
      "campaignId": "CAMP123",
      "state": "ENABLED",
      "keywordText": "free",
      "matchType": "NEGATIVE_EXACT"
    }
  ]
}
```

---

## SP Product Target Operations (v3 API)

### Create Product Targets
```
POST /sp/targets
```
```json
{
  "targets": [
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "PAUSED",
      "bid": 1.75,
      "expression": [
        {
          "type": "asinSameAs",
          "value": "B08N5WRWNW"
        }
      ],
      "expressionType": "MANUAL"
    },
    {
      "campaignId": "CAMP123",
      "adGroupId": "AG123",
      "state": "PAUSED",
      "bid": 1.50,
      "expression": [
        {
          "type": "asinCategorySameAs",
          "value": "2335752011"
        },
        {
          "type": "asinPriceBetween",
          "value": "20.00-50.00"
        }
      ],
      "expressionType": "MANUAL"
    }
  ]
}
```

### Target Expression Types

| Type | Description | Example Value |
|------|-------------|---------------|
| `asinSameAs` | Target specific ASIN | `B08N5WRWNW` |
| `asinCategorySameAs` | Target category | `2335752011` |
| `asinBrandSameAs` | Target brand | `Apple` |
| `asinPriceBetween` | Price range filter | `20.00-50.00` |
| `asinPriceGreaterThan` | Min price filter | `10.00` |
| `asinPriceLessThan` | Max price filter | `50.00` |
| `asinReviewRatingBetween` | Rating range | `4-5` |
| `asinIsPrimeShippingEligible` | Prime eligible | `true` |

---

## SD Targeting Operations

### Create SD Targets
```
POST /sd/targets
```
```json
[
  {
    "adGroupId": 123456789,
    "campaignId": 987654321,
    "state": "paused",
    "bid": 1.50,
    "expressionType": "manual",
    "expression": [
      {
        "type": "asinSameAs",
        "value": "B08N5WRWNW"
      }
    ]
  },
  {
    "adGroupId": 123456789,
    "campaignId": 987654321,
    "state": "paused",
    "bid": 2.00,
    "expressionType": "manual",
    "expression": [
      {
        "type": "views",
        "value": "lookback=30"
      }
    ]
  }
]
```

### SD Expression Types (Audiences)

| Type | Description |
|------|-------------|
| `views` | Views remarketing (lookback days) |
| `purchases` | Purchase remarketing |
| `similarProduct` | Similar product audiences |
| `asinSameAs` | Product targeting |
| `asinCategorySameAs` | Category targeting |

---

## SB Keyword & Product Targeting (v3)

### SB Keywords
```
POST /sb/keywords
```
```json
{
  "keywords": [
    {
      "campaignId": "CAMP_SB_001",
      "adGroupId": "AG_SB_001",
      "state": "ENABLED",
      "keywordText": "premium headphones",
      "matchType": "BROAD",
      "bid": 3.00
    }
  ]
}
```

### SB Product Targets
```
POST /sb/targets
```
```json
{
  "targets": [
    {
      "campaignId": "CAMP_SB_001",
      "adGroupId": "AG_SB_001",
      "state": "ENABLED",
      "bid": 2.50,
      "expressions": [
        {
          "type": "asinSameAs",
          "value": "B08N5WRWNW"
        }
      ]
    }
  ]
}
```

---

## Get Keyword/Target Recommendations

### SP Keyword Recommendations
```
POST /sp/recommendations/keyword-targets
```
```json
{
  "recommendationType": "KEYWORDS_FOR_ADGROUP",
  "adGroupId": "AG123",
  "campaignId": "CAMP123",
  "maxRecommendations": 100,
  "locale": "en_US",
  "bidsEnabled": true
}
```

**Response:**
```json
{
  "keywordTargetList": [
    {
      "keyword": "wireless speaker bluetooth",
      "matchType": "BROAD",
      "bid": 1.23,
      "rank": 1,
      "searchVolume": "HIGH"
    }
  ]
}
```

### SP Bid Recommendations
```
POST /sp/recommendations/bids-for-existing-ad-group
```
```json
{
  "adGroupId": "AG123",
  "campaignId": "CAMP123",
  "recommendationType": "BIDS_FOR_EXISTING_AD_GROUP",
  "targetingExpressions": [
    {
      "type": "KEYWORD",
      "value": "bluetooth speaker"
    }
  ]
}
```
