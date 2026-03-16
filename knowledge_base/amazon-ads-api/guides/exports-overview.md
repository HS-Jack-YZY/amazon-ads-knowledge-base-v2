# Exports API Overview

> Source: https://advertising.amazon.com/API/docs/en-us/guides/exports/overview

Exports provide an asynchronous way to retrieve campaign structure metadata. Unlike reports (which contain performance data), exports return metadata about campaigns at the time of the request.

## Exports vs Other APIs

| Feature | Exports | Reports | List Operations |
|---------|---------|---------|-----------------|
| Data type | Campaign metadata | Performance data | Campaign metadata |
| Execution | Asynchronous | Asynchronous | Synchronous |
| Best for | Large accounts, bulk sync | Performance analysis | Small accounts, real-time |

## Supported Export Types

All ad products (SP, SB, SD) support exports for:
- [Campaigns](exports-campaigns.md)
- [Ad Groups](exports-ad-groups.md)
- [Targets](exports-targets.md)
- [Ads](exports-ads.md)

## Usage Recommendations

- Designed for syncing data **1-2 times a day**
- Not intended for continuous real-time data retrieval
- Default cap: **5 concurrent jobs** per endpoint
- Contact support for additional capacity

## API Endpoint

```
POST /{entity}/exports
```

Response includes a job ID to poll for completion, then download the result.
