---
title: "Reporting (version 3)"
source: https://advertising.amazon.com/API/docs/en-us/offline-report-prod-3p
section: Reporting
---

# Offline Report

**Version**: 3.0

Request reports for Amazon Ads campaigns. For full documentation, see [Report types](/API/docs/en-us/guides/reporting/v3/report-types/overview) and our [Getting started tutorial](/API/docs/en-us/guides/reporting/v3/get-started).

## Endpoints

### POST /reporting/reports

**Summary**: Creates a report request

Creates a report request. Use this operation to request the creation of a new report for Amazon Advertising Products. Use `adProduct` to specify the Advertising Product of the report.

**Authorized resource type**:
Global Ad Account ID, Profile ID

**Parameter name**:
Amazon-Advertising-API-Scope

**Parameter in**:
header

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view","nemo_report_edit","nemo_report_view","reports_edit"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view","nemo_report_edit","nemo_report_view","reports_edit","view_performance_dashboard"]

**Tags**: Asynchronous Reports

**Operation ID**: createAsyncReport

**Parameters**:

| Name | In | Type | Required | Description |
|---|---|---|---|---|
| Amazon-Advertising-API-ClientId | header | string | true | The client identifier of the customer making the request. |
| Amazon-Advertising-API-Scope | header | string | false | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Amazon-Ads-AccountId | header | string | false | The identifier of a DSP advertiser account. Optional. For details, see [this guide](guides/reporting/dsp/creating-reports). |

**Request Body**:

Content-Type: `application/vnd.createasyncreportrequest.v3+json`

```json
{
  "$ref": "#/components/schemas/CreateAsyncReportRequest"
}
```

**Responses**:

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **422**: Unprocessable entity - Failed due to invalid parameters.
- **425**: Too Early - Request is a duplicate of a processing request.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

---

### DELETE /reporting/reports/{reportId}

**Summary**: Deletes a report by id

Deletes a report by id. Use this operation to cancel a report in a `PENDING` status.

**Tags**: Asynchronous Reports

**Operation ID**: deleteAsyncReport

**Parameters**:

| Name | In | Type | Required | Description |
|---|---|---|---|---|
| reportId | path | string | true | The identifier of the requested report. |
| Amazon-Advertising-API-ClientId | header | string | true | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | false | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Amazon-Ads-AccountId | header | string | false | The identifier of a DSP advertiser account. Optional. For details, see [this guide](guides/reporting/dsp/creating-reports). |

**Responses**:

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden.
- **404**: Not Found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

---

### GET /reporting/reports/{reportId}

**Summary**: Gets a generation status of report by id

Gets a generation status of a report by id. Uses the `reportId` value from
the response of previously requested report via `POST /reporting/reports`
operation. When `status` is set to `COMPLETED`, the report will be
available to be downloaded at `url`.

