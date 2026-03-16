---
title: Ads Data Manager
source: https://advertising.amazon.com/API/docs/en-us/ads-data-manager
section: Resources
---

# Ads Data Manager

Ads data manager (ADM) simplifies and streamlines the process of first-party data management across Amazon Ads. ADM's APIs let advertisers and their partners onboard their data once and securely reuse it across our ad products ( e.g. ADSP or AMC) for measuring conversions, engaging relevant audiences, and optimizing campaigns.

**Version:** 3.0

## Endpoints

### GET /adm/audiences

Lists all Audience DataSets.

**Authorized resource type**:
Global Manager Account ID

**Parameter name**:
Amazon-Ads-Manager-Account-ID

**Parameter in**:
header

**Requires one of these permissions**:
["MasterAccount_Manager","ManagerAccount_Dev","ads_data_manager_view","ads_data_manager_edit","MasterAccount_Viewer"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["audiences_edit"]

**Operation ID:** ListAudienceDatasets

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| nextToken | query | string | No | Optional. Token to receive next page of results. |
| limit | query | number | No | Optional. Number of results to limit. Default is 100. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: ListAudience 200 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### POST /adm/audiences

Creates an Audience DataSet.

**Authorized resource type**:
Global Manager Account ID

**Parameter name**:
Amazon-Ads-Manager-Account-ID

**Parameter in**:
header

**Requires one of these permissions**:
["MasterAccount_Manager","ManagerAccount_Dev","ads_data_manager_edit"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["audiences_edit"]

**Operation ID:** CreateAudienceDataset

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **201**: CreateAudience 201 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### GET /adm/audiences/{dataSetId}

Gets an Audience DataSet.

**Operation ID:** GetAudienceDataset

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| dataSetId | path | string | Yes | Unique identifier that is created to represent the Dataset. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: GetAudience 200 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### POST /adm/audiences/{dataSetId}/members

Posts audience members to an audience dataset.

**Operation ID:** IngestAudiences

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| dataSetId | path | string | Yes | An Amazon common Identifier format of type String. |
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/vnd.admAudiences.v1+json`

**Responses:**

- **200**: IngestAudiences 200 response
- **400**: 400 BadRequest
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### GET /adm/datarooms

Get a data room

**Operation ID:** GetDataroom

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: GetDataroom 200 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### POST /adm/datarooms

Create a dataroom

**Operation ID:** CreateDataroom

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **201**: CreateDataroom 201 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### GET /adm/datarooms/metadata

Gets dataset metadata including linked datasets, active dest., etc

**Operation ID:** GetDataroomMetadata

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: GetDataroomMetadata 200 response
- **400**: 400 BadRequest
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **500**: 500 ServerError

### POST /adm/datasets/list

Lists details of datasets in a given account.

**Operation ID:** ListDatasetDetails

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| search | query | string | No | The search query string. |
| order | query | string | No | The order or sorting criteria for the search results. |
| nextToken | query | string | No | A token to specify where to start retrieving results |
| maxResults | query | number | No | The maximum number of results to return per page. This value defaults to 100 |
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/vnd.admmetrics.v1+json`

**Responses:**

- **200**: ListDatasetDetails 200 response
- **400**: 400 BadRequest
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **500**: 500 ServerError

### DELETE /adm/datasets/{dataSetId}

Delete a Dataset.

**Operation ID:** DeleteDataset

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| dataSetId | path | string | Yes | Unique identifier that is created to represent the Dataset. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **204**: DeleteDataSet 204 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### GET /adm/datasets/{dataSetId}/metrics

Gets the metrics associated to dataset across all uploads

**Operation ID:** GetDataSetMetrics

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| dataSetId | path | string | Yes | The ID of the dataset for which to retrieve metrics |
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: GetDataSetMetrics 200 response
- **400**: 400 BadRequest
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **500**: 500 ServerError

### POST /adm/identities/delete

Deletes matched list of users from your data room within 30 days.

**Operation ID:** DeleteIdentity

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-Manager-Account-ID | header | string | Yes | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/vnd.admDataDeletion.v1+json`

**Responses:**

- **200**: DeleteIdentity 200 response
- **400**: 400 BadRequest
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### POST /adm/sharingRules

Create a new Sharing Rule in ADM.

**Operation ID:** CreateSharingRule

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: CreateSharingRule 200 response
- **400**: AdsCdxBadRequestException 400 response
- **401**: AdsCdxUnauthorizedRequestException 401 response
- **403**: AdsCdxForbiddenRequestException 403 response
- **404**: AdsCdxResourceNotFoundException 404 response
- **429**: AdsCdxTooManyRequestsException 429 response
- **500**: AdsCdxServerException 500 response

### POST /adm/sharingRules/list

List a set of sharing rules belonging to an account.

**Operation ID:** ListSharingRules

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: ListSharingRules 200 response
- **400**: AdsCdxBadRequestException 400 response
- **401**: AdsCdxUnauthorizedRequestException 401 response
- **403**: AdsCdxForbiddenRequestException 403 response
- **404**: AdsCdxResourceNotFoundException 404 response
- **429**: AdsCdxTooManyRequestsException 429 response
- **500**: AdsCdxServerException 500 response

### PATCH /adm/sharingRules/{sharingRuleId}/revoke

Revoke an existing Sharing Rule in ADM.

**Operation ID:** RevokeSharingRule

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| sharingRuleId | path | string | Yes | The unique identifier for a sharing rule. |
| Amazon-Ads-Manager-Account-ID | header | string | Yes | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **204**: RevokeSharingRule 204 response
- **400**: AdsCdxBadRequestException 400 response
- **401**: AdsCdxUnauthorizedRequestException 401 response
- **403**: AdsCdxForbiddenRequestException 403 response
- **404**: AdsCdxResourceNotFoundException 404 response
- **429**: AdsCdxTooManyRequestsException 429 response
- **500**: AdsCdxServerException 500 response

### GET /adm/terms

Get the Customer's Ads Data Manager Terms and Conditions

**Operation ID:** GetTerms

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:**

- **200**: AdsCdxSolGetTerms 200 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError

### PATCH /adm/terms

Set the Customer's Ads Data Manager Terms and Conditions acceptance

**Operation ID:** SetTermsAcceptance

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | No | Advertiser Account ID. |
| Amazon-Ads-Manager-Account-ID | header | string | No | Manager Account ID. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **204**: SetTermsAcceptance 204 response
- **400**: 400 DuplicateDatasetName Error
- **401**: 401 UnauthorizedRequest
- **403**: 403 ForbiddenRequest
- **404**: 404 ResourceNotFound
- **429**: 429 TooManyRequests
- **500**: 500 ServerError
