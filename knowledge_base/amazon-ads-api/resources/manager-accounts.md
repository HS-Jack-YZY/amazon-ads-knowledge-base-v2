---
title: Manager Account
source: https://advertising.amazon.com/API/docs/en-us/reference/1-0/managerAccount
section: Accounts
---

# Manager Account (3.0)

A Manager Account lets you manage a group of Amazon Advertising accounts.

# Manager Accounts

## Returns all manager accounts that a given Amazon Ads user has access to.

`GET /managerAccounts`

Endpoint: https://dtrnk0o2zy01c.cloudfront.net/managerAccounts

Returns all manager accounts that a user has access to, along with metadata for the Amazon Ads accounts that are linked to each manager account. NOTE: A maximum of 50 linked accounts are returned for each manager account.

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. This is a required header for advertisers and integrators using the Advertising API. |

### Responses

- 200 Success - operation succeeded.
- 400 Bad Request - request failed because invalid parameters were provided. Ensure that all required parameters were provided.
- 401 Unauthorized - request failed because user is not authenticated or is not allowed to invoke the operation.
- 403 Forbidden - request failed because user does not have access to a specified resource.
- 429 Too Many Requests - request was rate-limited. Retry later.
- 500 Internal Service Error - something failed in the server. Please try again later. If the issue persists, report an error.

### Response samples

Content type: application/vnd.getmanageraccountsresponse.v1+json

```json
{
  "managerAccounts": [
    {
      "linkedAccounts": [
        {
          "accountId": "string",
          "accountName": "string",
          "accountType": "DSP_ADVERTISING_ACCOUNT",
          "dspAdvertiserId": "string",
          "marketplaceId": "string",
          "profileId": "string"
        }
      ],
      "managerAccountId": "string",
      "managerAccountName": "string"
    }
  ]
}
```

## Creates a new Amazon Advertising Manager account.

`POST /managerAccounts`

Endpoint: https://dtrnk0o2zy01c.cloudfront.net/managerAccounts

Creates a new Amazon Advertising Manager account.

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. This is a required header for advertisers and integrators using the Advertising API. |

##### Request Body schema: application/vnd.createmanageraccountrequest.v1+json (required)

Request object required to create a new Manager account.

| Field | Type | Description |
|---|---|---|
| managerAccountName | string | Name of the Manager account. |
| managerAccountType | string | Enum: "Advertiser" "Agency". Type of the Manager account, which indicates how the Manager account will be used. Use Advertiser if the Manager account will be used for your own products and services, or Agency if you are managing accounts on behalf of your clients. |

### Responses

- 200 Success - operation succeeded.
- 400 Bad Request - request failed because invalid parameters were provided. Ensure that all required parameters were provided.
- 403 Forbidden - request failed because the caller was not authorized to create a Manager account.
- 429 Too Many Requests - request was rate-limited. Retry later.
- 500 Internal Service Error - something failed in the server. Please try again later. If the issue persists, report an error.

### Request samples

Content type: application/vnd.createmanageraccountrequest.v1+json

```json
{
  "managerAccountName": "string",
  "managerAccountType": "Advertiser"
}
```

### Response samples

Content type: application/vnd.manageraccount.v1+json

```json
{
  "linkedAccounts": [
    {
      "accountId": "string",
      "accountName": "string",
      "accountType": "DSP_ADVERTISING_ACCOUNT",
      "dspAdvertiserId": "string",
      "marketplaceId": "string",
      "profileId": "string"
    }
  ],
  "managerAccountId": "string",
  "managerAccountName": "string"
}
```

## Link Amazon Advertising accounts or advertisers with a Manager Account.

`POST /managerAccounts/{managerAccountId}/associate`

Endpoint: https://dtrnk0o2zy01c.cloudfront.net/managerAccounts/{managerAccountId}/associate

Link Amazon Advertising accounts or advertisers with a Manager Account.

##### Path Parameters

| Parameter | Type | Description |
|---|---|---|
| managerAccountId (required) | string | Id of the Manager Account. |

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. This is a required header for advertisers and integrators using the Advertising API. |

##### Request Body schema: application/vnd.updateadvertisingaccountsinmanageraccountrequest.v1+json (required)

