---
title: AMC Administration
source: https://advertising.amazon.com/API/docs/en-us
section: AMC
---

# AMC Administration

**Version**: 3.0

This set of APIs allow developers to manage their Amazon Marketing Cloud accounts and instances.

## Endpoints

### GET `/amc/accounts`

**Get a list of AMC Accounts that the user have access to.**

Get a list of AMC Accounts that the user have access to.

**Requires one of these permissions**:
[]

Tags: AMC Accounts

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with a "Login with Amazon" account. |

**Responses:** `200`, `400`, `401`, `403`, `429`, `500`

---

### GET `/amc/instances`

**Gets information about all AMC instances.**

Gets information about all AMC instances that the requesting entity has access to. Information for each instance includes the name, creation status, and the entities with access to the instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |
| limit | query | False | string | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |

**Responses:** `200`, `400`, `401`, `403`, `422`, `429`, `500`

---

### POST `/amc/instances`

**Creates a new AMC instance.**

Creates a new AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |

**Responses:** `200`, `400`, `401`, `403`, `429`, `500`

---

### DELETE `/amc/instances/{instanceId}`

**Deletes the requested AMC instance.**

Deletes the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `204`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}`

**Gets information about the requested AMC instance.**

Gets information about the requested AMC instance. Information includes the name, creation status, and the entities with access to the instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `415`, `429`, `500`

---

### PUT `/amc/instances/{instanceId}`

**Updates the requested AMC instance.**

Updates the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/advertisers`

**Gets advertisers information about the requested AMC instance.**

Gets advertisers information about the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| type | query | False | string | Optional. Filter advertisers by advertiser type in the response, if not provided, return all adverti |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |
| limit | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/advertisers/updates`

**Lists advertiser updates for the requested AMC instance.**

Gets advertiser updates for the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |
| limit | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/advertisers/updates`

**Creates a new advertiser update for the requested AMC instance.**

Creates a new advertiser update for the requested AMC instance. If there is already an open request(REQUESTED, AWAITING_APPROVAL, UPDATING), the request will fail.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/advertisers/updates/{updateId}`

**Gets the requested advertiser update for the requested AMC instance.**

Gets the requested advertiser update for the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| updateId | path | True | integer | The advertiser update identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/collaboration`

**Gets the collaboration metadata for the requested AMC instance.**

Gets the collaboration metadata for the requested AMC instance. Collaboration metadata is only available in instances backed by ACR.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaboration/idmappingtables`

**Creates an ID Mapping Table in the requested AMC instance collaboration and starts the job to populate the table.**

Creates an ID Mapping Table in the requested AMC instance collaboration and starts the job to populate the table.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaboration/idmappingtables/list`

**Lists the ID mapping tables in the collaboration in the requested AMC instance.**

Lists the ID mapping tables in the collaboration in the requested AMC instance. ID Mapping Tables are only available in instances backed by ACR.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### DELETE `/amc/instances/{instanceId}/collaboration/idmappingtables/{idMappingTableId}`

**Deletes the given ID Mapping Table in the collaboration for the requested AMC instance.**

Deletes the given ID Mapping Table in the collaboration for the requested AMC instance.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| idMappingTableId | path | True | string | The ID mapping table identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/collaboration/idmappingtables/{idMappingTableId}/jobTracker/{trackingId}`

**Retrieves the ID mapping workflow job associated to the tracking ID.**

Retrieves the ID mapping workflow job associated to the tracking ID. ID mapping workflow jobs are only available in instances backed by ACR.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| idMappingTableId | path | True | string | The ID mapping table identifier. |
| trackingId | path | True | string | The job tracking ID. Tracks when the ID mapping workflow job associated to the ID mapping table crea |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaboration/idmappingtables/{idMappingTableId}/jobs/list`

**Lists the ID mapping jobs associated to the ID mapping table.**

Lists the jobs associated to the given ID mapping table in the collaboration for the requested AMC instance. The response is paginated. Maximum number of jobs in the response is 100. If more jobs exist, the token included in the response can be used to get the next page of jobs.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| idMappingTableId | path | True | string | The ID mapping table identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### GET `/amc/instances/{instanceId}/collaboration/idmappingtables/{idMappingTableId}/jobs/{jobId}`

**Gets the ID mapping job metadata for the requested AMC instance.**

Gets the metadata of the job associated to the ID Mapping Table in the collaboration for the requested AMC instance. ID mapping job metadata is only available in instances backed by ACR.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| idMappingTableId | path | True | string | The ID mapping table identifier. |
| jobId | path | True | string | The ID mapping job identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaboration/idmappingtables/{idMappingTableId}/refresh`

**Refreshes the data in the given ID Mapping Table in the collaboration for the requested AMC instance.**

Starts a workflow job to refresh the data in the given ID Mapping Table in the collaboration for the requested AMC instance. Only one refresh every 14 days is allowed.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| idMappingTableId | path | True | string | The ID mapping table identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaboration/idnamespaces/list`

**Lists the ID namespaces associated to the collaboration in the requested AMC instance.**

Lists the advertiser ID namespaces that are not connected to an ID mapping table in the collaboration in the requested AMC instance. Advertiser ID Namespaces are only available in instances backed by ACR.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated.   Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adv |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaborations`

**Creates a collaboration in AWS Clean Rooms for this AMC instance.**

Creates a collaboration in AWS Clean Rooms (ACR). The collaboration is associated to the AMC instance. Only one collaboration per instance is allowed.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### PUT `/amc/instances/{instanceId}/collaborations/{collaborationId}/acrCustomer`

**Update customer member in the collaboration.**

Updates the customer's AWS account ID in the AWS Clean Rooms collaboration associated to the AMC instance. The customer must re-join the collaboration after the change is applied.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| collaborationId | path | True | string | The identifier of the collaboration associated to the instance. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/collaborations/{collaborationId}/acrCustomerPartners`

