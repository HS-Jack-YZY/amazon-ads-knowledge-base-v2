# Exports — Targets Model

> Source: https://advertising.amazon.com/API/docs/en-us/guides/exports/entities/targets

Targets control when ads appear (inclusions) or don't appear (exclusions/negative targeting) and specify bid amounts.

## Targeting Types

| Type | SP | SB | SD | Negative Support |
|------|----|----|----|----|
| AUTO | ✓ | ✓ | ✓ | |
| KEYWORD | ✓ | ✓ | | Campaign + Ad Group level |
| PRODUCT | ✓ | ✓ | ✓ | Campaign + Ad Group level |
| PRODUCT_CATEGORY | ✓ | ✓ | ✓ | |
| AUDIENCE | | | ✓ | |
| PRODUCT_AUDIENCE | | | ✓ | |
| PRODUCT_CATEGORY_AUDIENCE | | | ✓ | |
| THEME | | ✓ | | |

## Common Schema

| Field | Type | Required | Read-only | Description |
|-------|------|----------|-----------|-------------|
| targetId | string | ✓ | ✓ | Unique identifier |
| adGroupId | string | ✓ | | Parent ad group |
| campaignId | string | | | Parent campaign |
| adProduct | Enum | ✓ | | SP, SB, SD |
| state | Enum | ✓ | | User-set state |
| negative | boolean | ✓ | | true = exclusion |
| targetType | Enum | ✓ | | See types above |
| bid | object | | | Bid amount + currency |
| deliveryStatus | Enum | ✓ | ✓ | Delivery status |
| deliveryReasons | Enum[] | | ✓ | Non-delivery reasons |
| creationDateTime | datetime | ✓ | ✓ | Creation time |
| lastUpdatedDateTime | datetime | ✓ | ✓ | Last modification |
| targetDetails | object | | | Type-specific attributes |

## API Endpoint

```
POST /targets/exports
```
