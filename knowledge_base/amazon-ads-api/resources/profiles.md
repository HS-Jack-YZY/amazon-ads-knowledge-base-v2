---
title: Profiles
source: https://advertising.amazon.com/API/docs/en-us/reference/2/profiles
section: Accounts
---

# Amazon Ads API - Profiles (3.0)

URL: https://amzn-clicks.atlassian.net/servicedesk/customer/portals
License: Amazon Ads API License Agreement

Profiles represent an advertiser and their account's marketplace, and are used in all subsequent API calls via a management scope, Amazon-Advertising-API-Scope. Reports and all entity management operations are associated with a single profile. Advertisers cannot have more than one profile for each marketplace.

Advertisers who operate in more than one marketplace (for example, Amazon.com, Amazon.co.uk, Amazon.co.jp) will have only one profile associated with each marketplace. See this link for a list of marketplaces associated with each endpoint.

To retrieve your profile IDs, call the listProfiles operation, and include a valid authorization access token in the header. Use a profileId from the returned list as the value for the management scope (Amazon-Advertising-API-Scope) in the headers for subsequent API calls.

# Profiles

## Gets a list of profiles.

`GET /v2/profiles`

Endpoints:
- https://advertising-api.amazon.com (North America) /v2/profiles
- https://advertising-api-eu.amazon.com (Europe) /v2/profiles
- https://advertising-api-fe.amazon.com (Far East) /v2/profiles

Note that this operation does not return a response unless the current account has created at least one campaign using the advertising console.

##### Authorizations:

oauth2AuthorizationCode / bearerAuth

##### Query Parameters

| Parameter | Type | Description |
|---|---|---|
| apiProgram | string | Default: "campaign". Enum: "billing" "campaign" "paymentMethod" "store" "report" "account" "posts". Filters response to include profiles that have permissions for the specified Advertising API program only. Setting apiProgram=billing filters the response to include only profiles to which the user and application associated with the access token have permission to view or edit billing information. |
| accessLevel | string | Default: "edit". Enum: "edit" "view". Filters response to include profiles that have specified permissions for the specified Advertising API program only. Currently, the only supported access level is view and edit. Setting accessLevel=view filters the response to include only profiles to which the user and application associated with the access token have view permission to the provided api program. |
| profileTypeFilter | string | Enum: "seller" "vendor" "agency". Filters response to include profiles that are of the specified types in the comma-delimited list. Default is all types. Note that this filter performs an inclusive AND operation on the types. |
| validPaymentMethodFilter | string | Enum: "true" "false". Filter response to include profiles that have valid payment methods. Default is to include all profiles. Setting this filter to true returns only profiles with either no validPaymentMethod field, or the validPaymentMethod field set to true. Setting this to false returns profiles with the validPaymentMethod field set to false only. |

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. |

### Responses

200 Success.

### Response samples

Content type: application/json

```json
[
  {
    "profileId": 0,
    "countryCode": "BR",
    "currencyCode": "BRL",
    "dailyBudget": 0,
    "timezone": "Africa/Cairo",
    "accountInfo": {
      "marketplaceStringId": "string",
      "id": "string",
      "type": "vendor",
      "name": "string",
      "subType": "KDP_AUTHOR",
      "validPaymentMethod": true
    }
  }
]
```

## Update the daily budget for one or more profiles.

`PUT /v2/profiles`

Endpoints:
- https://advertising-api.amazon.com (North America) /v2/profiles
- https://advertising-api-eu.amazon.com (Europe) /v2/profiles
- https://advertising-api-fe.amazon.com (Far East) /v2/profiles

Note that this operation is only used for Sellers using Sponsored Products. This operation is not enabled for vendor type accounts.

##### Authorizations:

oauth2AuthorizationCode / bearerAuth

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. |

##### Request Body schema: application/json

| Field | Type | Description |
|---|---|---|
| profileId | integer \<int64\> | |
| dailyBudget | number | Note that this field applies to Sponsored Product campaigns for seller type accounts only. Not supported for vendor type accounts. |
| accountInfo | object (AccountInfo) | |

### Responses

200 success

### Request samples

Content type: application/json

```json
[
  {
    "profileId": 0,
    "dailyBudget": 0,
    "accountInfo": {}
  }
]
```

### Response samples

Content type: application/json

```json
[
  {
    "profileId": 0,
    "code": "string",
    "details": "string"
  }
]
```

## Gets a profile specified by identifier.

`GET /v2/profiles/{profileId}`

Endpoints:
- https://advertising-api.amazon.com (North America) /v2/profiles/{profileId}
- https://advertising-api-eu.amazon.com (Europe) /v2/profiles/{profileId}
- https://advertising-api-fe.amazon.com (Far East) /v2/profiles/{profileId}

This operation does not return a response unless the current account has created at least one campaign using the advertising console.

##### Authorizations:

oauth2AuthorizationCode / bearerAuth

##### Path Parameters

| Parameter | Type |
|---|---|
| profileId (required) | integer \<int64\> |

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. |

### Responses

200 Success.

### Response samples

Content type: application/json

```json
{
  "profileId": 0,
  "countryCode": "BR",
  "currencyCode": "BRL",
  "dailyBudget": 0,
  "timezone": "Africa/Cairo",
  "accountInfo": {
    "marketplaceStringId": "string",
    "id": "string",
    "type": "vendor",
    "name": "string",
    "subType": "KDP_AUTHOR",
    "validPaymentMethod": true
  }
}
```