**Add one or more customer partners to the collaboration.**

Add one or more customer partner members to the AWS Clean Rooms collaboration associated to the AMC instance.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| collaborationId | path | True | string | The identifier of the collaboration associated to the instance. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### PUT `/amc/instances/{instanceId}/collaborations/{collaborationId}/acrCustomerPartners`

**Update one or more customer partners in the collaboration.**

Update one or more customer partner members in the AWS Clean Rooms collaboration associated to the AMC instance. Only member abilities can be updated.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| collaborationId | path | True | string | The identifier of the collaboration associated to the instance. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### DELETE `/amc/instances/{instanceId}/collaborations/{collaborationId}/acrCustomerPartners/{acrCustomerPartnerId}`

**Delete the requested customer partner in the collaboration.**

Delete the requested customer partner member in the AWS Clean Rooms collaboration associated to the AMC instance.

Tags: Collaboration instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |
| collaborationId | path | True | string | The identifier of the collaboration associated to the instance. |
| acrCustomerPartnerId | path | True | string | The ID of the customer partner to be deleted. This value is the same as the AWS account ID of the cu |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---

### POST `/amc/instances/{instanceId}/updateCustomerAwsAccount`

**Updates customer's AWS account metadata in the requested AMC instance.**

Updates customer's AWS account metadata in the requested AMC instance.

Tags: Instance management

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
| Amazon-Advertising-API-ClientId | header | True | string | The identifier of a client associated with an Amazon Developer account. |
| Amazon-Advertising-API-Scope | header | False | string | This header is deprecated. Clients must pass in Amazon-Advertising-API-AdvertiserId and Amazon-Adver |
| Amazon-Advertising-API-AdvertiserId | header | True | string | The AMC Account ID |
| Amazon-Advertising-API-MarketplaceId | header | True | string | The Marketplace ID |
| instanceId | path | True | string | The instance identifier. |

**Responses:** `200`, `400`, `401`, `403`, `404`, `429`, `500`

---


## Schemas (63 total)

- **AcrCustomerPartner**: Metadata about a customer partner in a collaboration
- **AcrMemberAbility**: The list of abilities the member can have in a collaboration.
- **AddCollaborationCustomerPartnersPayload**: The payload of the request.
- **AddCollaborationCustomerPartnersResponse**: 
- **Advertiser**: Details about an advertiser
- **AdvertiserType**: The advertiser type values
- **AmcAdvertiserIdentifier**: Identifying properties of an advertiser.
- **AmcAdvertiserUpdate**: 
- **AmcAdvertiserUpdateLite**: 
- **AmcAdvertiserUpdateStatus**: The status of an advertiser update request.
- **AmcCreateAdvertiserUpdateRequest**: 
- **AmcCreateAdvertiserUpdateResponse**: 
- **AmcCreateInstanceRequest**: 
- **AmcCreateInstanceResponse**: 
- **AmcDeleteInstanceResponse**: Empty response object denoting successful deletion of an instance.
- **AmcGetAdvertiserUpdateResponse**: 
- **AmcListAdvertiserUpdatesResponse**: 
- **AmcUpdateInstanceRequest**: 
- **AmcUpdateInstanceResponse**: 
- **AmcpLinkAmcAccount**: AMC Account details.
- **AmcpLinkBadRequestExceptionResponseContent**: Bad Request.
- **AmcpLinkForbiddenRequestExceptionResponseContent**: Forbidden. The request failed because the user does not have access to the specified resource.
- **AmcpLinkListAmcAccountsResponseContent**: List of AMC Accounts.
- **AmcpLinkServerExceptionResponseContent**: Internal server error. Retry later. Contact support if this response persists.
- **AmcpLinkTooManyRequestsExceptionResponseContent**: Too Many Requests. The request was rate-limited. Retry later.
- **AmcpLinkUnauthorizedRequestExceptionResponseContent**: Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke t
- **CollaborationIdMappingJob**: Metadata about the ID mapping job associated to an ID mapping table in the collaboration.
- **CollaborationIdMappingJobMetrics**: Job data record processing metrics.
- **CollaborationIdMappingJobStatus**: The status a job can be in.
- **CollaborationIdMappingJobSummary**: Summarized metadata of the ID mapping job associated to an ID mapping table in the collaboration.
- **CollaborationIdMappingTable**: Metadata about a collaboration ID mapping table
- **CollaborationIdNamespaceAssociation**: Metadata of the Id Namespace associated to the ACR collaboration
- **CollaborationMember**: Metadata about a collaboration member
- **CollaborationMemberStatus**: The list of valid statuses of a member.
- **CollaborationStatus**: The valid statuses of an AWS Clean Rooms collaboration in an AMC instance.
|Status|Description|
|---
- **CollaborationSummary**: ACR collaboration metadata
- **CreateCollaborationIdMappingTablePayload**: Input data to create an ID mapping table
- **CreateCollaborationIdMappingTableResponse**: 
- **CreateCollaborationRequest**: 
- **CreateCollaborationResponse**: 
- **DeleteCollaborationCustomerPartnerResponse**: Empty response object denoting successful deletion of a customer partner.
- **DeleteCollaborationIdMappingTableResponse**: 
- **Error**: The error response object.
- **GetCollaborationIdMappingJobForTrackingIdResponse**: 
- **GetCollaborationIdMappingJobResponse**: 
- **GetInstanceAdvertisersResponse**: 
- **GetInstanceCollaborationResponse**: 
- **GetInstanceResponse**: 
- **Instance**: Details about an AMC instance.
- **InstanceCustomerAwsAccountMetadataPayload**: AWS account metadata

... and 13 more schemas
