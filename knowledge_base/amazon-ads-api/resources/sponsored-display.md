---
title: "Sponsored Display campaign management"
source: https://advertising.amazon.com/API/docs/en-us/sponsored-display/3-0/openapi
section: Sponsored Display
spec_url: https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-display/3-0/openapi.yaml
---

# Sponsored Display campaign management

**Version**: 3.0

This API enables programmatic access for campaign creation, management, and reporting for Sponsored Display campaigns.

For more information, see:
- [Sponsored Display overview](/API/docs/en-us/guides/sponsored-display/overview)
- [Creating audience targeting campaigns](/API/docs/en-us/guides/sponsored-display/audience-targeting)
- [Creating contextual targeting campaigns](/API/docs/en-us/guides/sponsored-display/contextual-targeting)

## Endpoints

### Campaigns

- **GET /sd/campaigns** - Gets a list of campaigns. `listCampaigns`
- **PUT /sd/campaigns** - Updates one or more campaigns. `updateCampaigns`
- **POST /sd/campaigns** - Creates one or more campaigns. `createCampaigns`
- **GET /sd/campaigns/{campaignId}** - Gets a requested campaign. `getCampaign`
- **DELETE /sd/campaigns/{campaignId}** - Sets the campaign status to archived. `archiveCampaign`
- **GET /sd/campaigns/extended** - Gets a list of campaigns with extended fields. `listCampaignsEx`
- **GET /sd/campaigns/extended/{campaignId}** - Gets extended info for a campaign. `getCampaignResponseEx`

### Ad Groups

- **GET /sd/adGroups** - Gets a list of ad groups. `listAdGroups`
- **PUT /sd/adGroups** - Updates one or more ad groups. `updateAdGroups`
- **POST /sd/adGroups** - Creates one or more ad groups. `createAdGroups`
- **GET /sd/adGroups/{adGroupId}** - Gets a requested ad group. `getAdGroup`
- **DELETE /sd/adGroups/{adGroupId}** - Sets the ad group status to archived. `archiveAdGroup`
- **GET /sd/adGroups/extended** - Gets a list of ad groups with extended fields. `listAdGroupsEx`
- **GET /sd/adGroups/extended/{adGroupId}** - Gets extended info for an ad group. `getAdGroupResponseEx`

### Product Ads

- **GET /sd/productAds** - Gets a list of product ads. `listProductAds`
- **PUT /sd/productAds** - Updates one or more product ads. `updateProductAds`
- **POST /sd/productAds** - Creates one or more product ads. `createProductAds`
- **GET /sd/productAds/{adId}** - Gets a requested product ad. `getProductAd`
- **DELETE /sd/productAds/{adId}** - Sets the status of a product ad to archived. `archiveProductAd`
- **GET /sd/productAds/extended** - Gets a list of product ads with extended fields. `listProductAdsEx`
- **GET /sd/productAds/extended/{adId}** - Gets extended info for a product ad. `getProductAdResponseEx`

### Targeting

- **GET /sd/targets** - Gets a list of targeting clauses. `listTargetingClauses`
- **PUT /sd/targets** - Updates one or more targeting clauses. `updateTargetingClauses`
- **POST /sd/targets** - Creates one or more targeting clauses. `createTargetingClauses`
- **GET /sd/targets/{targetId}** - Gets a targeting clause by identifier. `getTargets`
- **DELETE /sd/targets/{targetId}** - Sets the state of a targeting clause to archived. `archiveTargetingClause`
- **GET /sd/targets/extended** - Gets targeting clauses with extended fields. `listTargetingClausesEx`
- **GET /sd/targets/extended/{targetId}** - Gets extended info for a targeting clause. `getTargetsEx`
- **POST /sd/targets/recommendations** - Returns recommended products and categories. `getTargetRecommendations`
- **POST /sd/targets/bid/recommendations** - Returns bid recommendations for targeting. `getTargetBidRecommendations`

### Negative Targeting

- **GET /sd/negativeTargets** - Gets a list of negative targeting clauses. `listNegativeTargetingClauses`
- **PUT /sd/negativeTargets** - Updates negative targeting clauses. `updateNegativeTargetingClauses`
- **POST /sd/negativeTargets** - Creates negative targeting clauses. `createNegativeTargetingClauses`
- **GET /sd/negativeTargets/{negativeTargetId}** - Gets a negative targeting clause. `getNegativeTargets`
- **DELETE /sd/negativeTargets/{negativeTargetId}** - Archives a negative targeting clause. `archiveNegativeTargetingClause`
- **GET /sd/negativeTargets/extended** - Gets negative targeting with extended fields. `listNegativeTargetingClausesEx`
- **GET /sd/negativeTargets/extended/{negativeTargetId}** - Gets extended info for negative targeting. `getNegativeTargetsEx`

