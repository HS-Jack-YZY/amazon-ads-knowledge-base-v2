---
title: Amazon Ads API Concepts Overview
description: High-level overview of key concepts in the Amazon Ads API
type: guide
interface: api
tags:
    - Authorization
    - Operations
    - Account management
keywords:
    - access
    - headers
    - client application
    - reference
    - developer notes
---

# Concepts

This section describes key concepts customers will encounter in using the Amazon Ads API.

## Authorization

To use the Amazon Ads API, an application must be delegated access to act on behalf of an advertiser through an OAuth 2.0 flow. Tokens retrieved through this process are used for all operations in the API. 

For most operations, API callers also pass a profile identifier representing an advertiser's account in a particular marketplace.

- See the [Authorization Overview](guides/account-management/authorization/overview) for more information about authorization, permissions, and profiles.

## Reporting and exports

Use the Ads API reporting functionality to retrieve campaign performance data. To pull current campaign metadata and structure, use exports. 

Learn more about:

- [Reporting](guides/reporting/overview)
- [Exports](guides/exports/overview)

## Compatibility and versioning

REST resources in the Amazon Ads API are independently versioned using a **major.minor** format -- for example, “3.0”. Resources in an Amazon Ads API service are guaranteed to be backward compatible within a *major* version. 

At present, many resources have only one version.

- See [Compatibility and Versioning](reference/concepts/compatibility-versioning-policy) for information about specifying versions, compatibility, and deprecation policies.

## Rate limiting

Rate limiting in the Amazon Ads API is determined dynamically based on overall system load.

- See [Rate Limiting](reference/concepts/rate-limiting) for information on how to avoid rate limiting and best practices for handling `429` responses.

## Reference tables

See the following documents for tables describing limits, constraints, error responses, and status messages.

- [Limits, constraints, and quotas](reference/concepts/limits)
    - [Service limits](reference/concepts/limits#service-limits)
    - [Bid constraints by marketplace](reference/concepts/limits#bid-constraints-by-marketplace)
    - Valid characters
        - [Keyword character constraints](reference/concepts/limits#keyword-character-constraints)
        - [Entity name character constraints](reference/concepts/limits#entity-name-character-constraints)
- [Errors](reference/concepts/errors)
- [Computed status](reference/concepts/computed-status)

## Developer notes

See [Developer Notes](reference/concepts/developer-notes) for additional technical notes.
