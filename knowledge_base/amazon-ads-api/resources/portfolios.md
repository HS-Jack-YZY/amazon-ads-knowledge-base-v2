---
title: Portfolios
source: https://advertising.amazon.com/API/docs/en-us/reference/portfolios
section: Accounts
---

# Portfolios (3.0)

This API allows users to do Portfolios management operations.

# Budget Usage

## Budget usage API for portfolios

`POST /portfolios/budget/usage`

Endpoint: https://d1y2lf8k3vrkfu.cloudfront.net/portfolios/budget/usage

Requires one of these permissions: ["advertiser_campaign_edit","advertiser_campaign_view"]

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | any | The identifier of a client associated with a "Login with Amazon" account. This is a required header for advertisers and integrators using the Advertising API. |
| Amazon-Advertising-API-Scope (required) | any | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. This is a required header for advertisers and integrators using the Advertising API. |

##### Request Body schema: application/vnd.portfoliobudgetusage.v1+json

| Field | Type | Description |
|---|---|---|
| portfolioIds | Array of strings [1..100] items | A list of portfolio IDs. |

### Responses

- 207 Multi-status. An object containing a list of budget usage response objects reflecting the same order as the input.
- 400 Bad Request.
- 401 Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.
- 403 Forbidden. The request failed because user does not have access to a specified resource.
- 422 Unprocessable entity. The server understood the request, but was unable to process the instruction.
- 429 Too Many Requests. The request was rate-limited. Retry later.
- 500 Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.

### Request samples

Content type: application/vnd.portfoliobudgetusage.v1+json

```json
{
  "portfolioIds": ["string"]
}
```

### Response samples

Content type: application/vnd.portfoliobudgetusage.v1+json

```json
{
  "error": [
    {
      "code": "string",
      "details": "string",
      "index": 0,
      "portfolioId": "string"
    }
  ],
  "success": [
    {
      "budget": 0,
      "budgetUsagePercent": 0,
      "index": 0,
      "portfolioId": "string",
      "usageUpdatedTimestamp": "2019-08-24T14:15:22Z"
    }
  ]
}
```

# Portfolios

## CreatePortfolios

`POST /portfolios`

Endpoint: https://d1y2lf8k3vrkfu.cloudfront.net/portfolios

Requires one of these permissions: ["advertiser_campaign_edit"]

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Prefer | string | The "Prefer" header, as defined in [RFC7240], allows clients to request certain behavior from the service. Supported preferences: return=canonicalObjectId (default), return=obfuscatedObjectId, return=representation. |

##### Request Body schema: application/vnd.spPortfolio.v3+json (required)

| Field | Type | Description |
|---|---|---|
| portfolios (required) | Array of objects (CreatePortfolio) [1..100] items | An array of portfolio to create. |

### Responses

- 207 CreatePortfolios 207 response
- 400 SchemaValidationException 400 response
- 401 UnauthorizedException 401 response
- 403 AccessDeniedException 403 response
- 415 UnsupportedMediaTypeException 415 response
- 429 ThrottlingException 429 response
- 500 InternalServerException 500 response

### Request samples

Content type: application/vnd.spPortfolio.v3+json

```json
{
  "portfolios": [
    {
      "budget": {
        "amount": 0.1,
        "currencyCode": "AED",
        "endDate": "2019-08-24",
        "policy": "DATE_RANGE",
        "startDate": "2019-08-24"
      },
      "budgetControls": {
        "campaignUnspentBudgetSharing": {
          "featureState": "DISABLED"
        }
      },
      "name": "string",
      "state": "ENABLED"
    }
  ]
}
```

### Response samples

Content type: application/vnd.spPortfolio.v3+json

```json
{
  "portfolios": {
    "error": [
      {
        "errors": [
          {
            "errorType": "string",
            "errorValue": { }
          }
        ],
        "index": 0
      }
    ],
    "success": [
      {
        "index": 0,
        "portfolio": {
          "budget": {
            "amount": 0.1,
            "currencyCode": "AED",
            "endDate": "2019-08-24",
            "policy": "DATE_RANGE",
            "startDate": "2019-08-24"
          },
          "budgetControls": {
            "campaignUnspentBudgetSharing": {
              "featureState": "DISABLED"
            }
          },
          "extendedData": {
            "creationDateTime": "2019-08-24T14:15:22Z",
            "lastUpdateDateTime": "2019-08-24T14:15:22Z",
            "servingStatus": "ADVERTISER_ACCOUNT_OUT_OF_BUDGET",
            "statusReasons": ["ADVERTISER_ACCOUNT_OUT_OF_BUDGET_DETAIL"]
          },
          "inBudget": true,
          "name": "string",
          "portfolioId": "string",
          "state": "ENABLED"
        },
        "portfolioId": "string"
      }
    ]
  }
}
```

