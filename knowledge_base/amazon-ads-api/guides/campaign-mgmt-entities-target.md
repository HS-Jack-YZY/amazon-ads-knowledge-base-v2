# The Target Entity

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/target

Targets allow advertisers to influence when ads will or will not appear, as well as specify how much to bid for an ad when conditions are met.

> [Technical specification for the Targets resource](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Targets)

## Target parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| adGroupId | ○ | ○ | ✓ | ✓ |
| adProduct | ✓ | ✓ | ✓ | ✓ |
| bid | ○ | ○ | ○ | |
| bid.bid | ○ | ○ | ✓ | |
| bid.currencyCode | □ | □ | □ | |
| campaignId | ○ | ○ | ○ | |
| creationDateTime | □ | □ | □ | □ |
| lastUpdatedDateTime | □ | □ | □ | □ |
| marketplaceScope | ○ | □ | □ | |
| negative | ✓ | ✓ | ✓ | ✓ |
| state | ✓ | ✓ | ✓ | ✓ |
| status | □ | □ | □ | □ |
| tags | ○ | ○ | | |
| targetDetails | ○ | ○ | ○ | ○ |
| targetId | □ | □ | □ | □ |
| targetLevel | □ | □ | □ | □ |
| targetType | ✓ | ✓ | ✓ | ✓ |

## Target Types (targetDetails)

### Sponsored Ads Target Types

| Target Type | SP | SB | Description |
|-------------|----|----|-------------|
| keywordTarget | ◐ | ◐ | Match keyword + matchType (BROAD/PHRASE/EXACT) |
| productTarget | ◐ | ◐ | Match specific ASINs |
| productCategoryTarget | ◐ | ◐ | Match product categories with refinements |
| themeTarget | ◐ | ◐ | Theme-related keyword targeting |

### DSP Target Types

| Target Type | Description |
|-------------|-------------|
| audienceTarget | Amazon audience segments |
| deviceTarget | Device type, OS, orientation, mobile environment |
| locationTarget | Geographic location |
| dayPartTarget | Day of week + time of day |
| domainTarget | Domain name, domain list, or domain file |
| inventorySourceTarget | Inventory source |
| contentCategoryTarget | Content category |
| contentGenreTarget | Content genre |
| contentRatingTarget | Content rating (DSP or Twitch) |
| contentInstreamPositionTarget | In-stream ad position |
| contentOutstreamPositionTarget | Out-stream ad position |
| nativeContentPositionTarget | Native content position |
| foldPositionTarget | Above/below fold |
| adPlayerSizeTarget | Ad player size |
| adInitiationTarget | Video initiation type |
| videoAdFormatTarget | Video ad format |
| videoContentDurationTarget | Video content duration |
| appTarget | App targeting by app ID |
| thirdPartyTarget | 3P verification (DoubleVerify, IAS, Pixalate, NewsGuard) |

## Key Nested Entity Details

### KeywordTarget

| Field | SP | SB | DSP |
|-------|----|----|-----|
| keyword | ✓ | ✓ | ✓ |
| matchType | ✓ | ✓ | ✓ |
| nativeLanguageKeyword | ○ | ○ | |
| nativeLanguageLocale | ○ | ○ | |

### ProductTarget

| Field | SP | SB | DSP |
|-------|----|----|-----|
| matchType | ✓ | ✓ | ✓ |
| product.productId | ✓ | ○ | |
| productIdType | ✓ | ✓ | ✓ |

### ProductCategoryTarget

| Field | SP | SB |
|-------|----|----|
| productCategoryRefinement.productCategoryId | ○ | ○ |
| productCategoryRefinement.productBrandId | ○ | ○ |
| productCategoryRefinement.productAgeRangeId | ○ | |
| productCategoryRefinement.productPriceGreaterThan | ○ | ○ |
| productCategoryRefinement.productPriceLessThan | ○ | ○ |
| productCategoryRefinement.productRatingGreaterThan | ○ | ○ |
| productCategoryRefinement.productRatingLessThan | ○ | ○ |
| productCategoryRefinement.productPrimeShippingEligible | ○ | |