### Creatives

- **GET /sd/creatives** - Gets a list of creatives. `listCreatives`
- **PUT /sd/creatives** - Updates one or more creatives. `updateCreatives`
- **POST /sd/creatives** - Creates one or more creatives. `createCreatives`
- **POST /sd/creatives/preview** - Gets creative preview HTML. `postCreativePreview`
- **GET /sd/moderation/creatives** - Gets a list of creative moderations. `listCreativeModerations`

### Brand Safety

- **GET /sd/brandSafety/deny** - Gets websites/apps on the Brand Safety Deny List. `listDomains`
- **POST /sd/brandSafety/deny** - Creates Brand Safety Deny List domains. `createBrandSafetyDenyListDomains`
- **DELETE /sd/brandSafety/deny** - Deletes Brand Safety Deny List. `deleteBrandSafetyDenyList`
- **GET /sd/brandSafety/{requestId}/results** - Gets results for a request. `getRequestResults`
- **GET /sd/brandSafety/{requestId}/status** - Gets status of a request. `getRequestStatus`
- **GET /sd/brandSafety/status** - Lists status of all requests. `listRequestStatus`

### Reporting

- **POST /sd/{recordType}/report** - Creates a report request. `requestReport`
- **GET /v2/reports/{reportId}** - Gets the status of a report. `getReportStatus`
- **GET /v2/reports/{reportId}/download** - Downloads a report. `downloadReport`

### Snapshots

- **POST /sd/{recordType}/snapshot** - Creates a snapshot. `createSnapshot`
- **GET /sd/snapshots/{snapshotId}** - Gets snapshot status. `getSnapshot`
- **GET /sd/snapshots/{snapshotId}/download** - Downloads a snapshot. `downloadSnapshot`

### Budget

- **POST /sd/campaigns/budgetRecommendations** - Returns budget recommendations. `getSDBudgetRecommendations`
- **POST /sd/campaigns/budget/usage** - Budget usage for SD campaigns. `sdCampaignsBudgetUsage`
- **POST /sd/budgetRules** - Creates budget rules. `CreateBudgetRulesForSDCampaigns`
- **GET /sd/budgetRules** - Get all budget rules. `GetSDBudgetRulesForAdvertiser`
- **PUT /sd/budgetRules** - Update budget rules. `UpdateBudgetRulesForSDCampaigns`
- **GET /sd/budgetRules/{budgetRuleId}** - Gets a budget rule. `GetBudgetRuleByRuleIdForSDCampaigns`
- **GET /sd/budgetRules/{budgetRuleId}/campaigns** - Gets campaigns for a budget rule. `GetCampaignsAssociatedWithSDBudgetRule`
- **POST /sd/campaigns/{campaignId}/budgetRules** - Associates budget rules to campaign. `CreateAssociatedBudgetRulesForSDCampaigns`
- **GET /sd/campaigns/{campaignId}/budgetRules** - Gets budget rules for campaign. `ListAssociatedBudgetRulesForSDCampaigns`
- **DELETE /sd/campaigns/{campaignId}/budgetRules/{budgetRuleId}** - Disassociates a budget rule. `DisassociateAssociatedBudgetRuleForSDCampaigns`

### Optimization Rules

- **GET /sd/optimizationRules** - Gets optimization rules. `listOptimizationRules`
- **PUT /sd/optimizationRules** - Updates optimization rules. `updateOptimizationRules`
- **POST /sd/optimizationRules** - Creates optimization rules. `createOptimizationRules`
- **GET /sd/optimizationRules/{optimizationRuleId}** - Gets an optimization rule.
- **POST /sd/adGroups/{adGroupId}/optimizationRules** - Associates rules to ad group. `associateOptimizationRulesWithAdGroup`
- **GET /sd/adGroups/{adGroupId}/optimizationRules** - Gets rules for ad group.
- **POST /sd/adGroups/{adGroupId}/optimizationRules/disassociate** - Disassociates rules from ad group. `disassociateOptimizationRulesFromAdGroup`

### Forecasts

- **POST /sd/forecasts** - Return forecasts for an ad group. `createSDForecast`

### Locations

- **GET /sd/locations** - Gets locations for ad groups. `listLocations`
- **POST /sd/locations** - Creates locations for ad groups. `createLocations`
- **POST /sd/locations/delete** - Archives locations. `archiveLocations`

### Recommendations

- **POST /sd/recommendations/creative/headline** - Gets headline recommendations. `getHeadlineRecommendationsForSD`

## Schemas

Full definitions: https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-display/3-0/openapi.yaml
