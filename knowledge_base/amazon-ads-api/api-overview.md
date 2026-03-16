---
title: Amazon Ads API Overview
source: https://advertising.amazon.com/API/docs/en-us/reference/api-overview
section: Overview
---

# Amazon Ads API Overview

The Amazon Ads API enables Amazon advertisers and partners to programmatically manage advertising operations and retrieve performance data.

Find reference API docs by exploring the **API reference** navigation menu.

For user guides, recommendations, and tutorials, explore the **Developer guides** menu or see the [developer guides overview](https://advertising.amazon.com/API/docs/en-us/guides/overview).

## New to the Amazon Ads API?

Find useful first steps in our table of contents at left or see these docs:

- **[Onboarding](https://advertising.amazon.com/API/docs/en-us/guides/onboarding/overview)**: step-by-step instructions for gaining access.
- **[Getting started](https://advertising.amazon.com/API/docs/en-us/guides/get-started/overview)**: step-by-step instructions for managing auth and making your first requests.

## Amazon Ads API v1 is available

The new Amazon Ads API v1 is a reimagined approach to our Ads API, designed to provide a seamless experience across all Amazon advertising products through a common model. If you're new to Amazon Ads APIs, we recommend using it.

For more details, see [Amazon Ads API v1](https://advertising.amazon.com/API/docs/en-us/reference/amazon-ads/overview).

## Typical Use Cases

We expect a typical client will perform the following operations regularly:

- Make batch requests for all campaigns, ad groups, ads and keywords in paginated requests and store/update a local copy of the data.
- Request recent performance data for all campaigns, ad groups, ads and keywords in reports and use the IDs to associate and store/update performance data with the entities retrieved from a batch request.
- Analyze performance and make changes to bids and budgets. Optimize performance using the batch update API for campaigns, ad groups, ads and keywords.

These, as well as operations to modify single entities, are supported use cases for the API.

## API Endpoints

The API is accessible through the following regional hosts:

| URL | Region | Marketplaces |
|-----|--------|-------------|
| https://advertising-api.amazon.com | North America (NA) | United States (US), Canada (CA), Mexico (MX), Brazil (BR) |
| https://advertising-api-eu.amazon.com | Europe (EU) | United Kingdom (UK), France (FR), Italy (IT), Spain (ES), Germany (DE), Netherlands (NL), United Arab Emirates (AE), Poland (PL), Turkey (TR), Egypt (EG), Saudi Arabia (SA), Sweden (SE), Belgium (BE), India (IN), South Africa (ZA) |
| https://advertising-api-fe.amazon.com | Far East (FE) | Japan (JP), Australia (AU), Singapore (SG) |
