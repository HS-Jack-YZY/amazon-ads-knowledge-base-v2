---
title: Rate limiting
description: Overview of rate limiting and throttling in the Amazon Ads API
type: guide
interface: api
tags:
    - Operations
    - Reporting
keywords:
    - Retry-After
    - "429"
    - list operations
    - snapshot
---

# Rate limiting

Rate limiting, sometimes referred to as throttling, occurs when the Amazon Ads API receives too many requests within a given time period. 

When this happens, you will receive a response with the code 429. Contained within that response is a `Retry-After` header. The `Retry-After` value is the number of seconds that you should wait before submitting another API call. Rate limiting will occur dynamically based on the overall system load.

## Avoiding rate limits for reports

Rate limits associated with the [Sponsored Ads reporting API](offline-report-prod-3p), [Sponsored Display reports API](sponsored-display/3-0/openapi#tag/Reports), and the [Sponsored Brands reports API](sponsored-brands/3-0/openapi#tag/Reports) depend on the size of the report generation queue. These limits are determined on a per-region basis with multiple limit tiers that correspond to the current reporting queue size in a given region. Higher utilization periods with higher report queue sizes result in lower rate limits. Lower utilization periods result in higher rate limits with a higher number of accepted report generation requests.

Depending on the region, there may be different time periods of higher utilization each day. If you encounter lower rate limits and a higher occurrence of `429` HTTP response codes, we recommend that you distribute report generation requests throughout each day. For example, perform reporting backfills or request older data periods in smaller increments throughout the day and, in general, refrain from sending large batches of report generation requests. 

We also recommend use of [exponential backoff](https://aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/) in response to a high occurrence of `429` HTTP response codes. 

> [NOTE] Dynamic rate limits are unlikely to change over short time periods. Therefore, choose longer backoff periods for report generation. 

## Avoiding rate limits for all other API calls

Rate limits in the Amazon Ads API are dynamic and based on system load. If you experience frequent rate limits, you can decrease this by following these best practices:

### Use retry logic with exponential backoff

If a call to the Amazon Ads API fails, the error falls into one of three classes:

1. **Server error:** The HTTP response is a 500-level code that indicates a problem with API services.
2. **Throttling error:** The HTTP response is `429`, an administratively enforced restriction limiting the allowed frequency of API calls.
3. **Client error:** The HTTP response is a 400-level code other than `429`, indicating an issue with the request. Investigate the error in your request before retrying.

In general, you should retry requests that receive server or throttling errors. When retrying your requests, use an exponential backoff algorithm. The idea behind exponential backoff is to use progressively longer waits between retries for consecutive error responses. For example, when a 429 or 5xx error is received, your application could backoff for 2 seconds and try again. If error is received, backoff for 4 seconds and try again. If error is still being received, backoff 8 seconds and try again, etc. You should implement a maximum delay interval, as well as a maximum number of retries for the retry logic.

For more details on this type of strategy, see [error retries and exponential backoff](https://docs.aws.amazon.com/general/latest/gr/api-retries.html) in the AWS reference guide.

### Do not call 'list extended data' operations when extended properties are not necessary

These calls hold 5x the weight of standard calls towards throttling limits, and are quite expensive to process. The only difference between a list on extended data operations and standard list operations is that extended call provides the status of the entities. Avoid calling extended data operations unless you specifically need to know the status of the entities.

### Do not call list operations on all entities

To list all entities at a given level requires a significant number of API calls, and this operation does not scale well. A better alternative to making thousands of list operations is to request an export and parse the results.

To understand the exports specifications, see [Exports](exports).

### Avoid making reporting requests during high usage times.

Rate limits in the Sponsored Products, Sponsored Display, and Sponsored Brands reporting endpoints change with usage levels. We decrease during high usage times and increase them during low usage time. We determine usage levels at the endpoint region level. We encourage users to smooth their report creation requests throughout the day, such as pulling older data periods throughout the day. 