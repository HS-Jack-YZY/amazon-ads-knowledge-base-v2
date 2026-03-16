# Conversions all

**Analytics table:** `conversions_all`

**Audience table:** `conversions_all_for_audiences`

## Description

Contains both ad-exposed and non-ad-exposed conversions for tracked ASINs. Conversions are ad-exposed if a user was served a traffic event within the 28-day period prior to the conversion event.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| Conversion Info | conversion_id | STRING | DIMENSION | Unique identifier of the conversion event. In the dataset conversions,  each row has a unique conversion_id. In the dataset  conversions_with_relevance, the same conversion event will appear multiple  times if a conversion is determined to be relevant to multiple campaigns,  engagement scopes, or brand halo types. |
| Conversion Info | conversions | LONG | METRIC | Conversion count. |
| Conversion Info | event_category | STRING | DIMENSION | For ASIN conversions, the event_category is the high level category of the conversion event, either 'purchase' or 'website'. Examples of ASIN conversions when event_category = 'website' include: detail page views, add to wishlist, or the first Subscribe and Save order. For search conversions (when event_subtype = 'searchConversion'), the event_category is always 'website'. For pixel conversions, this field is always 'pixel'. |
| Conversion Info | event_date_utc | DATE | DIMENSION | Date of the conversion event in UTC. |
| Conversion Info | event_day_utc | INTEGER | DIMENSION | Day of the month of the conversion event in UTC. |
| Conversion Info | event_dt_hour_utc | TIMESTAMP | DIMENSION | Timestamp of the conversion event in UTC truncated to the hour. |
| Conversion Info | event_dt_utc | TIMESTAMP | DIMENSION | Timestamp of the conversion event in UTC. |
| Conversion Info | event_hour_utc | INTEGER | DIMENSION | Hour of the day of the conversion event in UTC. |
| Conversion Info | event_subtype | STRING | DIMENSION | Subtype of the conversion event. For ASIN conversions, the examples of event_subtype include: 'alexaSkillEnable', 'babyRegistry', 'customerReview', 'detailPageView', 'order', 'shoppingCart', 'snsSubscription', 'weddingRegistry', 'wishList'. For search conversions, event_subtype is always 'searchConversion'. For pixel conversions, the numeric ID of the event_subtype is provided. For additional information on the interpretation of this numeric identifier for pixel conversions, refer to event_type_description. |
| Conversion Info | event_type | STRING | DIMENSION | Type of the conversion event. |
| Conversion Info | event_type_class | STRING | DIMENSION | For ASIN conversions, the event_type_class is the High level classification of the event type, e.g. consideration,  conversion, etc. This field will be blank for pixel conversions (when event_category = 'pixel') and search conversions (when event_subtype = 'searchConversion'). |
| Conversion Info | event_type_description | STRING | DIMENSION | Human-readable description of the conversion event. For ASIN conversions, examples include: 'add to baby registry', 'Add to Shopping Cart', 'add to wedding registry', 'add to wishlist', 'Customer Reviews Page', 'New SnS Subscription', 'Product detail page viewed', 'Product purchased'. This field will be blank for search conversions (when event_subtype = 'searchConversion'). For pixel conversions (when event_category = 'pixel'), the event_type_description will include additional information about the pixel based on information provided as part of the campaign setup, such as 'Homepage visit', 'Add to Shopping Cart' or 'Brand store engagement 2'. Before using these fields to evaluate pixel conversions, we recommend that you consult with the team that set up the advertiser's campaign to determine how the event_type_description values for pixel conversions should be interpreted. |
| Conversion Info | exposure_type | STRING | DIMENSION | Attribution of the conversion. For website and purchase conversions, conversion is 'ad-exposed' if conversion happened within 28-days after a traffic event, else 'non-ad-exposed'. For pixel conversions, this field is always 'pixel'. |
| Conversion Info | ip_address | STRING | DIMENSION | Pseudonymous identifier that represents the IP address received for an ad event. The field can contain either IPv4 or IPv6 values. NULL values appear when Amazon Ads does not receive an IP address for the event. The field has a VERY_HIGH aggregation threshold, meaning it cannot be included in final SELECT statements but can be used within Common Table Expressions (CTEs) for aggregation purposes such as COUNT(DISTINCT ip_address). |
| Conversion Info | marketplace_id | INTEGER | Dimension | Marketplace ID of where the conversion event occurred. |
| Conversion Info | marketplace_name | STRING | Dimension | Name of the marketplace where the conversion event occurred. Example values are online marketplaces such as AMAZON.COM, AMAZON.CO.UK. Or in-store marketplaces, such as WHOLE_FOODS_MARKET_US or AMAZON_FRESH_STORES_US. |
| Conversion Info | new_to_brand | BOOLEAN | DIMENSION | True if the user was new to the brand. |
| Conversion Info | purchase_currency | STRING | DIMENSION | ISO currency code of the purchase order. |
| Conversion Info | purchase_unit_price | DecimalDataType | METRIC | Unit price of the product sold. |
| Conversion Info | sns_subscription_id | STRING | DIMENSION | Subscribe-and-save subscription id. |
| Conversion Info | total_product_sales | DecimalDataType | METRIC | Total sales(in local currency) of promoted ASINs and ASINs from the same  brands as promoted ASINs purchased by customers on Amazon. |
| Conversion Info | total_units_sold | LONG | METRIC | Total quantity of promoted products and products from the same brand as  promoted products purchased by customers on Amazon. A campaign can have  multiple units sold in a single purchase event. |
| Conversion Info | tracked_asin | STRING | DIMENSION | The dimension tracked_asin is the tracked Amazon Standard Identification Number, which is either the promoted or brand halo ASIN. When the tracked_item results in a purchase conversion, the tracked_asin will be populated in this column, in addition to being tracked in the tracked_item column with the same ASIN value. The tracked_asin is populated only if the event_category = 'purchase'. For the first SnS order and non-purchase conversions, such as detail page views, the ASIN is populated under tracked_item. See also 'tracked_item'. |
| Conversion Info | tracked_item | STRING | DIMENSION | Each campaign can track zero or more items. Depending on the type of campaign, these items might be ASINs, pixel IDs, DSP ad-attributed branded search keywords or apps. The tracked items for a campaign are the basis for which we determine which conversion events are sent to each AMC instance. In the custom attribution dataset, the tracked_item is the identifier of an item of interest for the campaign, such as the ASIN tracked to the campaign, the brand halo ASIN, or the ad-attributed branded keyword. Attribution algorithms match traffic and conversion event by the user identity and tracked item. Matching rules for tracked items may include expansion algorithms such as brand halo when the conversions_with_relevance dataset is used. If tracked_asin has a value populated, the same value for tracked_item will match tracked_asin. See also tracked_asin. |
| Conversion Info | user_id | STRING | DIMENSION | User ID. |
| Conversion Info | conversion_event_source | STRING | Dimension | Source through which the conversion event was sent to Amazon DSP |
| Conversion Info | conversion_event_name | STRING | Dimension | Advertiser defined name for the conversion event |
| Purchase Info | off_amazon_ product_sales | LONG | METRIC | Sales amount for off- Amazon purchase conversions |
| Conversion Info | off_amazon_conversion_value | LONG | METRIC | Value of off Amazon non- purchase conversions. Value is unitless and advertiser defined. |
| Purchase Info | combined_sales | LONG | METRIC | Sum of total_product_sales(Amazon product sales) and off_amazon_product_sales |
