---
title: The ad association entity in the Amazon Ads API
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/ad-associations
section: Common Models
---

# Ad associations

Ad associations apply to Amazon DSP ad groups only and correspond to [ad creative associations](guides/dsp/creative-associations) in earlier versions of the campaign managment API.

>View the [technical specification for the AdAssociations resource](amazon-ads/1-0/apis#tag/AdAssociations).

## Ad association parameters by ad product

**Key:** ✓ required | ○ optional | □ read-only | ◐ nested object

| Field | Common model |Amazon DSP |
| --- | --- | --- |
| adAssociationId                              	| □	| □	|
| adGroupId                                    	| ✓	| ✓	|
| adId                                         	| ✓	| ✓	|
| endDateTime                                  	| ○	| ○	|
| startDateTime                                	| ○	| ○	|
| state                                        	| ✓	| ✓	|
| weight                                       	| ○	| ○	|
