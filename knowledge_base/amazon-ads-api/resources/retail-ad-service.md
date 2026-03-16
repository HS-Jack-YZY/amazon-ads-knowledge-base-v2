---
title: Amazon Advertiser API for Retail Ad Service
source: https://advertising.amazon.com/API/docs/en-us/retail-ad-service
section: Resources
---

# Amazon Advertiser API for Retail Ad Service

The API that enables advertisers to run campaigns through Amazon Ads on retailers that are launched on Amazon Retail Ad Service

**Version:** 3.0

## Endpoints

### POST /ras/v1/adGroups

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1CreateAdGroups

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240, allows clients to request certain behavior from the server. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: CreateAdGroups 207 response
- **400**: AdGroupMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### PUT /ras/v1/adGroups

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1UpdateAdGroups

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: UpdateAdGroups 207 response
- **400**: AdGroupMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/adGroups/delete

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1DeleteAdGroups

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: DeleteAdGroups 207 response
- **400**: AdGroupMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/adGroups/list

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** RASv1ListAdGroups

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: ListAdGroups 200 response
- **400**: AdGroupAccessException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/campaigns

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1CreateCampaigns

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: CreateCampaigns 207 response
- **400**: CampaignMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### PUT /ras/v1/campaigns

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1UpdateCampaigns

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: UpdateCampaigns 207 response
- **400**: CampaignMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/campaigns/delete

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1DeleteCampaigns

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: DeleteCampaigns 207 response
- **400**: CampaignMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/campaigns/list

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** RASv1ListCampaigns

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: ListCampaigns 200 response
- **400**: CampaignAccessException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/productAds

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1CreateProductAds

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: CreateProductAds 207 response
- **400**: ProductAdMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### PUT /ras/v1/productAds

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1UpdateProductAds

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: UpdateProductAds 207 response
- **400**: ProductAdMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/productAds/delete

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1DeleteProductAds

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: DeleteProductAds 207 response
- **400**: ProductAdMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/productAds/list

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** RASv1ListProductAds

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: ListProductAds 200 response
- **400**: ProductAdAccessException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/targets

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1CreateTargets

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: CreateTargets 207 response
- **400**: TargetMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### PUT /ras/v1/targets

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1UpdateTargets

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |
| Prefer | header | string | No | The "Prefer" header, as defined in RFC7240. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: UpdateTargets 207 response
- **400**: TargetMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/targets/delete

**Requires one of these permissions**:
["advertiser_campaign_edit"]

**Operation ID:** RASv1DeleteTargets

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **207**: DeleteTargets 207 response
- **400**: TargetMutationException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response

### POST /ras/v1/targets/list

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** RASv1ListTargets

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: ListTargets 200 response
- **400**: TargetAccessException 400 response
- **401**: UnauthorizedException 401 response
- **403**: AccessDeniedException 403 response
- **429**: ThrottlingException 429 response
- **500**: InternalServerException 500 response
- **502**: BadGatewayException 502 response
- **503**: ServiceUnavailableException 503 response
- **504**: GatewayTimeoutException 504 response
