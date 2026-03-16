---
title: "Sponsored Brands campaign management (version 4)"
source: https://advertising.amazon.com/API/docs/en-us/sponsored-brands/3-0/openapi/prod
section: Sponsored Brands
spec_url: https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/4-0/openapi.json
---

# Sponsored Brands campaign management

**Version**: 4.0

Create and manage Sponsored Brands campaigns.

To learn more about Sponsored Brands campaigns, see:

 - [Sponsored Brands overview](guides/sponsored-brands/overview)
 - [Sponsored Brands campaign structure](guides/sponsored-brands/campaigns/structure)
 - [Get started with Sponsored Brands campaigns](guides/sponsored-brands/campaigns/get-started-with-campaigns)

## Tags

- **Campaigns**
- **Ad groups**
- **Ads**
- **Ad creatives**
- **Recommendations**
- **Product targeting categories**
- **Insights**
- **Budget usage**
- **Forecasts**
- **Optimization rules**
- **V3 Campaign Migration**

## Endpoints

### POST /sb/v4/campaigns

**Summary**: Create campaigns

Creates Sponsored Brands campaigns.

**Tags**: Campaigns

**Operation ID**: CreateSponsoredBrandsCampaigns

**Parameters**:

| Name | In | Type | Required |
|---|---|---|---|
| Amazon-Advertising-API-ClientId | header | string | true |
| Amazon-Advertising-API-Scope | header | string | true |

**Responses**: 207, 400, 401, 403, 429, 500

---

### PUT /sb/v4/campaigns

**Summary**: Update campaigns

Updates Sponsored Brands campaigns.

**Tags**: Campaigns

**Operation ID**: UpdateSponsoredBrandsCampaigns

**Parameters**:

| Name | In | Type | Required |
|---|---|---|---|
| Amazon-Advertising-API-ClientId | header | string | true |
| Amazon-Advertising-API-Scope | header | string | true |

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/campaigns/list

**Summary**: List campaigns

Lists Sponsored Brands campaigns.

**Tags**: Campaigns

**Operation ID**: ListSponsoredBrandsCampaigns

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/campaigns/delete

**Summary**: Delete campaigns

Deletes Sponsored Brands campaigns.

**Tags**: Campaigns

**Operation ID**: DeleteSponsoredBrandsCampaigns

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/adGroups

**Summary**: Create ad groups

Creates Sponsored Brands ad groups.

**Tags**: Ad groups

**Operation ID**: CreateSponsoredBrandsAdGroups

**Responses**: 207, 400, 401, 403, 429, 500

---

### PUT /sb/v4/adGroups

**Summary**: Update ad groups

Updates Sponsored Brands ad groups.

**Tags**: Ad groups

**Operation ID**: UpdateSponsoredBrandsAdGroups

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/adGroups/list

**Summary**: List ad groups

Lists Sponsored Brands ad groups.

**Tags**: Ad groups

**Operation ID**: ListSponsoredBrandsAdGroups

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/adGroups/delete

**Summary**: Delete ad groups

Deletes Sponsored Brands ad groups.

**Tags**: Ad groups

**Operation ID**: DeleteSponsoredBrandsAdGroups

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/autoCollection

**Summary**: Create Sponsored Brands Auto Collection Ads

Creates Sponsored Brands automatic collection ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsAutoCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/manualCollection

**Summary**: Create Sponsored Brands Manual Collection Ads

Creates Sponsored Brands manual collection ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsManualCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/brandVideo

**Summary**: Create brand video ads

Creates Sponsored Brands brand video ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsBrandVideoAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/productCollectionExtended

**Summary**: Creates Sponsored Brands new product collection ads with collection of custom images

Creates Sponsored Brands product collection ads with collection of custom images[1-5].

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsExtendedProductCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/video

**Summary**: Create video ads

Creates Sponsored Brands video ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsVideoAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/productCollection

**Summary**: Create product collection ads

Creates Sponsored Brands product collection ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandsProductCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/storeSpotlight

**Summary**: Create store spotlight ads

Creates Sponsored Brands store spotlight ads.

**Tags**: Ads

**Operation ID**: CreateSponsoredBrandStoreSpotlightAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### PUT /sb/v4/ads

**Summary**: Update ads

Updates Sponsored Brands ads.

**Tags**: Ads

**Operation ID**: UpdateSponsoredBrandsAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/ads/creatives/autoCollection

**Summary**: Update Sponsored Brands Auto Collection Ads

Updates the ad settings for an automatic collection by creating a new version.

**Tags**: Ads

**Operation ID**: UpdateSponsoredBrandsAutoCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/ads/creatives/manualCollection

**Summary**: Update Sponsored Brands Manual Collection Ads

Updates the ad settings for a manual collection by creating a new version.

**Tags**: Ads

**Operation ID**: UpdateSponsoredBrandsManualCollectionAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/list

**Summary**: List ads

Lists Sponsored Brands ads.

**Tags**: Ads

**Operation ID**: ListSponsoredBrandsAds

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/ads/delete

