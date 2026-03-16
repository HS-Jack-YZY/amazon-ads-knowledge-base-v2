---
title: Account Budget Settings
source: https://advertising.amazon.com/API/docs/en-us/account-budgets
section: Resources
---

# Advertisers - Account Budget Settings

**Version:** 3.0

## Endpoints

### GET /accountBudgets/featureFlags

**Summary:** Gets account budget feature flags information.

Gets account budget feature flags information.

**Requires one of these permissions**:
["advertiser_campaign_view"]

**Operation ID:** getAccountBudgetFeatureFlags

**Responses:**

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

### POST /accountBudgets/featureFlags

**Summary:** Creates or Updates account budget feature flags information.

Creates or Updates account budget feature flags information.

**Requires one of these permissions**:
["advertiser_campaign_view","advertiser_campaign_edit"]

**Operation ID:** updateAccountBudgetFeatureFlags

**Request Body:**

Content-Type: `application/vnd.accountBudgetFeatureFlags.v1+json`

**Responses:**

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.
