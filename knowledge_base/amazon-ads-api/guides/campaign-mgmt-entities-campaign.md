# The Campaign Entity

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/campaign

Campaigns group ads that share common objectives and optimization strategies. Campaigns may also have budgets, fees and frequency caps settings that are defaults to all ad groups, targets, and ads that are associated with the campaign.

> [Technical specification for the Campaigns resource](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/Campaigns)

## Campaign parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| adProduct | ✓ | ✓ | ✓ | ✓ |
| autoCreationSettings | ○ | ✓ | ○ | |
| autoCreationSettings.autoCreateTargets | ○ | ✓ | ○ | |
| brandId | ○ | | ○ | |
| [budgets](#budgets) | ◐ | ✓◐ | ✓◐ | ◐ |
| campaignId | □ | □ | □ | □ |
| costType | ○ | | ✓ | |
| countries | ○ | ○ | ○ | ○ |
| creationDateTime | □ | □ | □ | □ |
| endDateTime | ○ | ○ | ○ | □ |
| [fees](#fees) | ◐ | | | ◐ |
| [flights](#flights) | ◐ | | | ✓◐ |
| [frequencies](#frequencies) | ◐ | | | ◐ |
| isMultiAdGroupsEnabled | □ | | □ | |
| lastUpdatedDateTime | □ | □ | □ | □ |
| marketplaceScope | ○ | ✓ | ✓ | |
| marketplaces | ○ | ○ | ○ | ○ |
| name | ✓ | ✓ | ✓ | ✓ |
| optimizations | ○ | ○ | ○ | ✓ |
| [optimizations.bidSettings](#bidsettings) | ◐ | ◐ | ◐ | ✓◐ |
| [optimizations.budgetSettings](#budgetsettings) | ◐ | ◐ | | ◐ |
| [optimizations.goalSettings](#goalsettings) | ◐ | | ◐ | ◐ |
| [optimizations.primaryInventoryTypes](#primaryinventorytypes) | ◐ | | | ◐ |
| portfolioId | ○ | ○ | ○ | |
| productCategoryId | ○ | | | |
| purchaseOrderNumber | ○ | | | ○ |
| salesChannel | ○ | | ○ | |
| siteRestrictions | ○ | ○ | | |
| skanAppId | ○ | | | ○ |
| startDateTime | ○ | ✓ | ✓ | □ |
| state | ✓ | ✓ | ✓ | ✓ |
| status | □ | □ | □ | □ |
| tags | ○ | ○ | ○ | ○ |
| targetsAmazonDeal | □ | | | □ |

## Nested entities

### BidSettings

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| bidAdjustments | ○ | ○ | ○ | |
| bidAdjustments.audienceBidAdjustments | ○ | ○ | ○ | |
| bidAdjustments.placementBidAdjustments | ○ | ○ | ○ | |
| bidAdjustments.shopperSegmentBidAdjustments | ○ | | ○ | |
| bidStrategy | ○ | ○ | ○ | ✓ |

### BudgetSettings

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| budgetAllocation | ○ | | | ○ |
| flightBudgetRolloverStrategy | ○ | | | ○ |
| offAmazonBudgetControlStrategy | ○ | ○ | | |

### Budgets

| Field | Common | SP | SB | DSP |
|-------|--------|----|----|-----|
| Budget[].budgetType | ○ | ✓ | ✓ | ✓ |
| Budget[].budgetValue | ○ | ✓ | ✓ | ✓ |
| Budget[].budgetValue.monetaryBudgetValue | ○ | ✓ | ✓ | ✓ |
| Budget[].recurrenceTimePeriod | ○ | ✓ | ✓ | ✓ |

### Fees (DSP only)

| Field | Common | DSP |
|-------|--------|-----|
| CampaignFee[].feeType | ○ | ✓ |
| CampaignFee[].feeValue | ○ | ✓ |
| CampaignFee[].feeValueType | ○ | ✓ |

### Flights (DSP only)

| Field | Common | DSP |
|-------|--------|-----|
| CampaignFlight[].budget.budgetType | ○ | ✓ |
| CampaignFlight[].budget.budgetValue | ○ | ✓ |
| CampaignFlight[].endDateTime | ○ | ✓ |
| CampaignFlight[].flightId | ○ | ○ |
| CampaignFlight[].startDateTime | ○ | ✓ |

### Frequencies (DSP only)

| Field | Common | DSP |
|-------|--------|-----|
| Frequency[].eventMaxCount | ○ | ✓ |
| Frequency[].frequencyTargetingSetting | ○ | ✓ |
| Frequency[].timeCount | ○ | ✓ |
| Frequency[].timeUnit | ○ | ✓ |

### GoalSettings

| Field | Common | SB | DSP |
|-------|--------|----|----|
| currencyCode | □ | | □ |
| goal | ○ | □ | □ |
| kpi | ○ | ✓ | ✓ |
| kpiValue | ○ | | ○ |

### PrimaryInventoryTypes (DSP only)

| Field | Common | DSP |
|-------|--------|-----|
| PrimaryInventoryType[] | ○ | ○ |
