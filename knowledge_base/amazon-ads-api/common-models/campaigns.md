---
title: The campaign entity in the Amazon Ads API
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/campaigns
section: Common Models
---

# Campaigns

Campaigns group ads that share common objectives and optimization strategies. Campaigns may also have budgets, fees and frequency caps settings that are defaults to all ad groups, targets, and ads that are associated with the campaign.

>View the [technical specification for the Campaigns resource](amazon-ads/1-0/apis#tag/Campaigns).

## Campaign parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| adProduct                                                           	| ✓	| ✓	| ✓	| ✓	|
| autoCreationSettings                                                	| ○	| ✓	| ○	|  	|
| autoCreationSettings.autoCreateTargets                              	| ○	| ✓	| ○	|  	|
| brandId                                                             	| ○	|  	| ○	|  	|
| [budgets](#budgets)                                                 	| ◐	| ✓◐	| ✓◐	| ◐	|
| campaignId                                                          	| □	| □	| □	| □	|
| costType                                                            	| ○	|  	| ✓	|  	|
| countries                                                           	| ○	| ○	| ○	| ○	|
| countries.CountryCode[]                                             	| ○	| ○	| ○	| ○	|
| creationDateTime                                                    	| □	| □	| □	| □	|
| endDateTime                                                         	| ○	| ○	| ○	| □	|
| [fees](#fees)                                                       	| ◐	|  	|  	| ◐	|
| [flights](#flights)                                                 	| ◐	|  	|  	| ✓◐	|
| [frequencies](#frequencies)                                         	| ◐	|  	|  	| ◐	|
| isMultiAdGroupsEnabled                                              	| □	|  	| □	|  	|
| lastUpdatedDateTime                                                 	| □	| □	| □	| □	|
| marketplaceConfigurations                                           	|  	|  	|  	|  	|
| marketplaceScope                                                    	| ○	| ✓	| ✓	|  	|
| marketplaces                                                        	| ○	| ○	| ○	| ○	|
| marketplaces.Marketplace[]                                          	| ○	| ○	| ○	| ○	|
| name                                                                	| ✓	| ✓	| ✓	| ✓	|
| optimizations                                                       	| ○	| ○	| ○	| ✓	|
| [optimizations.bidSettings](#bidSettings)                           	| ◐	| ◐	| ◐	| ✓◐	|
| [optimizations.budgetSettings](#budgetSettings)                     	| ◐	| ◐	|  	| ◐	|
| [optimizations.goalSettings](#goalSettings)                         	| ◐	|  	| ◐	| ◐	|
| [optimizations.primaryInventoryTypes](#primaryInventoryTypes)       	| ◐	|  	|  	| ◐	|
| portfolioId                                                         	| ○	| ○	| ○	|  	|
| productCategoryId                                                   	| ○	|  	|  	|  	|
| purchaseOrderNumber                                                 	| ○	|  	|  	| ○	|
| salesChannel                                                        	| ○	|  	| ○	|  	|
| siteRestrictions                                                    	| ○	| ○	|  	|  	|
| siteRestrictions.SiteRestriction[]                                  	| ○	| ○	|  	|  	|
| skanAppId                                                           	| ○	|  	|  	| ○	|
| startDateTime                                                       	| ○	| ✓	| ✓	| □	|
| state                                                               	| ✓	| ✓	| ✓	| ✓	|
| status                                                              	| □	| □	| □	| □	|
| tags                                                                	| ○	| ○	| ○	| ○	|
| tags.Tag[]                                                          	| ○	| ○	| ○	| ○	|
| tags.Tag[]<br/>.key                                                 	| ○	| ✓	| ✓	| ✓	|
| tags.Tag[]<br/>.value                                               	| ○	| ✓	| ✓	| ✓	|
| targetsAmazonDeal                                                   	| □	|  	|  	| □	|


## Nested entities

### BidSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| bidAdjustments                                                                                         	| ○	| ○	| ○	|  	|
| bidAdjustments.audienceBidAdjustments                                                                  	| ○	| ○	| ○	|  	|
| bidAdjustments.audienceBidAdjustments<br/>.AudienceBidAdjustment[]                                     	| ○	| ○	| ○	|  	|
| bidAdjustments.placementBidAdjustments                                                                 	| ○	| ○	| ○	|  	|
| bidAdjustments.placementBidAdjustments<br/>.PlacementBidAdjustment[]                                   	| ○	| ○	| ○	|  	|
| bidAdjustments.shopperSegmentBidAdjustments                                                            	| ○	|  	| ○	|  	|
| bidAdjustments.shopperSegmentBidAdjustments<br/>.ShopperSegmentBidAdjustment[]                         	| ○	|  	| ○	|  	|
| bidStrategy                                                                                            	| ○	| ○	| ○	| ✓	|


### BudgetSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| budgetAllocation                                            	| ○	|  	|  	| ○	|
| flightBudgetRolloverStrategy                                	| ○	|  	|  	| ○	|
| offAmazonBudgetControlStrategy                              	| ○	| ○	|  	|  	|


### Budgets

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| Budget[]                                                              	| ○	| ○	| ○	| ○	|
| Budget[].budgetType                                                   	| ○	| ✓	| ✓	| ✓	|
| Budget[].budgetValue                                                  	| ○	| ✓	| ✓	| ✓	|
| Budget[].budgetValue<br/>.monetaryBudgetValue                         	| ○	| ✓	| ✓	| ✓	|
| Budget[].recurrenceTimePeriod                                         	| ○	| ✓	| ✓	| ✓	|


### Fees

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| CampaignFee[]                                           	| ○	|  	|  	| ○	|
| CampaignFee[].feeType                                   	| ○	|  	|  	| ✓	|
| CampaignFee[].feeValue                                  	| ○	|  	|  	| ✓	|
| CampaignFee[].feeValueType                              	| ○	|  	|  	| ✓	|


### Flights

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| CampaignFlight[]                                                 	| ○	|  	|  	| ○	|
| CampaignFlight[].budget                                          	| ○	|  	|  	| ✓	|
| CampaignFlight[].budget<br/>.budgetType                          	| ○	|  	|  	| ✓	|
| CampaignFlight[].budget<br/>.budgetValue                         	| ○	|  	|  	| ✓	|
| CampaignFlight[].endDateTime                                     	| ○	|  	|  	| ✓	|
| CampaignFlight[].flightId                                        	| ○	|  	|  	| ○	|
| CampaignFlight[].startDateTime                                   	| ○	|  	|  	| ✓	|


### Frequencies

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| Frequency[]                                                        	| ○	|  	|  	| ○	|
| Frequency[].eventMaxCount                                          	| ○	|  	|  	| ✓	|
| Frequency[].frequencyTargetingSetting                              	| ○	|  	|  	| ✓	|
| Frequency[].timeCount                                              	| ○	|  	|  	| ✓	|
| Frequency[].timeUnit                                               	| ○	|  	|  	| ✓	|


### GoalSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| currencyCode                              	| □	|  	|  	| □	|
| goal                                      	| ○	|  	| □	| □	|
| kpi                                       	| ○	|  	| ✓	| ✓	|
| kpiValue                                  	| ○	|  	|  	| ○	|


### PrimaryInventoryTypes

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| PrimaryInventoryType[]                              	| ○	|  	|  	| ○	|
