# Amazon Ads API Authorization Overview

> Source: https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/overview

## Access Requirements

The Amazon Ads API follows an **OAuth 2.0 flow** managed through Login with Amazon (LwA). Both the advertiser and the client application must participate to make a successful call.

- **Advertiser**: An Amazon Ads customer account that controls access to its data.
- **Client**: A Login with Amazon application approved to call the Amazon Ads API.

Even when the advertiser and developer share login credentials, the advertiser must explicitly authorize the client.

## Authorization Flow

1. Advertiser visits a consent URL associated with the client identifier
2. Advertiser confirms consent via Login with Amazon UI
3. LwA generates a one-time **authorization code**
4. Client exchanges authorization code + client credentials for **access token** and **refresh token**
5. Client uses access token to retrieve **profile identifier** for the advertiser
6. Client uses all three credentials (client ID, access token, profile ID) for API calls

## Required Authorization Headers

Every request to the Amazon Ads API requires:

| Header | Description |
|--------|-------------|
| `Amazon-Advertising-API-ClientId` | The client identifier of an LwA application authorized to access the API |
| `Authorization` | `Bearer ` prepended to an access token for the advertiser |
| `Amazon-Advertising-API-Scope` | A profile identifier for the advertiser's marketplace account (required for nearly all resources) |

If headers are missing or incorrect → `401 Unauthorized` response.

## Learn More

- [Authorization Grants](authorization-grants.md)
- [Access Tokens](authorization-access-tokens.md)
- [Profiles](authorization-profiles.md)
