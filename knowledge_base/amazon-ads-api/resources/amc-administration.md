---
title: Amazon Marketing Cloud - API administration overview
description: AMC API administration overview
type: guide
interface: api
---
# Overview

As the administrator of an AMC account, you can programmatically perform tasks like managing accounts, instances, and users in your organization. You can also manage and invite users in your organization to your account and elevate their role to an administrator.

In addition to the programmatic methods described in this section, AMC account admins have an alternative option for managing accounts and instance access directly through the user interface. From the Ads console, admins can navigate to **Administration > Account access & settings** to configure account permissions and settings. For more information, refer to [Add or remove users from your organization's account](https://advertising.amazon.com/help/GJHUF3HF98KVR4RM).

> [NOTE] This section details the administrator tasks specific to managing your AMC account and instances. See [Manager Accounts](guides/account-management/authorization/manager-accounts) for information on working with Manager Accounts and [Billing and Payment](guides/account-management/billing/getting-started) for details on how to access and manage your billings.

The developer guide details the following areas that an AMC administrator manages:

- [Accounts](guides/amazon-marketing-cloud/admin/account-management): An AMC account represents an advertiser or partner organization, is managed by an account administrator, who can invite other users to access or administer the account.
- [Users](guides/amazon-marketing-cloud/admin/account-management#manage-users): AMC has two primary types of users, "Admins" responsible for managing AMC accounts and instances, and "Viewers" - users with the ability to view and use the accounts.
- [Instances](guides/amazon-marketing-cloud/admin/instance-management): An instance is the actual AMC "clean room" that is set up for a given advertiser or company. Event-level signals for a given set of advertiser IDs start to accumulate in the instances and made available for querying. A single AMC account can contain more than one "instance". 

> [WARNING] Many of the administration operations for modifying accounts, users, and instances are not supported for instances created using AMC instant access APIs. To learn more about self-service instances and supported operations, refer to [Instant self-service access to AMC](guides/amazon-marketing-cloud/get-started/instant-access-to-amc).