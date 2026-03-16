---
title: D16GFMApiFrequencyGroupV1
source: https://advertising.amazon.com/API/docs/en-us
section: Amazon DSP
---

# D16GFMApiFrequencyGroupV1

**Version**: 3.0

FM FrequencyGroup API

## Endpoints

### POST `/frequencyGroups/v1`

**createFrequencyGroupV1**

Creates a frequency group with basic details and generates a frequency group identifier.

**Authorized resource type**:
Global Ad Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","advertiser_campaign_edit"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","ad

Tags: Frequency Group

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | False | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. Use Amazon-Ads- |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | False | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `201`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### POST `/frequencyGroups/v1/list`

**listFrequencyGroupsV1**

Gets a list of frequency groups for a given advertiser or entity.

**Authorized resource type**:
Global Ad Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view","advertiser_campaign_edit","advertiser_campaign_view"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:


Tags: Frequency Group

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Ads-AccountId | header | False | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. Use Amazon-Ads- |
| Amazon-Ads-Manager-AccountId | header | False | string | The identifier of a manager account. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | False | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `200`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### GET `/frequencyGroups/v1/{frequencyGroupId}`

**getFrequencyGroupV1**

Gets basic details for a frequency group given a frequency group identifier.

**Authorized resource type**:
Global Ad Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","campaign_view","advertiser_campaign_edit","advertiser_campaign_view"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these perm

Tags: Frequency Group

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| frequencyGroupId | path | True | string |  |
| Amazon-Ads-AccountId | header | False | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. Use Amazon-Ads- |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | False | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `200`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### PATCH `/frequencyGroups/v1/{frequencyGroupId}`

**patchFrequencyGroupV1**

Updates a frequency group.

**Authorized resource type**:
Global Ad Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","advertiser_campaign_edit"]

**Authorized resource type**:
DSP Rodeo Entity ID, DSP Advertiser Account ID

**Parameter name**:
Amazon-Ads-AccountId

**Parameter in**:
header

**Requires one of these permissions**:
["campaign_edit","advertiser_campaign_edit"]

**Authorized resource type**:
Global

Tags: Frequency Group

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| frequencyGroupId | path | True | string |  |
| Amazon-Ads-AccountId | header | False | string | Account identifier you use to access the DSP. This is your Amazon DSP Advertiser ID. Use Amazon-Ads- |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |
| Amazon-Advertising-API-Scope | header | False | string | The identifier of a profile associated with the advertiser account. Use GET method on Profiles resou |

**Responses:** `204`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---


## Schemas (19 total)

- **AdvertiserIdFilter**: Filter frequency groups by the list of advertiser ids.
- **CreateFrequencyGroupRequestContentV1**: 
- **CreateFrequencyGroupResponseContentV1**: 
- **CreateFrequencyGroupsV1**: 
- **CreatedFrequencyGroupsV1**: 
- **DspBadRequestExceptionResponseContent**: 
- **DspForbiddenExceptionResponseContent**: 
- **DspInternalServerExceptionResponseContent**: 
- **DspNotFoundExceptionResponseContent**: 
- **DspSubError**: 
- **DspTooManyRequestsExceptionResponseContent**: 
- **DspUnauthorizedExceptionResponseContent**: 
- **DspUnsupportedMediaTypeExceptionResponseContent**: 
- **FrequencyGroupStatusV1**: The frequency group status. Set to active on successful creation of the frequency group.
- **FrequencyGroupTimeUnitV1**: 
- **FrequencyGroups**: 
- **GetFrequencyGroupRequestContentV1**: 
- **ListFrequencyGroupsRequestContentV1**: 
- **PatchFrequencyGroupRequestContentV1**: 
