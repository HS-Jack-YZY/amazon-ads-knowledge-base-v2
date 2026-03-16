# The Ad Entity

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/ad

An ad is the smallest unit of an advertising campaign. It represents the creative and advertised products that a customer sees and interacts with.

> **Note:** DSP ads are associated with ad groups via the [ad association entity](campaign-mgmt-entities-ad-association.md).

> [Technical specification for the Ads resource](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Ads)

## Ad parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| activeCreative | □ | | □ | |
| adGroupId | ○ | ✓ | ✓ | |
| adId | □ | □ | □ | □ |
| adProduct | ✓ | ✓ | ✓ | ✓ |
| adType | ✓ | ✓ | ✓ | ✓ |
| campaignId | □ | □ | □ | |
| creationDateTime | □ | □ | □ | □ |
| creative | ○ | ○ | ○ | ○ |
| creative.audioCreative | ◐ | | | ◐ |
| creative.componentCreative | ◐ | | ◐ | ◐ |
| creative.displayCreative | ◐ | | | ◐ |
| creative.productCreative | ◐ | ◐ | | |
| creative.thirdPartyCreative | ◐ | | | ◐ |
| creative.videoCreative | ◐ | | | ◐ |
| lastUpdatedDateTime | □ | □ | □ | □ |
| marketplaceScope | ○ | □ | □ | |
| marketplaces | ✓ | □ | □ | ✓ |
| name | ○ | | ✓ | ✓ |
| state | ✓ | ✓ | ✓ | ✓ |
| status | □ | □ | □ | |
| tags | ○ | ○ | ○ | ○ |

## Creative Types

### ProductCreative (SP)

| Field | SP |
|-------|-----|
| productCreativeSettings | ✓ |
| productCreativeSettings.advertisedProduct | ✓ |
| productCreativeSettings.advertisedProduct.productId | ✓ |
| productCreativeSettings.advertisedProduct.productIdType | ✓ |
| productCreativeSettings.headline | ○ |

### ComponentCreative (SB + DSP)

Wraps multiple sub-creative types:

| Sub-Creative | SB | DSP |
|-------------|----|----|
| automaticCollectionSettings | ◐ | |
| manualCollectionSettings | ◐ | |
| productCollectionSettings | ◐ | |
| productVideoSettings | ◐ | |
| storeSpotlightSettings | ◐ | |
| assetBasedCreativeSettings | | ◐ |
| brandStoreSettings | | ◐ |
| responsiveEcommerceSettings | | ◐ |

### DisplayCreative (DSP only)

Standard display ad with images, click/impression tracking URLs, ad choices position, and creative sizes.

### VideoCreative (DSP only)

Two sub-types:
- **onlineVideoSettings** — for web video with call-to-actions, products, and tracking
- **streamingTvSettings** — for STV with products, videos, and tracking

### AudioCreative (DSP only)

Standard audio ad with audio asset, products, and tracking URLs.

### ThirdPartyCreative (DSP only)

- **thirdPartyDisplaySettings** — tag-hosted display creative
- **thirdPartyVideoSettings** — VAST URL-based video creative
