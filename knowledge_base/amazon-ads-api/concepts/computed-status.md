---
title: Computed status and campaign status
description: Information about computed status in the Amazon Ads API
type: guide
interface: api
tags:
    - Operations
keywords:
    - response
    - campaign status
---

# Computed status

| Global | Meaning |
|------|------|
| `STATUS_UNAVAILABLE` | Eligibility status is null or the corresponding status reason can't be found. |
| `ADVERTISER_STATUS_ENABLED` | Advertiser's status is ENABLED. |
| `ADVERTISER_PAUSED` | Advertiser's status is PAUSED |
| `ACCOUNT_OUT_OF_BUDGET` | Total ad-spend for the day across all of your campaigns has reached your Account Daily Budget Cap threshold. Your account level budget governs how much you spend per day across all of your campaigns. |
| `ADVERTISER_PAYMENT_FAILURE` | Advertiser payment was unsuccessful. |

| Campaign status | Meaning |
| --- | --- |
| `CAMPAIGN_STATUS_ENABLED` | Campaign's status is ENABLED. |
| `CAMPAIGN_PAUSED` | Campaign's status is PAUSED. |
| `CAMPAIGN_ARCHIVED` | Campaigns status is ARCHIVED |
| `PENDING_START_DATE` | Campaign's start date is in the future and has not started yet. |
| `ENDED` | Campaign's end date is in the past. |
| `CAMPAIGN_INCOMPLETE` | Campaign does not contain any ads or keywords. |
| `CAMPAIGN_OUT_OF_BUDGET` | Campaign's daily budget has been exceeded. |
| `PORTFOLIO_PAUSED` | The associated portfolio is paused. |
| `PORTFOLIO_ARCHIVED` | The associated portfolio is archived. |
| `PORTFOLIO_OUT_OF_BUDGET` | The maximum budget cap at the portfolio level has been reached. |
| `PORTFOLIO_ENDED` | The portfolio's end date is in the past. | 

| Ad group status | Meaning |
| --- | --- |
| `AD_GROUP_STATUS_ENABLED` | Ad group's status is ENABLED. |
| `AD_GROUP_PAUSED` | Ad group's status is PAUSED. |
| `AD_GROUP_ARCHIVED` | Ad group's status is ARCHIVED. |
| `AD_GROUP_INCOMPLETE` | Ad group does not contain at least one keyword and one ad. |
| `AD_GROUP_LOW_BID` | Maximum bid of ad group is less than the minimum allowed bid in its marketplace. |

| Ad status | Meaning |
| --- | --- |
| `AD_STATUS_LIVE` | Ad's status is ENABLED. |
| `AD_PAUSED` | Ad's status is PAUSED. |
| `AD_ARCHIVED` | Ad's status is ARCHIVED. |
| `MISSING_IMAGE` | Ad offer does not have Item decoration, or Item decoration doesn't have a product page. |
| `MISSING_DECORATION` | Ad is not servable. Please check status in Amazon Ads UI (Seller Central/Advertising Console) for additional details. |
| `NOT_BUYABLE` | Ad offer does not have decoration or buyability data. |
| `NOT_IN_BUYBOX` | **This field is no longer supported.** |
| `OUT_OF_STOCK` | Ad offer is out of stock. |

| Keyword status | Meaning |
| --- | --- |
| `TARGETING_CLAUSE_STATUS_LIVE` | Keyword status is ENABLED. |
| `TARGETING_CLAUSE_POLICING_SUSPENDED` | Keyword is suspended because of a policing reason. |
| `TARGETING_CLAUSE_PAUSED` | Keyword status is PAUSED. |
| `TARGETING_CLAUSE_ARCHIVED` | Keyword status is ARCHIVED. |
| `TARGETING_CLAUSE_BLOCKED` | Keyword is blocked and not eligible for advertising. |
| `NO_INVENTORY` | Ad offer is ineligible because inventory was removed. |

| Sponsored Brands campaign status | Meaning |
| --- | --- |
| `PENDING_REVIEW` | The campaign is pending review with moderation. |
| `READY` | The campaign is scheduled and ready to run (startDate set in future, but passed moderation). |
| `SCHEDULED` | Transitive state between ready and running. |
| `RUNNING` | The campaign is running. |
| `PAUSED` | The campaign state was set to PAUSED by the user. |
| `REJECTED` | The campaign has been rejected by moderation process. |
| `ENDED` | The campaign has passed end date. |
| `BILLING_ERROR` | The campaign has been stopped because of billing error. |
| `ASIN_NOT_BUYABLE` | Associated ASIN is not buyable. |
| `LANDING_PAGE_NOT_AVAILABLE` | The associated landing page is no longer available or valid (must have at least 3 eligible ASINs) |
| `OUT_OF_BUDGET` | The campaign has run out of budget. |