## UpdatePortfolios

`PUT /portfolios`

Endpoint: https://d1y2lf8k3vrkfu.cloudfront.net/portfolios

Requires one of these permissions: ["advertiser_campaign_edit"]

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Prefer | string | The "Prefer" header, as defined in [RFC7240], allows clients to request certain behavior from the service. Supported preferences: return=canonicalObjectId (default), return=obfuscatedObjectId, return=representation. |

##### Request Body schema: application/vnd.spPortfolio.v3+json (required)

| Field | Type | Description |
|---|---|---|
| portfolios (required) | Array of objects (UpdatePortfolio) [1..100] items | An array of portfolio with updated values. |

### Responses

- 207 UpdatePortfolios 207 response
- 400 SchemaValidationException 400 response
- 401 UnauthorizedException 401 response
- 403 AccessDeniedException 403 response
- 415 UnsupportedMediaTypeException 415 response
- 429 ThrottlingException 429 response
- 500 InternalServerException 500 response

### Request samples

Content type: application/vnd.spPortfolio.v3+json

```json
{
  "portfolios": [
    {
      "budget": {
        "amount": 0.1,
        "currencyCode": "AED",
        "endDate": "2019-08-24",
        "policy": "DATE_RANGE",
        "startDate": "2019-08-24"
      },
      "budgetControls": {
        "campaignUnspentBudgetSharing": {
          "featureState": "DISABLED"
        }
      },
      "name": "string",
      "portfolioId": "string",
      "state": "ENABLED"
    }
  ]
}
```

## ListPortfolios

`POST /portfolios/list`

Endpoint: https://d1y2lf8k3vrkfu.cloudfront.net/portfolios/list

Requires one of these permissions: ["advertiser_campaign_edit","advertiser_campaign_view"]

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. |
| Prefer | string | The "Prefer" header, as defined in [RFC7240], allows clients to request certain behavior from the service. Supported preferences: return=canonicalObjectId (default), return=obfuscatedObjectId, return=representation. |

##### Request Body schema: application/vnd.spPortfolio.v3+json

| Field | Type | Description |
|---|---|---|
| includeExtendedDataFields | boolean | Whether to get a list of portfolios with extended data fields (creationDate, lastUpdateDate, servingStatus). |
| nameFilter | object (NameFilter) | Filter entities by name. |
| nextToken | string | Token value allowing to navigate to the next response page. |
| portfolioIdFilter | object (ObjectIdFilter) | Filter entities by the list of objectIds. |
| stateFilter | object (EntityStateFilter) | Filter entities by state. |

### Responses

- 200 ListPortfolios 200 response
- 400 PortfolioAccessException 400 response
- 401 UnauthorizedException 401 response
- 403 AccessDeniedException 403 response
- 415 UnsupportedMediaTypeException 415 response
- 429 ThrottlingException 429 response
- 500 InternalServerException 500 response

### Request samples

Content type: application/vnd.spPortfolio.v3+json

```json
{
  "includeExtendedDataFields": true,
  "nameFilter": {
    "include": ["string"],
    "queryTermMatchType": "BROAD_MATCH"
  },
  "nextToken": "string",
  "portfolioIdFilter": {
    "include": ["string"]
  },
  "stateFilter": {
    "include": ["ENABLED"]
  }
}
```

### Response samples

Content type: application/vnd.spPortfolio.v3+json

```json
{
  "nextToken": "string",
  "portfolios": [
    {
      "budget": {
        "amount": 0.1,
        "currencyCode": "AED",
        "endDate": "2019-08-24",
        "policy": "DATE_RANGE",
        "startDate": "2019-08-24"
      },
      "budgetControls": {
        "campaignUnspentBudgetSharing": {
          "featureState": "DISABLED"
        }
      },
      "extendedData": {
        "creationDateTime": "2019-08-24T14:15:22Z",
        "lastUpdateDateTime": "2019-08-24T14:15:22Z",
        "servingStatus": "ADVERTISER_ACCOUNT_OUT_OF_BUDGET",
        "statusReasons": ["ADVERTISER_ACCOUNT_OUT_OF_BUDGET_DETAIL"]
      },
      "inBudget": true,
      "name": "string",
      "portfolioId": "string",
      "state": "ENABLED"
    }
  ],
  "totalResults": 0
}
```
