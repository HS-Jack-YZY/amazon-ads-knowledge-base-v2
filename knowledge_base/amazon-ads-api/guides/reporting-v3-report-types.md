# Reporting v3 — Report Types

> Source: https://advertising.amazon.com/API/docs/en-us/guides/reporting/v3/report-types/overview

## Overview

The Amazon Ads API v3 supports multiple report types for different ad products. Campaign performance can be broken down by dimensions including campaign, ad group, ad, keyword, target, and ASIN.

## Account Fields

| Field | Description |
|-------|-------------|
| `advertiserAccount.id` | Primary identifier for report dimensions, matches `adsAccountId` from Accounts API |
| `Amazon-Ads-AccountId` header | Specifies which advertising account data to retrieve |

## Report Types by Ad Product

| Report Type | SP | SB | SD | STV | DSP |
|-------------|----|----|----|----|-----|
| Campaign | ✓ | ✓ (preview) | ✓ | ✓ | ✓ |
| Ad Group | ✓ | ✓ (preview) | ✓ | ✓ | |
| Ad | ✓ | ✓ (preview) | ✓ | | |
| Targeting | ✓ | ✓ (preview) | ✓ | ✓ | |
| Search Term | ✓ | ✓ (preview) | | | |
| Advertised Product | ✓ | | ✓ | | |
| Purchased Product | ✓ | ✓ (preview) | ✓ | | |
| Placement | | ✓ (preview) | | | |
| Inventory | | | | | ✓ |
| Product | | | | | ✓ |
| Tech | | | | | ✓ |
| Geo | | | | | ✓ |
| Audience | | | | | ✓ |
| Audio & Video | | | | | ✓ |
| Reach & Frequency | | | | | ✓ |
| Bid Adjustment | | | | | ✓ |
| Benchmarks | ✓ | ✓ | ✓ | | ✓ |
| Conversion Path | | | | | ✓ |
| Prompt Ad Extension | ✓ | | | | |

> **Note:** SB reporting is currently in preview. Data for SB campaigns with `isMultiAdGroupsEnabled=False` won't be available until GA.

## Related

- [Reporting Columns (Metrics)](reporting-v3-columns.md) — All available metrics and their report type mappings
- [Code Examples](code-examples.md) — Python examples for requesting reports
