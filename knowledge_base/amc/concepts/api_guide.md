# AMC API Guide

## Overview

Amazon Marketing Cloud (AMC) is accessible programmatically through the **Amazon Ads API**, supporting automation of workflows, integrations, and tool development at scale. The AMC APIs follow the industry-standard **OAuth 2.0** authorization framework and use a consistent base URL.

> **Important**: Instance-level APIs were officially retired on August 01, 2024. All usage must migrate to AMC APIs on the Amazon Ads API. See the [Migration Guide](https://advertising.amazon.com/API/docs/en-us/guides/amazon-marketing-cloud/amc-migration-hub/migration) for details.

## Prerequisites

To work with AMC APIs, you need:

1. **An AMC instance** — associated with your DSP or Sponsored Ads account, with planned campaigns or campaigns live in the last 28 days
2. **A Login with Amazon (LWA) application** — for OAuth 2.0 authentication
3. **Working knowledge of AMC SQL** — see [SQL Reference](../../amazon-ads-api/resources/amc-sql-overview.md)
4. **(Optional) An S3 bucket** — for storing query results

## Gaining Access to AMC

### Option 1: Instant Self-Service Access (for Sponsored Ads advertisers)

- Automatically creates an AMC instance associated with your sponsored ads account
- Available within minutes after onboarding to Amazon API
- Limitation: the instance has only one sponsored ads account; you cannot add DSP or other sponsored ads advertisers

### Option 2: Apply via AdTech Account Executive

- For advertisers needing data from multiple advertisers or Amazon DSP
- Contact your AdTech AE or Partner to apply
- Amazon provisions an AMC account managed by your organization's designated "AMC admin"
- Admin can create instances, add advertiser IDs, and invite users

## Onboarding the Amazon Ads API

### Step 1: Create a Login with Amazon Application

- Go to [Login with Amazon](https://advertising.amazon.com/API/docs/en-us/guides/onboarding/create-lwa-app) and create a client application
- Obtain your **Client ID** and **Client Secret**

### Step 2: Apply for API Access

- Complete the application form describing your intended API usage
- Agree to the following:
  - [Amazon Ads API License Agreement](https://advertising.amazon.com/API/docs/license-agreement)
  - [Data Protection Policy](https://advertising.amazon.com/API/docs/policy/en_US)
  - [Amazon Marketing Cloud Terms](https://advertising.amazon.com/marketing-cloud/terms/AMC_Terms.html)
- Partners should visit the [Amazon Ads Partner page](https://advertising.amazon.com/partner-network/register-api) for access

### Step 3: Create an Authorization Grant and Retrieve Tokens

1. [Create an authorization grant](https://advertising.amazon.com/API/docs/en-us/guides/get-started/create-authorization-grant)
2. [Retrieve access and refresh tokens](https://advertising.amazon.com/API/docs/en-us/guides/get-started/retrieve-access-token)

## API Base URLs

All AMC APIs share a common URL prefix depending on the region:

| Region | Base URL |
|--------|----------|
| North America | `https://advertising-api.amazon.com` |
| Europe | `https://advertising-api-eu.amazon.com` |
| APAC | `https://advertising-api-fe.amazon.com` |

> Any of the above URLs can be used globally. Choose the endpoint geographically closest to where your calls originate.

## Required Header Parameters

| Header | Description | Example |
|--------|-------------|---------|
| `Authorization` | LWA access token | `Bearer Atza\|IwE...` |
| `Amazon-Advertising-API-ClientId` | Your LWA application Client ID | `amzn1.application-oa2-client.xxx` |
| `Amazon-Advertising-API-AdvertiserId` | AMC Account ID or Sponsored Ads Entity ID | `ENTITY1AA1AA11AAA1` |
| `Amazon-Advertising-API-MarketplaceId` | Target marketplace identifier | `ATVPDKIKX0DER` (US) |
| `Content-type` | Content type | `application/json` |

### About AdvertiserId

- When using **Instant Access API**: use your **Sponsored Ads Entity ID**
- When using **AE-provisioned accounts**: use the **AMC Account ID** provided by your Amazon Ads account executive
- You can find the AMC Account ID in the AMC console URL (the alphanumeric code prefixed with `ENTITY`)
- You can also call `GET /amc/accounts` to list all accounts your Client ID has access to

### About MarketplaceId

The `Amazon-Advertising-API-MarketplaceId` header is **exclusive to AMC APIs** and is not required for other Amazon Ads APIs. Ensure you specify the marketplace of your account when calling AMC APIs.

## Marketplace ID Reference

### North America

| Country | Marketplace ID | Code |
|---------|---------------|------|
| United States | `ATVPDKIKX0DER` | US |
| Canada | `A2EUQ1WTGCTBG2` | CA |
| Mexico | `A1AM78C64UM0Y8` | MX |
| Brazil | `A2Q3Y263D00KWC` | BR |

### Europe

| Country | Marketplace ID | Code |
|---------|---------------|------|
| United Kingdom | `A1F83G8C2ARO7P` | UK |
| Germany | `A1PA6795UKMFR9` | DE |
| France | `A13V1IB3VIYZZH` | FR |
| Spain | `A1RKKUPIHCS9HS` | ES |
| Italy | `APJ6JRA9NG5V4` | IT |
| Netherlands | `A1805IZSGTT6HS` | NL |
| Sweden | `A2NODRKZP88ZB9` | SE |
| Turkey | `A33AVAJ2PDY3EV` | TR |
| Saudi Arabia | `A17E79C6D8DWNP` | SA |
| UAE | `A2VIGQ35RCS4UG` | AE |

### APAC

| Country | Marketplace ID | Code |
|---------|---------------|------|
| Japan | `A1VC38T7YXB528` | JP |
| Australia | `A39IBJ37TRP1C6` | AU |
| India | `A21TJRUUN4KGV` | IN |

## Example: First API Call

Retrieve all instances in your account:

```bash
curl --location 'https://advertising-api.amazon.com/amc/instances' \
  --header 'Authorization: Bearer {token}' \
  --header 'Amazon-Advertising-API-ClientID: {Login with Amazon Client ID}' \
  --header 'Amazon-Advertising-API-AdvertiserId: {Sponsored Ads Entity ID or AMC Account ID}' \
  --header 'Amazon-Advertising-API-MarketplaceId: {Marketplace ID}'
```

## API Functional Categories

| Category | API Path Prefix | Description |
|----------|----------------|-------------|
| Administration | `/amc/accounts`, `/amc/instances` | Manage accounts and instances |
| Reporting | `/amc/reporting/{instanceId}/...` | Create/execute/schedule workflows, get query results |
| Audiences | `/amc/audiences/{instanceId}/...` | Create and manage custom audiences |
| Advertiser Data Upload | `/amc/upload/{instanceId}/...` | Upload advertiser first-party data |
| Custom Models | `/amc/models/{instanceId}/...` | Manage custom models |

## Rate Limits

- AMC enforces rate limits per endpoint within a time period
- Exceeding limits results in **429 (Too Many Requests)** error responses
- Workflow execution has concurrency limits:
  - **Instance level**: 10 parallel executions
  - **Account level**: 200 parallel executions
- No limit on the number of queued executions at the account level
- Limits are subject to change

## S3 Bucket Configuration (Optional)

Query results can be retrieved in two ways:

1. **Download URL** — call `GET /amc/reporting/{instanceId}/workflowExecutions/{workflowExecutionId}/downloadUrls`
2. **S3 Bucket** — results are automatically stored in your connected S3 bucket

### Setting Up an S3 Bucket

1. After instance creation, update the instance to include your **AWS Account ID** and **S3 bucket name**
2. Use the generated **CloudFormation URL** to create the S3 bucket within your AWS account
3. CloudFormation automatically grants AMC permission to write query results to the bucket
4. The bucket is owned and controlled by your AWS account; AMC cannot read files from it

> Possessing an AWS account and an S3 bucket is **not required** for AMC APIs. Without S3, you can use the Download URL method to retrieve results.
