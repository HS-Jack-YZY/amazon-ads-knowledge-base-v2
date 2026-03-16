---
title: Amazon Ads API - Complete Endpoint Reference
description: All API endpoint paths organized by product and resource
---

# API Endpoint Reference

> Base URLs: NA `https://advertising-api.amazon.com` | EU `https://advertising-api-eu.amazon.com` | FE `https://advertising-api-fe.amazon.com`

## Required Headers (All Endpoints)

```
Authorization: Bearer {access_token}
Amazon-Advertising-API-ClientId: {client_id}
Amazon-Advertising-API-Scope: {profile_id}
Content-Type: application/json
```

> **Note**: AMC endpoints use `Amazon-Advertising-API-AdvertiserId` and `Amazon-Advertising-API-MarketplaceId` instead of `Amazon-Advertising-API-Scope`.

---

## 1. Profiles & Accounts

| Method | Path | Description |
|--------|------|-------------|
| GET | `/v2/profiles` | List all advertising profiles |
| GET | `/v2/profiles/{profileId}` | Get profile by ID |
| PUT | `/v2/profiles` | Update profile daily budgets (Sellers only) |

Query params for GET `/v2/profiles`:
- `apiProgram`: billing, campaign, paymentMethod, store, report, account, posts (default: campaign)
- `accessLevel`: edit, view (default: edit)
- `profileTypeFilter`: seller, vendor, agency

---

## 2. Campaign Management - Amazon Ads API v1 (Recommended)

> v1 is the unified API across SP, SB, and DSP. Use v1 for new integrations.

### Campaigns

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/campaigns` | Create campaigns | 207 Multi-status |
| GET | `/campaigns` | List campaigns (paginated) | 200 |
| GET | `/campaigns/{campaignId}` | Get single campaign | 200 |
| PUT | `/campaigns/{campaignId}` | Update single campaign | 200 |
| PUT | `/campaigns` | Batch update campaigns | 207 Multi-status |

### Ad Groups

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/adGroups` | Create ad groups | 207 Multi-status |
| GET | `/adGroups` | List ad groups (paginated) | 200 |
| GET | `/adGroups/{adGroupId}` | Get single ad group | 200 |
| PUT | `/adGroups/{adGroupId}` | Update single ad group | 200 |
| PUT | `/adGroups` | Batch update ad groups | 207 Multi-status |

### Ads

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/ads` | Create ads | 207 Multi-status |
| GET | `/ads` | List ads (paginated) | 200 |
| GET | `/ads/{adId}` | Get single ad | 200 |
| PUT | `/ads/{adId}` | Update single ad | 200 |
| PUT | `/ads` | Batch update ads | 207 Multi-status |

### Ad Associations

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/adAssociations` | Create ad associations | 207 Multi-status |
| GET | `/adAssociations` | List ad associations | 200 |
| GET | `/adAssociations/{adAssociationId}` | Get single association | 200 |
| PUT | `/adAssociations/{adAssociationId}` | Update single association | 200 |
| PUT | `/adAssociations` | Batch update associations | 207 Multi-status |

