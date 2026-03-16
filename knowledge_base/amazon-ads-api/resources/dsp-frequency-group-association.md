---
title: D16GFMApiFrequencyGroupAssociationV1
source: https://advertising.amazon.com/API/docs/en-us
section: Amazon DSP
---

# D16GFMApiFrequencyGroupAssociationV1

**Version**: 3.0

FM FrequencyGroupAssociation API V1

## Endpoints

### PUT `/frequencyGroups/v1/advertiserAssociations`

**updateFrequencyGroupAdvertiserAssociationsV1**

Updates the list of frequency group and advertiser associations for a given entity. Accepts a maximum of 100 entries. Campaigns with Target Frequency KPI or Incremental Reach KPI cannot be associated with frequency groups.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view"]

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `201`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### POST `/frequencyGroups/v1/advertiserAssociations/list`

**listFrequencyGroupAdvertiserAssociationsV1**

Lists all associations between specified frequency groups or advertisers. Either a list of frequencyGroupIds or a list of advertiserIds should be provided, not both.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view"]

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `207`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### POST `/frequencyGroups/v1/advertisers/list`

**listAdvertisersFrequencyGroupAssociationsV1**

Provides a list of available advertisers and their frequency group association under an entity.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view"]

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `200`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### PUT `/frequencyGroups/v1/campaignAssociations`

**updateFrequencyGroupCampaignAssociationsV1**

Updates the list of frequency group and campaign associations for a given advertiser. Accepts a maximum of 100 entries. Each entry represents the final association state for that campaign. If the frequency group is an empty string ("campaignId": "id", "frequencyGroupId": ""), the campaign will be disassociated; otherwise ("campaignId": "id", "frequencyGroupId": "id") the campaign and frequency group will be associated.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `204`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### POST `/frequencyGroups/v1/campaignAssociations/list`

**listFrequencyGroupCampaignAssociationsV1**

Lists all associations between specified frequency groups or campaigns. Either a list of frequencyGroupIds or a list of campaignIds should be provided, not both.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view"]

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `207`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### POST `/frequencyGroups/v1/campaigns/list`

**listCampaignsFrequencyGroupAssociationsV1**

Provides a list of available campaigns/orders and their frequency group association under an advertiser.

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view"]

Tags: FrequencyGroupAssociation

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | True | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | True | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `200`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---


## Schemas (41 total)

- **AdsOwnerType**: If the frequency group belongs to a DSP entity or manager account, ownerType is MANAGER_ACCOUNT. If 
- **CampaignFrequency**: 
- **CampaignType**: 
- **CauseForAssociationUnavailability**: 
- **DeliveryStatus**: 
- **DspBadRequestExceptionResponseContent**: 
- **DspForbiddenExceptionResponseContent**: 
- **DspInternalServerExceptionResponseContent**: 
- **DspNotFoundExceptionResponseContent**: 
- **DspSubError**: 
- **DspTooManyRequestsExceptionResponseContent**: 
- **DspUnauthorizedExceptionResponseContent**: 
- **DspUnsupportedMediaTypeExceptionResponseContent**: 
- **FrequencyGroupInput**: 
- **FrequencyGroupWithAssociationOutput**: 
- **KPI**: 
- **ListAdvertiserAssociationResponseBaseObject**: 
- **ListAdvertiserFrequencyGroupAssociationResponseBaseObject**: 
- **ListAdvertisersBaseObject**: 
- **ListAdvertisersFrequencyGroupAssociationsBaseObject**: 
- **ListAdvertisersFrequencyGroupAssociationsRequestContentV1**: 
- **ListAdvertisersFrequencyGroupBaseObject**: 
- **ListCampaignAssociationResponseBaseObject**: 
- **ListCampaignsCampaignBaseObject**: 
- **ListCampaignsFrequencyGroupAssociationsRequestContentV1**: 
- **ListCampaignsFrequencyGroupBaseObject**: 
- **ListCampaignsFrequencyGroupCampaignAssociationsBaseObject**: Campaign and associated frequency groups. frequencyGroup contains a frequency group belongs to DSP a
- **ListFrequencyGroupAdvertiserAssociationRequestContentV1**: 
- **ListFrequencyGroupAdvertiserAssociationResponseBaseObject**: 
- **ListFrequencyGroupAssociationRequestContentV1**: 
- **ListFrequencyGroupAssociationResponseBaseObject**: 
- **ListFrequencyGroupCampaignAssociationResponseBaseObject**: 
- **TimeUnitV1**: 
- **UpdateFrequencyGroupAdvertiserAssociationRequestContentV1**: 
- **UpdateFrequencyGroupAdvertiserAssociationsBaseObject**: 
- **UpdateFrequencyGroupAssociationsBaseObject**: Either frequencyGroupId or frequencyGroups should be provided, not both. Provide frequencyGroupId, i
- **UpdateFrequencyGroupAssociationsRequestContentV1**: 
- **listAdvertisersFrequencyGroupAssociationsV1ResponseContent**: 
- **listCampaignsFrequencyGroupAssociationsV1ResponseContent**: 
- **listFrequencyGroupAdvertiserAssociationsV1ResponseContent**: 
- **listFrequencyGroupCampaignAssociationsV1ResponseContent**: 
