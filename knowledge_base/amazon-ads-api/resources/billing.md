---
title: Advertising Billing
source: https://advertising.amazon.com/API/docs/en-us/billing
section: Resources
---

# Advertising Billing

APIs that enable integrators to manage different aspects of billing for their account like Addresses, Taxes, Payments, Invoices etc..

**Version:** 3.0

## Endpoints

### GET /billing/documents/{documentId}

Gets billing document(s) with id.

**Operation ID:** GetDocument

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| documentId | path | string | Yes | Document ID |
| docType | query | array | Yes | Document type |
| Amazon-Ads-AccountId | header | string | No | Account identifier |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The header used to pass the ID of a manager account. |

**Responses:**

- **200**: GetDocument 200 response
- **400**: ValidationException 400 response
- **401**: UnauthorizedException 401 response
- **404**: ResourceNotFoundException 404 response
- **500**: InternalServerException 500 response

### POST /billing/invoices/pay

Executes payment on a set of or all of an advertisers open invoices.

**Operation ID:** PayInvoices

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: Successful response of the operation.
- **400**: The operation failed due to invalid client input.
- **429**: The operation failed due to reaching the rate limit.
- **500**: Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/notifications

**Summary:** Get the billing notifications for a list advertising accounts.

Gets an array of all currently valid billing notifications associated for each advertising account.

**Operation ID:** bulkGetBillingNotifications

**Request Body:**

Content-Type: `application/vnd.billingnotifications.v1+json`

**Responses:**

- **200**: Successful Request
- **400**: Bad Request
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource,
- **404**: Not Found - Requested account was not found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/paymentAgreements

Creates or updates payment agreements.

**Operation ID:** CreatePaymentAgreements

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: Successful response of the operation.
- **400**: The operation failed due to invalid client input.
- **429**: The operation failed due to reaching the rate limit.
- **500**: Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/paymentAgreements/list

Gets current payment agreement for a customer.

**Operation ID:** GetPaymentAgreements

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| agreementType | query | | Yes | The type of payment agreement to query for. |

**Responses:**

- **200**: Successful response of the operation.
- **400**: The operation failed due to invalid client input.
- **429**: The operation failed due to reaching the rate limit.
- **500**: Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/paymentMethods/list

Retrieves eligible payment methods for a customer.

**Operation ID:** GetCustomerPaymentMethods

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| criteriaType | query | | Yes | Criteria Types to that can be used to filter the payment methods. |

**Responses:**

- **200**: Successful response of the operation.
- **400**: The operation failed due to invalid client input.
- **429**: The operation failed due to reaching the rate limit.
- **500**: Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/paymentProfiles

Creates or updates payment profiles.

**Operation ID:** CreatePaymentProfiles

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Ads-AccountId | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: Successful response of the operation.
- **400**: The operation failed due to invalid client input.
- **429**: The operation failed due to reaching the rate limit.
- **500**: Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

### POST /billing/statuses

**Summary:** Get the billing status for a list of advertising accounts.

Gets the current billing status associated for each advertising account.

**Operation ID:** bulkGetBillingStatus

**Request Body:**

Content-Type: `application/vnd.bulkgetbillingstatusrequestbody.v1+json`

**Responses:**

- **200**: Successful
- **400**: Bad Request
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource,
- **404**: Not Found - Requested account was not found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

### GET /billingProfileAgreementContents/{billingProfileAgreementContentId}

**Summary:** API to fetch agreement contents related to billing profiles.

User needs to provide consent to certain agreements before creating a billing profile. This API provides a way for users to go through the agreement content.

**Operation ID:** GetBillingProfileAgreementContent

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |
| billingProfileAgreementContentId | path | string | Yes | agreementId for which the content needs to be fetched. |
| languageOfPreference | query | string | No | This selection controls the language of preference (or locale). |

**Responses:**

- **200**: Get operation was successful. `content` contains the HTML content of the agreement requested
- **401**: Billing profile agreement couldn't be fetched because of unauthenticated access.
- **403**: Billing profile agreement couldn't be fetched because of unauthorized access.
- **404**: Billing profile agreement couldn't be fetched because content doesn't exist.
- **500**: Billing profile agreement couldn't be fetched because of internal error.

### POST /billingProfileUsages

**Summary:** API to link one or more countries with a billing profile.

API to link one or more countries with a billing profile. The linked BillingProfile's billing information will be used for invoicing, taxes and other billing workflows.

**Operation ID:** ApplyBillingProfile

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/vnd.billingProfileUsage.v1+json`

**Responses:**

- **207**: Some Billing profile(s) may have been applied. Response may contain partial success.
- **400**: Billing profile(s) couldn't be applied because of invalid request payload.
- **401**: Billing profile(s) couldn't be applied because of unauthenticated access.
- **500**: Billing profile(s) couldn't be applied because of internal error.

### POST /billingProfileUsages/list

**Summary:** Lists the billing profiles linked to each country of global ads account.

**Operation ID:** GetBillingProfileUsages

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/vnd.billingProfileUsage.v1+json`

