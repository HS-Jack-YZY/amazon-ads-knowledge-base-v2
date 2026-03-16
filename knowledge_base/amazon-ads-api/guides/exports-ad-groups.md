# Exports — Ad Groups Model

> Source: https://advertising.amazon.com/API/docs/en-us/guides/exports/entities/ad-groups

## Common Schema

| Field | Type | Required | Read-only | Description |
|-------|------|----------|-----------|-------------|
| adGroupId | string | ✓ | ✓ | Unique identifier |
| campaignId | string | ✓ | | Parent campaign |
| adProduct | Enum | ✓ | | SP, SB, SD, STV |
| name | string | ✓ | | Ad group name |
| state | Enum | ✓ | | User-set state |
| deliveryStatus | Enum | ✓ | ✓ | Delivery condition |
| deliveryReasons | Enum[] | | ✓ | Non-delivery reasons |
| creationDateTime | datetime | ✓ | ✓ | Creation time |
| lastUpdatedDateTime | datetime | ✓ | ✓ | Last modification |
| creativeType | Enum | | | Creative type |

## Ad Product Mapping

| Platform | Latest Version |
|----------|---------------|
| Sponsored Products | Version 3 |
| Sponsored Brands | Version 4 |
| Sponsored Display | Version 1 |
| Sponsored Television | Version 1 |

## API Endpoints by Product

| Product | Endpoints |
|---------|-----------|
| SP | `POST /sp/adGroups`, `PUT /sp/adGroups`, `POST /sp/adGroups/delete` |
| SB | `sb/v4/adGroups` |
| SD | `sd/adGroups` |
| Exports | `POST /adGroups/exports` |
