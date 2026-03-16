---
title: Product Eligibility
source: https://advertising.amazon.com/API/docs/en-us/eligibility-prod-3p
section: Resources
---

# Eligibility

Check advertising eligibility of global offers.

**Version:** 3.0

## Endpoints

### POST /eligibility/product/list

**Summary:** Gets advertising eligibility status for a list of products.

Gets a list of advertising eligibility objects for a set of products. Requests are permitted only for products sold by the merchant associated with the profile. Note that the request object is a list of ASINs, but multiple SKUs are returned if there is more than one SKU associated with an ASIN. If a product is not eligible for advertising, the response includes an object describing the reasons for ineligibility.

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** productEligibility

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | Yes | The identifier of a profile associated with the advertiser account. |

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: Successful operation.
- **400**: Bad request.
- **401**: Unauthorized. Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden. Request failed because user does not have access to a specified resource
- **404**: Cannot find requested entity. Note that this may occur if a product is not associated with the given profile/merchant, or a product is no longer in the catalog.
- **422**: Unprocessable entity. The request was understood, but it contained invalid parameters.
- **429**: Too many requests. The request was rate-limited. Retry later.
- **500**: Internal server error. Retry later. Contact support if this response persists.

### POST /eligibility/programs

Checks the advertiser's eligibility to ad programs.

**Authorized resource type**:
Global Ad Account ID, Profile ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view","advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** ProgramEligibility

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Accept-Language | header | | No | Specify the language in which the response is returned. |
| Amazon-Ads-AccountId | header | string | No | The header used to pass global account associated with the advertiser account. |
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | No | The identifier of a profile associated with the advertiser account. |
| Content-Type | header | string | No | The content type of the request. |

**Request Body:**

Content-Type: `application/json`

Content-Type: `application/vnd.programeligibility.v2+json`

**Responses:**

- **200**: ProgramEligibility 200 response
- **400**: BadRequestException 400 response
- **401**: UnauthorizedException 401 response
- **404**: NotFoundException 404 response
- **429**: RateExceededException 429 response
- **500**: InternalServerErrorException 500 response
