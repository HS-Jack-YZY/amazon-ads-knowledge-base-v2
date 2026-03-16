# AMC (Amazon Marketing Cloud) Knowledge Base

This knowledge base contains comprehensive documentation for Amazon Marketing Cloud, including concepts, SQL reference, and data source table schemas — designed for use by Claude AI when writing AMC SQL queries and answering AMC questions.

**Source:** [Amazon Ads API - AMC Documentation](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/datasources/overview)

---

## Concepts

| Topic | Description |
|-------|-------------|
| [Overview & Availability](concepts/overview.md) | What is AMC, benefits, key features, supported regions |
| [How AMC Works](../amazon-ads-api/resources/amc-how-it-works.md) | Access methods, accounts/instances, data, queries, privacy |
| [Aggregation Threshold Guide](concepts/aggregation_threshold.md) | Detailed threshold levels, rules, practical examples |
| [API Guide](concepts/api_guide.md) | Authentication, base URLs, headers, marketplace IDs, first API call, S3 setup |
| [Workflow Management](concepts/workflow_management.md) | Create/execute/schedule workflows, custom parameters, get results |

## SQL Reference

| Topic | Description |
|-------|-------------|
| [SQL Overview](../amazon-ads-api/resources/amc-sql-overview.md) | Data types, operators, grammar |
| [SQL Basics](../amazon-ads-api/resources/amc-sql-basics.md) | SELECT, JOIN, WHERE, GROUP BY, HAVING, CTEs, LIMIT |
| [Functions](sql_reference/functions.md) | String, math, aggregate, date/time, conditional, array, window, hash, JSON, statistical |
| [Expressions](sql_reference/expressions.md) | CONTAINED_IN, BUILT_IN_PARAMETER, CUSTOM_PARAMETER, UUID |
| [Limitations](sql_reference/limitations.md) | Unsupported features, workarounds, mandatory requirements |

---

## Table Index

### Amazon DSP Traffic Tables

Tables containing inputs from all Amazon DSP campaigns. Includes records from ad product types such as Display, Online Video, Streaming TV, Audio, etc.

| Table | Analytics Name | Audience Name | Schema |
|-------|---------------|---------------|--------|
| DSP Impressions | `dsp_impressions` | `dsp_impressions_for_audiences` | [dsp/dsp_impressions.md](dsp/dsp_impressions.md) |
| DSP Clicks | `dsp_clicks` | `dsp_clicks_for_audiences` | [dsp/dsp_clicks.md](dsp/dsp_clicks.md) |
| DSP Views | `dsp_views` | `dsp_views_for_audiences` | [dsp/dsp_views.md](dsp/dsp_views.md) |
| DSP Impressions by Segments | `dsp_impressions_by_matched_segments` / `dsp_impressions_by_user_segments` | `dsp_impressions_by_matched_segments_for_audiences` / `dsp_impressions_by_user_segments_for_audiences` | [dsp/dsp_impressions_by_segments.md](dsp/dsp_impressions_by_segments.md) |
| DSP Video Events Feed | `dsp_video_events_feed` | `dsp_video_events_feed_for_audiences` | [dsp/dsp_video_events_feed.md](dsp/dsp_video_events_feed.md) |

### Amazon Ads Conversion Tables

These tables contain pairs of traffic and conversion events. "Traffic events" are impressions and clicks. "Conversion events" include purchases, various interactions with Amazon website (detailed page views, pixel fires, etc.). Each conversion event is attributed to its corresponding traffic event.

| Table | Analytics Name | Audience Name | Schema |
|-------|---------------|---------------|--------|
| Conversions | `conversions` | `conversions_for_audiences` | [conversions/conversions.md](conversions/conversions.md) |
| Conversions with Relevance | `conversions_with_relevance` | `conversions_with_relevance_for_audiences` | [conversions/conversions_with_relevance.md](conversions/conversions_with_relevance.md) |
| Attributed Events by Conversion Time | `amazon_attributed_events_by_conversion_time` | `amazon_attributed_events_by_conversion_time_for_audiences` | [conversions/amazon_attributed_events_by_conversion_time.md](conversions/amazon_attributed_events_by_conversion_time.md) |
| Attributed Events by Traffic Time | `amazon_attributed_events_by_traffic_time` | `amazon_attributed_events_by_traffic_time_for_audiences` | [conversions/amazon_attributed_events_by_traffic_time.md](conversions/amazon_attributed_events_by_traffic_time.md) |

### Sponsored Ads Table

Includes both impressions and clicks for sponsored ads programs.

