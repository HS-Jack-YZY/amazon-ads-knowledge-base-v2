# Amazon Ads API - Knowledge Base Index

> Source: https://advertising.amazon.com/API/docs/en-us/reference/api-overview
> Generated: 2026-03-16

## API Endpoints (Regional Hosts)

| URL | Region | Marketplaces |
|-----|--------|-------------|
| https://advertising-api.amazon.com | North America (NA) | US, CA, MX, BR |
| https://advertising-api-eu.amazon.com | Europe (EU) | UK, FR, IT, ES, DE, NL, AE, PL, TR, EG, SA, SE, BE, IN, ZA |
| https://advertising-api-fe.amazon.com | Far East (FE) | JP, AU, SG |

## Navigation Structure

### 1. Overview
- [API Overview](api-overview.md)

### 2. Concepts
- [Concepts Overview](concepts/overview.md)
- [Errors](concepts/errors.md)
- [Limits, Constraints, and Quotas](concepts/limits.md)
- [Rate Limiting](concepts/rate-limiting.md)
- [Compatibility and Versioning Policy](concepts/compatibility-versioning-policy.md)
- [Computed Status](concepts/computed-status.md)
- [Developer Notes](concepts/developer-notes.md)

### 3. Common Models
- [Common Models Overview](common-models/overview.md)
- [Campaigns](common-models/campaigns.md)
- [Ad Groups](common-models/ad-groups.md)
- [Targets](common-models/targets.md)
- [Ads](common-models/ads.md)
- [Ad Associations](common-models/ad-associations.md)
- [Enums](common-models/enums.md)

### 4. Guides (Implementation)
- [API Endpoints Reference](guides/api-endpoints-reference.md) ★ Complete endpoint paths for all products
- [Pagination & Batch Operations](guides/pagination-and-batch.md) ★ Pagination patterns, batch operations, async workflows
- [Code Examples (Python)](guides/code-examples.md) ★ End-to-end code examples for common operations
- [Authentication](guides/authentication.md)

#### Authorization (OAuth 2.0 Flow)
- [Authorization Overview](guides/authorization-overview.md) — OAuth 2.0 flow, required headers
- [Authorization Grants](guides/authorization-grants.md) — Consent URL, authorization codes
- [Access Tokens](guides/authorization-access-tokens.md) — Token retrieval, refresh, regional endpoints
- [Profiles](guides/authorization-profiles.md) — Profile retrieval, types, regional behavior

#### Campaign Management Entities (v1 Common Model)
- [Entities Overview](guides/campaign-mgmt-entities-overview.md) — 5 entity types, hierarchy
- [Campaign Entity](guides/campaign-mgmt-entities-campaign.md) ★ All parameters by ad product (SP/SB/DSP)
- [AdGroup Entity](guides/campaign-mgmt-entities-ad-group.md) ★ Parameters, bid, targeting settings
- [Ad Entity](guides/campaign-mgmt-entities-ad.md) ★ Creative types (product/component/display/video/audio)
- [Target Entity](guides/campaign-mgmt-entities-target.md) ★ 24+ target types (keyword/product/audience/DSP)
- [AdAssociation Entity](guides/campaign-mgmt-entities-ad-association.md) — DSP only

#### Reporting v3
- [Report Types](guides/reporting-v3-report-types.md) ★ Report types by ad product (SP/SB/SD/STV/DSP)
- [Reporting Columns (Metrics)](guides/reporting-v3-columns.md) ★ All metrics with types and report type mappings

#### Exports API
- [Exports Overview](guides/exports-overview.md) — Async metadata retrieval
- [Campaigns Model](guides/exports-campaigns.md)
- [Ad Groups Model](guides/exports-ad-groups.md)
- [Targets Model](guides/exports-targets.md)
- [Ads Model](guides/exports-ads.md)

#### Amazon Marketing Stream
- [Data Guide](guides/marketing-stream-data-guide.md) ★ All datasets, regional availability, subscription endpoints

### 5. Amazon Ads API v1
- [V1 Overview](amazon-ads-v1/overview.md)
- [V1 Get Started](amazon-ads-v1/getting-started.md)
- [Generate SDK from v1 Specs](amazon-ads-v1/generate-sdk.md)

### 6. Resources - Accounts
- [Account Management (beta)](resources/account-management.md)
- [Profiles](resources/profiles.md)
- [Manager Accounts](resources/manager-accounts.md)
- [Test Accounts](resources/test-accounts.md)
- [User Invitations](resources/user-invitations.md)
- [User Permissions](resources/user-permissions.md)

### 7. Resources - Reporting
- [Version 3 Reporting](resources/reporting-v3.md)
- [Brand Metrics (beta)](resources/brand-metrics.md)
- [Brand Benchmarks](resources/brand-benchmarks.md)
- [Store Insights](resources/store-insights.md)
- [Marketing Mix Modeling (beta)](resources/marketing-mix-modeling.md)