### Ad Extensions

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/adExtensions` | Create ad extensions | 207 Multi-status |
| GET | `/adExtensions` | List ad extensions | 200 |
| PUT | `/adExtensions/{adExtensionId}` | Update single ad extension | 200 |

### Brand Stores (v1)

| Method | Path | Description |
|--------|------|-------------|
| GET | `/brandStores` | List brand stores |
| GET | `/brandStores/{storeId}/editions` | List store editions |
| GET | `/brandStores/{storeId}/pages` | List store pages |
| PUT | `/brandStores/{storeId}/editionPublishVersions` | Publish store edition |

---

## 3. Sponsored Products (SP)

### SP-Specific Endpoints (v3)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/sp/campaigns/recommendations` | Get campaign optimization recommendations |
| POST | `/sp/budget-rules` | Create budget rules |
| GET | `/sp/budget-rules` | List budget rules |
| GET | `/sp/budget-rules/{ruleId}` | Get budget rule |
| POST | `/sp/budget-rules/usage` | Get budget usage for campaigns |
| POST | `/sp/recommendations/bids-for-existing-ad-group` | Get bid recommendations |
| POST | `/sp/recommendations/bids-for-new-ad-group` | Get bid recommendations for new ad group |
| POST | `/sp/recommendations/budget` | Get budget recommendations |
| POST | `/sp/recommendations/budget-for-new-campaign` | Get budget for new campaign |
| POST | `/sp/recommendations/keyword-targets` | Get keyword target recommendations |
| POST | `/sp/product-recommendations` | Get ASIN recommendations |
| POST | `/sp/targets/category-recommendations` | Get category recommendations |
| POST | `/sp/targets/category/{categoryId}/refinements` | Get category refinements |
| POST | `/sp/campaign-optimization-rules` | Create optimization rules |
| GET | `/sp/campaign-optimization-rules/{ruleId}` | Get optimization rule |
| DELETE | `/sp/campaign-optimization-rules/{ruleId}` | Delete optimization rule |

---

## 4. Sponsored Brands (SB)

### SB v4 Campaigns

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/sb/v4/campaigns` | Create SB campaigns | 207 |
| PUT | `/sb/v4/campaigns` | Update SB campaigns | 207 |
| POST | `/sb/v4/campaigns/list` | List SB campaigns | 200 |
| POST | `/sb/v4/campaigns/delete` | Delete SB campaigns | 207 |

### SB v4 Ad Groups

| Method | Path | Description | Response |
|--------|------|-------------|----------|
| POST | `/sb/v4/adGroups` | Create SB ad groups | 207 |
| PUT | `/sb/v4/adGroups` | Update SB ad groups | 207 |
| POST | `/sb/v4/adGroups/list` | List SB ad groups | 200 |
| POST | `/sb/v4/adGroups/delete` | Delete SB ad groups | 207 |

### SB v4 Ads (Multiple Types)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/sb/v4/ads/productCollection` | Create product collection ads |
| POST | `/sb/v4/ads/productCollectionExtended` | Create extended product collection ads |
| POST | `/sb/v4/ads/brandVideo` | Create brand video ads |
| POST | `/sb/v4/ads/video` | Create video ads |
| POST | `/sb/v4/ads/autoCollection` | Create auto collection ads |
| POST | `/sb/v4/ads/manualCollection` | Create manual collection ads |
| POST | `/sb/v4/ads/storeSpotlight` | Create store spotlight ads |
| PUT | `/sb/v4/ads` | Update SB ads |
| POST | `/sb/v4/ads/list` | List SB ads |
| POST | `/sb/v4/ads/delete` | Delete SB ads |

### SB v3 Targeting (Keywords & Products)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/sb/keywords` | Create SB keywords |
| PUT | `/sb/keywords` | Update SB keywords |
| POST | `/sb/keywords/list` | List SB keywords |
| DELETE | `/sb/keywords/{keywordId}` | Archive SB keyword |
| POST | `/sb/negativeKeywords` | Create SB negative keywords |
| PUT | `/sb/negativeKeywords` | Update SB negative keywords |
| POST | `/sb/negativeKeywords/list` | List SB negative keywords |
| DELETE | `/sb/negativeKeywords/{negativeKeywordId}` | Archive SB negative keyword |
| POST | `/sb/targets` | Create SB product targets |
| PUT | `/sb/targets` | Update SB product targets |
| POST | `/sb/targets/list` | List SB product targets |
| DELETE | `/sb/targets/{targetId}` | Archive SB product target |
| POST | `/sb/negativeTargets` | Create SB negative product targets |
| PUT | `/sb/negativeTargets` | Update SB negative product targets |
| POST | `/sb/negativeTargets/list` | List SB negative product targets |
| DELETE | `/sb/negativeTargets/{negativeTargetId}` | Archive SB negative target |

---

## 5. Sponsored Display (SD)