| Table | Analytics Name | Audience Name | Schema |
|-------|---------------|---------------|--------|
| Sponsored Ads Traffic | `sponsored_ads_traffic` | `sponsored_ads_traffic_for_audiences` | [sponsored_ads/sponsored_ads_traffic.md](sponsored_ads/sponsored_ads_traffic.md) |

### Amazon Live Traffic Table

Includes Amazon Live impression, click, and view events at the granularity of carousel ads displayed alongside Amazon Live broadcast media.

| Table | Analytics Name | Audience Name | Schema |
|-------|---------------|---------------|--------|
| Amazon Live Traffic | `amazon_live_traffic` | `amazon_live_traffic_for_audiences` | [amazon_live/amazon_live_traffic.md](amazon_live/amazon_live_traffic.md) |

### AMC Paid Features Tables

Tables associated with AMC paid feature subscriptions. Dataset availability varies by marketplace.

| Table | Analytics Name | Audience Name | Schema |
|-------|---------------|---------------|--------|
| Conversions All | `conversions_all` | `conversions_all_for_audiences` | [paid_features/conversions_all.md](paid_features/conversions_all.md) |
| Audience Segment Membership | `audience_segments_*` | `audience_segments_*_for_audiences` | [paid_features/audience_segment_membership.md](paid_features/audience_segment_membership.md) |
| Amazon Your Garage | `amazon_your_garage` | `amazon_your_garage_for_audiences` | [paid_features/amazon_your_garage.md](paid_features/amazon_your_garage.md) |
| Brand Store Insights | `amazon_brand_store_page_views` / `amazon_brand_store_engagement_events` | see schema file | [paid_features/brand_store_insights.md](paid_features/brand_store_insights.md) |
| Amazon Retail Purchases | `amazon_retail_purchases` | `amazon_retail_purchase_for_audiences` | [paid_features/amazon_retail_purchase.md](paid_features/amazon_retail_purchase.md) |
| Prime Video Channel Insights | `amazon_pvc_enrollments` / `amazon_pvc_streaming_events_feed` | see schema file | [paid_features/prime_video_channel_insights.md](paid_features/prime_video_channel_insights.md) |
| Experian Vehicle Insights | `experian_vehicle_purchases` | - | [paid_features/experian_vehicle_purchases.md](paid_features/experian_vehicle_purchases.md) |
| NCS CPG Insights Stream | `cpg_insights_stream` | - | [paid_features/cpg_insights_stream.md](paid_features/cpg_insights_stream.md) |

---

## AMC SQL Reference Tips

### Time Zones

- AMC queries use **UTC time by default**
- The advertising console reports use **advertiser time zone** (e.g., `America/Los_Angeles`)
- To match AMC to advertiser time zone, use the `timeWindowTimeZone` parameter in `CreateWorkflowExecution` request
- Most tables provide both UTC and advertiser-timezone versions of date/time fields (e.g., `impression_date` vs `impression_date_utc`)

### Attribution Intervals

- The API provides four standard intervals: `_1d`, `_7d`, `_14d`, `_30d`
- In AMC SQL, you can aggregate results for **any custom interval** up to the attribution window (14 days)
- Use `SECONDS_BETWEEN()` to calculate custom attribution windows:

```sql
-- 9-day attribution window example
SELECT campaign, SUM(total_purchases) AS total_orders_9d
FROM amazon_attributed_events_by_traffic_time
WHERE SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*9
GROUP BY campaign
```

Single expression form:
```sql
SUM(IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 9*24*60*60, total_purchases_clicks, 0)) AS purchases_9d
```

### Conversion vs Traffic Time

- **Sponsored Products** and **Sponsored Display** use `amazon_attributed_events_by_traffic_time`
- **Sponsored Brands** uses `amazon_attributed_events_by_conversion_time`

### Aggregation Thresholds

Each column has an aggregation threshold level that determines how it can be used:

| Level | Meaning |
|-------|---------|
| `NONE` | No restrictions, can be freely used |
| `LOW` | Minimal threshold, generally usable in SELECT |
| `MEDIUM` | Moderate threshold |
| `HIGH` | High threshold, may require more aggregation |
| `VERY_HIGH` | Cannot be included in final SELECT; use only within CTEs for aggregation (e.g., `COUNT(DISTINCT user_id)`) |
| `INTERNAL` | For internal use only |

### Key Fields

