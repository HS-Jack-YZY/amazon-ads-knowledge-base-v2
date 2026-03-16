---
title: Amazon Ads API common model overview
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/overview
section: Common Models
---

# Amazon Ads API common model overview

The common model for the Amazon Ads API provides advertisers with a standard way to refer to common concepts across our different ad products (Sponsored Products, Sponsored Brands, Sponsored Display, Sponsored Television, and Amazon DSP).

We currently support common models for:

- [Campaigns](reference/common-models/campaigns)
- [Ad groups](reference/common-models/ad-groups)
- [Targets](reference/common-models/targets)
- [Ads](reference/common-models/ads)
- [Ad associations](reference/common-models/ad-associations)

We also support common [enums](reference/common-models/enums) that are referenced within each model.

# Campaign management entities

Campaigns group ads that share common objectives and optimization strategies. Campaigns may also have budgets, fees and frequency caps settings that are defaults to all ad groups, targets, and ads that are associated with the campaign.

Specific attributes for each ad product are preserved in the common model based on the `adProduct` attribute of a given campaign or child entity.

## Entity relationships

<div style="display: flex; flex-wrap: wrap; gap: 1.4em;">
    <div>

        ### Sponsored ads

        ![Campaign entity relationships chart - Sponsored ads](/_images/campaign-management/entities-sponsored-ads.png)

    </div>
    <div>

        ### Amazon DSP

        ![Campaign entity relationships chart - ADSP](/_images/campaign-management/entities-adsp.png)

    </div>
</div>

_The general structure of campaigns for sponsored ads and Amazon DSP._

## Entity guides

The following documents contain information about available attributes by ad product for each type of entity.

| Entity | API Specification |
|-------|-------------------|
| [Campaign](guides/campaign-management/entities/campaign) | [Campaign API Specification](amazon-ads/1-0/apis#tag/Campaigns) |
| [Ad Group](guides/campaign-management/entities/ad-group) | [Ad Group API Specification](amazon-ads/1-0/apis#tag/AdGroups) |
| [Ad](guides/campaign-management/entities/ad) | [Ad API Specification](amazon-ads/1-0/apis#tag/Ads) |
| [Target](guides/campaign-management/entities/target) | [Target API Specification](amazon-ads/1-0/apis#tag/Targets) |
| [Ad Association](guides/campaign-management/entities/ad-association) | [Ad Association API Specification](amazon-ads/1-0/apis#tag/AdAssociations) |
