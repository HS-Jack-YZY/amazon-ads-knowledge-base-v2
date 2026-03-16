---
title: How does Amazon Marketing Cloud work
description: An overview of how AMC works
type: guide
interface: api
---
# How AMC works

Pseudonymized inputs from Amazon Ads campaign events such as ad impressions, ad clicks, and ad-attributed conversions that span across media, including streaming TV, audio, video, display, and sponsored ads are uploaded into AMC instances. Examples of common signal types that are uploaded include direct-to-consumer (D2C) store sales information, CRM records, and product catalog mapping.

| [TILES] Did you know?                                                                                                                                                                                                                        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AMC prioritizes privacy and security by design by accepting only pseudonymized information. All information in your AMC instance is handled in strict accordance with Amazon's privacy notice, and raw event information cannot be exported. |

The signals you choose to upload stays within your dedicated AMC instance, and cannot be accessed or exported by Amazon.

> [NOTE] To be joined with Amazon Ads signals, your signals need to contain joinable fields such as pseudonymized email addresses, and phone numbers, or product ASINs. For details on [joining fields](guides/amazon-marketing-cloud/amc-sql/basics#join), see [AMC SQL reference](guides/amazon-marketing-cloud/amc-sql/overview).

Through AMC, you may want to analyze your audience's journey and path to conversion, or audience penetration, or want to consider the frequency distribution of an ad or optimal frequency that leads to a conversion.

All analysis takes place within AMC, across dimensions like audiences, device, time, or campaigns to name a few and results are aggregated to generate anonymous reports that you can export.

> [TIP:AMC education resources]To deepen your AMC knowledge, explore the [AMC education resources](https://learningconsole.amazonadvertising.com/student/path/37211-amazon-marketing-cloud-education?sid=da9d26fa-93a7-4e15-8fbb-20c519d58d8b&sid_i=3) available on Amazon Ads learning console.


## AMC UI and APIs

The Amazon Marketing Cloud (AMC) is accessible through two primary methods:

* Access via the web-based user interface within Amazon Ads console
* Programmatic integration through the Amazon Ads API

Please note that the AMC user interface is currently available exclusively in English, with no localization options for other languages.

## Gain access to AMC

There are two ways to gain access to an AMC:

* If you are a sponsored ads advertiser, you can use AMC instant access to automatically create an AMC instance associated with your sponsored ads account and start using AMC within minutes. 
    * Directly access AMC through the user interface by navigating to AMC within your Amazon Ads console, or after you onboard to Amazon API, follow the instructions in [Instant self-service access to AMC](guides/amazon-marketing-cloud/get-started/instant-access-to-amc).
    * Note that the AMC instance created will have only one sponsored ads account associated with it. You will not be able to add Amazon DSP or other sponsored ads advertisers to the instance. 
* If you want the scope of your instance to include data from multiple advertisers or Amazon DSP advertisers, you will need to reach out to your AdTech AE or Partner to apply for access to AMC. After you apply for access, Amazon provisions an AMC account. 
    * Your account will be managed by a user your organization designates as the "AMC admin". Your organization's AMC admin can create instances and add advertiser ids to the instances. The admin can then add users to the account to view and analyze data in the assigned instance. For details on AMC admin functions, refer to the [AMC administration functions](guides/amazon-marketing-cloud/admin/1_amc_administration).

## AMC accounts and instances

To use AMC, you must first understand AMC account and instances, the fundamental building blocks of AMC that allow for a hierarchical structure.
An [AMC account](#amc-accounts) represents the advertiser or agency as the top-level organizational unit, and contains one or more [instance(s)](#amc-instances).  An instance is the actual AMC "clean room" that is set up for a given advertiser or company.

### AMC accounts

Access to AMC is managed at the account level. An admin user can create instances, grant organization users access to specific instances within the account, and invite additional admins. This granular access control allows selective user access to accounts and instances, enabling agencies to manage multiple accounts across multiple advertisers, brands, or entities under a single corporate umbrella.

> [NOTE] AMC instances created using the instant access API will use the sponsored ads account ID as the AMC account ID.

For details see [AMC account management](guides/amazon-marketing-cloud/admin/account-management).

### AMC instances

An instance contains records from only a single brand or company. AMC allows for the following types of instances:

- **Standard instances**: Contains Amazon Ads events for a single advertiser, and mapped to one or multiple Amazon DSP accounts and or sponsored ads entities. Admin users can [create standard instances](guides/amazon-marketing-cloud/admin/instance-management#create-an-instance).
- **Sandbox instances**: Contains synthetic signals generated to mimic the structure and statistical properties of AMC signals. All AMC accounts have been granted a [sandbox instance](guides/amazon-marketing-cloud/amc-sandbox). This type of instance is not supported for AMC instances created using the instant access API.
- **Collaboration instances**: The integration of [AMC on AWS Clean Rooms](guides/amazon-marketing-cloud/acr/1_overview) enables advertisers to seamlessly collaborate with Amazon Ads exclusive signals, using your data from the advertiser's AWS environment. Reach out to your AdTech AE to request a collaboration instance. This type of instance is not supported for AMC instances created using the instant access API.

> [NOTE] Unless otherwise specified, all references are to standard AMC instances.
> Admin users can create standard instances. For more details, see [Create instances](guides/amazon-marketing-cloud/admin/instance-management#create-an-instance).




### Data in your AMC instance

Data in your instance can be Amazon owned or customer or advertiser owned.

#### Amazon-Owned Data

- Automatically populated with **13 months of historical data** (backfill) upon instance creation
- Continuously updated with new event data as campaigns run
- Includes: DSP impressions/clicks/views, Sponsored Ads traffic, conversions, and more

#### Advertiser-Uploaded Data

- Advertisers can upload their own first-party data (e.g., CRM data, offline conversions, website events) using [Advertiser data upload](guides/amazon-marketing-cloud/advertiser-data-upload/advertiser-data-overview)
- Uploaded data is matched against Amazon's pseudonymized user identifiers
- Enables cross-channel analysis combining Amazon signals with advertiser-owned signals

#### Exception: Amazon Retail Purchases (ARP)

- Contains **60 months** (5 years) of purchase history — significantly more than the standard 13 months
- Exercise caution when joining with other AMC datasets due to mismatched time windows

You can also opt-in for AMC's **Paid features** to avail more datasets and insights for deeper analysis of your campaigns and audience creation outcomes.

> [WARNING] Any data you choose to upload stay within your dedicated AMC instance, and can't be accessed or exported by Amazon.

For details, see [AMC data sources](guides/amazon-marketing-cloud/datasources/overview).

### Queries in AMC

AMC allows you to access the data from your instances through the use of queries written in **AMC Structured Query Language (AMC- SQL)**. Queries can be written to generate custom metrics and insights tailored to your business, enabling you make more informed decisions on your campaign spend.

AMC SQL is a custom query language that supports most of the basic SQL operation, designed to help advertisers interact with event-level records to generate aggregated outputs, which lead to insights for campaign measurement, audience analysis, media optimization, or to create audiences.

> [WARNING] While you can perform queries within each instance, you can't perform queries across instances.

When you submit a query for processing, AMC's [data aggregation thresholds](guides/amazon-marketing-cloud/aggregation-threshold) are enforced to ensure the output contains aggregated and anonymous results to protect customer privacy.

You can use AMC's [workflow management service](guides/amazon-marketing-cloud/reporting/create-workflow) to programmatically manage your queries.

After you run your queries, you [can get your results](guides/amazon-marketing-cloud/reporting/get-your-results) in any of the following ways:

- [Through a download URL.](guides/amazon-marketing-cloud/reporting/get-your-results#download-your-query-results)
- [Through your connected S3 bucket, to which your query results are stored.](guides/amazon-marketing-cloud/reporting/get-your-results#view-your-workflow-output-in-the-amazon-s3-bucket)

> [NOTE] To send the results of your queries to your S3 bucket, you will need to  [define an S3 bucket](guides/amazon-marketing-cloud/get-started/get-started#set-up-s3-buckets-optional).

## Privacy Safeguards

- All data within AMC is **pseudonymized** — there are no personally identifiable identifiers
- **Raw user-level data cannot be exported** — only aggregated results that meet threshold requirements
- Aggregation thresholds ensure that results represent a sufficient number of users
- The clean room architecture prevents data from being moved outside the secure environment