- **`user_id`** (VERY_HIGH threshold): Pseudonymous identifier connecting user activity across events. Use only in CTEs for `COUNT(DISTINCT user_id)` type aggregations
- **`request_tag`**: Connects related impression/view/click/conversion events. **Not recommended as JOIN key** - use `UNION ALL` instead, or `user_id` for user-level analysis
- **Cost fields**: Different tables use different units:
  - **Microcents**: divide by `100,000,000` to get dollars (fields like `supply_cost`, `audience_fee`, `platform_fee`)
  - **Millicents**: divide by `100,000` to get dollars (fields like `impression_cost`, `total_cost`)

### SQL Syntax Limitations

AMC SQL has the following syntax restrictions:

| Clause | Status | Notes |
|--------|--------|-------|
| `ORDER BY` | **Standalone: not supported.** Supported within `PARTITION BY` window clauses. | Use `RANK()` / `ROW_NUMBER()` with `PARTITION BY ... ORDER BY` for ordering |
| `SELECT *` | Not supported | Always list column names explicitly |
| `RIGHT JOIN` | Not supported | Swap tables and use `LEFT JOIN` instead |
| Aggregation | **Required** | Every query must include at least one aggregate function |

`LIMIT` **is supported** — use it to cap the number of returned rows.

For full details, see [Limitations & Unsupported Features](sql_reference/limitations.md).

### Amazon Retail Purchases (ARP) Notes

- Contains **60 months** (5 years) of historical purchase data vs **13 months** in other datasets
- Exercise caution when joining with other AMC datasets due to mismatched time windows
- Sourced from retail data pipeline (not advertising data pipeline)

---

## Example SQL Queries

### Sponsored Products: Conversions + Traffic

```sql
WITH traffic_and_conversion_events AS (
  SELECT
    advertiser, campaign,
    0 AS impressions,
    0 AS clicks,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*7, total_purchases, 0) AS total_purchases_7d,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*14, total_purchases, 0) AS total_purchases_14d,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*14, purchases, 0) AS purchases_14d,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*14, total_product_sales, 0) AS total_product_sales_14d,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*14, total_units_sold, 0) AS total_units_sold_14d,
    IF(SECONDS_BETWEEN(traffic_event_dt_utc, conversion_event_dt_utc) <= 60*60*24*14, brand_halo_units_sold, 0) AS brand_halo_units_sold_14d
  FROM amazon_attributed_events_by_traffic_time
  WHERE ad_product_type = 'sponsored_products'

  UNION ALL

  SELECT
    advertiser, campaign,
    impressions, clicks,
    0 AS total_purchases_7d,
    0 AS total_purchases_14d,
    0 AS purchases_14d,
    0 AS total_product_sales_14d,
    0 AS total_units_sold_14d,
    0 AS brand_halo_units_sold_14d
  FROM sponsored_ads_traffic
)
SELECT
  advertiser, campaign,
  SUM(impressions) AS impressions,
  SUM(clicks) AS clicks,
  SUM(total_purchases_7d) AS total_purchases_7d,
  SUM(total_purchases_14d) AS total_purchases_14d,
  SUM(purchases_14d) AS purchases_14d,
  SUM(total_units_sold_14d) AS total_units_sold_14d,
  SUM(brand_halo_units_sold_14d) AS brand_halo_units_sold_14d,
  SUM(total_product_sales_14d) AS total_product_sales_14d
FROM traffic_and_conversion_events
GROUP BY advertiser, campaign
```

### DSP Reach and Frequency

```sql
SELECT
  campaign,
  COUNT(*) AS total_impressions,
  COUNT(DISTINCT user_id) AS unique_users
FROM dsp_impressions
GROUP BY campaign
```

### DSP Cost Analysis

```sql
SELECT
  campaign,
  SUM(impressions) AS total_impressions,
  SUM(total_cost) / 100000.0 AS total_cost_dollars,
  (SUM(total_cost) / 100000.0) / (SUM(impressions) / 1000.0) AS cpm_dollars
FROM dsp_impressions
GROUP BY campaign
```

### Daily Clicks by Product (ASIN)

Query daily click, impression, and spend data per product ASIN from Sponsored Ads. Note: `creative_asin` is only populated for a subset of Sponsored Products and Sponsored Display events; other ad types will have NULL values (filtered out below).

```sql
SELECT
  event_date,
  ad_product_type,
  creative_asin,
  SUM(clicks) AS total_clicks,
  SUM(impressions) AS total_impressions,
  SUM(spend) / 100000000.0 AS total_spend
FROM sponsored_ads_traffic
WHERE creative_asin IS NOT NULL
GROUP BY event_date, ad_product_type, creative_asin
```
