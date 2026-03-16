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
