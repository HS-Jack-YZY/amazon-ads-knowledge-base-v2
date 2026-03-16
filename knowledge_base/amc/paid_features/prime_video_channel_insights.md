# Amazon Prime Video Channel Insights

**Analytics table:** `amazon_pvc_enrollments`

**Audience table:** `amazon_pvc_enrollments_for_audiences`

## Description

Amazon Prime Video Channel Insights is a collection of two AMC data views that represent Prime Video Channel subscriptions and streaming signals. Amazon Prime Video Channel Insights is a standalone AMC Paid Features resource that is available for trial and subscription enrollments within the AMC Paid Features suite of insight expansion options, powered by Amazon Ads. This resource is available to Amazon Advertisers that operate Prime Video Channels within the supported AMC Paid Features account marketplaces (US/CA/JP/AU/FR/IT/ES/UK/DE).

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| marketplace_id | LONG | DIMENSION | ID of the marketplace where the Amazon Prime Video Channel enrollment event occurred | INTERNAL |
| marketplace_name | STRING | DIMENSION | This is the marketplace associated with the Amazon Prime Video Channel record | LOW |
| no_3p_trackers | BOOLEAN | DIMENSION | Boolean value indicating whether the event can be used for audience creation that is third-party tracking enabled (i.e. whether you can serve creative with third-party tracking when running media against the audience). Third-party tracking refers to measurement tags and pixels from external vendors that can be used to measure ad performance. Possible values for this field are: 'true', 'false'. | LOW |
| pv_benefit_id | STRING | DIMENSION | Amazon Prime Video subscription benefit identifier | INTERNAL |
| pv_benefit_name | STRING | DIMENSION | Amazon Prime Video subscription benefit name | LOW |
| pv_billing_type | STRING | DIMENSION | Amazon Prime Video billing type for the enrollment record | MEDIUM |
| pv_end_date | DATE | DIMENSION | Interval-specific end date associated with the PVC enrollment record | LOW |
| pv_enrollment_status | STRING | DIMENSION | Status for the PVC enrollment record | LOW |
| pv_is_latest_record | BOOLEAN | DIMENSION | Indicator of whether the PVC enrollment record is the most recent record within the table | INTERNAL |
| pv_is_plan_conversion | BOOLEAN | DIMENSION | Indicates whether the PVC enrollment record has converted from Free Trial to a subscription. this is often associated with a change in the billing type for the PVC subscription | LOW |
| pv_is_plan_start | BOOLEAN | DIMENSION | Indicates whether the PVC enrollment record is the start of a enrollment. this is often the opening of a free trial or the first subscription record for the PV subscription ID | LOW |
| pv_is_promo | BOOLEAN | DIMENSION | Indicator of whether the PVC enrollment record is associated with a promotional offer | LOW |
| pv_offer_name | STRING | DIMENSION | Amazon Prime Video subscription offer name | HIGH |
| pv_start_date | DATE | DIMENSION | Interval-specific start date associated with the PVC enrollment record | LOW |
| pv_sub_event_primary_key | STRING | DIMENSION | Unique identifier for the PVC enrollment event | INTERNAL |
| pv_subscription_id | STRING | DIMENSION | Amazon Prime Video subscription id | INTERNAL |
| pv_subscription_name | STRING | DIMENSION | Amazon Prime Video subscription name | LOW |
| pv_subscription_product_id | STRING | DIMENSION | Amazon Prime Video subscription product identifier | INTERNAL |
| pv_unit_price | DECIMAL | DIMENSION | Unit price for the PVC enrollment record | NONE |
| user_id | STRING | DIMENSION | Pseudonymous identifier that connects user activity across different events. The field can contain ad user IDs (representing Amazon accounts), device IDs, or browser IDs. NULL values appear when Amazon Ads is unable to resolve an identifier for an event. The field has a VERY_HIGH aggregation threshold, meaning it cannot be included in final SELECT statements but can be used within Common Table Expressions (CTEs) for aggregation purposes like COUNT(DISTINCT user_id). | VERY_HIGH |
| user_id_type | STRING | DIMENSION | Type of user ID value. AMC includes different types of user ID values, depending on whether the value represents a resolved Amazon account, a device, or a browser cookie. If Amazon Ads is unable to determine or provide an ID of any kind for an impression event, the user_id and user_id_type values for that record will be NULL. Possible values include: 'adUserId', 'sisDeviceId', 'adBrowserId', and NULL. | LOW |
