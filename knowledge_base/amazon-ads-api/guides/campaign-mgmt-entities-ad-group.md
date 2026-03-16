# The AdGroup Entity

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/ad-group

Ad groups are used to group ads that have common targeting, strategy, and creatives.

> [Technical specification for the AdGroups resource](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/AdGroups)

## AdGroup parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| adGroupId | □ | □ | □ | □ |
| adProduct | ✓ | ✓ | ✓ | ✓ |
| advertisedProductCategoryIds | ○ | | | ○ |
| [bid](#bid) | ◐ | ✓◐ | | ✓◐ |
| [budgets](#budgets) | ◐ | | | ◐ |
| campaignId | ✓ | ✓ | ✓ | ✓ |
| creationDateTime | □ | □ | □ | □ |
| creativeRotationType | ○ | | | ✓ |
| endDateTime | ○ | | | ✓ |
| [fees](#fees) | ◐ | | | ◐ |
| [frequencies](#frequencies) | ◐ | | | ◐ |
| inventoryType | ○ | | | ✓ |
| lastUpdatedDateTime | □ | □ | □ | □ |
| marketplaceScope | ○ | □ | □ | |
| marketplaces | ○ | □ | □ | |
| name | ✓ | ✓ | ✓ | ✓ |
| [optimization](#optimization) | ◐ | | | ✓◐ |
| pacing | ○ | | | ✓ |
| pacing.deliveryProfile | ○ | | | ✓ |
| purchaseOrderNumber | ○ | | | ○ |
| startDateTime | ○ | | | ✓ |
| state | ✓ | ✓ | ✓ | ✓ |
| status | □ | □ | □ | □ |
| tags | ○ | ○ | ○ | ○ |
| [targetingSettings](#targetingsettings) | ◐ | | | ✓◐ |

## Nested entities

### Bid

| Field | Common | SP | DSP |
|-------|--------|----|----|
| baseBid | ○ | | ✓ |
| currencyCode | □ | □ | □ |
| defaultBid | ○ | ✓ | |
| marketplaceSettings | ○ | | |
| maxAverageBid | ○ | | ○ |

### Budgets (DSP only)

| Field | DSP |
|-------|-----|
| Budget[].budgetType | ✓ |
| Budget[].budgetValue | ✓ |
| Budget[].budgetValue.monetaryBudgetValue | ✓ |
| Budget[].recurrenceTimePeriod | ✓ |

### Fees (DSP only)

| Field | DSP |
|-------|-----|
| Fee[].addToBudgetSpentAmount | ✓ |
| Fee[].feeType | ✓ |
| Fee[].feeValue | ✓ |
| Fee[].thirdPartyProvider | ✓ |

### Frequencies (DSP only)

| Field | DSP |
|-------|-----|
| Frequency[].eventMaxCount | ✓ |
| Frequency[].frequencyTargetingSetting | ✓ |
| Frequency[].timeCount | ✓ |
| Frequency[].timeUnit | ✓ |

### Optimization (DSP only)

| Field | DSP |
|-------|-----|
| bidStrategy | ✓ |
| budgetSettings.budgetAllocation | ○ |
| budgetSettings.dailyMinSpendValue | ○ |

### TargetingSettings (DSP only)

| Field | DSP |
|-------|-----|
| amazonViewability | ✓ |
| amazonViewability.includeUnmeasurableImpressions | ✓ |
| amazonViewability.viewabilityTier | ✓ |
| automatedTargetingTactic | □ |
| defaultAudienceTargetingMatchType | ○ |
| enableLanguageTargeting | ○ |
| siteLanguage | □ |
| tacticsConvertersExclusionType | ○ |
| targetedPGDealId | ○ |
| timeZoneType | ✓ |
| userLocationSignal | ✓ |
| videoCompletionTier | ○ |
