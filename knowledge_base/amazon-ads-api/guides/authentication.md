---
title: Amazon Ads API Authentication Guide
source: Multiple Amazon Ads documentation pages
section: Guides
---

# Amazon Ads API Authentication Guide

## Overview

Amazon Ads API uses **Login with Amazon (LWA)** OAuth 2.0 for authentication. All API requests must include valid authentication headers.

## Prerequisites

1. **Amazon Developer Account** - Register at developer.amazon.com
2. **Amazon Ads API Access** - Apply through the Amazon Advertising console
3. **LWA Application** - Create a Login with Amazon security profile

## OAuth 2.0 Flow

### Step 1: Register Your Application

1. Go to [Amazon Developer Console](https://developer.amazon.com)
2. Create a new Login with Amazon (LWA) security profile
3. Note your **Client ID** and **Client Secret**
4. Set up your **Redirect URI**

### Step 2: Get Authorization Code

Redirect the user to:
```
https://www.amazon.com/ap/oa?client_id={CLIENT_ID}&scope=advertising::campaign_management&response_type=code&redirect_uri={REDIRECT_URI}
```

Scopes available:
- `advertising::campaign_management` - Full campaign management access

### Step 3: Exchange Code for Tokens

POST to `https://api.amazon.com/auth/o2/token`:
```json
{
  "grant_type": "authorization_code",
  "code": "{AUTH_CODE}",
  "redirect_uri": "{REDIRECT_URI}",
  "client_id": "{CLIENT_ID}",
  "client_secret": "{CLIENT_SECRET}"
}
```

Response:
```json
{
  "access_token": "...",
  "refresh_token": "...",
  "token_type": "bearer",
  "expires_in": 3600
}
```

### Step 4: Refresh Access Token

Access tokens expire after **1 hour**. Use the refresh token to get new ones:

POST to `https://api.amazon.com/auth/o2/token`:
```json
{
  "grant_type": "refresh_token",
  "refresh_token": "{REFRESH_TOKEN}",
  "client_id": "{CLIENT_ID}",
  "client_secret": "{CLIENT_SECRET}"
}
```

## Required API Headers

Every API request must include:

| Header | Value | Description |
|--------|-------|-------------|
| `Authorization` | `Bearer {access_token}` | OAuth access token |
| `Amazon-Advertising-API-ClientId` | `{client_id}` | Your LWA client ID |
| `Amazon-Advertising-API-Scope` | `{profile_id}` | Target advertising profile ID |
| `Content-Type` | `application/json` | Request body format |
| `Accept` | `application/json` | Response format |

## LWA Endpoints (Regional)

Token endpoints are **not region-specific**. You can use any of these:
- `https://api.amazon.com/auth/o2/token` (default)
- `https://api.amazon.co.uk/auth/o2/token` (EU)
- `https://api.amazon.co.jp/auth/o2/token` (FE)

**Note**: Applications are not region-specific. You can create, verify, and refresh tokens using any regional LWA endpoint.

## Python Example

```python
import requests

# Token refresh
def refresh_access_token(client_id, client_secret, refresh_token):
    url = "https://api.amazon.com/auth/o2/token"
    payload = {
        "grant_type": "refresh_token",
        "refresh_token": refresh_token,
        "client_id": client_id,
        "client_secret": client_secret
    }
    response = requests.post(url, data=payload)
    response.raise_for_status()
    return response.json()["access_token"]

# API request
def get_profiles(access_token, client_id):
    url = "https://advertising-api.amazon.com/v2/profiles"
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Amazon-Advertising-API-ClientId": client_id,
        "Content-Type": "application/json"
    }
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()
```

## Postman Collection

Amazon provides an official Postman collection at:
https://github.com/amzn/ads-advanced-tools-docs/tree/main/postman

Files:
- `Amazon_Ads_API.postman_collection.json` - API endpoint collection
- `Amazon_Ads_API_Environment.postman_environment.json` - Environment variables

The collection includes pre/post-request scripts for automatic token management.

## Useful Links

- [Authorization Overview](https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/overview)
- [Retrieve Access Token](https://advertising.amazon.com/API/docs/en-us/guides/get-started/retrieve-access-token)
- [Authorization Grants](https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/authorization-grants)
- [Python Auth Guide](https://advertising.amazon.com/API/docs/en-us/guides/usage-examples/2025-03-step-by-step-guide-authorization-amazon-ads-api-requests-using-python)
