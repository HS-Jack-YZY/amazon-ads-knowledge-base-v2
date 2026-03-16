---
title: Amazon Ads API Quick Reference
description: A comprehensive quick reference for the Amazon Advertising API
---

# Amazon Ads API - Quick Reference

## 1. What is the Amazon Ads API?

The Amazon Ads API enables advertisers and partners to **programmatically manage advertising operations** and **retrieve performance data** across all Amazon advertising products.

### Key Capabilities
- Create, manage, and optimize ad campaigns
- Retrieve performance metrics and reporting data
- Manage advertiser accounts and profiles
- Access audience insights and recommendations
- Automate bidding and budget optimization

---

## 2. API Versions

### Amazon Ads API v1 (Recommended for new integrations)
- Unified API across all advertising products
- Common data model for campaigns, ad groups, targets, ads
- RESTful design with consistent patterns
- OpenAPI specification available for SDK generation

### Legacy APIs (Sponsored Products v2/v3, Sponsored Brands v3, etc.)
- Product-specific APIs with different patterns
- Still supported but v1 is recommended for new work

---

## 3. Regional Endpoints

| Region | Endpoint URL | Marketplaces |
|--------|-------------|-------------|
| **North America (NA)** | `https://advertising-api.amazon.com` | US, CA, MX, BR |
| **Europe (EU)** | `https://advertising-api-eu.amazon.com` | UK, FR, IT, ES, DE, NL, AE, PL, TR, EG, SA, SE, BE, IN, ZA |
| **Far East (FE)** | `https://advertising-api-fe.amazon.com` | JP, AU, SG |

---

## 4. Authentication

Amazon Ads API uses **Login with Amazon (LWA)** OAuth 2.0:

1. Register your application in the Amazon Developer Console
2. Obtain a client ID and client secret
3. Use the authorization code grant flow to get access tokens
4. Include the access token in the `Authorization` header
5. Include your profile ID in the `Amazon-Advertising-API-Scope` header

### Required Headers
```
Authorization: Bearer {access_token}
Amazon-Advertising-API-ClientId: {client_id}
Amazon-Advertising-API-Scope: {profile_id}
Content-Type: application/json
```

---

## 5. Key Resources / Product APIs

### Accounts & Profiles
- **Profiles** - Advertising profiles associated with accounts
- **Manager Accounts** - Parent accounts managing multiple profiles
- **Account Management** - Account-level operations

### Campaign Management (Common Model)
- **Campaigns** - Top-level advertising campaigns
- **Ad Groups** - Groups of ads within campaigns
- **Targets** - Keyword and product targeting
- **Ads** - Individual ad creatives
- **Ad Associations** - Links between ads and ad groups

### Advertising Products
| Product | Description |
|---------|-------------|
| **Sponsored Products** | PPC ads in search results and product pages |
| **Sponsored Brands** | Banner ads featuring brand logo, headline, products |
| **Sponsored Display** | Display ads on and off Amazon |
| **Sponsored TV** | Streaming TV ads |
| **Amazon DSP** | Demand-side platform for programmatic display/video |

### Reporting & Analytics
- **Version 3 Reporting** - Async report generation
- **Brand Metrics** - Brand awareness and consideration metrics
- **Amazon Attribution** - Cross-channel attribution
- **Amazon Marketing Stream** - Near real-time performance data streaming
- **Brand Benchmarks** - Category-level benchmarking

### Amazon Marketing Cloud (AMC)
- **AMC Administration** - Instance management
- **AMC Reporting** - SQL-based custom analytics
- **Rule-based Audiences** - Audience creation from AMC insights
- **Advertiser Data Upload** - First-party data integration
- **Custom Models** - Machine learning model deployment

### Amazon DSP
- **Measurement** - Campaign measurement and attribution
- **Combined Audiences** - Audience segment management
- **Conversions** - Conversion tracking setup
- **Frequency Groups** - Cross-campaign frequency management
- **Guidance** - Campaign optimization recommendations

### Other Resources
- **Portfolios** - Group campaigns for budget management
- **Billing & Invoices** - Billing data and account budgets
- **Stores** - Amazon Store management
- **Posts** - Social-style content
- **Assets** - Creative asset library
- **Product Metadata/Eligibility** - Product information and ad eligibility
- **Change History** - Audit log of account changes
- **Moderation** - Ad review status and feedback
- **Localization** - Multi-language ad content

---

## 6. Common Patterns

### Typical Workflow
1. **List Profiles** → Get available advertising profiles
2. **Create Campaign** → Set budget, targeting, and schedule
3. **Create Ad Groups** → Organize ads and targets
4. **Add Targets** → Keywords, products, or audiences
5. **Create Ads** → Ad creative content
6. **Monitor Reports** → Pull performance data
7. **Optimize** → Adjust bids, budgets, targeting

### Pagination
Most list endpoints support pagination with `nextToken` / `startIndex` + `count` patterns.

### Async Operations
Reports and bulk operations use async patterns:
1. Submit request → Get request ID
2. Poll status → Check if complete
3. Download results → Get the data

### Batch Operations
Use batch endpoints to create/update multiple entities in a single request (e.g., batch update campaigns, ad groups).

---

## 7. Rate Limiting

The API enforces rate limits per advertising account. When limits are exceeded:
- HTTP 429 (Too Many Requests) is returned
- Use exponential backoff retry strategy
- Check `Retry-After` header for wait time

---

## 8. Error Handling

Standard HTTP status codes:
| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 207 | Multi-status (batch operations) |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 422 | Unprocessable Entity |
| 429 | Too Many Requests |
| 500 | Internal Server Error |

---

## 9. Useful Links

- **API Overview**: https://advertising.amazon.com/API/docs/en-us/reference/api-overview
- **Onboarding Guide**: https://advertising.amazon.com/API/docs/en-us/guides/onboarding/overview
- **Getting Started**: https://advertising.amazon.com/API/docs/en-us/guides/get-started/overview
- **V1 API Spec**: https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis
- **GitHub**: https://github.com/amzn/ads-advanced-tools-docs
- **RSS Release Notes**: https://d3a0d0y2hgofx6.cloudfront.net/rss/en-us/ad-api-rss.xml

---

## 10. Glossary

| Term | Description |
|------|-------------|
| **LWA** | Login with Amazon - OAuth 2.0 authentication |
| **Profile** | An advertising profile linked to a marketplace |
| **ASIN** | Amazon Standard Identification Number (product ID) |
| **SP** | Sponsored Products |
| **SB** | Sponsored Brands |
| **SD** | Sponsored Display |
| **STV** | Sponsored TV |
| **DSP** | Demand-Side Platform |
| **AMC** | Amazon Marketing Cloud |
| **AMS** | Amazon Marketing Stream |
| **ACOS** | Advertising Cost of Sales |
| **ROAS** | Return on Ad Spend |
| **CPC** | Cost Per Click |
| **CPM** | Cost Per Mille (thousand impressions) |
| **CTR** | Click-Through Rate |
| **RBA** | Rule-Based Audiences |
