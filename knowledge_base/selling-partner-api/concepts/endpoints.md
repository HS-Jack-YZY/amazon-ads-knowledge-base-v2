---
title: SP-API Endpoints & Marketplace IDs
source: https://developer-docs.amazon.com/sp-api/docs/sp-api-endpoints
---

# SP-API Endpoints & Marketplace IDs

## Production Endpoints

| Region | Endpoint | AWS Region |
|--------|----------|------------|
| North America (NA) | `https://sellingpartnerapi-na.amazon.com` | us-east-1 |
| Europe (EU) | `https://sellingpartnerapi-eu.amazon.com` | eu-west-1 |
| Far East (FE) | `https://sellingpartnerapi-fe.amazon.com` | us-west-2 |

## Sandbox Endpoints

| Region | Endpoint |
|--------|----------|
| North America (NA) | `https://sandbox.sellingpartnerapi-na.amazon.com` |
| Europe (EU) | `https://sandbox.sellingpartnerapi-eu.amazon.com` |
| Far East (FE) | `https://sandbox.sellingpartnerapi-fe.amazon.com` |

## Marketplace ID Reference

### North America (NA)

| Country | Marketplace ID | Code |
|---------|----------------|------|
| Canada | A2EUQ1WTGCTBG2 | CA |
| United States | ATVPDKIKX0DER | US |
| Mexico | A1AM78C64UM0Y8 | MX |
| Brazil | A2Q3Y263D00KWC | BR |

### Europe (EU)

| Country | Marketplace ID | Code |
|---------|----------------|------|
| Ireland | A28R8C7NBKEWEA | IE |
| Spain | A1RKKUPIHCS9HS | ES |
| United Kingdom | A1F83G8C2ARO7P | UK |
| France | A13V1IB3VIYZZH | FR |
| Belgium | AMEN7PMS3EDWL | BE |
| Netherlands | A1805IZSGTT6HS | NL |
| Germany | A1PA6795UKMFR9 | DE |
| Italy | APJ6JRA9NG5V4 | IT |
| Sweden | A2NODRKZP88ZB9 | SE |
| South Africa | AE08WJ6YKNBMC | ZA |
| Poland | A1C3SOZRARQ6R3 | PL |
| Egypt | ARBP9OOSHTCHU | EG |
| Turkey | A33AVAJ2PDY3EV | TR |
| Saudi Arabia | A17E79C6D8DWNP | SA |
| United Arab Emirates | A2VIGQ35RCS4UG | AE |
| India | A21TJRUUN4KGV | IN |

### Far East (FE)

| Country | Marketplace ID | Code |
|---------|----------------|------|
| Singapore | A19VAU5U5O7RUS | SG |
| Australia | A39IBJ37TRP1C6 | AU |
| Japan | A1VC38T7YXB528 | JP |

## Marketplace ID 与 Ads API 的对比

SP-API 和 Ads API 使用**相同的 Marketplace ID**（如 US = `ATVPDKIKX0DER`）。区别在于：

- **SP-API**：Marketplace ID 作为查询参数传递（如 `?marketplaceIds=ATVPDKIKX0DER`）
- **Ads API**：常规 API 用 Profile ID（隐含 Marketplace），AMC API 用 `Amazon-Advertising-API-MarketplaceId` Header

## URL 构建规则

```
{endpoint}/{api_path}?marketplaceIds={marketplace_id}
```

示例:
```
GET https://sellingpartnerapi-na.amazon.com/catalog/2022-04-01/items/B08N5WRWNW?marketplaceIds=ATVPDKIKX0DER
```
