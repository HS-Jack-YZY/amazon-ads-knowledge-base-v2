---
title: Campaign Diagnostics
source: https://advertising.amazon.com/API/docs/en-us/campaign-diagnostics
section: Resources
---

# Diagnostics

The Campaign Diagnostics API ([POST /diagnostics/campaigns/issues](https://advertising.amazon.com/API/docs/en-us/campaign-diagnostics)) will be deprecated on December 01, 2025. New users will no longer be able to make requests as of June 20, 2025. All existing access to the API will be shut off on December 01, 2025

**Version:** 3.0

## Endpoints

### POST /diagnostics/campaigns/issues

**Summary:** Returns campaign issues

Creates the advertiser campaign issues, for all advertising campaigns.

**Requires one of these permissions**:
["advertiser_campaign_view","advertiser_campaign_edit"]

**Operation ID:** campaignDiagnostics

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/vnd.campaigndiagnosticsissues.v1+json`

**Responses:**

- **207**: Successful Operation.
- **400**: Validation Exception.
- **401**: Unauthorized Exception.
- **429**: Throttling Exception.
- **500**: Internal Exception.
