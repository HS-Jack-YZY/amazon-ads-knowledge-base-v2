---
title: "Brand Metrics"
source: https://advertising.amazon.com/API/docs/en-us/brand-metrics-openapi
section: Reporting
---

# Brand Metrics

**Version**: 3.0

Brand Metrics provides a new measurement solution that quantifies opportunities for your brand at each stage of the customer journey on Amazon, and helps brands understand the value of different shopping engagements that impact stages of that journey. You can now access Awareness and Consideration indices that compare your performance to peers using models predictive of consideration and sales. Brand Metrics quantifies the number of customers in the awareness and consideration marketing funnel stages and is built at scale to measure all shopping engagements with your brand on Amazon, not just ad-attributed engagements. Additionally, BM breaks out key shopping engagements at each stage of the shopping journey, along with the Return on Engagement, so you can measure the historical sales following a consideration event or purchase.

## Endpoints

### POST /insights/brandMetrics/report

**Summary**: Generate Brand Metrics Report. Each response record will include the following dimensional fields (in addition to the requested metrics) brand Namecategory, TreeNamecategory, HierarchylookbackPeriod, metricsComputationDate

Generates the Brand Metrics report in CSV or JSON format. Customize the report by passing a specific categoryTreeName, categoryPath, brandName, reportStartDate, reportEndDate, lookbackPeriod, format or a list of metrics from the available metrics in the metrics field. If an empty request body is passed, report for the latest available report date in JSON format will get generated with all the available brands and metrics for an advertiser. The report may or may not contain the Brand Metrics data for one or more brands depending on data availability.

**Requires one of these permissions**:
["advertiser_campaign_edit","nemo_report_edit"]

**Tags**: Report

**Operation ID**: generateBrandMetricsReport

**Parameters**:

| Name | In | Type | Required | Description |
|---|---|---|---|---|
| Amazon-Advertising-API-Scope | header | string | true | The identifier of a profile associated with the advertiser account. Use `GET` method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Amazon-Advertising-API-ClientId | header | string | true | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body**:

Create request body to generate the Brand Metrics Report.

Content-Type: `application/vnd.insightsbrandmetrics.v1+json`

Content-Type: `application/vnd.insightsbrandmetrics.v1.1+json`

**Responses**:

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized. Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden. Request failed because user does not have access to a specified resource.
- **422**: Unprocessable Entity - Request was understood, but contained invalid parameters.
- **424**: Dependency Failure - Please retry the request.
- **429**: Too many requests. The request was rate-limited. Retry later.
- **500**: Internal server error. Retry later. Contact support if this response persists.

---

### GET /insights/brandMetrics/report/{reportId}

**Summary**: Retrieve the status and the URL of the Brand Metrics Report being generated

Fetch the location and status of the report for the brands for which the metrics are available. The URL to the report is only available when the status of the report is SUCCESSFUL.

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view","nemo_report_edit","nemo_report_view"]

**Tags**: Report

**Operation ID**: getBrandMetricsReport

**Parameters**:

| Name | In | Type | Required | Description |
|---|---|---|---|---|
| reportId | path | string | true | The report Id to be fetched. |
| Amazon-Advertising-API-Scope | header | string | true | The identifier of a profile associated with the advertiser account. Use `GET` method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Amazon-Advertising-API-ClientId | header | string | true | The identifier of a client associated with a "Login with Amazon" account. |

**Responses**:

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthorized. Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden. Request failed because user does not have access to a specified resource.
- **422**: Unprocessable Entity - Request was understood, but contained invalid parameters.
- **424**: Dependency Failure - Please retry the request.
- **429**: Too many requests. The request was rate-limited. Retry later.
- **500**: Internal server error. Retry later. Contact support if this response persists.

---

## Schemas

### brandMetricsError

The error response object.

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| code | string | false | http status code. |
| details | string | false | high level human readable message. |
| errors | array | false | A list of the errors encountered. |
| requestId | string | false |  |

### brandMetricsGenerateReportRequest

Request object to generate the Brand Metrics Report.

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| brandName | string | false | Optional. Brand Name. If no Brand Name is passed, then all data available for all brands belonging to the entity are retrieved. |
| categoryPath | array | false | Optional. The hierarchical path that leads to a node starting with the root node. If no Category Node Name is passed, then all data available for all brands belonging to the entity are retrieved. |
| categoryTreeName | string | false | Optional. The node at the top of a browse tree. It is the start node of a tree. |
| format | string | false | Format of the report. |
| lookBackPeriod | string | false | Currently supported values: "1w" (one week), "1m" (one month) and "1cm" (one calendar month). This defines the period of time used to determine the number of shoppers in the metrics computation. |
| metrics | array | false | Optional. Specify an array of string of metrics field names to include in the report. If no metric field names are specified, all metrics are returned. |
| reportEndDate | string | false | Optional. Retrieves metrics with metricsComputationDate between reportStartDate and reportEndDate (inclusive). The maximum allowed date range for report generation is 3 months. |
| reportStartDate | string | false | Optional. Retrieves metrics with metricsComputationDate between reportStartDate and reportEndDate (inclusive). The maximum allowed date range for report generation is 3 months. |

### brandMetricsGenerateReportResponse

Response object containing Brand Metrics Report metadata.

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| expiration | integer | true | The expiration time of the URI in the location property in milliseconds. |
| format | string | true | Format of the report. |
| location | string | false | The URI address of the report. |
| reportId | string | true | The identifier of the report. |
| status | string | true | The build status of the report. |
| statusDetails | string | true | A human-readable description of the current status. |

### brandMetricsGetReportByIdResponse

Response object containing Brand Metrics Report status metadata.

**Type**: object

| Property | Type | Required | Description |
|---|---|---|---|
| brandsInfo | array | false | List of first 200 brands for which the Brand Metrics report is generated. The report may contain more than 200 brands. This list is only populated with brands if the Brand Metrics are available. |
| expiration | integer | true | The expiration time of the URI in the location property in milliseconds. |
| format | string | true | Format of the report. |
| location | string | false | The URI address of the report. Only available if the report is generated successfully. |
| reportId | string | true | The identifier of the report. |
| status | string | true | The build status of the report. |
| statusDetails | string | true | A human-readable description of the current status. |
