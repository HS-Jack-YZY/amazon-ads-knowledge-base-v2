---
title: The ad entity in the Amazon Ads API
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/ads
section: Common Models
---

# Ads

An ad is the smallest unit of an advertising campaign. An ad represents the creative and advertised products that a customer sees and interacts with.

>[NOTE]DSP ads are associated with ad groups via the [ad association entity](guides/campaign-management/entities/ad-association).

>[TIP:Creatives]Fields for ad creatives vary widely by ad product. See [Nested entities](#nested-entities) below for details of each creative type.

>View the [technical specification for the Ads resource](amazon-ads/1-0/apis#tag/Ads).

## Ad parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| activeCreative                                           	| □	|  	| □	|  	|
| adGroupId                                                	| ○	| ✓	| ✓	|  	|
| adId                                                     	| □	| □	| □	| □	|
| adProduct                                                	| ✓	| ✓	| ✓	| ✓	|
| adType                                                   	| ✓	| ✓	| ✓	| ✓	|
| campaignId                                               	| □	| □	| □	|  	|
| creationDateTime                                         	| □	| □	| □	| □	|
| creative                                                 	| ○	| ○	| ○	| ○	|
| [creative.audioCreative](#audioCreative)                 	| ◐	|  	|  	| ◐	|
| [creative.componentCreative](#componentCreative)         	| ◐	|  	| ◐	| ◐	|
| [creative.displayCreative](#displayCreative)             	| ◐	|  	|  	| ◐	|
| [creative.productCreative](#productCreative)             	| ◐	| ◐	|  	|  	|
| [creative.thirdPartyCreative](#thirdPartyCreative)       	| ◐	|  	|  	| ◐	|
| [creative.videoCreative](#videoCreative)                 	| ◐	|  	|  	| ◐	|
| lastUpdatedDateTime                                      	| □	| □	| □	| □	|
| marketplaceConfigurations                                	|  	|  	|  	|  	|
| marketplaceScope                                         	| ○	| □	| □	|  	|
| marketplaces                                             	| ✓	| □	| □	| ✓	|
| marketplaces.Marketplace[]                               	| ○	|  	|  	| ○	|
| name                                                     	| ○	|  	| ✓	| ✓	|
| state                                                    	| ✓	| ✓	| ✓	| ✓	|
| status                                                   	| □	| □	| □	|  	|
| tags                                                     	| ○	| ○	| ○	| ○	|
| tags.Tag[]                                               	| ○	| ○	| ○	| ○	|
| tags.Tag[]<br/>.key                                      	| ○	| ✓	| ✓	| ✓	|
| tags.Tag[]<br/>.value                                    	| ○	| ✓	| ✓	| ✓	|


## Nested entities

### AssetBasedCreativeSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| additionalHtml                                                                                        	| ○	|  	|  	| ○	|
| bodyText                                                                                              	| ○	|  	|  	| ○	|
| brand                                                                                                 	| ○	|  	|  	| ✓	|
| callToActions                                                                                         	| ○	|  	|  	| ✓	|
| callToActions.assetBasedCreativeCallToActionSettings                                                  	| ○	|  	|  	| ○	|
| callToActions.assetBasedCreativeCallToActionSettings<br/>.callToActionType                            	| ○	|  	|  	| ○	|
| callToActions.assetBasedCreativeCallToActionSettings<br/>.deepLinkingBehavior                         	| ○	|  	|  	| ○	|
| callToActions.assetBasedCreativeCallToActionSettings<br/>.url                                         	| ○	|  	|  	| ✓	|
| clickTrackingUrls                                                                                     	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]                                                               	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]<br/>.url                                                      	| ○	|  	|  	| ✓	|
| creativeSizes                                                                                         	| ○	|  	|  	| ○	|
| creativeSizes.Size[]                                                                                  	| ○	|  	|  	| ○	|
| creativeSizes.Size[]<br/>.height                                                                      	| ○	|  	|  	| ✓	|
| creativeSizes.Size[]<br/>.width                                                                       	| ○	|  	|  	| ✓	|
| customVideos                                                                                          	| ○	|  	|  	| ○	|
| customVideos.assetId                                                                                  	| ○	|  	|  	| ✓	|
| customVideos.assetVersion                                                                             	| ○	|  	|  	| ✓	|
| disclaimers                                                                                           	| ○	|  	|  	| ○	|
| headlines                                                                                             	| ○	|  	|  	| ○	|
| impressionTrackingUrls                                                                                	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]                                                          	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]<br/>.url                                                 	| ○	|  	|  	| ✓	|
| inventoryTypes                                                                                        	| ○	|  	|  	| ✓	|
| inventoryTypes.ComponentInventoryType[]                                                               	| ○	|  	|  	| ○	|
| language                                                                                              	| ○	|  	|  	| ✓	|
| logos                                                                                                 	| ○	|  	|  	| ○	|
| logos.Image[]                                                                                         	| ○	|  	|  	| ○	|
| logos.Image[]<br/>.assetId                                                                            	| ○	|  	|  	| ✓	|
| logos.Image[]<br/>.assetVersion                                                                       	| ○	|  	|  	| ✓	|
| logos.Image[]<br/>.formatProperties                                                                   	| ○	|  	|  	| ○	|
| optimizationGoalKpi                                                                                   	| ○	|  	|  	| ✓	|
| responsiveSizingBehavior                                                                              	| ○	|  	|  	| ✓	|
| squareImages                                                                                          	| ○	|  	|  	| ✓	|
| squareImages.Image[]                                                                                  	| ○	|  	|  	| ○	|
| squareImages.Image[]<br/>.assetId                                                                     	| ○	|  	|  	| ✓	|
| squareImages.Image[]<br/>.assetVersion                                                                	| ○	|  	|  	| ✓	|
| squareImages.Image[]<br/>.formatProperties                                                            	| ○	|  	|  	| ○	|
| tallImages                                                                                            	| ○	|  	|  	| ✓	|
| tallImages.Image[]                                                                                    	| ○	|  	|  	| ○	|
| tallImages.Image[]<br/>.assetId                                                                       	| ○	|  	|  	| ✓	|
| tallImages.Image[]<br/>.assetVersion                                                                  	| ○	|  	|  	| ✓	|
| tallImages.Image[]<br/>.formatProperties                                                              	| ○	|  	|  	| ○	|
| wideImages                                                                                            	| ○	|  	|  	| ✓	|
| wideImages.Image[]                                                                                    	| ○	|  	|  	| ○	|
| wideImages.Image[]<br/>.assetId                                                                       	| ○	|  	|  	| ✓	|
| wideImages.Image[]<br/>.assetVersion                                                                  	| ○	|  	|  	| ✓	|
| wideImages.Image[]<br/>.formatProperties                                                              	| ○	|  	|  	| ○	|


### AudioCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| standardAudioSettings                                                                           	| ○	|  	|  	| ○	|
| standardAudioSettings.audio                                                                     	| ○	|  	|  	| ✓	|
| standardAudioSettings.audio<br/>.assetId                                                        	| ○	|  	|  	| ✓	|
| standardAudioSettings.audio<br/>.assetVersion                                                   	| ○	|  	|  	| ✓	|
| standardAudioSettings.impressionTrackingUrls                                                    	| ○	|  	|  	| ○	|
| standardAudioSettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                         	| ○	|  	|  	| ○	|
| standardAudioSettings.language                                                                  	| ○	|  	|  	| ✓	|
| standardAudioSettings.products                                                                  	| ○	|  	|  	| ○	|
| standardAudioSettings.products<br/>.AdvertisedProducts[]                                        	| ○	|  	|  	| ○	|


### BrandStoreSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| additionalHtml                                                                                	| ○	|  	|  	| ○	|
| bodyText                                                                                      	| ○	|  	|  	| ○	|
| brand                                                                                         	| ○	|  	|  	| ✓	|
| callToActions                                                                                 	| ○	|  	|  	| ✓	|
| callToActions.brandStoreCallToActionSettings                                                  	| ○	|  	|  	| ○	|
| callToActions.brandStoreCallToActionSettings<br/>.callToActionType                            	| ○	|  	|  	| ○	|
| callToActions.brandStoreCallToActionSettings<br/>.deepLinkingBehavior                         	| ○	|  	|  	| ○	|
| callToActions.brandStoreCallToActionSettings<br/>.url                                         	| ○	|  	|  	| ✓	|
| clickTrackingUrls                                                                             	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]                                                       	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]<br/>.url                                              	| ○	|  	|  	| ✓	|
| creativeSizes                                                                                 	| ○	|  	|  	| ○	|
| creativeSizes.Size[]                                                                          	| ○	|  	|  	| ○	|
| creativeSizes.Size[]<br/>.height                                                              	| ○	|  	|  	| ✓	|
| creativeSizes.Size[]<br/>.width                                                               	| ○	|  	|  	| ✓	|
| disclaimers                                                                                   	| ○	|  	|  	| ○	|
| headlines                                                                                     	| ○	|  	|  	| ○	|
| impressionTrackingUrls                                                                        	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]                                                  	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]<br/>.url                                         	| ○	|  	|  	| ✓	|
| inventoryTypes                                                                                	| ○	|  	|  	| ✓	|
| inventoryTypes.ComponentInventoryType[]                                                       	| ○	|  	|  	| ○	|
| language                                                                                      	| ○	|  	|  	| ✓	|
| logos                                                                                         	| ○	|  	|  	| ○	|
| logos.assetId                                                                                 	| ○	|  	|  	| ✓	|
| logos.assetVersion                                                                            	| ○	|  	|  	| ✓	|
| logos.formatProperties                                                                        	| ○	|  	|  	| ○	|
| logos.formatProperties<br/>.FormatProperties[]                                                	| ○	|  	|  	| ○	|
| optimizationGoalKpi                                                                           	| ○	|  	|  	| ✓	|
| responsiveSizingBehavior                                                                      	| ○	|  	|  	| ✓	|
| squareImages                                                                                  	| ○	|  	|  	| ✓	|
| squareImages.Image[]                                                                          	| ○	|  	|  	| ○	|
| squareImages.Image[]<br/>.assetId                                                             	| ○	|  	|  	| ✓	|
| squareImages.Image[]<br/>.assetVersion                                                        	| ○	|  	|  	| ✓	|
| squareImages.Image[]<br/>.formatProperties                                                    	| ○	|  	|  	| ○	|
| tallImages                                                                                    	| ○	|  	|  	| ✓	|
| tallImages.Image[]                                                                            	| ○	|  	|  	| ○	|
| tallImages.Image[]<br/>.assetId                                                               	| ○	|  	|  	| ✓	|
| tallImages.Image[]<br/>.assetVersion                                                          	| ○	|  	|  	| ✓	|
| tallImages.Image[]<br/>.formatProperties                                                      	| ○	|  	|  	| ○	|
| wideImages                                                                                    	| ○	|  	|  	| ✓	|
| wideImages.Image[]                                                                            	| ○	|  	|  	| ○	|
| wideImages.Image[]<br/>.assetId                                                               	| ○	|  	|  	| ✓	|
| wideImages.Image[]<br/>.assetVersion                                                          	| ○	|  	|  	| ✓	|
| wideImages.Image[]<br/>.formatProperties                                                      	| ○	|  	|  	| ○	|


### ComponentCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| [assetBasedCreativeSettings](#assetBasedCreativeSettings)	| ◐	|  	|  	| ◐	|
| [automaticCollectionSettings](#automaticCollectionSettings)        	| ◐	|  	| ◐	|  	|
| [brandStoreSettings](#brandStoreSettings)                	| ◐	|  	|  	| ◐	|
| [dynamicCollectionSettings](#dynamicCollectionSettings)  	| ◐	|  	|  	|  	|
| [manualCollectionSettings](#manualCollectionSettings)    	| ◐	|  	| ◐	|  	|
| [productCollectionSettings](#productCollectionSettings)  	| ◐	|  	| ◐	|  	|
| [productVideoSettings](#productVideoSettings)            	| ◐	|  	| ◐	|  	|
| [responsiveEcommerceSettings](#responsiveEcommerceSettings)	| ◐	|  	|  	| ◐	|
| [storeSpotlightSettings](#storeSpotlightSettings)        	| ◐	|  	| ◐	|  	|


### DisplayCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| standardDisplaySettings                                                                                 	| ○	|  	|  	| ○	|
| standardDisplaySettings.adChoicesPosition                                                               	| ○	|  	|  	| ✓	|
| standardDisplaySettings.callToAction                                                                    	| ○	|  	|  	| ○	|
| standardDisplaySettings.callToAction<br/>.clickToAppDisplayCallToActionSettings                         	| ○	|  	|  	| ○	|
| standardDisplaySettings.callToAction<br/>.clickToUrlDisplayCallToActionSettings                         	| ○	|  	|  	| ○	|
| standardDisplaySettings.clickTrackingUrls                                                               	| ○	|  	|  	| ○	|
| standardDisplaySettings.clickTrackingUrls<br/>.CreativeTrackingUrl[]                                    	| ○	|  	|  	| ○	|
| standardDisplaySettings.creativeSizes                                                                   	| ○	|  	|  	| ✓	|
| standardDisplaySettings.creativeSizes<br/>.Size[]                                                       	| ○	|  	|  	| ✓	|
| standardDisplaySettings.customImages                                                                    	| ○	|  	|  	| ✓	|
| standardDisplaySettings.customImages<br/>.Image[]                                                       	| ○	|  	|  	| ✓	|
| standardDisplaySettings.impressionTrackingUrls                                                          	| ○	|  	|  	| ○	|
| standardDisplaySettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                               	| ○	|  	|  	| ○	|
| standardDisplaySettings.language                                                                        	| ○	|  	|  	| ✓	|


### DynamicCollectionSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| products                                                                         	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]                                                    	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.globalStoreSetting                            	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.marketplaceSettings                           	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.productId                                     	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.productIdType                                 	| ✓	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductId                             	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductIdType                         	| ○	|  	|  	|  	|


### AutomaticCollectionSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | -- | --- | -- | --- |
| sharedSettings                                                                   	| ○	|  	| ✓	|  	|
| sharedSettings.brand                                                             	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos                                                        	| ○	|  	| ○	|  	|
| sharedSettings.brandLogos<br/>.assetId                                           	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos<br/>.assetVersion                                      	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos<br/>.formatProperties                                  	| ○	|  	| ○	|  	|
| productExclusions                                                                	| ○	|  	| ○	|  	|
| productExclusions.AdvertisedProducts[]                                           	| ○	|  	| ○	|  	|
| productExclusions.AdvertisedProducts[]<br/>.productId                            	| ○	|  	| ✓	|  	|
| productExclusions.AdvertisedProducts[]<br/>.productIdType                        	| ○	|  	| ✓	|  	|


### ManualCollectionSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | -- | --- | - | --- |
| sharedSettings                                                                   	| ○	|  	| ✓	|  	|
| sharedSettings.brand                                                             	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos                                                        	| ○	|  	| ○	|  	|
| sharedSettings.brandLogos<br/>.assetId                                           	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos<br/>.assetVersion                                      	| ○	|  	| ✓	|  	|
| sharedSettings.brandLogos<br/>.formatProperties                                  	| ○	|  	| ○	|  	|
| productInclusions                                                                	| ○	|  	| ✓	|  	|
| productInclusions.AdvertisedProducts[]                                           	| ○	|  	| ✓	|  	|
| productInclusions.AdvertisedProducts[]<br/>.productId                            	| ○	|  	| ✓	|  	|
| productInclusions.AdvertisedProducts[]<br/>.productIdType                        	| ○	|  	| ✓	|  	|
| landingPage                                                                      	| ○	|  	| ✓	|  	|
| landingPage.landingPageType                                                      	| ○	|  	| ✓	|  	|
| landingPage.landingPageUrl                                                       	| ○	|  	| ○	|  	|


### ProductCollectionSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| brand                                                                                                     	| ○	|  	| ✓	|  	|
| brandLogos                                                                                                	| ○	|  	| ✓	|  	|
| brandLogos.Image[]                                                                                        	| ○	|  	| ○	|  	|
| brandLogos.Image[]<br/>.assetId                                                                           	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.assetVersion                                                                      	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.formatProperties                                                                  	| ○	|  	| ○	|  	|
| creativePropertiesToOptimize                                                                              	| ○	|  	| ○	|  	|
| creativePropertiesToOptimize.ProductCollectionCreativePropertiesToOptimize[]                              	| ○	|  	| ○	|  	|
| customImages                                                                                              	| ○	|  	| ✓	|  	|
| customImages.Image[]                                                                                      	| ○	|  	| ○	|  	|
| customImages.Image[]<br/>.assetId                                                                         	| ○	|  	| ✓	|  	|
| customImages.Image[]<br/>.assetVersion                                                                    	| ○	|  	| ✓	|  	|
| customImages.Image[]<br/>.formatProperties                                                                	| ○	|  	| ○	|  	|
| enableCreativeAutoTranslation                                                                             	| ○	|  	| ○	|  	|
| headlines                                                                                                 	| ○	|  	| ○	|  	|
| landingPage                                                                                               	| ○	|  	| ✓	|  	|
| landingPage.landingPageAsins                                                                              	| ○	|  	| ○	|  	|
| landingPage.landingPageAsins<br/>.asins                                                                   	| ○	|  	| ○	|  	|
| landingPage.landingPageType                                                                               	| ○	|  	| ✓	|  	|
| landingPage.landingPageUrl                                                                                	| ○	|  	| ○	|  	|
| moderationStatus                                                                                          	| ○	|  	| ○	|  	|
| moderationStatus.moderationStatus                                                                         	| ○	|  	| ✓	|  	|
| products                                                                                                  	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]                                                                             	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]<br/>.globalStoreSetting                                                     	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.marketplaceSettings                                                    	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.productId                                                              	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]<br/>.productIdType                                                          	| ✓	|  	| ✓	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductId                                                      	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductIdType                                                  	| ○	|  	|  	|  	|
| untranslatedHeadlines                                                                                     	| ○	|  	| ○	|  	|


### ProductCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| productCreativeSettings                                                                      	| ○	| ✓	|  	|  	|
| productCreativeSettings.advertisedProduct                                                    	| ○	| ✓	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.globalStoreSetting                            	| ○	| ✓	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.marketplaceSettings                           	| ○	|  	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.productId                                     	| ○	| ✓	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.productIdType                                 	| ✓	| ✓	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.resolvedProductId                             	| ○	| ○	|  	|  	|
| productCreativeSettings.advertisedProduct<br/>.resolvedProductIdType                         	| ○	| ○	|  	|  	|
| productCreativeSettings.headline                                                             	| ○	| ○	|  	|  	|


### ProductVideoSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| brand                                                                            	| ○	|  	| ○	|  	|
| brandLogos                                                                       	| ○	|  	| ○	|  	|
| brandLogos.Image[]                                                               	| ○	|  	| ○	|  	|
| brandLogos.Image[]<br/>.assetId                                                  	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.assetVersion                                             	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.formatProperties                                         	| ○	|  	| ○	|  	|
| enableCreativeAutoTranslation                                                    	| ○	|  	| ○	|  	|
| headlines                                                                        	| ○	|  	| ○	|  	|
| landingPage                                                                      	| ○	|  	| ○	|  	|
| landingPage.landingPageType                                                      	| ○	|  	| ✓	|  	|
| landingPage.landingPageUrl                                                       	| ○	|  	| ○	|  	|
| moderationStatus                                                                 	| ○	|  	| ○	|  	|
| moderationStatus.moderationStatus                                                	| ○	|  	| ✓	|  	|
| products                                                                         	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]                                                    	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]<br/>.globalStoreSetting                            	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.marketplaceSettings                           	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.productId                                     	| ○	|  	| ○	|  	|
| products.AdvertisedProducts[]<br/>.productIdType                                 	| ✓	|  	| ✓	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductId                             	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductIdType                         	| ○	|  	|  	|  	|
| untranslatedHeadlines                                                            	| ○	|  	| ○	|  	|
| untranslatedVideos                                                               	| ○	|  	| ✓	|  	|
| untranslatedVideos.Video[]                                                       	| ○	|  	| ○	|  	|
| untranslatedVideos.Video[]<br/>.assetId                                          	| ○	|  	| ✓	|  	|
| untranslatedVideos.Video[]<br/>.assetVersion                                     	| ○	|  	| ✓	|  	|
| videos                                                                           	| ○	|  	| ✓	|  	|
| videos.Video[]                                                                   	| ○	|  	| ○	|  	|
| videos.Video[]<br/>.assetId                                                      	| ○	|  	| ✓	|  	|
| videos.Video[]<br/>.assetVersion                                                 	| ○	|  	| ✓	|  	|


### ResponsiveEcommerceSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| clickTrackingUrls                                                                                           	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]                                                                     	| ○	|  	|  	| ○	|
| clickTrackingUrls.CreativeTrackingUrl[]<br/>.url                                                            	| ○	|  	|  	| ✓	|
| creativePropertiesToOptimize                                                                                	| ○	|  	|  	| ○	|
| creativePropertiesToOptimize.ResponsiveEcommerceCreativePropertiesToOptimize[]                              	| ○	|  	|  	| ○	|
| creativeSizes                                                                                               	| ○	|  	|  	| ○	|
| creativeSizes.Size[]                                                                                        	| ○	|  	|  	| ○	|
| creativeSizes.Size[]<br/>.height                                                                            	| ○	|  	|  	| ✓	|
| creativeSizes.Size[]<br/>.width                                                                             	| ○	|  	|  	| ✓	|
| disclaimers                                                                                                 	| ○	|  	|  	| ○	|
| headlines                                                                                                   	| ○	|  	|  	| ○	|
| images                                                                                                      	| ○	|  	|  	| ○	|
| images.Image[]                                                                                              	| ○	|  	|  	| ○	|
| images.Image[]<br/>.assetId                                                                                 	| ○	|  	|  	| ✓	|
| images.Image[]<br/>.assetVersion                                                                            	| ○	|  	|  	| ✓	|
| images.Image[]<br/>.formatProperties                                                                        	| ○	|  	|  	| ○	|
| impressionTrackingUrls                                                                                      	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]                                                                	| ○	|  	|  	| ○	|
| impressionTrackingUrls.CreativeTrackingUrl[]<br/>.url                                                       	| ○	|  	|  	| ✓	|
| inventoryTypes                                                                                              	| ○	|  	|  	| ✓	|
| inventoryTypes.ComponentInventoryType[]                                                                     	| ○	|  	|  	| ○	|
| language                                                                                                    	| ○	|  	|  	| ✓	|
| logos                                                                                                       	| ○	|  	|  	| ○	|
| logos.assetId                                                                                               	| ○	|  	|  	| ✓	|
| logos.assetVersion                                                                                          	| ○	|  	|  	| ✓	|
| logos.formatProperties                                                                                      	| ○	|  	|  	| ○	|
| logos.formatProperties<br/>.FormatProperties[]                                                              	| ○	|  	|  	| ○	|
| optimizationGoalKpi                                                                                         	| ○	|  	|  	| ✓	|
| products                                                                                                    	| ○	|  	|  	| ✓	|
| products.AdvertisedProducts[]                                                                               	| ○	|  	|  	| ○	|
| products.AdvertisedProducts[]<br/>.globalStoreSetting                                                       	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.marketplaceSettings                                                      	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.productId                                                                	| ○	|  	|  	| ✓	|
| products.AdvertisedProducts[]<br/>.productIdType                                                            	| ✓	|  	|  	| ✓	|
| products.AdvertisedProducts[]<br/>.resolvedProductId                                                        	| ○	|  	|  	|  	|
| products.AdvertisedProducts[]<br/>.resolvedProductIdType                                                    	| ○	|  	|  	|  	|
| recAdVariations                                                                                             	| ○	|  	|  	| ○	|
| recAdVariations.ResponsiveEcommerceAdVariations[]                                                           	| ○	|  	|  	| ○	|
| responsiveSizingBehavior                                                                                    	| ○	|  	|  	| ✓	|
| supportedThirdPartySellers                                                                                  	| ○	|  	|  	| ✓	|


### StoreSpotlightSettings

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| brand                                                                                                  	| ○	|  	| ✓	|  	|
| brandLogos                                                                                             	| ○	|  	| ✓	|  	|
| brandLogos.Image[]                                                                                     	| ○	|  	| ○	|  	|
| brandLogos.Image[]<br/>.assetId                                                                        	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.assetVersion                                                                   	| ○	|  	| ✓	|  	|
| brandLogos.Image[]<br/>.formatProperties                                                               	| ○	|  	| ○	|  	|
| cards                                                                                                  	| ○	|  	| ✓	|  	|
| cards.CardCreativeElement[]                                                                            	| ○	|  	| ○	|  	|
| cards.CardCreativeElement[]<br/>.headline                                                              	| ○	|  	| ✓	|  	|
| cards.CardCreativeElement[]<br/>.landingPage                                                           	| ○	|  	| ○	|  	|
| cards.CardCreativeElement[]<br/>.products                                                              	| ○	|  	| ○	|  	|
| creativePropertiesToOptimize                                                                           	| ○	|  	| ○	|  	|
| creativePropertiesToOptimize.StoreSpotlightCreativePropertiesToOptimize[]                              	| ○	|  	| ○	|  	|
| enableCreativeAutoTranslation                                                                          	| ○	|  	| ○	|  	|
| headlines                                                                                              	| ○	|  	| ○	|  	|
| landingPage                                                                                            	| ○	|  	| ✓	|  	|
| landingPage.landingPageType                                                                            	| ○	|  	| ✓	|  	|
| landingPage.landingPageUrl                                                                             	| ○	|  	| ✓	|  	|
| moderationStatus                                                                                       	| ○	|  	| ○	|  	|
| moderationStatus.moderationStatus                                                                      	| ○	|  	| ✓	|  	|
| untranslatedHeadlines                                                                                  	| ○	|  	| ○	|  	|


### ThirdPartyCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| thirdPartyDisplaySettings                                                                           	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.adChoicesPosition                                                         	| ○	|  	|  	| ✓	|
| thirdPartyDisplaySettings.additionalHtml                                                            	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.clickTrackingUrls                                                         	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.clickTrackingUrls<br/>.CreativeTrackingUrl[]                              	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.creativeSizes                                                             	| ○	|  	|  	| ✓	|
| thirdPartyDisplaySettings.creativeSizes<br/>.Size[]                                                 	| ○	|  	|  	| ✓	|
| thirdPartyDisplaySettings.impressionTrackingUrls                                                    	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                         	| ○	|  	|  	| ○	|
| thirdPartyDisplaySettings.language                                                                  	| ○	|  	|  	| ✓	|
| thirdPartyDisplaySettings.thirdPartyTagHostingSource                                                	| ○	|  	|  	| ✓	|
| thirdPartyVideoSettings                                                                             	| ○	|  	|  	| ○	|
| thirdPartyVideoSettings.impressionTrackingUrls                                                      	| ○	|  	|  	| ○	|
| thirdPartyVideoSettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                           	| ○	|  	|  	| ○	|
| thirdPartyVideoSettings.language                                                                    	| ○	|  	|  	| ✓	|
| thirdPartyVideoSettings.vastUrl                                                                     	| ○	|  	|  	| ✓	|


### VideoCreative

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Sponsored Products |Sponsored Brands |Amazon DSP |
| --- | --- | --- | --- | --- |
| onlineVideoSettings                                                                           	| ○	|  	|  	| ○	|
| onlineVideoSettings.callToActions                                                             	| ○	|  	|  	| ○	|
| onlineVideoSettings.callToActions<br/>.VideoCallToAction[]                                    	| ○	|  	|  	| ○	|
| onlineVideoSettings.clickTrackingUrls                                                         	| ○	|  	|  	| ○	|
| onlineVideoSettings.clickTrackingUrls<br/>.CreativeTrackingUrl[]                              	| ○	|  	|  	| ○	|
| onlineVideoSettings.impressionTrackingUrls                                                    	| ○	|  	|  	| ○	|
| onlineVideoSettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                         	| ○	|  	|  	| ○	|
| onlineVideoSettings.language                                                                  	| ○	|  	|  	| ✓	|
| onlineVideoSettings.products                                                                  	| ○	|  	|  	| ○	|
| onlineVideoSettings.products<br/>.globalStoreSetting                                          	| ○	|  	|  	|  	|
| onlineVideoSettings.products<br/>.marketplaceSettings                                         	| ○	|  	|  	|  	|
| onlineVideoSettings.products<br/>.productId                                                   	| ○	|  	|  	| ✓	|
| onlineVideoSettings.products<br/>.productIdType                                               	| ✓	|  	|  	| ✓	|
| onlineVideoSettings.products<br/>.resolvedProductId                                           	| ○	|  	|  	|  	|
| onlineVideoSettings.products<br/>.resolvedProductIdType                                       	| ○	|  	|  	|  	|
| onlineVideoSettings.videos                                                                    	| ○	|  	|  	| ✓	|
| onlineVideoSettings.videos<br/>.assetId                                                       	| ○	|  	|  	| ✓	|
| onlineVideoSettings.videos<br/>.assetVersion                                                  	| ○	|  	|  	| ✓	|
| streamingTvSettings                                                                           	| ○	|  	|  	| ○	|
| streamingTvSettings.callToActions                                                             	| ○	|  	|  	| ○	|
| streamingTvSettings.callToActions<br/>.VideoCallToAction[]                                    	| ○	|  	|  	| ○	|
| streamingTvSettings.impressionTrackingUrls                                                    	| ○	|  	|  	| ○	|
| streamingTvSettings.impressionTrackingUrls<br/>.CreativeTrackingUrl[]                         	| ○	|  	|  	| ○	|
| streamingTvSettings.language                                                                  	| ○	|  	|  	| ✓	|
| streamingTvSettings.products                                                                  	| ○	|  	|  	| ○	|
| streamingTvSettings.products<br/>.AdvertisedProducts[]                                        	| ○	|  	|  	| ○	|
| streamingTvSettings.videos                                                                    	| ○	|  	|  	| ✓	|
| streamingTvSettings.videos<br/>.assetId                                                       	| ○	|  	|  	| ✓	|
| streamingTvSettings.videos<br/>.assetVersion                                                  	| ○	|  	|  	| ✓	|