### SD Campaigns

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sd/campaigns` | List SD campaigns |
| POST | `/sd/campaigns` | Create SD campaigns (max 100) |
| PUT | `/sd/campaigns` | Update SD campaigns (max 100) |
| GET | `/sd/campaigns/{campaignId}` | Get SD campaign |
| DELETE | `/sd/campaigns/{campaignId}` | Archive SD campaign (irreversible) |
| GET | `/sd/campaigns/extended` | List SD campaigns with extended fields |
| GET | `/sd/campaigns/extended/{campaignId}` | Get SD campaign extended |

### SD Ad Groups

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sd/adGroups` | List SD ad groups |
| POST | `/sd/adGroups` | Create SD ad groups (max 100) |
| PUT | `/sd/adGroups` | Update SD ad groups (max 100) |
| GET | `/sd/adGroups/{adGroupId}` | Get SD ad group |
| DELETE | `/sd/adGroups/{adGroupId}` | Archive SD ad group (irreversible) |
| GET | `/sd/adGroups/extended` | List with extended fields |

### SD Product Ads

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sd/productAds` | List SD product ads |
| POST | `/sd/productAds` | Create SD product ads (max 100) |
| PUT | `/sd/productAds` | Update SD product ads (max 100) |
| GET | `/sd/productAds/{adId}` | Get SD product ad |
| DELETE | `/sd/productAds/{adId}` | Archive SD product ad (irreversible) |
| GET | `/sd/productAds/extended` | List with extended fields |

### SD Targeting

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sd/targets` | List SD targeting clauses |
| POST | `/sd/targets` | Create SD targets (max 200 for T00030, max 1000 for T00020) |
| PUT | `/sd/targets` | Update SD targets (max 100) |
| GET | `/sd/targets/{targetId}` | Get SD target |
| DELETE | `/sd/targets/{targetId}` | Archive SD target |

### SD Brand Safety

| Method | Path | Description |
|--------|------|-------------|
| GET | `/sd/brandSafety/deny` | List brand safety deny list |
| POST | `/sd/brandSafety/deny` | Add to deny list (max 10,000) |
| DELETE | `/sd/brandSafety/deny` | Archive entire deny list |

---

## 6. Reporting (v3)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/reporting/reports` | Create async report request |
| GET | `/reporting/reports/{reportId}` | Get report status & download URL |
| DELETE | `/reporting/reports/{reportId}` | Cancel pending report |

### Available Report Types

| Product | Report Type IDs |
|---------|----------------|
| **Sponsored Products** | spCampaigns, spTargeting, spSearchTerm, spAdvertisedProduct, spPurchasedProduct, spGrossAndInvalids |
| **Sponsored Brands** | sbCampaigns, sbAdGroup, sbAds, sbTargeting, sbSearchTerm, sbCampaignPlacement, sbPurchasedProduct, sbGrossAndInvalids |
| **Sponsored Display** | sdCampaigns, sdAdGroup, sdAdvertisedProduct, sdTargeting, sdPurchasedProduct, sdGrossAndInvalids |
| **Sponsored TV** | stCampaigns, stTargeting |
| **DSP** | dspCampaign, dspAudience, dspInventory, dspProduct, dspGeo, dspTech, dspAudioAndVideo |

---

## 7. Amazon Marketing Cloud (AMC)

### AMC Administration

| Method | Path | Description |
|--------|------|-------------|
| GET | `/amc/accounts` | List AMC accounts |
| GET | `/amc/instances` | List AMC instances |
| GET | `/amc/instances/{instanceId}` | Get instance details |
| POST | `/amc/instances` | Create AMC instance |
| PUT | `/amc/instances/{instanceId}` | Update instance |

### AMC Reporting (Workflow Management)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/amc/reporting/{instanceId}/workflows` | Create a workflow (saved SQL query) |
| GET | `/amc/reporting/{instanceId}/workflows` | List workflows |
| GET | `/amc/reporting/{instanceId}/workflows/{workflowId}` | Get workflow details |
| PUT | `/amc/reporting/{instanceId}/workflows/{workflowId}` | Update workflow |
| DELETE | `/amc/reporting/{instanceId}/workflows/{workflowId}` | Delete workflow |
| POST | `/amc/reporting/{instanceId}/workflows/{workflowId}/execute` | Execute workflow |
| GET | `/amc/reporting/{instanceId}/workflowExecutions` | List workflow executions |
| GET | `/amc/reporting/{instanceId}/workflowExecutions/{executionId}` | Get execution status |
| GET | `/amc/reporting/{instanceId}/workflowExecutions/{executionId}/downloadUrls` | Get result download URLs |

