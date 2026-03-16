# Amazon DSP video events table

**Analytics table:** `dsp_video_events_feed`

**Audience table:** `dsp_video_events_feed_for_audiences`

## Description

This table has the exact same basic structure as dsp_impressions table but in addition to that, the table provides video metrics for each of the video creative events triggered by the video player and associated with the impression event.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| video_click | LONG | Metric | The number of Amazon DSP video clicks. Possible values for this field are: '1' (if the video was viewed to completion) or '0' (if the video was not viewed to completion). This field will always be '0' for non-video impressions. | NONE |
| video_complete | LONG | Metric | The number of Amazon DSP video impressions where the video was viewed to completion (100%). Possible values for this field are: '1' (if the video was viewed to completion) or '0' (if the video was not viewed to completion). This field will always be '0' for non-video impressions. | NONE |
| video_creative_view | LONG | Metric | The number of Amazon DSP video impressions where an additional ad element, such as the video companion ad or VPAID overlay, was viewed. Possible values for this field are: '1' (if the additional ad element was viewed) or '0' (if the additional ad element was not viewed). This field will always be '0' for non-video impressions. | NONE |
| video_first_quartile | LONG | Metric | The number of Amazon DSP video impressions where the video was viewed to the first quartile (at least 25% completion). Possible values for this field are: '1' (if the video was viewed to at least 25% completion) or '0' (if the video was not viewed to 25% completion). This field will always be '0' for non-video impressions. | NONE |
| video_impression | LONG | Metric | The number of Amazon DSP video impressions where the first frame of the ad was shown. Possible values for this field are: '1' (if the first frame of the video was shown) or '0' (if the first frame of the video was not shown). This field will always be '0' for non-video impressions. | NONE |
| video_midpoint | LONG | Metric | The number of Amazon DSP video impressions where the video was viewed to the midpoint (at least 50% completion). Possible values for this field are: '1' (if the video was viewed to at least 50% completion) or '0' (if the video was not viewed to 50% completion). This field will always be '0' for non-video impressions. | NONE |
| video_mute | LONG | Metric | The number of Amazon DSP video mutes. Possible values for this field are: '1' (if the user muted the video) or '0' (if the user did not mute the video). This field will always be '0' for non-video impressions. | NONE |
| video_pause | LONG | Metric | The number of Amazon DSP video pauses. Possible values for this field are: '1' (if the user paused the video) or '0' (if the user did not pause the video). This field will always be '0' for non-video impressions. | NONE |
| video_replay | LONG | Metric | The number of Amazon DSP video impressions where the ad was replayed again after it completed. Possible values for this field are: 1 (if the user replayed the video after completion) or 0 (if the video was not replayed after completion). This field will always be '0' for non-video impressions. | NONE |
| video_resume | LONG | Metric | The number of Amazon DSP video impressions where the video was resumed after a pause. Possible values for this field are: 1 (if the video was resumed after a pause) or 0 (if the video was not resumed after a pause). This field will always be '0' for non-video impressions. | NONE |
| video_skip_backward | LONG | Metric | The number of Amazon DSP video impressions that had backward skips. Possible values for this field are: '1' (if the user skipped the video backward) or '0' (if the user did not skip the video backward). This field will always be '0' for non-video impressions. | NONE |
| video_skip_forward | LONG | Metric | The number of Amazon DSP video impressions that had forward skips. Possible values for this field are: '1' (if the user skipped the video forward) or '0' (if the user did not skip the video forward). This field will always be '0' for non-video impressions. | NONE |
| video_start | LONG | Metric | The number of Amazon DSP video impression starts. Possible values for this field are: '1' (if the user started the video) or '0' (if the user did not start the video). This field will always be '0' for non-video impressions. | NONE |
| video_third_quartile | LONG | Metric | The number of Amazon DSP video impressions where the video was viewed to the third quartile (at least 75% completion). Possible values for this field are: '1' (if the video was viewed to at least 75% completion) or '0' (if the video was not viewed to 75% completion). This field will always be '0' for non-video impressions. | NONE |
| video_unmute | LONG | Metric | The number of Amazon DSP video unmutes. Possible values for this field are: '1' (if the video was unmuted) or '0' (if the video was not unmuted). This field will always be '0' for non-video impressions. | NONE |
