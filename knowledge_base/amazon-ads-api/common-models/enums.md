---
title: Amazon Ads API common enums
source: https://advertising.amazon.com/API/docs/en-us/reference/common-models/enums
section: Common Models
---

# Enums

This document contains the enums referenced by [common models](reference/common-models/overview). When enums values in the common models differ from those used in campaign management APIs, the values table contains extra columns to show equivalencies.

### adProduct

**Description**:  An ad product is a top-level offering from Amazon Ads, with a given feature set, business rules, and consistent logic.

| Values |
|-----|
| SPONSORED\_PRODUCTS |
| SPONSORED\_BRANDS |
| SPONSORED\_DISPLAY |

**Referenced by**: [Campaigns](reference/common-models/campaigns), [ad groups](reference/common-models/ad-groups)

### adType

**Description**: The type or format of an ad.

| Values|
|-----|
| PRODUCT_AD |
| IMAGE |
| VIDEO |
| PRODUCT\_COLLECTION |
| STORE\_SPOTLIGHT |

**Referenced by**: [Ad](reference/common-models/ads)

### audienceSegmentType

**Description**: Specifies types of audience segment.

| Values              |
|---------------------|
| SPONSORED\_ADS\_AMC |
| BEHAVIOR\_DYNAMIC    |

**Referenced by**: [Campaigns](reference/common-models/campaigns)


### bidStrategy

**Description**: The auto bidding strategy applied to to the campaign.

|Values	|Sponsored Products (dynamicBidding)	|Sponsored Brands (bidOptimizationStrategy)	|
|---	|---	|---	|
|SALES\_DOWN\_ONLY	|LEGACY\_FOR\_SALES	|none	|
|SALES	|AUTO\_FOR\_SALES	|MAXIMIZE\_IMMEDIATE\_SALES	|
|NEW\_TO\_BRAND	|none	|MAXIMIZE\_NEW\_TO\_BRAND\_CUSTOMERS	|
|RULE\_BASED	|RULE\_BASED	|*none* if a bidRule is present	|
|none / null	|MANUAL	| 	|

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### budgetType

**Description**: The type of budget associated with the campaign.

| Values |
|-----|
| MONETARY |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### costType

**Description**: The way the campaign is charged.

| Values |
|-----|
| CPC |
| VCPM |

### currencyCode

