# Access Tokens

> Source: https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/access-tokens

Access tokens represent a specific advertiser's consent for a specific client to access the advertiser's data. They are valid for **60 minutes** and are **global** (work across all regions).

## Authorization Servers

| Region | URL |
|--------|-----|
| North America (NA) | `https://api.amazon.com/auth/o2/token` |
| Europe (EU) | `https://api.amazon.co.uk/auth/o2/token` |
| Far East (FE) | `https://api.amazon.co.jp/auth/o2/token` |

## Retrieving via Authorization Code

```bash
curl -X POST \
  --data "grant_type=authorization_code&code=AUTH_CODE&redirect_uri=YOUR_RETURN_URL&client_id=YOUR_CLIENT_ID&client_secret=YOUR_SECRET_KEY" \
  https://api.amazon.com/auth/o2/token
```

> Authorization codes expire after 5 minutes and may be used only once.

## Refreshing an Access Token

```bash
curl -X POST \
  --data "grant_type=refresh_token&client_id=YOUR_CLIENT_ID&refresh_token=YOUR_REFRESH_TOKEN&client_secret=YOUR_CLIENT_SECRET" \
  https://api.amazon.com/auth/o2/token
```

> A refresh token remains valid until the user who granted authorization revokes it.

## Response Format

```json
{
    "access_token": "Atza|IQEBLjAsAhRmHjNgHpi0U-Dme37rR6CuUpSR...",
    "token_type": "bearer",
    "expires_in": 3600,
    "refresh_token": "Atzr|IQEBLzAtAhRPpMJxdwVz2Nn6f2y-tpJX2DeX..."
}
```

## Token Prefixes

- Access tokens begin with `Atza|`
- Refresh tokens begin with `Atzr|`

## Usage in API Calls

Include in the `Authorization` header:

```
Authorization: Bearer Atza|IQEBLjAsAhRmHjNgHpi0U-Dme37rR6CuUpSR...
```