### AMC Audiences

| Method | Path | Description |
|--------|------|-------------|
| POST | `/amc/audiences/{instanceId}/ruleBasedAudiences` | Create rule-based audience |
| GET | `/amc/audiences/{instanceId}/ruleBasedAudiences` | List rule-based audiences |
| GET | `/amc/audiences/{instanceId}/ruleBasedAudiences/{audienceId}` | Get audience details |
| PUT | `/amc/audiences/{instanceId}/ruleBasedAudiences/{audienceId}` | Update audience |
| DELETE | `/amc/audiences/{instanceId}/ruleBasedAudiences/{audienceId}` | Delete audience |

### AMC Advertiser Data Upload

| Method | Path | Description |
|--------|------|-------------|
| POST | `/amc/upload/{instanceId}/dataSets` | Create dataset |
| GET | `/amc/upload/{instanceId}/dataSets` | List datasets |
| GET | `/amc/upload/{instanceId}/dataSets/{dataSetId}` | Get dataset details |
| DELETE | `/amc/upload/{instanceId}/dataSets/{dataSetId}` | Delete dataset |
| POST | `/amc/upload/{instanceId}/dataSets/{dataSetId}/uploadUrls` | Get upload URL |
| POST | `/amc/upload/{instanceId}/dataSets/{dataSetId}/uploads` | Confirm upload |
| GET | `/amc/upload/{instanceId}/dataSets/{dataSetId}/uploads` | List uploads |

---

## 8. Other Resources

### Portfolios

| Method | Path | Description |
|--------|------|-------------|
| GET | `/v2/portfolios` | List portfolios |
| GET | `/v2/portfolios/{portfolioId}` | Get portfolio |
| POST | `/v2/portfolios` | Create portfolios |
| PUT | `/v2/portfolios` | Update portfolios |
| GET | `/v2/portfolios/extended` | List extended portfolios |

### Exports

| Method | Path | Description |
|--------|------|-------------|
| POST | `/exports` | Create export request |
| GET | `/exports/{exportId}` | Get export status |

### Change History

| Method | Path | Description |
|--------|------|-------------|
| POST | `/history` | Query change history |

### Moderation

| Method | Path | Description |
|--------|------|-------------|
| POST | `/moderation` | Get moderation results |

### Product Metadata

| Method | Path | Description |
|--------|------|-------------|
| POST | `/product/metadata` | Get product metadata (ASINs/SKUs) |

### Product Eligibility

| Method | Path | Description |
|--------|------|-------------|
| POST | `/eligibility/product/list` | Check ad eligibility |

---

## OpenAPI Specification Downloads

All specs available at CDN:

| Spec | URL |
|------|-----|
| v1 Common | `https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/AmazonAdsAPIALL_prod_3p.json` |
| v1 All Merged | `https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/AmazonAdsAPIALLMerged_prod_3p.json` |
| SP v3 | `https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/SponsoredProducts_prod_3p.json` |
| SB v4 | `https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/4-0/openapi.json` |
| SB v3 | `https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-brands/3-0/openapi.yaml` |
| SD v3 | `https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/sponsored-display/3-0/openapi.yaml` |
| Profiles | `https://d3a0d0y2hgofx6.cloudfront.net/openapi/en-us/profiles/3-0/openapi.yaml` |
| Reporting v3 | `https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/OfflineReport_prod_3p.json` |
| STV | `https://d1y2lf8k3vrkfu.cloudfront.net/openapi/en-us/dest/SponsoredTV_prod_3p.json` |
| Contracts Index | `https://d3a0d0y2hgofx6.cloudfront.net/en-us/contracts.json` |
