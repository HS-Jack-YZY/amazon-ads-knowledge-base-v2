# Authorization Grants

> Source: https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/authorization-grants

An authorization code represents a specific advertiser's consent for a specific client to access the advertiser's data.

## Consent Request URL

Regional hosts for the consent request page:

| Region | URL Prefix |
|--------|-----------|
| North America (NA) | `https://www.amazon.com/ap/oa` |
| Europe (EU) | `https://eu.account.amazon.com/ap/oa` |
| Far East (FE) | `https://apac.account.amazon.com/ap/oa` |

### Query Parameters

| Parameter | Description |
|-----------|-------------|
| client_id | The client identifier of the client application |
| scope | OAuth 2.0 permission scope. Use `advertising::campaign_management` for most API uses. Use `advertising::audiences` for Data Provider API |
| response_type | Always `code` |
| redirect_uri | URL to redirect advertiser after allowing access |
| state | *(Optional)* Opaque value for maintaining state between request and response |
| code_challenge | *(Optional)* For PKCE security |
| code_challenge_method | *(Optional)* Method used to encode the code_verifier |

### Example

```
https://www.amazon.com/ap/oa?client_id=YOUR_LWA_CLIENT_ID&scope=advertising::campaign_management&response_type=code&redirect_uri=YOUR_RETURN_URL
```

## Retrieving Authorization Codes

After confirming consent, the advertiser is redirected to `redirect_uri` with the code appended:

```
https://www.amazon.com/?code=xxxxxxxxxxxxxxxxxxx&scope=advertising%3A%3Acampaign_management
```

## Key Facts

- Authorization codes are valid for **5 minutes**
- Authorization codes are valid **globally** across LwA hosts
- An authorization code can be used to retrieve an access token and refresh token