## Sponsored Brands Campaign Status

| Status | Actions that lead to a change in status | Resulting Campaign Status | Campaign state | Eligible states a user can set the state to in a PUT request |
| --- | --- |
| `PENDING_REVIEW` | Moderation approval | `READY` | `PAUSED` | None |
|  | Moderation rejected | `REJECTED` | `PAUSED` | None |
| `READY` | Campaign state set to PAUSED thru PUT request | `PAUSED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | Campaign archived thru DELETE request | `TERMINATED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If campaign state in ENABLED and within start and end date | `SCHEDULED`, `RUNNING` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If past the end date of campaign | `ENDED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If there is a billing error | `BILLING_ERROR` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If the associated ASIN is no longer buyable | `ASIN_NOT_BUYABLE` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If the associated landing page is no longer available | `LANDING_PAGE_ NOT_AVAILABLE` | `ENABLED` | `PAUSED`, `ARCHIVED` |
| `SCHEDULED` | Campaign gets updated to RUNNING | `RUNNING` | `ENABLED` | `PAUSED`, `ARCHIVED` |
| `RUNNING` | Campaign state set to PAUSED thru PUT request | `PAUSED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | Campaign archived thru DELETE request | `TERMINATED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If past the end date of campaign | `ENDED` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If there is a billing error | `BILLING_ERROR` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If the associated ASIN is no longer buyable | `ASIN_NOT_BUYABLE` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If the associated landing page is no longer available | `LANDING_PAGE_ NOT_AVAILABLE` | `ENABLED` | `PAUSED`, `ARCHIVED` |
|  | If the campaign runs out of budget | `OUT_OF_BUDGET` | `ENABLED` | `PAUSED`, `ARCHIVED` |
| `PAUSED` | Campaign state set to ENABLED thru PUT request on /sb/campaigns | `READY`, `SCHEDULED`, `RUNNING` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | Campaign archived thru DELETE request | `TERMINATED` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | If past the End date of campaign | `ENDED` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | If there is a billing error | `BILLING_ERROR` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | If the associated ASIN is no longer buyable | `ASIN_NOT_BUYABLE` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | If the associated landing page is no longer available | `LANDING_PAGE_ NOT_AVAILABLE` | `PAUSED` | `ENABLED`, `ARCHIVED` |
|  | If the campaign runs out of budget | `OUT_OF_BUDGET` | `PAUSED` | `ENABLED`, `ARCHIVED` |
| `REJECTED` | Terminal status No action available | `REJECTED` | `PAUSED` | `ARCHIVED` |
| `ENDED` | Terminal status No action available | `ENDED` | `PAUSED` | `ARCHIVED` |
| `BILLING_ERROR` | Fix billing error(s) | `PAUSED`, `READY`, `SCHEDULED`, `RUNNING` | `PAUSED` | `ARCHIVED` |
|  | Campaign archived thru DELETE request on /sb/campaigns | `TERMINATED` | `PAUSED` | `ARCHIVED` |
| `ASIN_NOT_BUYABLE` | Issue(s) with ASIN fixed | `PAUSED`, `READY`, `SCHEDULED`, `RUNNING` | `PAUSED` | `ARCHIVED` |
|  | Campaign archived through a DELETE request on /sb/campaigns | `TERMINATED` | `PAUSED` | `ARCHIVED` |
| `LANDING_PAGE_ NOT_AVAILABLE` | Campaign archived through a DELETE request on /sb/campaigns | `TERMINATED` | `PAUSED` | `ARCHIVED` |
| `OUT_OF_BUDGET` | Increase the budget (for daily budget only) through a PUT request | `PAUSED`, `READY`, `SCHEDULED`, `RUNNING` | `PAUSED` | `ARCHIVED` |
|  | The next calendar day has started, causing the daily spent budget to refresh | `PAUSED`, `READY`, `SCHEDULED`, `RUNNING` | `PAUSED` | `ARCHIVED` |
