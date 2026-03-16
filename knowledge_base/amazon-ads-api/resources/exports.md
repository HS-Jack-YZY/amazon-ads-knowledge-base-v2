---
title: Amazon Ads API Exports
source: https://advertising.amazon.com/API/docs/en-us/exports
section: Resources
---

# Amazon Ads API Exports

Amazon Ads API to request and download exports across ad products.

**Version:** 3.0

## Servers

- https://advertising-api.amazon.com - Production server for NA
- https://advertising-api-eu.amazon.com - Production server for EU
- https://advertising-api-fe.amazon.com - Production server for FE

## Endpoints

### POST /adGroups/export

**Summary:** Creates a file-based export of Ad Groups.

Creates a file-based export of Ad Groups in the account satisfying the filtering criteria.

To understand the call flow for asynchronous exports, see [Getting started with sponsored ads exports](/API/docs/en-us/guides/exports/get-started).

**Operation ID:** AdGroupExport

**Request Body:**

Content-Type: `application/vnd.adgroupsexport.v1+json`

**Responses:**

- **202**: Success.
- **400**: Bad request
- **401**: Unauthorized
- **406**: Not acceptable

### POST /ads/export

**Summary:** Creates a file-based export of Ads.

Creates a file-based export of Ads in the account satisfying the filtering criteria.

To understand the call flow for asynchronous exports, see [Getting started with sponsored ads exports](/API/docs/en-us/guides/exports/get-started).

**Operation ID:** AdExport

**Request Body:**

Content-Type: `application/vnd.adsexport.v1+json`

**Responses:**

- **202**: Success.
- **400**: Bad request
- **401**: Unauthorized
- **406**: Not acceptable

### POST /campaigns/export

**Summary:** Creates a file-based export of Campaigns.

Creates a file-based export of Campaigns in the account satisfying the filtering criteria.

To understand the call flow for asynchronous exports, see [Getting started with sponsored ads exports](/API/docs/en-us/guides/exports/get-started).

**Operation ID:** CampaignExport

**Request Body:**

Content-Type: `application/vnd.campaignsexport.v1+json`

**Responses:**

- **202**: Success.
- **400**: Bad request
- **401**: Unauthorized
- **406**: Not acceptable

### GET /exports/{exportId}

**Summary:** Gets the status of a requested export and a link to download the export.

This API will return a status of the specified export.

To understand the call flow for asynchronous exports, see [Getting started with sponsored ads exports](/API/docs/en-us/guides/exports/get-started).

**Operation ID:** GetExport

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| exportId | path | string | Yes | The export identifier. |

**Responses:**

- **200**: Success.
- **401**: Unauthorized
- **404**: Not found
- **406**: Not acceptable

### POST /targets/export

**Summary:** Creates a file-based export of Targets.

Creates a file-based export of Targets in the account satisfying the filtering criteria.

To understand the call flow for asynchronous exports, see [Getting started with sponsored ads exports](/API/docs/en-us/guides/exports/get-started).

**Operation ID:** TargetExport

**Request Body:**

Content-Type: `application/vnd.targetsexport.v1+json`

**Responses:**

- **202**: Success.
- **400**: Bad request
- **401**: Unauthorized
- **406**: Not acceptable
