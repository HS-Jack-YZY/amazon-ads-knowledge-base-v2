---
title: "Sponsored Brands campaign management (version 3)"
source: https://advertising.amazon.com/API/docs/en-us/sponsored-brands/3-0/openapi
section: Sponsored Brands
spec_url: https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/3-0/openapi.yaml
---

# Amazon Ads API - Sponsored Brands

**Version**: 3.0

Use the Amazon Ads API for Sponsored Brands for campaign, ad group, keyword, negative keyword, drafts, Stores, landing pages, and Brands management operations. For more information about Sponsored Brands, see the [Sponsored Brands Support Center](https://advertising.amazon.com/help#GQFZA83P55P747BZ). For onboarding information, see the [account setup](https://advertising.amazon.com/API/docs/v3/guides/account_setup) topic.

This contract contains the latest versions for keyword and product targeting. For the latest version of campaigns, ad groups, ads, and creatives, see [Sponsored Brands version 4](/API/docs/en-us/sponsored-brands/3-0/openapi/prod).

## Tags

- **Keywords**
- **Negative keywords**
- **Product targeting**
- **Negative product targeting**
- **Theme targeting**
- **Targeting recommendations**
- **Bid recommendations**
- **Budget Rules Recommendations**
- **Keyword Recommendations**
- **Stores**
- **Landing page asins**
- **Media**
- **Brands**
- **Moderation**

## Endpoints

### GET /brands
getBrands - Gets an array of Brand data objects for the Brand associated with the profile ID.
**Operation ID**: `getBrands`

---

### GET /sb/keywords
Gets an array of keywords, filtered by optional criteria.
**Operation ID**: `listKeywords`

---

### PUT /sb/keywords
Updates one or more keywords.
**Operation ID**: `updateKeywords`

---

### POST /sb/keywords
Creates one or more keywords.
**Operation ID**: `createKeywords`

---

### GET /sb/keywords/{keywordId}
Gets a keyword specified by identifier.
**Operation ID**: `getKeyword`

---

### DELETE /sb/keywords/{keywordId}
Archives a keyword specified by identifier.
**Operation ID**: `archiveKeyword`

---

### GET /sb/negativeKeywords
Gets an array of negative keywords, filtered by optional criteria.
**Operation ID**: `listNegativeKeywords`

---

### PUT /sb/negativeKeywords
Updates one or more negative keywords.
**Operation ID**: `updateNegativeKeywords`

---

### POST /sb/negativeKeywords
Creates one or more negative keywords.
**Operation ID**: `createNegativeKeywords`

---

### GET /sb/negativeKeywords/{keywordId}
Gets a negative keyword specified by identifier.
**Operation ID**: `getNegativeKeyword`

---

### DELETE /sb/negativeKeywords/{keywordId}
Archives a negative keyword specified by identifier.
**Operation ID**: `archiveNegativeKeyword`

---

### GET /pageAsins
Gets ASIN information for a specified address.
**Operation ID**: `listAsins`

---

### PUT /media/complete
The API is used to notify that the upload is completed.
**Operation ID**: `completeUpload`

---

### GET /media/describe
API to poll for media status.
**Operation ID**: `describeMedia`

---

### GET /stores/assets
Gets a list of assets associated with a specified brand entity identifier.
**Operation ID**: `listAssets`

---

### POST /stores/assets
Creates a new image asset.
**Operation ID**: `createAsset`

---

### POST /sb/recommendations/bids
Gets bid recommendations.
**Operation ID**: `getBidsRecommendations`

---

### POST /sb/campaigns/budgetRules/recommendations
Gets a list of special events with suggested date range and suggested budget increase for a campaign.
**Operation ID**: `SBGetBudgetRulesRecommendation`

---

### POST /sb/recommendations/keyword
Gets keyword recommendations.
**Operation ID**: `getKeywordRecommendations`

---

### POST /sb/targets/list
Lists targets.
**Operation ID**: `listTargets`

---

### PUT /sb/targets
Updates one or more targets.
**Operation ID**: `updateTargets`

---

### POST /sb/targets
Create one or more targets.
**Operation ID**: `createTargets`

---

### GET /sb/targets/{targetId}
Gets a target specified by identifier.
**Operation ID**: `getTarget`

---

### DELETE /sb/targets/{targetId}
Archives a target specified by identifier (permanent).
**Operation ID**: `archiveTarget`

---

### POST /sb/negativeTargets/list
Gets a list of product negative targets.
**Operation ID**: `listNegativeTargets`

---

### PUT /sb/negativeTargets
Updates one or more negative targets.
**Operation ID**: `updateNegativeTargets`

---

### POST /sb/negativeTargets
Create one or more negative targets.
**Operation ID**: `createNegativeTargets`

---

### GET /sb/negativeTargets/{negativeTargetId}
Gets a negative target specified by identifier.
**Operation ID**: `getNegativeTarget`

---

### DELETE /sb/negativeTargets/{negativeTargetId}
Archives a negative target specified by identifier (permanent).
**Operation ID**: `archiveNegativeTarget`

---

### POST /sb/themes/list
Lists theme targets.
**Operation ID**: `sbListThemes`

---

### PUT /sb/themes
Updates one or more theme targets.
**Operation ID**: `sbUpdateThemes`

---

### POST /sb/themes
Create one or more theme targets.
**Operation ID**: `sbCreateThemes`

---

### POST /sb/recommendations/targets/product/list
Gets a list of recommended products for targeting.
**Operation ID**: `getProductRecommendations`

---

### POST /sb/recommendations/targets/category
Gets a list of recommended categories for targeting.
**Operation ID**: `getTargetingCategories`

---

### POST /sb/recommendations/targets/brand
Gets a list of brand suggestions.
**Operation ID**: `getBrandRecommendations`

---

### GET /sb/moderation/campaigns/{campaignId}
[DEPRECATED] Gets the moderation result for a campaign specified by identifier.

---

### POST /v2/hsa/{recordType}/report
Requests the creation of a report containing performance data related to Sponsored Brands campaigns.

---

### GET /v2/reports/{reportId}
Returns the status of a previously requested report.

---

### GET /v2/reports/{reportId}/download
Downloads a previously requested report identified by reportId.
**Operation ID**: `downloadReport`

---

## Schemas

Full definitions: https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/3-0/openapi.yaml
