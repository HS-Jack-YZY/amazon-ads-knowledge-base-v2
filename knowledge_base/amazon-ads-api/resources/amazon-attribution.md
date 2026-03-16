---
title: "Amazon Attribution"
source: https://advertising.amazon.com/API/docs/en-us/amazon-attribution-prod-3p
section: Amazon Attribution
spec_url: https://dtrnk0o2zy01c.cloudfront.net/openapi/en-us/dest/AmazonAttribution_prod_3p.json
---

# Amazon Attribution

**Version**: 3.0

Amazon Attribution is an advertising measurement product that enables advertisers to understand the impact that their non-Amazon ads (i.e. Google Ads, Facebook, Microsoft Ads) have in driving shopping activity on Amazon. Amazon Attribution is currently available in beta for US, CA, UK, DE, FR, IT, and ES vendors and professional sellers enrolled in Brand Registry.

For more information, see [Amazon Attribution overview](/API/docs/en-us/guides/amazon-attribution/overview) and [Getting started guide](/API/docs/en-us/guides/amazon-attribution/get-started).

## Endpoints

### GET /attribution/advertisers

Gets a list of advertisers associated with an Amazon Attribution account.

**Operation ID**: `getAdvertisersByProfile`

**Responses**: 200

---

### GET /attribution/publishers

Gets a list of all available publishers.

**Operation ID**: `getPublishers`

**Responses**: 200

---

### POST /attribution/report

Gets an attribution report for a specified list of advertisers.

**Operation ID**: `getAttributionTagsByCampaign`

**Responses**: 200, 400, 403, 500

---

### GET /attribution/tags/macroTag

Gets a list of attribution tags for third-party publisher campaigns that support macros.

**Operation ID**: `getPublisherAttributionTagTemplate`

**Responses**: 200, 400, 401, 403, 429, 500

---

### GET /attribution/tags/nonMacroTemplateTag

Gets a list of attribution tags for third-party publisher campaigns that do not support macros.

**Operation ID**: `getPublisherMacroAttributionTag`

**Responses**: 200, 400, 401, 403, 429, 500

---

## Schemas (10 total)

Full definitions: https://dtrnk0o2zy01c.cloudfront.net/openapi/en-us/dest/AmazonAttribution_prod_3p.json

- **AdvertiserResponse**: {advertisers}
- **AttributionTagResponse**: {advertiserAttributionTagMap}
- **MaaSError**: {code, details}
- **Publisher**: {id, macroEnabled, name}
- **PublishersResponse**: {publisher}
- **ReportEntry**: {adGroupId, advertiserName, brandName, campaignId, creativeId, date, marketplace, productAsin, productCategory, productConversionType, productGroup, productName, productSubcategory, publisher}
- **ReportRequestBody**: {advertiserIds, count, cursorId, endDate, groupBy, metrics, reportType, startDate}
- **ReportResponse**: {cursorId, reports, size}
- **advertiser**: {advertiserId, advertiserName}
- **attributionTagMap**
