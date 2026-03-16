# Profiles

> Source: https://advertising.amazon.com/API/docs/en-us/guides/account-management/authorization/profiles

Profiles represent an advertiser's account in a specific marketplace. The `profileId` is passed as the `Amazon-Advertising-API-Scope` header in nearly all API calls.

## Retrieving Profiles

```bash
GET /v2/profiles HTTP/1.1
Host: advertising-api.amazon.com
Content-Type: application/json
Authorization: Bearer Atza|zZzZzZzZ
Amazon-Advertising-API-ClientId: amzn1.application-oa2-client.XXX
```

- This call does **not** require the `Amazon-Advertising-API-Scope` header
- Returns a maximum of **5,000 profiles**
- Use `profileTypeFilter` to filter by account type
- Use `apiProgram` and `accessLevel` to filter by permission level

## Response Example

```json
[
  {
    "profileId": 999999999,
    "countryCode": "US",
    "currencyCode": "USD",
    "timezone": "America/Los_Angeles",
    "accountInfo": {
      "marketplaceStringId": "ATVPDKIKX0DER",
      "id": "ENTITYZIbbbbbrrr",
      "type": "vendor",
      "name": "Name of the Account",
      "validPaymentMethod": true
    }
  }
]
```

## Regional Behavior

The Profiles resource returns **only** profiles whose marketplace falls within the region of the API host:

| API Host | Region | Marketplaces |
|----------|--------|-------------|
| `advertising-api.amazon.com` | NA | US, CA, MX, BR |
| `advertising-api-eu.amazon.com` | EU | UK, FR, IT, ES, DE, NL, AE, PL, TR, EG, SA, SE, BE, IN, ZA |
| `advertising-api-fe.amazon.com` | FE | JP, AU, SG |

## Profile Types

| Type | Account | Used With |
|------|---------|-----------|
| `vendor` | Vendor | SP, SB, SD |
| `seller` | Seller | SP, SB, SD (SB/SD require Brand Registry) |
| `agency` | Agency | DSP and Data Provider APIs only |
