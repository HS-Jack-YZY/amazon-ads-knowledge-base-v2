# Amazon audience segment membership tables

**Analytics table:** `audience_segments_amer_inmarket`

## Description

Amazon audience segment membership is presented across multiple data views, the default data views are DIMENSION dataset type, whereas the historical snapshots are FACT dataset type. Based on this implementation detail, the default data view presents the most recent user-to-segment associations, whereas the historical snapshots present the user-to-segment associations as records on the first Thursday of each calendar month.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| Audience Segment Membership | no_3p_trackers | BOOLEAN | Dimension | Is this item not allowed to use 3P tracking? |
| Audience Segment Membership | segment_id | INTEGER | Dimension | Identification code for the segment. |
| Audience Segment Membership | segment_marketplace_id | LONG | Dimension | Marketplace the segment belongs to; segments can belong to multiple.marketplaces |
| Audience Segment Membership | segment_name | STRING | Dimension | Name of the segment the user_id is tagged to. |
| Audience Segment Membership | user_id | STRING | Dimension | User ID of the customer. |
| Audience Segment Membership | user_id_type | STRING | Dimension | Type of user ID. |
| Audience Segment Membership | snapshot_datetime | DATE | Dimension | The date of when snapshot was taken. |