**Responses:**

- **200**: Linked billing profile(s) are successfully fetched.
- **400**: Operation failed because of invalid request payload.
- **401**: Operation failed because of unauthenticated access
- **500**: Operation failed because of internal error

### POST /billingProfiles

**Summary:** API to create one or more billing profile(s).

Creates one or more billing profiles. A Billing Profile contains billing information (address, taxes, agreements etc..) that will be used for invoicing and other billing workflows.

**Operation ID:** CreateBillingProfiles

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: Billing profile(s) created. Response may contain partial success.
- **400**: Billing profile(s) couldn't be created because of invalid request payload.
- **401**: Billing profile(s) couldn't be created because of unauthenticated access.
- **500**: Billing profile(s) couldn't be created because of internal error.

### PUT /billingProfiles

**Summary:** API to update one or more billing profile(s).

Updates one or more billing profiles under a global account. Note that `isBillTo` and `type` are immutable attributes and cannot be updated.

**Operation ID:** UpdateBillingProfiles

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: Billing profile(s) is(are) updated. Response may contain partial success.
- **400**: Billing profile(s) couldn't be updated because of invalid request payload.
- **401**: Billing profile(s) couldn't be updated because of unauthenticated access.
- **500**: Billing profile(s) couldn't be updated because of internal error.

### POST /billingProfiles/list

**Summary:** Fetches billing profiles present under the global account.

Fetches billing profiles present under the global account. Supports pagination with `nextToken` and customizable `maxResults`.

**Operation ID:** GetBillingProfiles

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/vnd.billingProfile.v1+json`

**Responses:**

- **200**: Billing profile(s) is(are) fetched.
- **400**: Billing profile(s) couldn't be fetched because of invalid request payload.
- **401**: Billing profile(s) couldn't be fetched because of unauthenticated access.
- **500**: Billing profile(s) couldn't be fetched because of internal error.

### POST /billingStatements

**Summary:** API to request billing statement generation for an Advertising account.

**Operation ID:** CreateBillingStatement

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | No | The identifier of a profile associated with the advertiser account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of a profile associated with the advertiser account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/vnd.createbillingstatementsrequest.v1+json`

**Responses:**

- **202**: Billing statement creation request accepted and request identifier is generated.
- **400**: Bad Request, caused due to invalid argument passed in the request.
- **401**: Unauthorized - The request failed because the user is not authenticated.
- **403**: Forbidden - The request failed because the caller is not authorized.
- **404**: Account doesn't exist for which billing statement is requested.
- **500**: Internal server error.

### GET /billingStatements/{billingStatementRequestId}

**Summary:** API to fetch the latest status of Billing Statements creation request.

**Operation ID:** GetBillingStatement

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | No | The identifier of a profile associated with the advertiser account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of a profile associated with the advertiser account. |
| billingStatementRequestId | path | string | Yes | Billing Statement Request Id. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Responses:**

- **200**: Successful Operation.
- **401**: Unauthorized - The request failed because the user is not authenticated.
- **403**: Forbidden - The request failed because the caller is not authorized.
- **404**: Billing Statement not found for the given billingStatementRequestId.

### POST /invoiceSummaries/list

**Summary:** Lists the billing invoice summary(s) in a global ads account.

**Operation ID:** GetBillingInvoiceSummaries

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Ads-AccountId | header | string | No | The identifier of an account. Account can be a global advertising account. |
| Amazon-Advertising-API-Manager-Account | header | string | No | The identifier of a manager account. |

**Request Body:**

Content-Type: `application/vnd.billingInvoiceSummary.v1+json`

**Responses:**

- **200**: Contains an object encapsulating either the aggregation result(s) or sorted & filtered billing invoice summary(s).
- **400**: Operation failed because of invalid request payload.
- **401**: Operation failed because of unauthenticated access
- **500**: Operation failed because of internal error

### GET /invoices

**Summary:** Get invoices for advertiser

**Operation ID:** getAdvertiserInvoices

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| invoiceStatuses | query | array | No | Filter invoices by status. |
| startDate | query | | No | The starting date (inclusive) of the date range for filtering invoices (ISO format). |
| endDate | query | | No | The ending date (inclusive) of the date range for filtering invoices (ISO format). |
| count | query | integer | No | Number of records to include in the paged response. Defaults to 100. |
| cursor | query | string | No | A cursor representing how far into a result set this query should begin. |

**Responses:**

- **200**: successful operation
- **400**: Bad Request
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource,
- **404**: Not Found - Requested account was not found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

### GET /invoices/{invoiceId}

**Summary:** Get invoice data by invoice ID

**Operation ID:** getInvoice

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| invoiceId | path | string | Yes | ID of invoice to fetch |

**Responses:**

- **200**: Successful Operation
- **400**: Bad Request
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource,
- **404**: Not Found - Requested invoice was not found.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.
