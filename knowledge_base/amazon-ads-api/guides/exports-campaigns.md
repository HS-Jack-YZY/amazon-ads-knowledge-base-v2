# Exports — Campaigns Model

> Source: https://advertising.amazon.com/API/docs/en-us/guides/exports/entities/campaigns

## Common Schema

| Field | Type | Required | Read-only | Description |
|-------|------|----------|-----------|-------------|
| campaignId | string | ✓ | ✓ | Unique identifier |
| name | string | ✓ | | Campaign name |
| state | Enum | ✓ | | User-set state |
| deliveryStatus | Enum | ✓ | ✓ | Overall delivery condition |
| lastUpdatedDateTime | datetime | ✓ | ✓ | Last modification time |
| creationDateTime | datetime | ✓ | ✓ | Creation time |
| portfolioId | string | | | Associated portfolio |
| startDate | date | | | Campaign start |
| endDate | date | | | Campaign end |
| adProduct | Enum | | | SP, SB, SD, STV |
| brandEntityId | string | | | Required for SB |
| budgetCaps | object | ✓ | | Budget settings |
| budgetCaps.budgetType | Enum | ✓ | | DAILY or LIFETIME |
| budgetCaps.recurrenceTimePeriod | Enum | ✓ | | DAILY |
| budgetCaps.monetaryBudgetValue | decimal | ✓ | | Budget amount |
| optimization | object | | | Bid strategy settings |
| optimization.bidStrategy | Enum | | | AUTO, MANUAL, etc. |
| optimization.placementBidAdjustments | array | | | Placement adjustments |
| optimization.shopperSegmentBidAdjustments | array | | | Shopper segment adjustments |
| targetingSettings | object | | | Campaign targeting approach |
| costType | Enum | | | CPC, CPM, etc. |
| tags | array | | | Custom key-value labels |

## Ad Product Support

| Platform | Latest Version |
|----------|---------------|
| Sponsored Products | Version 3 |
| Sponsored Brands | Version 4 |
| Sponsored Display | Version 1 |
| Amazon Marketing Stream | campaigns dataset |
| Sponsored Television | Version 1 |

## API Endpoint

```
POST /campaigns/exports
```
