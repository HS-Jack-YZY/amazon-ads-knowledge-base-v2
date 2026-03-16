# Amazon Live Traffic

**Analytics table:** `amazon_live_traffic`

**Audience table:** `amazon_live_traffic_for_audiences`

## Description

The amazon_live_traffic table includes Amazon Live impression, click, and view events, at the granularity of the product carousel ads that run alongside Amazon Live broadcasts. Use this table to generate insights about your Amazon Live media.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| ad_product_type | STRING | DIMENSION | Type of Amazon Ads ad product responsible for the traffic event. In this table, this field will always display the value 'amazon_live'. | LOW |
| advertiser | STRING | DIMENSION | Amazon Live advertiser name. Example value: 'Widgets Inc'. | LOW |
| broadcast_date_utc | DATE | DIMENSION | Initial broadcast date in Coordinated Universal Time (UTC). Example value: '2025-01-01'. | LOW |
| broadcast_id | STRING | DIMENSION | The ID of the Amazon Live broadcast, which can be found in the URL of the Amazon Live broadcast page: https://www.amazon.com/live/broadcast/[broadcast_id]. This ID will be consistent across livestream and playback/on-demand events of the same Amazon Live video. Note that this field is only available for broadcasts with a broadcast date of 2025-05-09 or later. Example value: 'a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e5e5'. | LOW |
| broadcast_name | STRING | DIMENSION | The name of the Amazon Live broadcast. Note that this field is only available for broadcasts with a broadcast date after 2025-05-01.  Example value: 'Widgets Inc Back to School 2025'. | LOW |
| clicks | LONG | METRIC | Count of Amazon Live product carousel ad clicks. Possible values for this field are: '1' (if the record represents a click event) or '0' (if the record does not represent a click event). | NONE |
| creative_asin | STRING | DIMENSION | The ASIN promoted by the ad within the Amazon Live product carousel. Note that this field is only available for broadcasts with a broadcast date of 2025-07-15 or later. Example value: 'B01234ABCD'. | LOW |
| creative_id | LONG | DIMENSION | ID of the Amazon Live product carousel ad. A product carousel ad appears alongside the Amazon Live broadcast and highlights an ASIN featured in the video. | LOW |
| event_date_utc | DATE | DIMENSION | Date of the Amazon Live event in Coordinated Universal Time (UTC). Example value: '2025-01-01'. | LOW |
| event_day_utc | INTEGER | DIMENSION | Day of month when the Amazon Live event occurred in Coordinated Universal Time (UTC). Example value: '1'. | LOW |
| event_dt_hour_utc | TIMESTAMP | DIMENSION | Timestamp of the Amazon Live event in Coordinated Universal Time (UTC), truncated to hour. Example value: '2025-01-01T12:00:00.000Z'. | LOW |
| event_dt_utc | TIMESTAMP | DIMENSION | Timestamp of the Amazon Live event in Coordinated Universal Time (UTC). Example value: '2025-01-01T23:59:59.000Z'. | MEDIUM |
| event_hour_utc | INTEGER | DIMENSION | Hour of the Amazon Live event in Coordinated Universal Time (UTC). Example value: '14' (represents 2:00 PM in 24-hour time). | LOW |
| event_id | STRING | DIMENSION | Internal event ID for the Amazon Live traffic event, where the event could be an Amazon Live product carousel ad impression, click, or view. To join Amazon Live traffic to attributed events, join event_id in this table to traffic_event_id in the amazon_attributed_* tables. | VERY_HIGH |
| impressions | LONG | METRIC | Count of Amazon Live product carousel ad impressions. Possible values for this field are: 1 (if the record represents an Amazon Live impression) or 0 (if the record does not represent an Amazon Live impression). | NONE |
| site | STRING | DIMENSION | The retail domain where the Amazon Live product carousel ad was displayed (e.g. amazon.us, amazon.in). This can help you determine in which marketplace your media was run. | LOW |
| slot_name | STRING | DIMENSION | The environment in which the Amazon Live product carousel ad was displayed. Possible values include: 'carousel-desktop-web', 'carousel-mobile-web', 'carousel-mobile-app', and 'carousel-shoptv-app'. | LOW |
| user_id | STRING | DIMENSION | Pseudonymous identifier that connects user activity across different events. The field can contain ad user IDs (representing Amazon accounts), device IDs, or browser IDs. NULL values appear when Amazon Ads is unable to resolve an identifier for an event. The field has a VERY_HIGH aggregation threshold, meaning it cannot be included in final SELECT statements but can be used within Common Table Expressions (CTEs) for aggregation purposes like COUNT(DISTINCT user_id). | VERY_HIGH |
| user_id_type | STRING | DIMENSION | Type of user ID value. AMC includes different types of user ID values, depending on whether the value represents a resolved Amazon account, a device, or a browser cookie. If Amazon Ads is unable to determine or provide an ID of any kind for a click event, the 'user_id' and 'user_id_type' values for that record will be NULL. Possible values include: 'adUserId', 'sisDeviceId', 'adBrowserId', and NULL. | LOW |
| views | LONG | METRIC | Count of Amazon Live product carousel ad views (how many times the product carousel ad was at least 50% in-view for at least 1 second). Possible values for this field are: '1' (if the record represents an ad view event) or '0' (if the record does not represent an ad view event). | NONE |