| Field | Type | Description |
|---|---|---|
| accounts | Array of objects (AccountToUpdate) | List of Advertising accounts or advertisers to link/unlink with Manager Account. User can pass a list with a maximum of 20 accounts/advertisers using any mix of identifiers. |

### Responses

- 207 Multi-Status - Some Advertising accounts or advertisers may not have been linked successfully.
- 400 Bad Request - request failed because invalid parameters were provided. Ensure that all required parameters were provided.
- 401 Unauthorized - request failed because user is not authenticated or is not allowed to invoke the operation.
- 403 Forbidden - request failed because user does not have access to a specified resource.
- 429 Too Many Requests - request was rate-limited. Retry later.
- 500 Internal Service Error - something failed in the server. Please try again later. If the issue persists, report an error.

### Request samples

Content type: application/vnd.updateadvertisingaccountsinmanageraccountrequest.v1+json

```json
{
  "accounts": [
    {
      "id": "string",
      "roles": ["ENTITY_OWNER"],
      "type": "ACCOUNT_ID"
    }
  ]
}
```

### Response samples

Content type: application/vnd.updateadvertisingaccountsinmanageraccountresponse.v1+json

```json
{
  "failedAccounts": [
    {
      "account": {
        "id": "string",
        "roles": ["ENTITY_OWNER"],
        "type": "ACCOUNT_ID"
      },
      "error": {
        "code": "BAD_REQUEST",
        "message": "string"
      }
    }
  ],
  "succeedAccounts": [
    {
      "id": "string",
      "roles": ["ENTITY_OWNER"],
      "type": "ACCOUNT_ID"
    }
  ]
}
```

## Unlink Amazon Advertising accounts or advertisers with a Manager Account.

`POST /managerAccounts/{managerAccountId}/disassociate`

Endpoint: https://dtrnk0o2zy01c.cloudfront.net/managerAccounts/{managerAccountId}/disassociate

Unlink Amazon Advertising accounts or advertisers with a Manager Account.

##### Path Parameters

| Parameter | Type | Description |
|---|---|---|
| managerAccountId (required) | string | Id of the Manager Account. |

##### Header Parameters

| Parameter | Type | Description |
|---|---|---|
| Amazon-Advertising-API-ClientId (required) | string | The identifier of a client associated with a "Login with Amazon" account. This is a required header for advertisers and integrators using the Advertising API. |

##### Request Body schema: application/vnd.updateadvertisingaccountsinmanageraccountrequest.v1+json (required)

| Field | Type | Description |
|---|---|---|
| accounts | Array of objects (AccountToUpdate) | List of Advertising accounts or advertisers to link/unlink with Manager Account. User can pass a list with a maximum of 20 accounts/advertisers using any mix of identifiers. |

### Responses

- 207 Multi-Status - Some Advertising accounts or advertisers may not have been linked successfully.
- 400 Bad Request - request failed because invalid parameters were provided. Ensure that all required parameters were provided.
- 401 Unauthorized - request failed because user is not authenticated or is not allowed to invoke the operation.
- 403 Forbidden - request failed because user does not have access to a specified resource.
- 429 Too Many Requests - request was rate-limited. Retry later.
- 500 Internal Service Error - something failed in the server. Please try again later. If the issue persists, report an error.

### Request samples

Content type: application/vnd.updateadvertisingaccountsinmanageraccountrequest.v1+json

```json
{
  "accounts": [
    {
      "id": "string",
      "roles": ["ENTITY_OWNER"],
      "type": "ACCOUNT_ID"
    }
  ]
}
```

### Response samples

Content type: application/vnd.updateadvertisingaccountsinmanageraccountresponse.v1+json

```json
{
  "failedAccounts": [
    {
      "account": {
        "id": "string",
        "roles": ["ENTITY_OWNER"],
        "type": "ACCOUNT_ID"
      },
      "error": {
        "code": "BAD_REQUEST",
        "message": "string"
      }
    }
  ],
  "succeedAccounts": [
    {
      "id": "string",
      "roles": ["ENTITY_OWNER"],
      "type": "ACCOUNT_ID"
    }
  ]
}
```
