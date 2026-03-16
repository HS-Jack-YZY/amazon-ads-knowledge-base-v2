# Amazon DSP by matched and user impressions tables

**Analytics table:** `dsp_impressions_by_matched_segments`

**Audience table:** `dsp_impressions_by_matched_segments_for_audiences`

## Description

These two tables have exactly the same basic structure as the dsp_impressions table but in addition to that they provide segment level information for each of the segments that was either targeted by the ad or included the user that received the impression. This means that each impression appears multiple times in these tables. dsp_impressions_by_matched_segments shows only the segments that included the user and were targeted by the ad at the time of the impression. dsp_impressions_by_user_segments shows all segments that include the user, behavior_segment_matched is set to "1" if the segment was targeted by the ad.
The following table shows columns in addition to the ones listed for dsp_impressions.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| behavior_segment_description | STRING | DIMENSION | Description of the audience segment, for segments both targeted by the Amazon DSP line item and matched to the user at the time of impression. This field contains explanations of the characteristics that define each segment, such as shopping behaviors, demographics, and interests. | LOW |
| behavior_segment_id | INTEGER | DIMENSION | Unique identifier for the audience segment, for segments both targeted by the Amazon DSP line item and matched to the user at the time of impression. Example value: '123456'. | LOW |
| behavior_segment_matched | LONG | METRIC | Indicator of whether the behavior segment was targeted by the Amazon DSP line item and matched to the user at the time of impression. Since this table includes matched segments only, this field will always have a value of '1' (the segment was targeted and matched to the user). | NONE |
| behavior_segment_name | STRING | DIMENSION | Name of the audience segment, for segments both targeted by the Amazon DSP line item and matched to the user at the time of impression. | LOW |