Report generation can take as long as 3 hours. Repeated calls to check report status may generate a 429 response,
indicating that your requests have been throttled. To retrieve reports programmatically, your application logic should
institute a delay between requests. For more information,
see [Retry logic with exponential backoff](concepts/rate-limiting#use-retry-logic-with-exponential-backoff).

**Tags**: Asynchronous Reports

**Operation ID**: getAsyncReport

**Parameters**:

| Name | In | Type | Required | Description |
|---|---|---|---|---|
| reportId | path | string | true | The identifier of the requested report. |
| Amazon-Advertising-API-ClientId | header | string | true | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | false | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Amazon-Ads-AccountId | header | string | false | The identifier of a DSP advertiser account. Optional. For details, see [this guide](guides/reporting/dsp/creating-reports). |

**Responses**:

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **404**: Not Found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

---

## Report Type IDs

| Product | Report Type IDs |
|---------|----------------|
| **Sponsored Products** | spCampaigns, spTargeting, spSearchTerm, spAdvertisedProduct, spPurchasedProduct, spGrossAndInvalids |
| **Sponsored Brands** | sbCampaigns, sbAdGroup, sbAds, sbTargeting, sbSearchTerm, sbCampaignPlacement, sbPurchasedProduct, sbGrossAndInvalids |
| **Sponsored Display** | sdCampaigns, sdAdGroup, sdAdvertisedProduct, sdTargeting, sdPurchasedProduct, sdGrossAndInvalids |
| **Sponsored TV** | stCampaigns, stTargeting |
| **DSP** | dspCampaign, dspAudience, dspInventory, dspProduct, dspGeo, dspTech, dspAudioAndVideo |

---

## Request / Response Examples

### Create Report Request

```
POST /reporting/reports
Content-Type: application/vnd.createasyncreportrequest.v3+json
Authorization: Bearer {access_token}
Amazon-Advertising-API-ClientId: {client_id}
Amazon-Advertising-API-Scope: {profile_id}
```

```json
{
  "name": "SP Campaign Report - March 2026",
  "startDate": "2026-03-01",
  "endDate": "2026-03-15",
  "configuration": {
    "adProduct": "SPONSORED_PRODUCTS",
    "reportTypeId": "spCampaigns",
    "groupBy": ["campaign"],
    "columns": [
      "campaignName",
      "campaignId",
      "campaignStatus",
      "campaignBudgetAmount",
      "impressions",
      "clicks",
      "cost",
      "purchases1d",
      "purchases7d",
      "purchases14d",
      "purchases30d",
      "sales1d",
      "sales7d",
      "sales14d",
      "sales30d"
    ],
    "filters": [
      {
        "field": "campaignStatus",
        "values": ["ENABLED", "PAUSED"]
      }
    ],
    "timeUnit": "DAILY",
    "format": "GZIP_JSON"
  }
}
```

### Create Report Response (200)

```json
{
  "reportId": "amzn1.clicksAPI.v1.p1.ABC123DEF456",
  "status": "PENDING",
  "configuration": {
    "adProduct": "SPONSORED_PRODUCTS",
    "reportTypeId": "spCampaigns",
    "groupBy": ["campaign"],
    "columns": ["campaignName", "campaignId", "impressions", "clicks", "cost"],
    "timeUnit": "DAILY",
    "format": "GZIP_JSON"
  },
  "startDate": "2026-03-01",
  "endDate": "2026-03-15",
  "createdAt": "2026-03-16T10:00:00.000Z",
  "updatedAt": "2026-03-16T10:00:00.000Z",
  "name": "SP Campaign Report - March 2026",
  "url": null,
  "urlExpiresAt": null,
  "fileSize": null,
  "generatedAt": null,
  "failureReason": null
}
```

### Get Report Status (Completed)

```
GET /reporting/reports/amzn1.clicksAPI.v1.p1.ABC123DEF456
```

```json
{
  "reportId": "amzn1.clicksAPI.v1.p1.ABC123DEF456",
  "status": "COMPLETED",
  "startDate": "2026-03-01",
  "endDate": "2026-03-15",
  "createdAt": "2026-03-16T10:00:00.000Z",
  "updatedAt": "2026-03-16T10:02:30.000Z",
  "generatedAt": "2026-03-16T10:02:30.000Z",
  "url": "https://advertising-api-report.s3.amazonaws.com/...",
  "urlExpiresAt": "2026-03-16T11:02:30.000Z",
  "fileSize": 12345
}
```

### Downloaded Report Data (GZIP_JSON decompressed)

```json
[
  {
    "campaignName": "SP Auto Campaign",
    "campaignId": "123456789",
    "campaignStatus": "ENABLED",
    "campaignBudgetAmount": 50.0,
    "date": "2026-03-01",
    "impressions": 15000,
    "clicks": 250,
    "cost": 125.50,
    "purchases1d": 12,
    "sales1d": 450.00
  },
  {
    "campaignName": "SP Auto Campaign",
    "campaignId": "123456789",
    "campaignStatus": "ENABLED",
    "campaignBudgetAmount": 50.0,
    "date": "2026-03-02",
    "impressions": 18200,
    "clicks": 310,
    "cost": 155.75,
    "purchases1d": 15,
    "sales1d": 580.00
  }
]
```

### Key Notes

- **Format**: Only `GZIP_JSON` is supported. Download and decompress with gzip.
- **Lookback**: Most reports support 95-day lookback window.
- **URL expiry**: Download URLs expire after ~3600 seconds. Re-poll status to get a new URL.
- **Processing time**: Reports can take up to 3 hours. Use exponential backoff polling.
- **timeUnit**: `DAILY` returns one row per day per group-by dimension. `SUMMARY` aggregates the entire date range.

---

## Schemas

### AsyncReport

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| configuration | AsyncReportConfiguration | true |  |
| createdAt | string | true | The date at which the report was created in ISO 8601 date time format. |
| endDate | string | true | The end date for the reporting period in YYYY-mm-dd format. |
| failureReason | string | false | Present for failed reports only. The reason why a report failed to generate. |
| fileSize | number | false | The size of the report file, in bytes. |
| generatedAt | string | false | The date at which the report was generated in ISO 8601 date time format. |
| name | string | false | Optional. The name of the generated report. |
| reportId | string | true | The identifier of the requested report. |
| startDate | string | true | The start date for the reporting period in YYYY-mm-dd format. |
| status | string | true | The build status of the report. `PENDING` - Report is created and awaiting processing. `PROCESSING` - Report is processing. `COMPLETED` - Report has completed. Check the `url` field. |
| updatedAt | string | true | The date at which the report was last updated in ISO 8601 date time format. |
| url | string | false | URL of the generated report. |
| urlExpiresAt | string | false | The date at which the download URL for the generated report expires. urlExpires at this time defaults to 3600 seconds but may vary in the future. |

### AsyncReportAdProduct

The advertising product.

**Type**: string

**Enum values**: ALL, DEMAND_SIDE_PLATFORM, SPONSORED_BRANDS, SPONSORED_DISPLAY, SPONSORED_PRODUCTS, SPONSORED_TELEVISION

### AsyncReportConfiguration

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| adProduct | AsyncReportAdProduct | true |  |
| columns | array | true | The list of columns to be used for report. The availability of columns depends on the selection of reportTypeId. This list cannot be null or empty. |
| filters | array | false | The list of filters supported by a report type. The availability of filters fields depends on the selection of reportTypeId. |
| format | string | true | The report file format. |
| groupBy | array | true | This field determines the aggregation level of the report data and also makes additional fields available for selection. This field cannot be null or empty. |
| reportTypeId | string | true | The identifier of the Report Type to be generated. |
| timeUnit | string | true | The aggregation level of report data. If the timeUnit is set to `SUMMARY`, the report data is aggregated at the time period specified. |

### AsyncReportFilter

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| field | string | false | The field name of the filter |
| values | array | false | The values to be filtered by |

### AsyncReportingError

The Error Response.

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| code | string | false | The HTTP status code of the response. |
| detail | string | false | A human-readable description of the response. |

### CreateAsyncReportRequest

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| configuration | AsyncReportConfiguration | true |  |
| endDate | string | true | YYYY-MM-DD format. The maximum lookback window supported depends on the selection of reportTypeId. Most report types support `95 days` as lookback window. |
| name | string | false | The name of the report. |
| startDate | string | true | YYYY-MM-DD format. The maximum lookback window supported depends on the selection of reportTypeId. Most report types support `95 days` as lookback window. |

### DeleteAsyncReportResponse

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| code | string | false | The HTTP status code of the response. |
| detail | string | false | A human-readable description of the response. |
| reportId | string | false | The identifier of the report. |
