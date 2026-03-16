---
title: The ad group entity in the Amazon Ads API
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/ad-groups
section: Common Models
---

# Ad groups

Ad groups are used to group ads that have common targeting, strategy, and creatives.

>View the [technical specification for the AdGroups resource](amazon-ads/1-0/apis#tag/AdGroups).

## Ad group parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| adGroupId                                                 	| □	| □	| □	| □	|
| adProduct                                                 	| ✓	| ✓	| ✓	| ✓	|
| advertisedProductCategoryIds                              	| ○	|  	|  	| ○	|
| [bid](#bid)                                               	| ◐	| ✓◐	|  	| ✓◐	|
| [budgets](#budgets)                                       	| ◐	|  	|  	| ◐	|
| campaignId                                                	| ✓	| ✓	| ✓	| ✓	|
| creationDateTime                                          	| □	| □	| □	| □	|
| creativeRotationType                                      	| ○	|  	|  	| ✓	|
| endDateTime                                               	| ○	|  	|  	| ✓	|
| [fees](#fees)                                             	| ◐	|  	|  	| ◐	|
| [frequencies](#frequencies)                               	| ◐	|  	|  	| ◐	|
| inventoryType                                             	| ○	|  	|  	| ✓	|
| lastUpdatedDateTime                                       	| □	| □	| □	| □	|
| marketplaceConfigurations                                 	|  	|  	|  	|  	|
| marketplaceScope                                          	| ○	| □	| □	|  	|
| marketplaces                                              	| ○	| □	| □	|  	|
| marketplaces.Marketplace[]                                	| ○	|  	|  	|  	|
| name                                                      	| ✓	| ✓	| ✓	| ✓	|
| [optimization](#optimization)                             	| ◐	|  	|  	| ✓◐	|
| pacing                                                    	| ○	|  	|  	| ✓	|
| pacing.deliveryProfile                                    	| ○	|  	|  	| ✓	|
| purchaseOrderNumber                                       	| ○	|  	|  	| ○	|
| startDateTime                                             	| ○	|  	|  	| ✓	|
| state                                                     	| ✓	| ✓	| ✓	| ✓	|
| status                                                    	| □	| □	| □	| □	|
| tags                                                      	| ○	| ○	| ○	| ○	|
| tags.Tag[]                                                	| ○	| ○	| ○	| ○	|
| tags.Tag[]<br/>.key                                       	| ○	| ✓	| ✓	| ✓	|
| tags.Tag[]<br/>.value                                     	| ○	| ✓	| ✓	| ✓	|
| [targetingSettings](#targetingSettings)                   	| ◐	|  	|  	| ✓◐	|


## Nested entities

### Bid

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| baseBid                                                                                      	| ○	|  	|  	| ✓	|
| currencyCode                                                                                 	| □	| □	|  	| □	|
| defaultBid                                                                                   	| ○	| ✓	|  	|  	|
| marketplaceSettings                                                                          	| ○	|  	|  	|  	|
| marketplaceSettings.AdGroupBidMarketplaceSetting[]                                           	| ○	|  	|  	|  	|
| marketplaceSettings.AdGroupBidMarketplaceSetting[]<br/>.currencyCode                         	| ○	|  	|  	|  	|
| marketplaceSettings.AdGroupBidMarketplaceSetting[]<br/>.defaultBid                           	| ○	|  	|  	|  	|
| marketplaceSettings.AdGroupBidMarketplaceSetting[]<br/>.marketplace                          	| ○	|  	|  	|  	|
| maxAverageBid                                                                                	| ○	|  	|  	| ○	|


### Budgets

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| Budget[]                                                              	| ○	|  	|  	| ○	|
| Budget[].budgetType                                                   	| ○	|  	|  	| ✓	|
| Budget[].budgetValue                                                  	| ○	|  	|  	| ✓	|
| Budget[].budgetValue<br/>.monetaryBudgetValue                         	| ○	|  	|  	| ✓	|
| Budget[].recurrenceTimePeriod                                         	| ○	|  	|  	| ✓	|


### Fees

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| Fee[]                                                     	| ○	|  	|  	| ○	|
| Fee[].addToBudgetSpentAmount                              	| ○	|  	|  	| ✓	|
| Fee[].feeType                                             	| ○	|  	|  	| ✓	|
| Fee[].feeValue                                            	| ○	|  	|  	| ✓	|
| Fee[].thirdPartyProvider                                  	| ○	|  	|  	| ✓	|


### Frequencies

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| Frequency[]                                                        	| ○	|  	|  	| ○	|
| Frequency[].eventMaxCount                                          	| ○	|  	|  	| ✓	|
| Frequency[].frequencyTargetingSetting                              	| ○	|  	|  	| ✓	|
| Frequency[].timeCount                                              	| ○	|  	|  	| ✓	|
| Frequency[].timeUnit                                               	| ○	|  	|  	| ✓	|


### Optimization

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| bidStrategy                                                    	| ○	|  	|  	| ✓	|
| budgetSettings                                                 	| ○	|  	|  	| ○	|
| budgetSettings.budgetAllocation                                	| ○	|  	|  	| ○	|
| budgetSettings.dailyMinSpendValue                              	| ○	|  	|  	| ○	|


### TargetingSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| amazonViewability                                                             	| ○	|  	|  	| ✓	|
| amazonViewability.includeUnmeasurableImpressions                              	| ○	|  	|  	| ✓	|
| amazonViewability.viewabilityTier                                             	| ○	|  	|  	| ✓	|
| automatedTargetingTactic                                                      	| □	|  	|  	| □	|
| defaultAudienceTargetingMatchType                                             	| ○	|  	|  	| ○	|
| enableLanguageTargeting                                                       	| ○	|  	|  	| ○	|
| siteLanguage                                                                  	| □	|  	|  	| □	|
| tacticsConvertersExclusionType                                                	| ○	|  	|  	| ○	|
| targetedPGDealId                                                              	| ○	|  	|  	| ○	|
| timeZoneType                                                                  	| ○	|  	|  	| ✓	|
| userLocationSignal                                                            	| ○	|  	|  	| ✓	|
| videoCompletionTier                                                           	| ○	|  	|  	| ○	|
