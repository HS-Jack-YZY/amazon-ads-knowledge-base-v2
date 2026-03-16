# Campaign Management Entities Overview

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/overview

Campaign management in the Amazon Ads API covers five entity types shared across ad products (SP, SB, SD, DSP):

| Entity | Description | API Spec |
|--------|-------------|----------|
| [Campaign](campaign-mgmt-entities-campaign.md) | Groups ads with common objectives, budgets, and optimization | [Campaigns API](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Campaigns) |
| [Ad Group](campaign-mgmt-entities-ad-group.md) | Groups ads with common targeting, strategy, and creatives | [AdGroups API](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/AdGroups) |
| [Ad](campaign-mgmt-entities-ad.md) | The creative and products a customer sees | [Ads API](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Ads) |
| [Target](campaign-mgmt-entities-target.md) | Controls when ads appear and bid amounts | [Targets API](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Targets) |
| [Ad Association](campaign-mgmt-entities-ad-association.md) | Links ads to ad groups (DSP only) | [AdAssociations API](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/AdAssociations) |

## Hierarchy

**Sponsored Ads**: Campaign → Ad Group → (Ads + Targets)

**Amazon DSP**: Campaign → Ad Group → (Targets + Ad Associations → Ads)

Product-specific attributes are maintained through an `adProduct` identifier within the common model.
