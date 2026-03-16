---
title: Getting started with Amazon Ads API v1
source: https://advertising.amazon.com/API/docs/en-us/reference/amazon-ads/getting-started
section: Amazon Ads API v1
---

# Getting started with Amazon Ads API v1

## Prerequisites

All clients who have completed onboarding to the Amazon Ads API are permitted to call the Ads API v1 generally.

Closed betas: Certain resources may be listed as closed beta, in which case you need to submit a request to join the beta program in order to gain access. Learn more about joining a closed beta program.

## Required headers

Just as for other Amazon Ads APIs, Ads API v1 requests must provide Amazon-Ads-ClientId and Authorization headers to authorize calls. Learn more about authorization using Login With Amazon.

Additional headers may be required for requests, depending on the functionality and ad product:

- Amazon-Advertising-API-Scope: Required for most sponsored ads requests. Use the Profiles API to retrieve the profile ID of the desired advertiser and marketplace to use as the value for this header for your Sponsored Ads Seller or Vendor. You can also retrieve profile ID information from the Manager Accounts API for Sponsored Ads Seller and Vendor accounts.
- Amazon-Ads-AccountId: Required for ADSP and cross-product requests. For ADSP requests, either use the DSP Advertisers API and select the advertiserId of the desired account or use the Manager Accounts API and select the dspAdvertiserId value of a linked account to use as the value for this header.
- Amazon-Ads-Manager-AccountId: Manager account ID for manager account operations

## Understanding advertising accounts

Amazon Ads API v1 uses a unified account model that works across headers and request body fields:

### Account types and relationships

- Advertising Account: The primary account entity that contains campaigns and data across all ad products
- Profile ID: Identifier used for sponsored ads operations (Amazon-Advertising-API-Scope header)
- Account ID: Identifier used for cross-product operations (Amazon-Ads-AccountId header)

### Header vs. body field usage

- Headers: Use appropriate account identifiers for account-scoped operations
- Body fields: Use advertiserAccount.id in request bodies to specify which account's data to retrieve or modify
- Access requested accounts: Use the accessRequested field to specify which accounts you want to access in multi-account scenarios

## OpenAPI specification interface

The Amazon Ads API v1 OpenAPI specification is presented in an enhanced interface featuring a new ad product selection control for select APIs (e.g., campaign management).

By default, the page displays a specification common to all ad products, including all available attributes. With any ad product selected, the page displays a specification specific to that ad product, including only those attributes that apply to the given entity for that ad product. These ad product-specific specifications display what is needed for a specific ad product's business rules and validations.

Similarly, the Download OpenAPI spec link in the description adjusts depending on whether an ad product is selected.

## Implementation recommendations

### Test accounts

You can use your existing accounts, or you can create a test account for testing. See Test Account Overview for more information on setup.
