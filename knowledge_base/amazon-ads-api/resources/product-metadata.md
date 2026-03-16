---
title: Product Metadata
source: https://advertising.amazon.com/API/docs/en-us/product-metadata
section: Resources
---

# Product Selector

The Amazon Product Selector API allows integrators to receive product metadata such as inventory status, price, eligibility status and product details for SKUS or ASINs in their Product Catalog in order to launch, manage or optimize Sponsored Product, Sponsored Brands or Sponsored Display advertising campaigns. The Product Selector API is available to Sellers, Vendors, and Authors. Note that for vendors it fetches inventory based on the vendor codes so the result could be different from elsewhere.

**Version:** 3.0

## Endpoints

### POST /product/metadata

**Summary:** Returns product metadata for the advertiser

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view","campaign_edit","campaign_view"]

**Operation ID:** ProductMetadata

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| Amazon-Advertising-API-ClientId | header | string | Yes | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | string | No | The identifier of a profile associated with the advertiser account. |
| Amazon-Ads-AccountId | header | string | No | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |

**Request Body:**

Content-Type: `application/vnd.productmetadatarequest.v1+json`

**Responses:**

- **200**: Successful operation.
- **400**: Bad Request.
- **401**: Unauthenticated request.
- **403**: Forbidden - Request failed because user is not authorized to access a resource.
- **404**: Not Found - Requested resource does not exist or is not visible for the authenticated user.
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error.
