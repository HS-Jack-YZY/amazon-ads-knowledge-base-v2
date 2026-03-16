---
title: ADSP Audiences
source: https://advertising.amazon.com/API/docs/en-us
section: Amazon DSP
---

# ADSP Audiences

**Version**: 3.0



## Endpoints

### POST `/dsp/audiences`

**Creates an audience.**

Creates a targeting audience based on an audience definition.

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view","audiences_edit"]

Tags: Audiences

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use `GET` method on Profiles res |
| advertiserId | query | True | string | The advertiser to create audience for. |

**Responses:** `207`, `400`, `403`

---


## Schemas (7 total)

- **DspAudienceCreateRequestItem**: Complete audience model to be used for creation of the audience.
- **DspAudienceError**: The error object.
- **DspAudienceErrorItem**: The error response object.
- **DspAudienceErrorItemError**: The error object.
- **DspAudienceResponse**: This holds an array of successful items and an array of error items from the request.
- **DspAudienceRule**: A rule for defining an audience.

 **Rule Constraints Table**: Provides available valid combinations
- **DspAudienceSuccessItem**: The success response object.
