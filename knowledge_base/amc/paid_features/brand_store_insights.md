# Amazon Brand Store insights tables

**Analytics table:** `amazon_brand_store_page_views(_non_endemic)`

**Audience table:** `amazon_brand_store_page_views_for_audiences(_non_endemic)`

## Description

Amazon Brand Store insights is a collection of two AMC datasets that represent Brand Store page renders and interactions. Amazon Brand Store insights is a standalone AMC Paid Features resource that is available for trial and subscription enrollments within the AMC Paid Features suite of insight expansion options, powered by Amazon Ads.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| Brand Store insights | advertiser_id | LONG | Dimension | Advertiser ID. |
| Brand Store insights | channel | STRING | Dimension | Channel tag ID, referenced as query string name. |
| Brand Store insights | device_type | STRING | Dimension | Device type that viewed the store. |
| Brand Store insights | dwell_time | DECIMAL | Dimension | Dwell time of page view(in seconds). |
| Brand Store insights | event_date_utc | DATE | Dimension | Date of event in UTC. |
| Brand Store insights | event_dt_utc | TIMESTAMP | Dimension | Timestamp of event in UTC. |
| Brand Store insights | ingress_type | STRING | Dimension | Enumerated list of store traffic source:0 - uncategorized / default1 - search2 - detail page byline4 - ads6 - store recommendations7 through 11- experimentation |
| Brand Store insights | marketplace_id | INTEGER | Dimension | Marketplace ID of the store. |
| Brand Store insights | page_id | STRING | Dimension | Store page ID. |
| Brand Store insights | page_title | STRING | Dimension | Title of the page. |
| Brand Store insights | reference_id | STRING | Dimension | Identifier for the ad campaign that is associated with the Brand Store page visit, associated with ingress_type = 4. |
| Brand Store insights | referrer_domain | STRING | Dimension | HTML referrer domain from which user arrived at page from e.g. google.com (external) or amazon.com (internal). |
| Brand Store insights | session_id | STRING | Dimension | Store session ID. |
| Brand Store insights | store_name | STRING | Dimension | Name of the store set by the store owner. |
| Brand Store insights | user_id | STRING | Dimension | User ID that performed the event. |
| Brand Store insights | user_id_type | STRING | Dimension | Type of User ID. |
| Brand Store insights | visit_id | STRING | Dimension | Store visit ID. |
| Brand Store insights | no_3p_trackers | BOOLEAN | Dimension | Indicates whether this item is not allowed to use 3P tracking. |