**Summary**: Delete ads

Deletes Sponsored Brands ads.

**Tags**: Ads

**Operation ID**: DeleteSponsoredBrandsAds

**Responses**: 207, 400, 401, 403, 429, 500

---

### POST /sb/ads/creatives/brandVideo

**Summary**: Create new version of brand video ad creative

This API creates a new version of an existing creative for given Sponsored Brands Ad by supplying brand video creative content.

**Tags**: Ad creatives

**Operation ID**: CreateBrandVideoCreative

**Responses**: 200, 400, 401, 403, 409, 429, 500

---

### POST /sb/ads/creatives/productCollectionExtended

**Summary**: Creates Sponsored Brands new version of product collection with collection of custom image ads

This API creates a new version of creative for given Sponsored Brands ad by supplying extended product collection creative content.

**Tags**: Ad creatives

**Operation ID**: CreateExtendedProductCollectionCreative

**Responses**: 200, 400, 401, 403, 409, 429, 500

---

### POST /sb/ads/creatives/video

**Summary**: Create new version of video ad creative

This API creates a new version of an existing creative for given Sponsored Brands ad by supplying video creative content.

**Tags**: Ad creatives

**Operation ID**: CreateVideoCreative

**Responses**: 200, 400, 401, 403, 409, 429, 500

---

### POST /sb/ads/creatives/productCollection

**Summary**: Create new version of product collection ad creative

This API creates a new version of creative for given Sponsored Brands ad by supplying product collection creative content.

**Tags**: Ad creatives

**Operation ID**: CreateProductCollectionCreative

**Responses**: 200, 400, 401, 403, 409, 429, 500

---

### POST /sb/ads/creatives/storeSpotlight

**Summary**: Create new version of store spotlight ad creative

This API creates a new version of creative for given Sponsored Brands ad by supplying store spotlight creative content.

**Tags**: Ad creatives

**Operation ID**: CreateStoreSpotlightCreative

**Responses**: 200, 400, 401, 403, 409, 429, 500

---

### POST /sb/ads/creatives/list

**Summary**: List ad creatives

This API gets an array of all Sponsored Brands creatives that qualify the given resource identifiers and filters.

**Tags**: Ad creatives

**Operation ID**: ListCreatives

**Responses**: 200, 400, 401, 403, 404, 429, 500

---

### GET /sb/negativeTargets/brands/recommendations

**Summary**: Get brand recommendations for negative targeting

Returns brands recommended for negative targeting. Only available for Sellers and Vendors.

**Tags**: Recommendations

**Operation ID**: SBTargetingGetNegativeBrands

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/recommendations/optimization

**Summary**: Get recommendation for optimization rule

Returns recommended bid value for optimization rule enable campaigns.

**Tags**: Recommendations

**Operation ID**: SBOptimizationRecommendation

**Responses**: 207, 400, 401, 403, 415, 429, 500

---

### POST /sb/recommendations/creative/headline

**Summary**: Get recommendations for creative headline

API to receive creative headline suggestions.

**Tags**: Recommendations

**Operation ID**: getHeadlineRecommendations

**Responses**: 200, 400, 401, 422, 429, 500

---

### POST /sb/campaigns/budgetRecommendations

**Summary**: Get budget recommendations

Provides daily budget recommendations for a list of requested Sponsored Brands campaigns, with context on estimated historical missed opportunities.

**Tags**: Recommendations

**Operation ID**: GetBudgetRecommendations

**Responses**: 207, 401, 403, 415, 422, 429, 500

---

### GET /sb/targets/categories

**Summary**: Get targetable categories

Returns all targetable categories by default in a list. List of categories can be used to build and traverse category tree.

**Tags**: Product targeting categories

**Operation ID**: SBTargetingGetTargetableCategories

**Responses**: 200, 400, 401, 429, 500

---

### POST /sb/targets/products/count

**Summary**: Get number of products in a category

Get number of targetable asins based on refinements provided by the user.

**Tags**: Product targeting categories

**Operation ID**: SBTargetingGetTargetableASINCounts

**Responses**: 200, 400, 401, 422, 429, 500

---

### GET /sb/targets/categories/{categoryRefinementId}/refinements

**Summary**: Get refinements for category

Returns refinements according to category input.

**Tags**: Product targeting categories

**Operation ID**: SBTargetingGetRefinementsForCategory

**Responses**: 200, 400, 401, 429, 500

---

### POST /sb/campaigns/insights

**Summary**: Get insights for campaigns

Creates campaign level insights. Insights will be provided for passed in campaign parameters.

**Tags**: Insights

**Operation ID**: SBInsightsCampaignInsights

**Responses**: 200, 400, 401, 422, 429, 500

---

### POST /sb/budgetRules

**Summary**: Create budget rules

**Tags**: Budget rules

**Operation ID**: CreateBudgetRulesForSBCampaigns

**Responses**: 207, 400, 401, 403, 422, 429, 500

---

### PUT /sb/budgetRules