**Description**: An [ISO 4217](https://en.wikipedia.org/wiki/ISO\_4217) standard currency code for all currency-related attributes.

|Values	|
|-----|
|AED	|
|AUD	|
|BRL	|
|CAD	|
|CHF	|
|CNY	|
|DKK	|
|EUR	|
|GBP	|
|INR	|
|JPY	|
|MXN	|
|NOK	|
|SAR	|
|SEK	|
|SGD	|
|TRY	|
|USD	|
|BHD	|
|CNH	|
|CZK	|
|HKD	|
|HUF	|
|ILS	|
|JOD	|
|KWD	|
|PLN	|
|QAR	|
|RON	|
|THB	|
|ZAR	|
|ARS	|
|BGN	|
|BOB	|
|CLP	|
|COP	|
|CRC	|
|DOP	|
|DZD	|
|EGP	|
|GTQ	|
|HNL	|
|HRK	|
|IDR	|
|JMD	|
|KRW	|
|MAD	|
|MYR	|
|NGN	|
|NZD	|
|PAB	|
|PEN	|
|PHP	|
|PKR	|
|PYG	|
|RSD	|
|RUB	|
|TND	|
|TWD	|
|UAH	|
|UYU	|
|VND	|

**Referenced by**: [Campaigns](reference/common-models/campaigns), [ad groups](reference/common-models/ad-groups)

### deliveryReasons

**Description**: This is a list of reasons that explains the delivery status of the entity. It explains why the entity is delivering or not delivering. This is not defined by the user and is read only.

|Values	|Sponsored Products	|Sponsored Brands	|Sponsored Display	|
|-----|------|-------|--------|
|CAMPAIGN\_PAUSED	|CAMPAIGN\_PAUSED	|CAMPAIGN\_PAUSED	|CAMPAIGN\_PAUSED	|
|CAMPAIGN\_ARCHIVED	|CAMPAIGN\_ARCHIVED	|CAMPAIGN\_ARCHIVED	|CAMPAIGN\_ARCHIVED	|
|CAMPAIGN\_PENDING\_START\_DATE	|PENDING\_START\_DATE	|PENDING\_START\_DATE	|PENDING\_START\_DATE	|
|CAMPAIGN\_END\_DATE\_REACHED	|ENDED	|ENDED	|ENDED	|
|CAMPAIGN\_REJECTED	|REJECTED	|REJECTED	| 	|
|CAMPAIGN\_PENDING\_REVIEW	|PENDING\_REVIEW	|PENDING\_REVIEW	| 	|
|CAMPAIGN\_INCOMPLETE	|CAMPAIGN\_INCOMPLETE	|CAMPAIGN\_INCOMPLETE	| 	|
|CAMPAIGN\_OUT\_OF\_BUDGET	|CAMPAIGN\_OUT\_OF\_BUDGET	|CAMPAIGN\_OUT\_OF\_BUDGET	|CAMPAIGN\_OUT\_OF\_BUDGET	|
|PORTFOLIO\_OUT\_OF\_BUDGET	|PORTFOLIO\_OUT\_OF\_BUDGET	| 	| 	|
|PORTFOLIO\_END\_DATE\_REACHED	|PORTFOLIO\_ENDED	|PORTFOLIO\_ENDED	| 	|
|PORTFOLIO\_ARCHIVED	|PORTFOLIO\_ARCHIVED	|PORTFOLIO\_ARCHIVED	| 	|
|PORTFOLIO\_PAUSED	|PORTFOLIO\_PAUSED	|PORTFOLIO\_PAUSED	| 	|
|PORTFOLIO\_PENDING\_START\_DATE	|PORTFOLIO\_PENDING\_START\_DATE	|PORTFOLIO\_PENDING\_START\_DATE	| 	|
|ADVERTISER\_POLICING\_SUSPENDED	|ADVERTISER\_POLICING\_SUSPENDED	|ADVERTISER\_POLICING\_SUSPENDED	| 	|
|ADVERTISER\_POLICING\_PENDING\_REVIEW	|ADVERTISER\_POLICING\_PENDING\_REVIEW	|ADVERTISER\_POLICING\_PENDING\_REVIEW	| 	|
|ADVERTISER\_ARCHIVED	|ADVERTISER\_ARCHIVED	|ADVERTISER\_ARCHIVED	| 	|
|ADVERTISER\_OUT\_OF\_BUDGET	|ADVERTISER\_OUT\_OF\_BUDGET AND ACCOUNT\_OUT\_OF\_BUDGET	|ADVERTISER\_ACCOUNT\_OUT\_OF\_BUDGET	|ACCOUNT\_OUT\_OF\_BUDGET	|
|ADVERTISER\_PAUSED	|ADVERTISER\_PAUSED	|ADVERTISER\_PAUSED	|ADVERTISER\_PAUSED	|
|ADVERTISER\_PAYMENT\_FAILURE	|ADVERTISER\_PAYMENT\_FAILURE	|ADVERTISER\_PAYMENT\_FAILURE	|ADVERTISER\_PAYMENT\_FAILURE	|
|ADVERTISER\_OUT\_OF\_PREPAY\_BALANCE	| 	|ADVERTISER\_OUT\_OF\_PREPAY\_BALANCE	| 	|
|ADVERTISER\_INELIGIBLE	| 	|INELIGIBLE	| 	|
|ADVERTISER\_OUT\_OF\_PREPAY\_BALANCE	| 	|ADVERTISER\_OUT\_OF\_PREPAY\_BALANCE	| 	|
|AD\_GROUP\_PAUSED	|AD\_GROUP\_PAUSED	|AD\_GROUP\_PAUSED	|AD\_GROUP\_PAUSED	|
|AD\_GROUP\_ARCHIVED	|AD\_GROUP\_ARCHIVED	|AD\_GROUP\_ARCHIVED	|AD\_GROUP\_ARCHIVED	|
|AD\_GROUP\_INCOMPLETE	|AD\_GROUP\_INCOMPLETE	|AD\_GROUP\_INCOMPLETE	|AD\_GROUP\_INCOMPLETE	|
|AD\_GROUP\_POLICING\_PENDING\_REVIEW	|AD\_GROUP\_POLICING\_PENDING\_REVIEW	|AD\_GROUP\_POLICING\_PENDING\_REVIEW	| 	|
|AD\_GROUP\_LOW\_BID	|AD\_GROUP\_LOW\_BID	|AD\_GROUP\_LOW\_BID	|AD\_GROUP\_LOW\_BID	|
|AD\_GROUP\_PENDING\_REVIEW	|PENDING\_REVIEW	| 	| 	|
|AD\_GROUP\_REJECTED	|REJECTED	| 	| 	|
|TARGET\_POLICING\_SUSPENDED	|TARGETING\_CLAUSE\_POLICING\_SUSPENDED	| 	| 	|
|TARGET\_PAUSED	|TARGETING\_CLAUSE\_PAUSED	| 	|TARGET\_STATUS\_PAUSED	|
|TARGET\_ARCHIVED	|TARGETING\_CLAUSE\_ARCHIVED	| 	|TARGET\_STATUS\_ARCHIVED	|
|TARGET\_BLOCKED	|TARGETING\_CLAUSE\_BLOCKED	| 	| 	|
|AD\_PAUSED	|AD\_PAUSED	|AD\_PAUSED	|AD\_STATUS\_PAUSED	|
|AD\_ARCHIVED	|AD\_ARCHIVED	|AD\_ARCHIVED	|AD\_STATUS\_ARCHIVED	|
|AD\_POLICING\_PENDING\_REVIEW	|AD\_POLICING\_PENDING\_REVIEW	|AD\_POLICING\_PENDING\_REVIEW	| 	|
|AD\_POLICING\_SUSPENDED	|AD\_POLICING\_SUSPENDED	|AD\_POLICING\_SUSPENDED	| 	|
|AD\_CREATION\_FAILED	|AD\_CREATION\_OFFLINE\_FAILED or AD\_CREATION\_FAILED	| 	| 	|
|AD\_CREATION\_IN\_PROGRESS	|AD\_CREATION\_OFFLINE\_PENDING or AD\_CREATION\_OFFLINE\_IN\_PROGRESS	| 	| 	|
|LANDING\_PAGE\_NOT\_AVAILABLE	|LANDING\_PAGE\_NOT\_AVAILABLE or AD\_LANDING\_PAGE\_NOT\_AVAILABLE	| 	| 	|
|NOT\_BUYABLE	|NOT\_BUYABLE or AD\_NOT\_BUYABLE	| 	|NOT\_BUYABLE	|
|NOT\_IN\_BUYBOX	|NOT\_IN\_BUYBOX or AD\_NOT\_IN\_BUYBOX	| 	|NOT\_IN\_BUYBOX	|
|NOT\_IN\_POLICY	| 	| 	|NOT\_IN\_POLICY	|
|OUT\_OF\_STOCK	|OUT\_OF\_STOCK or AD\_OUT\_OF\_STOCK	| 	|OUT\_OF\_STOCK	|
|AD\_MISSING\_IMAGE	|MISSING\_IMAGE or AD\_MISSING\_IMAGE	| 	|MISSING\_IMAGE	|
|SECURITY\_SCAN\_PENDING\_REVIEW	|SECURITY\_SCAN\_PENDING\_REVIEW	| 	| 	|
|SECURITY\_SCAN\_REJECTED	|SECURITY\_SCAN\_REJECTED	| 	| 	|
|STATUS\_UNAVAILABLE	|STATUS\_UNAVAILABLE	| 	| 	|
|NO\_INVENTORY	|NO\_INVENTORY	| 	| 	|
|NO\_PURCHASABLE\_OFFER	|NO\_PURCHASABLE\_OFFER or AD\_NO\_PURCHASABLE\_OFFER	| 	| 	|
|AD\_INELIGIBLE	|INELIGIBLE or AD\_INELIGIBLE	|INELIGIBLE	| 	|
|CREATIVE\_MISSING\_ASSET	| 	| 	| 	|
|CREATIVE\_PENDING\_REVIEW	| 	|SUBMITTED\_FOR\_MODERATION or PENDING\_MODERATION\_REVIEW	|PENDING\_REVIEW	|
|CREATIVE\_REJECTED	|AD\_GROUP\_POLICING\_CREATIVE\_REJECTED	|REJECTED\_BY\_MODERATION or AD\_GROUP\_POLICING\_CREATIVE\_REJECTED	|REJECTED	|
|AD\_MISSING\_DECORATION	|AD\_MISSING\_DECORATION	| 	|MISSING\_DECORATION	|
|PIR\_RULE\_EXCLUDED	|PIR\_RULE\_EXCLUDED	| 	| 	|
|AD\_NOT\_DELIVERING	|CAMPAIGN\_ADS\_NOT\_DELIVERING	| 	|CAMPAIGN\_ADS\_NOT\_DELIVERING |
|OTHER	| 	| 	| 	|

**Referenced by**: [Campaigns](reference/common-models/campaigns), [ad groups](reference/common-models/ad-groups)

### deliveryStatus

**Description**: This is an overall status if the entity is delivering or not. This is not defined by the user and is read only.

|Values|
|-----|
| DELIVERING |
| NOT\_DELIVERING |
| UNAVAILABLE |

**Referenced by**: [Campaigns](reference/common-models/campaigns), [ad groups](reference/common-models/ad-groups)

### event

**Description**: A target event is an event used in audience targets to define what product event to target based on.

| Allowed values|
|-----|
| PURCHASE |
| VIEW |

**Referenced by**: [Targets](reference/common-models/targets)

### goal

**Description**: The objective of the campaign or ad group.

| Allowed values | Sponsored Display |
|-----|-----|
| AWARENESS | reach |
| CONSIDERATION | clicks |
| CONVERSIONS | conversions |

**Referenced by**: [ad groups](reference/common-models/ad-groups)

### kpi

**Description**: The way a goal is measured.

| Allowed values |
|-----|
| CLICKS |

**Referenced by**: [ad groups](reference/common-models/ad-groups)

### landingPageType

**Description**: The type of landing page used in a an ad. Only certain landing page types are supported for each ad type.

| Values | IMAGE | VIDEO | PRODUCT_COLLECTION | STORE_SPOTLIGHT |
|-------|---|-----|------|------|
| PRODUCT\_LIST | | | x | |
| STORE | x | x | x | x |
| CUSTOM\_URL | | | x| |
| DETAIL\_PAGE | | x | | |
| OFF\_AMAZON\_LINK | x | | | |

### matchType

**Description**: This is the type of matching that Amazon will apply to the given target. Different match types are available based on the target type and ad product.

#### Auto target match types

|Allowed values	| Description | Sponsored Products	|Sponsored Brands	|Sponsored Display	|
|------|-----|-----|-------|
|SEARCH\_LOOSE\_MATCH	|Targets customers using search terms loosely related to your products. |QUERY\_BROAD\_REL\_MATCHES	|N/a	|N/a	|
|SEARCH\_CLOSE\_MATCH	|Targets customers using search terms closely related to your products.| QUERY\_HIGH\_REL\_MATCHES	|N/a	|N/a	|
|PRODUCT\_SUBSTITUTES	|Targets customers who view detail pages of products similar to yours.| ASIN\_SUBSTITUTE\_RELATED	|N/a	|N/a	|
|PRODUCT\_COMPLEMENTS	|Targets customers who view detail pages of products that complement your product.| ASIN\_ACCESSORY\_RELATED	|N/a	|N/a	|
|PRODUCT\_SIMILAR	| Targets customers who view detail pages of products similar to yours.|N/a	|N/a	|similarProduct	|
|SEARCH\_RELATED\_TO\_YOUR\_BRAND	| A set of keywords that are often use to search for brands and promote brand impressions. |N/a	|KEYWORDS\_RELATED\_TO\_YOUR\_BRAND	|N/a	|
|SEARCH\_RELATED\_TO\_YOUR\_LANDING\_PAGES	|A set of keywords that promote brand discovery and can help drive traffic to brand store page or product detail pages. |N/a	|KEYWORDS\_RELATED\_TO\_YOUR\_LANDING\_PAGES	|N/a	|

#### Keyword target match types

|Allowed values	| Description | Sponsored Products	|Sponsored Brands	|
|--------|-------|------|
|BROAD	|Offers broad exposure to customer shopping queries. Search terms may include keyword terms in any order, and may also include singulars, plurals, variations, synonyms, and related terms. | BROAD	|broad	|
|PHRASE	| For Sponsored Products, the search term must contain the exact phrase or sequence of words. It's more restrictive than broad match. Phrase match also includes the plural form of the keyword. In Sponsored Brands campaigns, this match type includes search terms matching the meaning of the keyword. |PHRASE	|phrase	|
|EXACT	| The search term must exactly match the keyword or close variations of the keyword. The sequence of words must also match. This is the most restrictive keyword match type. |EXACT	|exact	|


#### Product target match types

|Allowed values	|Sponsored Products	|Sponsored Brands	|Sponsored Display	|
|--------|-------|-------|-------|
|PRODUCT\_EXACT	|ASIN\_SAME\_AS	|asinSameAs	|asinSameAs	|
|PRODUCT\_SIMILAR	|ASIN\_EXPANDED\_FROM	|N/a	|N/a	|


#### Product audience match types

|Allowed values	|Sponsored Display mapping	|
|-------|-----|
|PRODUCT\_EXACT	|exactProduct	|
|PRODUCT\_SIMILAR	|relatedProduct, similarProduct	|

#### Theme target match type

| Allowed values | Sponsored Products |
| --- | --- |
| KEYWORDS\_RELATED\_TO\_YOUR\_BRAND | brand |
| KEYWORDS\_RELATED\_TO\_GIFTS | gift |
| KEYWORDS\_RELATED\_TO\_YOUR\_PRODUCT\_CATEGORY | category |

**Referenced by**: [Targets](reference/common-models/targets)

### placement

**Description**: Refers to the placement where an ad appears.

| Values | Sponsored Products | Sponsored Brands |
|-----|-------|------|
| HOME\_PAGE | | HOME |
| TOP\_OF\_SEARCH | PLACEMENT\_TOP | |
| PRODUCT\_PAGE | PLACEMENT\_PRODUCT\_PAGE | DETAIL\_PAGE |
| REST\_OF\_SEARCH | REST\_OF\_SEARCH | |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### recurrenceTimePeriod

**Description**: The possible recurrence options for a budget.

|Values|
|-----|
| DAILY |
| LIFETIME |
| OTHER |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### productIdType

**Description**: The type of ID used to identify a product.

| Values |
|-------|
| ASIN |
| SKU |

**Referenced by**: [Ads](reference/common-models/ads)

### shopperCohortType

**Description**: Specifies types of shopper cohort.

| Values                             |
|------------------------------------|
| AUDIENCE\_SEGMENT |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### shopperSegment

**Description**: Specifies types of shoppers.

| Values |
|----|
| NEW\_TO\_BRAND\_PURCHASE |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### state

**Description**: The user-chosen state of a campaign.

|Values|
|-----|
| ENABLED |
| PAUSED |
| ARCHIVED |
| OTHER |

**Referenced by**: [Campaigns](reference/common-models/campaigns), [ad groups](reference/common-models/ad-groups)

### targetingSettings

**Description**: Used to indicate the type of targeting supported by the campaign.

|Values| Description |
|-----|------|
| MANUAL | Sponsored Products manual targeting.|
| AUTO |  Sponsored Products auto targeting. |
| T00020 | Sponsored Display contextual targeting. |
| T00030 | Sponsored Display audience targeting. |

**Referenced by**: [Campaigns](reference/common-models/campaigns)

### targetType

**Description**: A target type defines the type of target criteria you are targeting for inclusion or exclusion on the given ad group or campaign.

|Values|
|-----|
| AUTO |
| KEYWORD |
| PRODUCT\_CATEGORY |
| PRODUCT |
| PRODUCT\_CATEGORY\_AUDIENCE |
| PRODUCT\_AUDIENCE |
| AUDIENCE |

**Referenced by**: [Targets](reference/common-models/targets)
