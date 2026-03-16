# Amazon Retail Purchases in AMC

**Analytics table:** `amazon_retail_purchases`

**Audience table:** `amazon_retail_purchase_for_audiences`

## Description

The Amazon Retail Purchases (ARP) dataset (amazon_retail_purchases) enables advertisers to analyze long-term (up to 60 months) customer purchase behavior and create more comprehensive insights.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| asin | STRING | - | ASIN is the abbreviation for Amazon Standard  Identification Number. This represents the item associated with the retail  event. A unique block of letters and/or numbers that identify all products  sold on Amazon. | LOW |
| asin_brand | STRING | - | ASIN item merchant brand name. | LOW |
| asin_name | STRING | - | ASIN item name. | LOW |
| asin_parent | STRING | - | The Amazon Standard Identification Number (ASIN) that  is the parent of this ASIN for the retail event. | LOW |
| currency_code | STRING | - | ISO currency code of the retail event. | LOW |
| event_id | STRING | - | Unique identifier of the retail event record. In the  data set, each row has a unique event_id. This event_id can have a  many-to-one relationship with purchase_id. | VERY_HIGH |
| is_business_flag | BOOLEAN | - | Indicates whether the retail event is associated with "Amazon Business" program. | LOW |
| is_gift_flag | BOOLEAN | - | Indicates whether the retail event is associated with "send an order as a gift". | LOW |
| marketplace_id | INTEGER | - | Marketplace ID of where the retail event occurred. | INTERNAL |
| marketplace_name | STRING | - | Name of the marketplace where the retail event occurred. Example values include AMAZON.COM, AMAZON.CO.UK, etc. | LOW |
| no_3p_trackers | BOOLEAN | - | Is this item not allowed to use 3P tracking. | NONE |
| origin_session_id | STRING | - | Describes the session when the retail item was added  to cart. | VERY_HIGH |
| purchase_date_utc | DATE | - | Date of the retail event in UTC. | LOW |
| purchase_day_utc | INTEGER | - | Day of the month of the retail event in UTC. | LOW |
| purchase_dt_hour_utc | TIMESTAMP | - | Timestamp of the retail event in UTC truncated to the  hour. | LOW |
| purchase_dt_utc | TIMESTAMP | - | Timestamp of the retail event in UTC. | MEDIUM |
| purchase_hour_utc | INTEGER | - | Hour of the day of the retail event in UTC. | LOW |
| purchase_id | STRING | - | Unique identifier of the retail purchase record. This  purchase_id can have a one-to-many relationship with event_id. | VERY_HIGH |
| purchase_month_utc | INTEGER | - | Month of the conversion event in UTC. | LOW |
| purchase_order_method | STRING | - | Enumerated descriptor of how the shopper purchased the item. S = Shopping Cart. B = Buy Now. 1 = 1-Click Buy. | LOW |
| purchase_program_name | STRING | - | Indicates the purchase program associated with the retail event. | LOW |
| purchase_session_id | STRING | - | Describes the session when the retail item was  purchased. | VERY_HIGH |
| purchase_units_sold | LONG | - | Total quantity of retail items associated with the  retail event. A record can have multiple units sold of a single retail item. | NONE |
| unit_price | DECIMAL | - | Per unit price of the product sold. | NONE |
| user_id | STRING | - | User ID associated with the retail event (the user ID of the shopper that purchased the item). | VERY_HIGH |
| user_id_type | STRING | - | Type of user ID. The only value for this data set is “adUserId”. | LOW |
