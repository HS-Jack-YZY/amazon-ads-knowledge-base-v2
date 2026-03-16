---
title: Developer notes
description: Understand important concepts for developers building applications using the Amazon Ads API. 
type: guide
interface: api
tags:
    - Operations
---

# Developer notes

## Object IDs

The API assigns immutable IDs to all entities. These entity IDs are used to reconcile performance data retrieved through the reporting interface against campaign entities managed through the campaign management interface. IDs for all entities will be in the range of 64-bit unsigned integers. IDs are unique for a given type, but two objects with different types may share the same ID (for example, a campaignId for a campaign may be the same as an adGroupId for an unrelated ad group).

IDs for each type are unique within a [Profile](guides/account-management/authorization/profiles). For example, two campaigns (regardless of ad type) associated with the same profile cannot share a campaignId, but you could see the same campaignId appear under a different profile.

## Archiving

This is a change. Modifying archived entities is not allowed, but you can continue to view archived entities and their performance as you do now in campaign manager and in downloadable reports. Additionally, we do not count archived entities towards the entity limits that we have in place, which, in effect increases your entity limits.

## Pagination consistency

When making batch requests via the management API, each page request is made independently. Results are ordered consistently, but pagination may result in duplicate or missing records if the set of records satisfying the filtering criteria changes between paged requests. Entity exports and reports do not suffer from the same problem.

## Atomicity of operations

Note that batch update and creation operations are non-atomic.

## Idempotency

All operations are idempotent in that the final server state will remain the same if the same operation is performed multiple times. However, this doesn't guarantee that the same response will be returned, since duplicate creations will result in an error on the second request.

For creation, idempotency is guaranteed by the following uniqueness constraints which, when violated, will return an error indicating that the resource already exists:

- Campaigns: Campaign name
- Ad groups: Campaign name, ad group name
- Keywords: Campaign name, ad group name, keyword, match type
- Negative keywords: Campaign name, ad group name, keyword, match type
- Campaign negative keywords: campaign name, keyword, match type
- Product ad: Campaign name, ad group name, SKU, ASIN

For reporting and snapshots, files are memorized, so duplicate requests will return the same report ID

## Partial updates

The only required attribute to update entities is the ID. This allows for partial updates where only a subset of the attributes are provided and all other attributes will remain unchanged. This allows for less verbose requests for common operations like changing a large batch of keyword bids.

## Implicit operations

Batch updates can be used to create and archive/delete entities implicitly. The absence of an ID in an update, along with the presence of all attributes required for creation, is interpreted as intent to create a new entity. Similarly, the presence of an ID and state of archived can be used to archive an entity.

## Asynchronous exports vs. synchronous batch GETs for campaign management

The API is used for synchronous batch operations to get campaigns, ad groups, keywords, and ads. Additionally, the API provides an asynchronous interface for getting a complete export of all entities of a single type. Exports are generally more efficient if the client intends to get all campaigns, ad groups, keywords, or ads in bulk. This is useful for clients who replicate their account structures locally.

To understand the exports specifications for each ad type, see [Exports](exports).

## GETs with extended attributes

Because extended attributes include computed/inherited status, batch gets where these attributes are requested are inherently costlier. It's recommended that clients attempt to calculate inherited status locally using stored parent and grandparent status, particularly if account structure is requested multiple times per day.

## Sponsored Brands moderation

At Amazon Ads, we believe maintaining a high customer experience bar for the ads we serve helps us drive better results for our advertisers. Accordingly, we've set [customer-centric Ad Policies](https://advertising.amazon.com/resources/ad-policy/en/sponsored-ads-policies) to help preserve and enhance that experience. When users submit a new Sponsored Brands campaign or make changes to an existing campaign, we review it using a moderation process to make sure that it is up to the high standards we set for the customer shopping experience across Amazon. Campaigns that are going through moderation will be set to a 'Pending Review' state. The advertiser will receive an email at the email address linked to their account confirming the campaign is in review. Advertisers will receive an email within 72 hours confirming whether or not their ad is approved. Please note at the time, moderation is not available on Sandbox.
