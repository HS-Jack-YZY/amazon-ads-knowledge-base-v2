---
title: Compatibility and versioning policy
description: Describes the compatibility and versioning policy of resources in the Amazon Ads API
type: guide
interface: api
tags:
    - Operations
keywords:
    - resource representation
    - accept header
    - deprecated version
---

# Compatibility and versioning

## Versioning

Resources in the Amazon Ads API are independently versioned, which enables customers to adopt new features on their desired timeframe and enables Amazon developers to evolve APIs independently. Version information for a given resource can be found in the technical specifications for that resource.

### Specifying versions

Some resources in the API use [content negotiation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation) via the `Accept` and `Content-Type` headers to determine the resource version that will be returned. For other resources, the request URL determines the resource version, for instance by including `/v2` in the path.

See the API specification for a given resource to determine the appropriate method for specifying a version.

## Compatibility

Changes to resources in the Amazon Ads API are backwards compatible within a version.

Any breaking change introduced to a resource will be accompanied by a corresponding increment in the version and will be announced via a [release note](release-notes/index). Non-breaking changes may be introduced within versions.

### Exceptions to backwards compatibility

The Amazon Ads API may *not* return a stable resource representation in the following circumstances:

* A legal issue arises that requires breaking a stable resource representation.
* A critical bug is discovered that can be corrected only by breaking a stable resource representation.
* A critical security flaw is discovered that can only be mitigated by breaking a stable resource representation.

In the case where a stable resource representation is not returned, the Amazon Ads API will communicate the change and work with clients to migrate to the new version of the resource representation.

### Enum fields

When a field with enumerated values (an **enum field** or **enum**) is introduced, the same representation will be used in all use cases of that enum model and will be consistent for requests and responses on the same API endpoint. Any enums used only in responses are documented using the OpenAPI “read-only” annotation or with explanatory text in the documentation.

Any enum fields added to an existing resource absent a version change will be optional, with a default value that maps to the previous API behavior.

Within a version, an API resource will not:

* Rename or remove an enum field.
* Change the type of an enum field.
* Make an enum field required when it was previously optional.
* Change the default behavior of an enum field.

#### Enum values

The addition of a new **enum value** to an existing enum field in a request or response is generally *not* a breaking change and will not require a version increment.

However, the following changes to enum values are considered breaking and will not be made without a version increment. Within a version, an API resource will not:

* Remove an existing enum value.
* Change an existing enum value, including any change to the behavior of an existing enum value.
* Rename an enum value.
* Replace (split) an enum value with more granular enum values. For example, a “state” enum value may not be split into more granular states.
* Add a new enum value that changes the meaning or behavior of existing enum values.

>[TIP: “Other” values]Some resources in the API currently include enums that accept **** “OTHER” or a similar value. Such instances will be removed in the next version update for the resource.

## Deprecations & shutoffs

The Amazon Ads API supports deprecation of unused, lightly used, or old versions of existing operations. 

Before any version of a resource representation is shut off, clients will be given at least six months notice. Once a shutoff date is announced, the associated resources are considered deprecated. During the deprecation period, no new features will be added to the existing endpoint and support may be limited. 

Upcoming shutoffs are announced via [release notes](release-notes/index) and are also cataloged in the [Deprecations reference](release-notes/deprecations).