### 8. Resources - Campaign Management (v1 CRUD with examples)
- [Campaigns (v1)](resources/campaigns-v1.md)
- [Ad Groups (v1)](resources/ad-groups-v1.md)
- [Targets (v1)](resources/targets-v1.md)
- [Ads (v1)](resources/ads-v1.md)
- [Ad Associations (v1)](resources/ad-associations-v1.md)

### 9. Resources - Other
- [Ads Data Manager](resources/ads-data-manager.md)
- [Exports](resources/exports.md)

### 10. Resources - Retail Ad Service
- [Campaign Management](resources/retail-ad-service.md)
- [Retailer Identity](resources/retailer-identity.md)

### 11. Resources - Sponsored Products
(Uses Amazon Ads API v1)

### 12. Resources - Sponsored Brands
- [Version 4](resources/sponsored-brands-v4.md)
- [Version 3](resources/sponsored-brands-v3.md)
- [Category Benchmark](resources/sponsored-brands-category-benchmark.md)

### 13. Resources - Sponsored Display
- [Campaign Management](resources/sponsored-display.md)

### 14. Resources - Sponsored TV
- [Campaign Management (beta)](resources/sponsored-tv.md)

### 15. Resources - Amazon DSP
- [Forecasts](resources/dsp-forecasts.md)
- [Measurement (beta)](resources/dsp-measurement.md)
- [Advertiser (beta)](resources/dsp-advertiser.md)
- [Combined Audiences](resources/dsp-combined-audiences.md)
- [Conversions](resources/dsp-conversions.md)
- [Frequency Savings Insight](resources/dsp-freq-insight.md)
- [Frequency Groups](resources/dsp-frequency-group.md)
- [Frequency Groups Associations](resources/dsp-frequency-group-association.md)
- [Guidance](resources/dsp-guidance.md)
- [Performance+ Insights (beta)](resources/dsp-campaign-insights.md)
- [Quick Actions](resources/dsp-quick-actions.md)

### 16. Resources - Amazon Marketing Cloud (AMC)
- [AMC Administration](resources/amc-administration.md)
- [AMC Reporting](resources/amc-reporting.md)
- [Rule-based Audiences](resources/amc-rba.md)
- [Advertiser Audiences (beta)](resources/amc-advertiser-audience.md)
- [Advertiser Data Upload](resources/amc-advertiser-data-upload.md)
- [Custom Models](resources/amc-custom-models.md)

### 17. Resources - Other Services
- [Amazon Marketing Stream](resources/amazon-marketing-stream.md)
- [Amazon Attribution](resources/amazon-attribution.md)
- [Billing](resources/billing.md)
- [Account Budgets](resources/account-budgets.md)
- [Portfolios](resources/portfolios.md)
- [Brand Associations](resources/brand-associations.md)
- [Brand Home](resources/brand-home.md)
- [Stores](resources/stores.md)
- [Posts](resources/posts.md)
- [Assets](resources/assets.md)

### 18. Resources - Products & Discovery
- [Product Metadata](resources/product-metadata.md)
- [Product Eligibility](resources/product-eligibility.md)
- [Targetable Entities](resources/targetable-entities.md)
- [Locations](resources/locations.md)

### 19. Resources - Recommendations & Insights
- [Partner Opportunities](resources/partner-opportunities.md)
- [Overlapping Audiences](resources/overlapping-audiences.md)
- [Persona Builder](resources/persona-builder.md)
- [Campaign Diagnostics](resources/campaign-diagnostics.md)

### 20. Resources - Content & Moderation
- [Pre-moderation](resources/pre-moderation.md)
- [Moderation](resources/moderation.md)
- [Change History](resources/change-history.md)
- [Ad Library](resources/ad-library.md)

### 21. Resources - Media Planning
- [Reach and Performance Forecasting](resources/reach-performance-forecasting.md)
- [Historic Reach](resources/historic-reach.md)

### 22. Resources - Localization
- [Localization](resources/localization.md)
- [Validation Configuration](resources/validation-configuration.md)

### 23. Resources - Data Provider
- [Record Management](resources/data-provider-record.md)
- [Hashed Records](resources/data-provider-hashed-records.md)

### 24. Older Versions
- [DSP Reports (v2)](older/dsp-reports-v2.md)
- [DSP Reports (v3)](older/dsp-reports-v3.md)
- [DSP Bid Modifiers](older/dsp-bid-modifiers.md)
- [DSP Campaign Management](older/dsp-campaigns.md)
- [Profiles (v1)](older/profiles-v1.md)
- [Suggested Keywords](older/suggested-keywords.md)
- [Bid Controls](older/bid-controls.md)
- [Reports (v1)](older/reports-v1.md)

## URL Reference

All pages are under `https://advertising.amazon.com/API/docs/en-us/`
