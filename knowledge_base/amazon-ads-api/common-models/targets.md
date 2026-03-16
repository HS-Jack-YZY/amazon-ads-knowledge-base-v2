---
title: The target entity in the Amazon Ads API
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/targets
section: Common Models
---

# Targets

Targets allow advertisers to influence when ads will or will not appear, as well as specify how much to bid for an ad when these conditions are met.

>[TOPIC:Target types and targetDetails]The `targetDetails` object must include one of the supported target types, based on the appropriate key for that type. Each target type is broken out in the charts below; for detailed information on each type, see [Nested entities](#nested-entities).

>[NOTE]Campaign-level targeting is supported only for a subset of sponsored ads targeting types. For more information on sponsored ads support by targeting type, see the [model guide for targets](reference/common-models/targets).

>View the [technical specification for the Targets resource](amazon-ads/1-0/apis#tag/Targets).

## Target parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| adGroupId                                                                          	| ○	| ○	| ✓	| ✓	|
| adProduct                                                                          	| ✓	| ✓	| ✓	| ✓	|
| bid                                                                                	| ○	| ○	| ○	|  	|
| bid.bid                                                                            	| ○	| ○	| ✓	|  	|
| bid.currencyCode                                                                   	| □	| □	| □	|  	|
| bid.marketplaceSettings                                                            	| ○	|  	|  	|  	|
| bid.marketplaceSettings<br/>.TargetBidMarketplaceSetting[]                         	| ○	|  	|  	|  	|
| campaignId                                                                         	| ○	| ○	| ○	|  	|
| creationDateTime                                                                   	| □	| □	| □	| □	|
| lastUpdatedDateTime                                                                	| □	| □	| □	| □	|
| marketplaceConfigurations                                                          	|  	|  	|  	|  	|
| marketplaceScope                                                                   	| ○	| □	| □	|  	|
| marketplaces                                                                       	| ○	| □	| □	|  	|
| marketplaces.Marketplace[]                                                         	| ○	|  	|  	|  	|
| negative                                                                           	| ✓	| ✓	| ✓	| ✓	|
| state                                                                              	| ✓	| ✓	| ✓	| ✓	|
| status                                                                             	| □	| □	| □	| □	|
| tags                                                                               	| ○	| ○	|  	|  	|
| tags.Tag[]                                                                         	| ○	| ○	|  	|  	|
| tags.Tag[]<br/>.key                                                                	| ○	| ✓	|  	|  	|
| tags.Tag[]<br/>.value                                                              	| ○	| ✓	|  	|  	|
| targetDetails                                                                      	| ○	| ○	| ○	| ○	|
| [targetDetails.adInitiationTarget](#adInitiationTarget)                            	| ◐	|  	|  	| ◐	|
| [targetDetails.adPlayerSizeTarget](#adPlayerSizeTarget)                            	| ◐	|  	|  	| ◐	|
| [targetDetails.appTarget](#appTarget)                                              	| ◐	|  	|  	| ◐	|
| [targetDetails.audienceTarget](#audienceTarget)                                    	| ◐	|  	|  	| ◐	|
| [targetDetails.contentCategoryTarget](#contentCategoryTarget)                      	| ◐	|  	|  	| ◐	|
| [targetDetails.contentGenreTarget](#contentGenreTarget)                            	| ◐	|  	|  	| ◐	|
| [targetDetails.contentInstreamPositionTarget](#contentInstreamPositionTarget)      	| ◐	|  	|  	| ◐	|
| [targetDetails.contentOutstreamPositionTarget](#contentOutstreamPositionTarget)    	| ◐	|  	|  	| ◐	|
| [targetDetails.contentRatingTarget](#contentRatingTarget)                          	| ◐	|  	|  	| ◐	|
| [targetDetails.dayPartTarget](#dayPartTarget)                                      	| ◐	|  	|  	| ◐	|
| [targetDetails.deviceTarget](#deviceTarget)                                        	| ◐	|  	|  	| ◐	|
| [targetDetails.domainTarget](#domainTarget)                                        	| ◐	|  	|  	| ◐	|
| [targetDetails.foldPositionTarget](#foldPositionTarget)                            	| ◐	|  	|  	| ◐	|
| [targetDetails.inventorySourceTarget](#inventorySourceTarget)                      	| ◐	|  	|  	| ◐	|
| [targetDetails.keywordTarget](#keywordTarget)                                      	| ◐	| ◐	| ◐	| ◐	|
| [targetDetails.locationTarget](#locationTarget)                                    	| ◐	|  	|  	| ◐	|
| [targetDetails.nativeContentPositionTarget](#nativeContentPositionTarget)          	| ◐	|  	|  	| ◐	|
| [targetDetails.productCategoryTarget](#productCategoryTarget)                      	| ◐	| ◐	| ◐	| ◐	|
| [targetDetails.productTarget](#productTarget)                                      	| ◐	| ◐	| ◐	| ◐	|
| [targetDetails.themeTarget](#themeTarget)                                          	| ◐	| ◐	| ◐	| ◐	|
| [targetDetails.thirdPartyTarget](#thirdPartyTarget)                                	| ◐	|  	|  	| ◐	|
| [targetDetails.videoAdFormatTarget](#videoAdFormatTarget)                          	| ◐	|  	|  	| ◐	|
| [targetDetails.videoContentDurationTarget](#videoContentDurationTarget)            	| ◐	|  	|  	| ◐	|
| targetId                                                                           	| □	| □	| □	| □	|
| targetLevel                                                                        	| □	| □	| □	| □	|
| targetType                                                                         	| ✓	| ✓	| ✓	| ✓	|


## Nested entities

### AdInitiationTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| videoInitiationType                              	| ○	|  	|  	| ✓	|


### AdPlayerSizeTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| adPlayerSize                              	| ○	|  	|  	| ✓	|


### AppTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| appId                                	| ○	|  	|  	| ✓	|
| appType                              	| ○	|  	|  	| ✓	|


### AudienceTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| acrossGroupOperator                                                                    	| ○	|  	|  	| ○	|
| audienceId                                                                             	| ○	|  	|  	| ✓	|
| audienceId.defaultValue                                                                	| ○	|  	|  	| ○	|
| audienceId.marketplaceSettings                                                         	| ○	|  	|  	|  	|
| audienceId.marketplaceSettings<br/>.StringMarketplaceSetting[]                         	| ○	|  	|  	|  	|
| groupId                                                                                	| ○	|  	|  	| ○	|
| inGroupOperator                                                                        	| ○	|  	|  	| ○	|


### ContentCategoryTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| contentCategoryId                              	| ○	|  	|  	| ✓	|


### ContentGenreTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| contentGenre                              	| ○	|  	|  	| ✓	|


### ContentInstreamPositionTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| instreamPosition                              	| ○	|  	|  	| ✓	|


### ContentOutstreamPositionTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| outstreamPosition                              	| ○	|  	|  	| ✓	|


### ContentRatingTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| contentRatingType                                                                             	| ○	|  	|  	| ✓	|
| contentRatingTypeDetails                                                                      	| ○	|  	|  	| ✓	|
| contentRatingTypeDetails.dspContentRating                                                     	| ○	|  	|  	| ○	|
| contentRatingTypeDetails.dspContentRating<br/>.dspContentRating                               	| ○	|  	|  	| ✓	|
| contentRatingTypeDetails.twitchContentRating                                                  	| ○	|  	|  	| ○	|
| contentRatingTypeDetails.twitchContentRating<br/>.twitchContentRating                         	| ○	|  	|  	| ✓	|


### DayPartTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| dayOfWeek                                        	| ○	|  	|  	| ✓	|
| timeOfDay                                        	| ○	|  	|  	| ✓	|
| timeOfDay.endTime                                	| ○	|  	|  	| ✓	|
| timeOfDay.startTime                              	| ○	|  	|  	| ✓	|


### DeviceTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| deviceOrientation                              	| ○	|  	|  	| ○	|
| deviceType                                     	| ○	|  	|  	| ✓	|
| mobileDevice                                   	| ○	|  	|  	| ○	|
| mobileEnvironment                              	| ○	|  	|  	| ○	|
| mobileOs                                       	| ○	|  	|  	| ○	|


### DomainTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| domainTargetDetails                                                                         	| ○	|  	|  	| ✓	|
| domainTargetDetails.advertiserDomainList                                                    	| ○	|  	|  	| ○	|
| domainTargetDetails.advertiserDomainList<br/>.inheritFromAdvertiser                         	| ○	|  	|  	| ✓	|
| domainTargetDetails.domainFileTarget                                                        	| ○	|  	|  	| ○	|
| domainTargetDetails.domainFileTarget<br/>.domainFileId                                      	| ○	|  	|  	| ○	|
| domainTargetDetails.domainFileTarget<br/>.domainFileKey                                     	| ○	|  	|  	| ✓	|
| domainTargetDetails.domainFileTarget<br/>.domainFileName                                    	| ○	|  	|  	| ✓	|
| domainTargetDetails.domainFileTarget<br/>.domainFileUrl                                     	| ○	|  	|  	| ○	|
| domainTargetDetails.domainListTarget                                                        	| ○	|  	|  	| ○	|
| domainTargetDetails.domainListTarget<br/>.domainListId                                      	| ○	|  	|  	| ✓	|
| domainTargetDetails.domainNameTarget                                                        	| ○	|  	|  	| ○	|
| domainTargetDetails.domainNameTarget<br/>.domainName                                        	| ○	|  	|  	| ✓	|
| domainTargetType                                                                            	| ○	|  	|  	| ✓	|


### FoldPositionTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| foldPosition                              	| ○	|  	|  	| ✓	|


### InventorySourceTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| inventorySourceId                                                                             	| ○	|  	|  	| ✓	|
| inventorySourceId.defaultValue                                                                	| ○	|  	|  	| ○	|
| inventorySourceId.marketplaceSettings                                                         	| ○	|  	|  	|  	|
| inventorySourceId.marketplaceSettings<br/>.StringMarketplaceSetting[]                         	| ○	|  	|  	|  	|
| inventorySourceType                                                                           	| ○	|  	|  	| ✓	|


### KeywordTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| keyword                                            	| ✓	| ✓	| ✓	| ✓	|
| matchType                                          	| ✓	| ✓	| ✓	| ✓	|
| nativeLanguageKeyword                              	| ○	| ○	| ○	|  	|
| nativeLanguageLocale                               	| ○	| ○	| ○	|  	|


### LocationTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| locationId                              	| ○	|  	|  	| ✓	|


### NativeContentPositionTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| nativePosition                              	| ○	|  	|  	| ✓	|


### ProductCategoryTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| productCategoryRefinement                                                                                                	| ✓	| ✓	| ✓	| ✓	|
| productCategoryRefinement.marketplaceSettings                                                                            	| ○	|  	|  	|  	|
| productCategoryRefinement.marketplaceSettings<br/>.ProductCategoryRefinementMarketplaceSetting[]                         	| ○	|  	|  	|  	|
| productCategoryRefinement.productCategoryRefinement                                                                      	| ○	| ✓	| ○	| ○	|
| productCategoryRefinement.productCategoryRefinement<br/>.productAgeRangeId                                               	| ○	| ○	|  	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productAgeRangeIdResolved                                       	| ○	| ○	|  	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productBrandId                                                  	| ○	| ○	| ○	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productBrandIdResolved                                          	| ○	| ○	|  	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productCategoryId                                               	| ○	| ○	| ○	| ○	|
| productCategoryRefinement.productCategoryRefinement<br/>.productCategoryIdResolved                                       	| ○	| ○	|  	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productPriceGreaterThan                                         	| ○	| ○	| ○	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productPriceLessThan                                            	| ○	| ○	| ○	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productPrimeShippingEligible                                    	| ○	| ○	|  	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productRatingGreaterThan                                        	| ○	| ○	| ○	|  	|
| productCategoryRefinement.productCategoryRefinement<br/>.productRatingLessThan                                           	| ○	| ○	| ○	|  	|
| productGenreRefinement                                                                                                   	| ○	| ○	|  	|  	|
| productGenreRefinement.productGenreId                                                                                    	| ○	| ✓	|  	|  	|
| productGenreRefinement.productGenreIdResolved                                                                            	| ○	| ○	|  	|  	|


### ProductTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| matchType                                                                            	| ✓	| ✓	| ✓	| ✓	|
| product                                                                              	| ✓	| ✓	| ✓	| ✓	|
| product.marketplaceSettings                                                          	| ○	|  	|  	|  	|
| product.marketplaceSettings<br/>.ProductMarketplaceSetting[]                         	| ○	|  	|  	|  	|
| product.productId                                                                    	| ○	| ✓	| ○	|  	|
| productIdType                                                                        	| ✓	| ✓	| ✓	| ✓	|


### ThemeTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| matchType                              	| ✓	| ✓	| ✓	| ✓	|


### ThirdPartyTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| thirdPartyTargetDetails                                                                                                     	| ○	|  	|  	| ✓	|
| thirdPartyTargetDetails.doubleVerifyAuthenticAttention                                                                      	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyAuthenticAttention<br/>.universalAttention                                              	| ○	|  	|  	| ✓	|
| thirdPartyTargetDetails.doubleVerifyAuthenticBrandSafety                                                                    	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyAuthenticBrandSafety<br/>.doubleVerifySegmentId                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety                                                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.appAgeRating                                                           	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.appStarRating                                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.contentCategories                                                      	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.contentCategoriesWithRisk                                              	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.excludeAppsWithInsufficientRating                                      	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyBrandSafety<br/>.unknownContent                                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyCustomContextualSegmentId                                                               	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyCustomContextualSegmentId<br/>.doubleVerifySegmentId                                    	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyFraudInvalidTraffic                                                                     	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyFraudInvalidTraffic<br/>.blockAppAndSites                                               	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyFraudInvalidTraffic<br/>.excludeAppsAndSites                                            	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyFraudInvalidTraffic<br/>.excludeImpressions                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyStandardDisplayBrandSafety                                                              	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyStandardDisplayBrandSafety<br/>.contentCategories                                       	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyStandardDisplayBrandSafety<br/>.contentCategoriesWithRisk                               	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyStandardDisplayBrandSafety<br/>.unknownContent                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyViewability                                                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyViewability<br/>.averageCompletionAndFullyViewableRateTargeting                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyViewability<br/>.brandExposureViewabilityTargeting                                      	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyViewability<br/>.includeUnmeasurableImpressions                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.doubleVerifyViewability<br/>.mrcViewabilityTargeting                                                	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety                                                                        	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.excludeContent                                                    	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyAdult                                               	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyAlcohol                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyGambling                                            	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyHateSpeech                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyIllegalDownloads                                    	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyIllegalDrugs                                        	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyOffensiveLanguage                                   	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceBrandSafety<br/>.iasBrandSafetyViolence                                            	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceContextualAvoidance                                                                	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceContextualAvoidance<br/>.avoidanceSegments                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceContextualTargeting                                                                	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceContextualTargeting<br/>.topicalSegments                                           	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceContextualTargeting<br/>.verticalSegments                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceFraudInvalidTraffic                                                                	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceFraudInvalidTraffic<br/>.targetSetting                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceQualitySync                                                                        	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceQualitySync<br/>.segmentId                                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceViewability                                                                        	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.integralAdScienceViewability<br/>.standard                                                          	| ○	|  	|  	| ✓	|
| thirdPartyTargetDetails.integralAdScienceViewability<br/>.viewabilityTargeting                                              	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.newsGuardBrandGuardMisinformationSafety                                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.newsGuardBrandGuardMisinformationSafety<br/>.avoidanceList                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.newsGuardBrandGuardTrustedNewsTargeting                                                             	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.newsGuardBrandGuardTrustedNewsTargeting<br/>.targetingList                                          	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.pixalateFraudInvalidTraffic                                                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.pixalateFraudInvalidTraffic<br/>.excludeAppsAndDomains                                              	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.pixalateFraudInvalidTraffic<br/>.excludeIpAddressAndUserAgents                                      	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.pixalateFraudInvalidTraffic<br/>.excludeOttAndMobileDevices                                         	| ○	|  	|  	| ○	|
| thirdPartyTargetDetails.pixalateFraudInvalidTraffic<br/>.excludeRemovedAppsFromAppStores                                    	| ○	|  	|  	| ○	|
| thirdPartyTargetType                                                                                                        	| ○	|  	|  	| ✓	|


### VideoAdFormatTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| videoAdFormat                              	| ○	|  	|  	| ✓	|


### VideoContentDurationTarget

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| duration                              	| ○	|  	|  	| ✓	|
