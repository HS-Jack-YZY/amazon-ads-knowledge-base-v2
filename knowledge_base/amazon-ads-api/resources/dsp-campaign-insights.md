---
title: D16GDspApiCampaignInsightsV1
source: https://advertising.amazon.com/API/docs/en-us
section: Amazon DSP
---

# D16GDspApiCampaignInsightsV1

**Version**: 3.0

The DSP Campaign Insights API provides campaign and ad group performance insights for given campaign or ad ad group ids.

## Endpoints

### POST `/dsp/v1/campaign/insights`

**GetDspCampaignInsightsV1**

Gets campaign and ad group performance insights given campaign ids or ad group ids.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Advertising-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_view"]

Tags: DspCampaignInsights

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |
| Amazon-Advertising-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |

**Responses:** `207`, `400`, `401`, `403`, `404`, `409`, `415`, `429`, `500`

---


## Schemas (21 total)

- **CampaignInsight**: 
- **DspBadRequestExceptionV1ResponseContent**: 
- **DspConflictExceptionV1ResponseContent**: 
- **DspForbiddenExceptionV1ResponseContent**: 
- **DspInternalServerExceptionV1ResponseContent**: 
- **DspNotFoundExceptionV1ResponseContent**: 
- **DspSubErrorV1**: 
- **DspTooManyRequestsExceptionV1ResponseContent**: 
- **DspUnauthorizedExceptionV1ResponseContent**: 
- **DspUnsupportedMediaTypeExceptionV1ResponseContent**: 
- **ErrorResponse**: 
- **InsightRequest**: 
- **InsightType**: 
- **InsightsUnion**: 
- **ListDspCampaignInsightsRequestContent**: 
- **ListDspCampaignInsightsResponseContent**: 
- **PerformancePlusShopperTrait**: 
- **PerformancePlusShopperTraitInsight**: 
- **PerformancePlusTargetingTactic**: 
- **SuccessInsightsResponse**: 
- **TimeToConvertBucket**: 
