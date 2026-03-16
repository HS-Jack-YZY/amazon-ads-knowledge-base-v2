# Amazon Marketing Stream — Data Guide

> Source: https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-stream/data-guide

Amazon Marketing Stream provides near real-time performance metrics and campaign metadata via subscriptions. Each dataset uses a specific subscription endpoint.

## DSP Performance

| Dataset ID | NA | EU | FE | Subscription Endpoint |
|-----------|----|----|----|-----------------------|
| adsp-traffic | ✓ | ✓ | ✓ | `POST /dsp/streams/subscriptions` |
| adsp-conversion | ✓ | ✓ | ✓ | `POST /dsp/streams/subscriptions` |
| adsp-clickstream | ✓ | ✓ | ✓ | `POST /dsp/streams/subscriptions` |
| adsp-rich-media | ✓ | ✓ | ✓ | `POST /dsp/streams/subscriptions` |

## Sponsored Products Performance

| Dataset ID | NA | EU | FE | Subscription Endpoint |
|-----------|----|----|----|-----------------------|
| sp-traffic | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |
| sp-conversion | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |

## Sponsored Display Performance

| Dataset ID | NA | EU | FE | Subscription Endpoint |
|-----------|----|----|----|-----------------------|
| sd-traffic | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |
| sd-conversion | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |

## Sponsored Brands Performance

| Dataset ID | NA | EU | FE | Subscription Endpoint |
|-----------|----|----|----|-----------------------|
| sb-traffic | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |
| sb-conversion | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |
| sb-clickstream | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |
| sb-rich-media | ✓ | ✓ | ✓ | `POST /streams/subscriptions` |

## Operational Datasets

| Dataset ID | NA | EU | FE | Description |
|-----------|----|----|----|----|
| budget-usage | ✓ | ✓ | ✓ | Budget usage tracking |
| sponsored-ads-campaign-diagnostics-recommendations | ✓ | ✓ | ✓ | Campaign diagnostics |
| sp-budget-recommendations | ✓ | ✓ | ✓ | Budget recommendations & missed opportunities |

## Campaign Management Datasets

| Dataset ID | NA | EU | FE | Description |
|-----------|----|----|----|----|
| ads-campaign-management-campaigns | ✓ | ✓ | ✓ | Campaign metadata |
| ads-campaign-management-adgroups | ✓ | ✓ | ✓ | Ad group metadata |
| ads-campaign-management-ads | ✓ | ✓ | ✓ | Ad metadata |
| ads-campaign-management-targets | ✓ | ✓ | ✓ | Target metadata |

## Key Notes

- Confirm each subscription in SQS after subscribing
- DSP datasets use a different subscription endpoint (`/dsp/streams/subscriptions`)
- Sponsored ads datasets use `/streams/subscriptions`
