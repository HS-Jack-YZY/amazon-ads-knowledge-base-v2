# Conversions with relevance

**Analytics table:** `conversions_with_relevance`

**Audience table:** `conversions_with_relevance_for_audiences`

## Description

The data sources conversions and conversions_with_relevance are used to create custom attribution models both for ASIN conversions (purchases) and pixel conversions.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| advertiser | STRING | DIMENSION | Advertiser name | LOW |
| advertiser_id | LONG | DIMENSION | Advertiser ID | LOW |
| advertiser_timezone | STRING | DIMENSION | Time zone of the advertiser | LOW |
| campaign | STRING | DIMENSION | Campaign name | LOW |
| campaign_budget_amount | LONG | DIMENSION | Campaign budget amount (millicents) | LOW |
| campaign_end_date | DATE | DIMENSION | Campaign end date in the advertiser time zone. | LOW |
| campaign_end_date_utc | DATE | DIMENSION | Campaign end date in UTC | LOW |
| campaign_end_dt | TIMESTAMP | DIMENSION | Campaign end timestamp in the advertiser time zone. | LOW |
| campaign_end_dt_utc | TIMESTAMP | DIMENSION | Campaign end timestamp in UTC | LOW |
| campaign_id | LONG | DIMENSION | The campaign ID for Amazon DSP campaigns. For Sponsored Ads campaign IDs, refer to campaign_id_string. Amazon DSP campaign IDs can also be found in campaign_id_string. | LOW |
| campaign_id_string | STRING | DIMENSION | The campaign IDs for Amazon DSP and Sponsored Ads campaigns (Recommended over campaign_id column) | LOW |
| campaign_sales_type | STRING | DIMENSION | Campaign sales type | LOW |
| campaign_source | STRING | DIMENSION | Campaign source | LOW |
| campaign_start_date | DATE | DIMENSION | Campaign start date in the advertiser time zone. | LOW |
| campaign_start_date_utc | DATE | DIMENSION | Campaign start date in UTC. | LOW |
| campaign_start_dt | TIMESTAMP | DIMENSION | Campaign start timestamp in the advertiser time zone. | LOW |
| campaign_start_dt_utc | TIMESTAMP | DIMENSION | Campaign start timestamp in UTC. | LOW |
| combined_sales | DECIMAL(38,4) | METRIC | Sum of total_product_sales+off_Amazon_product_sales | NONE |
| conversion_event_name | STRING | DIMENSION | The advertiser's name of the conversion definition | LOW |
| conversion_event_source_name | STRING | DIMENSION | The source of the advertiser-provided conversion data. | LOW |
| conversion_id | STRING | DIMENSION | Unique identifier of the conversion event. In the data set conversions, each row has a unique conversion_id. In the data set conversions_with_relevance, the same conversion event will appear multiple times if a conversion is determined to be relevant to multiple campaigns, engagement scopes, or brand halo types. | VERY_HIGH |
| conversions | LONG | METRIC | Conversion count | NONE |
| engagement_scope | STRING | DIMENSION | The engagement scope between the campaign setup and the conversion. Possible values for this column are PROMOTED, BRAND_HALO, and null. See also the definition for halo_code. The engagement_scope will always be 'PROMOTED' for pixel conversions (when event_category = 'pixel'). | LOW |
| event_category | STRING | DIMENSION | For ASIN conversions, the event_category is the high level category of the conversion event, either 'purchase' or 'website'. Examples of ASIN conversions when event_category = 'website' include: detail page views, add to wishlist, or the first Subscribe and Save order. For search conversions (when event_subtype = 'searchConversion'), the event_category is always 'website'. For pixel conversions, this field is always 'pixel'. | LOW |
| event_date | DATE | DIMENSION | Date of the conversion event in the advertiser time zone. | LOW |
| event_date_utc | DATE | DIMENSION | Date of the conversion event in UTC. | LOW |
| event_day | INTEGER | DIMENSION | Day of the month of the conversion event in the advertiser time zone. | LOW |
| event_day_utc | INTEGER | DIMENSION | Day of the month of the conversion event in UTC. | LOW |
| event_dt | TIMESTAMP | DIMENSION | Timestamp of the conversion event in the advertiser time zone. | MEDIUM |
| event_dt_hour | TIMESTAMP | DIMENSION | Timestamp of the conversion event in the advertiser time zone truncated to the hour. | LOW |
| event_dt_hour_utc | TIMESTAMP | DIMENSION | Timestamp of the conversion event in UTC truncated to the hour. | LOW |
| event_dt_utc | TIMESTAMP | DIMENSION | Timestamp of the conversion event in UTC. | MEDIUM |
| event_hour | INTEGER | DIMENSION | Hour of the day of the conversion event in the advertiser time zone. | LOW |
| event_hour_utc | INTEGER | DIMENSION | Hour of the day of the conversion event in UTC. | LOW |
| event_subtype | STRING | DIMENSION | Subtype of the conversion event. This field provides additional detail about the subtype of conversion event that occurred, such as whether it represents viewing a product's detail page on Amazon.com or completing a purchase on an advertiser's website. For on-Amazon conversion events, this field contains human-readable values, while off-Amazon events measured via Events Manager are represented by numeric values. Possible values include: 'detailPageView', 'shoppingCart', 'order', 'searchConversion', 'brandStorePageView', 'wishList', 'babyRegistry', 'weddingRegistry', 'customerReview' for on-Amazon events, and numeric values like '134', '140', '141' for off-Amazon events. For more information on off-Amazon conversion event subtypes, refer to the "Introduction to Events Manager" entry in the IQL. | LOW |
| event_type | STRING | DIMENSION | Always 'CONVERSION' in the data sources conversions and conversions_with_relevance. | LOW |
| event_type_class | STRING | DIMENSION | For ASIN conversions, the event_type_class is the high level classification of the event type, e.g. consideration, conversion, etc. This field will be blank for pixel conversions (when event_category = 'pixel') and search conversions (when event_subtype = 'searchConversion'). | LOW |
| event_type_description | STRING | DIMENSION | Human-readable description of the conversion event. For ASIN conversions, examples include: 'add to baby registry', 'Add to Shopping Cart', 'add to wedding registry', 'add to wishlist', 'Customer Reviews Page', 'New SnS Subscription', 'Product detail page viewed', 'Product purchased'. This field will be blank for search conversions (when event_subtype = 'searchConversion'). For pixel conversions (when event_category = 'pixel'), the event_type_description will include additional information about the pixel based on information provided as part of the campaign setup, such as 'Homepage visit', 'Add to Shopping Cart' or 'Brand store engagement 2'. Before using these fields to evaluate pixel conversions, we recommend that you consult with the team that set up the advertiser's campaign to determine how the event_type_description values for pixel conversions should be interpreted. | LOW |
| halo_code | STRING | DIMENSION | The halo code between the campaign and conversion. Possible values for this column are TRACKED_ASIN, VARIATIONAL_ASIN, BRAND_KEYWORD, CATEGORY_KEYWORD, BRAND_MARKETPLACE, BRAND_GL_PRODUCT, BRAND_CATEGORY, BRAND_SUBCATEGORY, and null. See also the definition for engagement_scope. The halo_code will be NULL for pixel conversions (when event_category = 'pixel'). | LOW |
| ip_address | STRING | DIMENSION | Pseudonymous identifier that represents the IP address received for an ad event. The field can contain either IPv4 or IPv6 values. NULL values appear when Amazon Ads does not receive an IP address for the event. The field has a VERY_HIGH aggregation threshold, meaning it cannot be included in final SELECT statements but can be used within Common Table Expressions (CTEs) for aggregation purposes such as COUNT(DISTINCT ip_address). | VERY_HIGH |
| marketplace_name | STRING | DIMENSION | Name of the marketplace where the conversion event occurred. Example values are online marketplaces such as AMAZON.COM, AMAZON.CO.UK. Or in-store marketplaces, such as WHOLE_FOODS_MARKET_US or AMAZON_FRESH_STORES_US. Also, refer to the column 'purchase_retail_program' and nd search the AMC Instructional Query Library for In Store, Fresh, or Whole Foods to find related queries | LOW |
| new_to_brand | BOOLEAN | DIMENSION | True if the user was new to the brand. | LOW |
| no_3p_trackers | BOOLEAN | DIMENSION | Is this item not allowed to use 3P tracking | NONE |
| off_amazon_conversion_value | DECIMAL(38,4) | METRIC | Non monetary "value" of conversion for non-purchase conversions | NONE |
| off_amazon_product_sales | DECIMAL(38,4) | METRIC | "Value" of purchase conversions provided via Conversion Builder | NONE |
| purchase_currency | STRING | DIMENSION | ISO currency code of the purchase order. | LOW |
| purchase_unit_price | DECIMAL(38,4) | METRIC | Unit price of the product sold. | NONE |
| total_product_sales | DECIMAL(38,4) | METRIC | Total sales (in local currency) of promoted ASINs and ASINs from the same brands as promoted ASINs purchased by customers on Amazon. | NONE |
| total_units_sold | LONG | METRIC | Total quantity of promoted products and products from the same brand as promoted products purchased by customers on Amazon. A campaign can have multiple units sold in a single purchase event. | NONE |
| tracked_asin | STRING | DIMENSION | The dimension tracked_asin is the tracked Amazon Standard Identification Number, which is either the promoted or brand halo ASIN. When the tracked_item results in a purchase conversion, the tracked_asin will be populated in this column, in addition to being tracked in the tracked_item column with the same ASIN value. The tracked_asin is populated only if the event_category = 'purchase'. For the first SnS order and non-purchase conversions, such as detail page views, the ASIN is populated under tracked_item. See also 'tracked_item'. | LOW |
| tracked_item | STRING | DIMENSION | Identifier for the conversion event item. The value in this field depends on the subtype of the conversion event. For ASIN-related conversions on Amazon such as purchases, detail page views, add to cart events, this field will contain the ASIN of the product. For brand store events, this field will contain the brand store ID. For branded search conversions on Amazon, this field will contain the ad-attributed branded search keyword. For off-Amazon conversions, this field will contain the ID of the conversion definition. Note that when tracked_asin is populated, the same value will appear in tracked_item. | LOW |
| user_id | STRING | DIMENSION | User ID | VERY_HIGH |
| user_id_type | STRING | DIMENSION | Type of user ID | LOW |