**Summary**: Update budget rules

**Tags**: Budget rules

**Operation ID**: UpdateBudgetRulesForSBCampaigns

**Responses**: 207, 400, 401, 403, 422, 429, 500

---

### GET /sb/budgetRules

**Summary**: Get budget rules

**Tags**: Budget rules

**Operation ID**: GetSBBudgetRulesForAdvertiser

**Responses**: 200, 400, 401, 403, 422, 429, 500

---

### GET /sb/budgetRules/{budgetRuleId}

**Summary**: Get budget rule by ID

**Tags**: Budget rules

**Operation ID**: GetBudgetRuleByRuleIdForSBCampaigns

**Responses**: 200, 400, 401, 403, 422, 429, 500

---

### POST /sb/campaigns/{campaignId}/budgetRules

**Summary**: Associate budget rules to campaign

A maximum of 250 rules can be associated to a campaign.

**Tags**: Budget rules

**Operation ID**: CreateAssociatedBudgetRulesForSBCampaigns

**Responses**: 207, 400, 401, 403, 422, 429, 500

---

### GET /sb/campaigns/{campaignId}/budgetRules

**Summary**: Get budget rules associated to campaign

**Tags**: Budget rules

**Operation ID**: ListAssociatedBudgetRulesForSBCampaigns

**Responses**: 200, 400, 401, 403, 422, 429, 500

---

### GET /sb/budgetRules/{budgetRuleId}/campaigns

**Summary**: Get campaigns associated with budget rule

**Tags**: Budget rules

**Operation ID**: GetCampaignsAssociatedWithSBBudgetRule

**Responses**: 200, 400, 401, 403, 422, 429, 500

---

### DELETE /sb/campaigns/{campaignId}/budgetRules/{budgetRuleId}

**Summary**: Disassociate budget rule from campaign

**Tags**: Budget rules

**Operation ID**: DisassociateAssociatedBudgetRuleForSBCampaigns

**Responses**: 200, 400, 401, 403, 422, 429, 500

---

### POST /sb/campaigns/budget/usage

**Summary**: Get budget usage

**Tags**: Budget usage

**Operation ID**: sbCampaignsBudgetUsage

**Responses**: 207, 400, 401, 403, 422, 429, 500

---

### POST /sb/forecasts

**Summary**: Get performance forecasts for campaigns

Returns forecasts for a list of new campaigns specified in SB forecast request. Currently only one new campaign is supported.

**If the campaign is not set to any goal during campaign creation then use PAGE_VISIT as goal value.**

**Tags**: Forecasts

**Operation ID**: SBCampaignPerformanceForecasts

**Responses**: 207, 400, 401, 403, 422, 429, 500

---

### POST /sb/rules/optimization

**Summary**: Create optimization rules

Currently available in beta.

**Tags**: Optimization rules

**Operation ID**: CreateSponsoredBrandsOptimizationRules

**Responses**: 207, 400, 401, 403, 415, 429, 500

---

### PUT /sb/rules/optimization

**Summary**: Update optimization rules

**Tags**: Optimization rules

**Operation ID**: UpdateSponsoredBrandsOptimizationRules

**Responses**: 207, 400, 401, 403, 415, 429, 500

---

### POST /sb/rules/optimization/associate

**Summary**: Associate optimization rules

**Tags**: Optimization rules

**Operation ID**: AssociateSponsoredBrandsOptimizationRules

**Responses**: 207, 400, 401, 403, 415, 429, 500

---

### POST /sb/rules/optimization/list

**Summary**: List optimization rules

**Tags**: Optimization rules

**Operation ID**: ListSponsoredBrandsOptimizationRules

**Responses**: 200, 400, 401, 403, 415, 429, 500

---

### POST /sb/rules/optimization/disassociate

**Summary**: Disassociate optimization rules

**Tags**: Optimization rules

**Operation ID**: DisassociateSponsoredBrandsOptimizationRules

**Responses**: 207, 400, 401, 403, 415, 429, 500

---

### POST /sb/v4/legacyCampaigns/migrationJob

**Summary**: Creates Migration Job for V3 campaigns

**Tags**: V3 Campaign Migration

**Operation ID**: StartMigrationJob

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/legacyCampaigns/migrationJob/results

**Summary**: List Migration Results of all Campaign

**Tags**: V3 Campaign Migration

**Operation ID**: MigrationJobResults

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/legacyCampaigns/migrationJob/status

**Summary**: List Migration Job Status

**Tags**: V3 Campaign Migration

**Operation ID**: MigrationJobStatus

**Responses**: 200, 400, 401, 403, 429, 500

---

### POST /sb/v4/legacyCampaigns/overallMigrationResults

**Summary**: Lists all Campaign Migration results for an advertiser

**Tags**: V3 Campaign Migration

**Operation ID**: MigrationResults

**Responses**: 200, 400, 401, 403, 429, 500

---

## Schemas

Total schemas: 491. For the full schema definitions, refer to the OpenAPI spec at:
https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/4-0/openapi.json
