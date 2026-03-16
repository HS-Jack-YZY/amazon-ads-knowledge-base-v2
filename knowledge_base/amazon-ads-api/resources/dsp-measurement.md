---
title: Amazon DSP Measurement
source: https://advertising.amazon.com/API/docs/en-us/dsp-measurement
section: Amazon DSP
---

API reference

Resources

Amazon DSP

Amazon DSP measurement
Create and manage brand lift studies for Amazon DSP.
Version 1
OAS 3.0.1
Download OpenAPI spec
Server details
Measurement beta
Measurement
Measurement
Checks the DSP AUDIENCE_RESEARCH study type eligibility against vendor products.
POST
/dsp/measurement/eligibility/audienceResearch

Checks the DSP AUDIENCE_RESEARCH study type eligibility status against vendor products.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: application/vnd.measurementeligibility.v1.2+json

The DSP audience research study eligibility request object.

fundingTypeFilters	
Array of strings (FundingTypeV1M2) [ 1 .. 100 ] items
Items Enum: "COMPLIMENTARY" "CPM" "FLAT_RATE"

FundingType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorProductIdFilters	
Array of strings [ 1 .. 100 ] items

VendorProduct identifier filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorTypeFilters	
Array of strings (VendorTypeV1M2) [ 1 .. 100 ] items
Items Enum: "AMAZON" "OMNICHANNEL_METRICS"

VendorType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


audienceTargetingGroup	
object (AudienceTargetingGroupV1M2)

The model for holding Audiece targeting group. The includedAudienceGroups and excludedAudienceGroups are always joined with AND operator.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"fundingTypeFilters": 
[
"COMPLIMENTARY"
],
"vendorProductIdFilters": 
[
"string"
],
"vendorTypeFilters": 
[
"AMAZON"
],
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
}
}
Response samples
200400401403404415429500
Content type
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"metadata": 
{
"budget": 0.1,
"endDate": "2019-08-24T14:15:22Z",
"flightLength": 0,
"impressions": 0,
"startDate": "2019-08-24T14:15:22Z"
},
"nextToken": "string",
"vendorProductEligibilities": 
[
{}
]
}
Checks the DSP BRAND_LIFT study type eligibility against vendor products.
POST
/dsp/measurement/eligibility/brandLift

Checks the DSP BRAND_LIFT study type eligibility status against vendor products.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.

REQUEST BODY SCHEMA: 
application/vnd.measurementeligibility.v1+json
application/vnd.measurementeligibility.v1.1+json
application/vnd.measurementeligibility.v1+json

The DSP brand lift eligibility request object.

fundingTypeFilters	
Array of strings (FundingTypeV1) [ 1 .. 100 ] items
Items Value: "COMPLIMENTARY"

FundingType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorProductIdFilters	
Array of strings [ 1 .. 100 ] items

VendorProduct identifier filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorTypeFilters	
Array of strings (VendorTypeV1) [ 1 .. 100 ] items
Items Value: "AMAZON"

VendorType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


currentStudyId	
string

Optional current study identifier, if provided orders are expected to be added into this study and the orders already associated with this study will be excluded from certain eligibility check.


excludedLineItemIds	
Array of strings [ 0 .. 100 ] items

A list of canonical lineItem identifiers that are excluded from the eligibility check.


orderIds	
Array of strings [ 1 .. 100 ] items

A list of canonical order identifiers. By default all lineItems in those orders will be included.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.measurementeligibility.v1+json
application/vnd.measurementeligibility.v1.1+json
application/vnd.measurementeligibility.v1+json
Copy
Expand allCollapse all
{
"fundingTypeFilters": 
[
"COMPLIMENTARY"
],
"vendorProductIdFilters": 
[
"string"
],
"vendorTypeFilters": 
[
"AMAZON"
],
"currentStudyId": "string",
"excludedLineItemIds": 
[
"string"
],
"orderIds": 
[
"string"
]
}
Response samples
200400401403404415429500
Content type
application/vnd.measurementeligibility.v1+json
application/vnd.measurementeligibility.v1.1+json
application/vnd.measurementeligibility.v1+json
Copy
Expand allCollapse all
{
"metadata": 
{
"budget": 0.1,
"endDate": "2019-08-24T14:15:22Z",
"flightLength": 0,
"impressions": 0,
"startDate": "2019-08-24T14:15:22Z"
},
"nextToken": "string",
"vendorProductEligibilities": 
[
{}
]
}
Checks the DSP CREATIVE_TESTING study type eligibility against vendor products.
POST
/dsp/measurement/eligibility/creativeTesting

Checks the DSP CREATIVE_TESTING study type eligibility status against vendor products.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: application/vnd.measurementeligibility.v1.2+json

The DSP creative testing study eligibility request object.

fundingTypeFilters	
Array of strings (FundingTypeV1M2) [ 1 .. 100 ] items
Items Enum: "COMPLIMENTARY" "CPM" "FLAT_RATE"

FundingType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorProductIdFilters	
Array of strings [ 1 .. 100 ] items

VendorProduct identifier filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorTypeFilters	
Array of strings (VendorTypeV1M2) [ 1 .. 100 ] items
Items Enum: "AMAZON" "OMNICHANNEL_METRICS"

VendorType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


audienceTargetingGroup	
object (AudienceTargetingGroupV1M2)

The model for holding Audiece targeting group. The includedAudienceGroups and excludedAudienceGroups are always joined with AND operator.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"fundingTypeFilters": 
[
"COMPLIMENTARY"
],
"vendorProductIdFilters": 
[
"string"
],
"vendorTypeFilters": 
[
"AMAZON"
],
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
}
}
Response samples
200400401403404415429500
Content type
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"metadata": 
{
"budget": 0.1,
"endDate": "2019-08-24T14:15:22Z",
"flightLength": 0,
"impressions": 0,
"startDate": "2019-08-24T14:15:22Z"
},
"nextToken": "string",
"vendorProductEligibilities": 
[
{}
]
}
Checks the DSP OMNICHANNEL_METRICS study type eligibility against vendor products.
POST
/dsp/measurement/eligibility/omnichannelMetrics

Checks the DSP OMNICHANNEL_METRICS study type eligibility status against vendor products.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: 
application/vnd.measurementeligibility.v1.2+json
application/vnd.measurementeligibility.v1.3+json
application/vnd.measurementeligibility.v1.2+json

The DSP omnichannel metrics eligibility request object.

fundingTypeFilters	
Array of strings (FundingTypeV1M2) [ 1 .. 100 ] items
Items Enum: "COMPLIMENTARY" "CPM" "FLAT_RATE"

FundingType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorProductIdFilters	
Array of strings [ 1 .. 100 ] items

VendorProduct identifier filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


vendorTypeFilters	
Array of strings (VendorTypeV1M2) [ 1 .. 100 ] items
Items Enum: "AMAZON" "OMNICHANNEL_METRICS"

VendorType filters to be applied when checking eligibility status. If not supplied we will check against all available vendor products.


brandIds	
Array of strings [ 0 .. 100 ] items

A list of canonical brand identifiers.


currentStudyId	
string

Optional current study identifier. If provided orders are expected to be added into this study and the orders already associated with this study will be excluded from certain eligibility checks.


excludedLineItemIds	
Array of strings [ 0 .. 100 ] items

A list of canonical lineItem identifiers that are excluded from the eligibility check.


orderIds	
Array of strings [ 0 .. 100 ] items

A list of canonical order identifiers. By default all lineItems in those orders will be included.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.measurementeligibility.v1.2+json
application/vnd.measurementeligibility.v1.3+json
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"fundingTypeFilters": 
[
"COMPLIMENTARY"
],
"vendorProductIdFilters": 
[
"string"
],
"vendorTypeFilters": 
[
"AMAZON"
],
"brandIds": 
[
"string"
],
"currentStudyId": "string",
"excludedLineItemIds": 
[
"string"
],
"orderIds": 
[
"string"
]
}
Response samples
200400401403404415429500
Content type
application/vnd.measurementeligibility.v1.2+json
application/vnd.measurementeligibility.v1.3+json
application/vnd.measurementeligibility.v1.2+json
Copy
Expand allCollapse all
{
"metadata": 
{
"budget": 0.1,
"endDate": "2019-08-24T14:15:22Z",
"flightLength": 0,
"impressions": 0,
"startDate": "2019-08-24T14:15:22Z"
},
"nextToken": "string",
"vendorProductEligibilities": 
[
{}
]
}
Gets one or more DSP AUDIENCE_RESEARCH studies with requested study identifiers or an advertiser identifier.
GET
/dsp/measurement/studies/audienceResearch

Gets one or more DSP AUDIENCE_RESEARCH studies with requested study identifiers or an advertiser identifier.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
studyIds	
Array of strings [ 1 .. 50 ] items

Study canonical identifier to filter with. Either one of studyIds or advertiserId should be provided.


advertiserId	
string

The advertiser canonical identifier. Either one of studyIds or advertiserId should be provided.


nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Response samples
200400401403404415429500
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"measurements": 
[
{}
],
"nextToken": "string"
}
Create new DSP AUDIENCE_RESEARCH study.
POST
/dsp/measurement/studies/audienceResearch

Create new DSP AUDIENCE_RESEARCH study.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: application/vnd.studymanagement.v1.2+json

Create object for DSP AUDIENCE_RESEARCH study.

externalReferenceId	
string

Optional field. For some vendors, advertisers are required to provide this vendor assigned reference identifier for EXTERNAL_BILLING studies.


name	
string

The study name.


status	
string (StudyStatusV1)
Enum: "APPROVED" "CANCELLED" "DRAFT" "ENDED" "INFEASIBLE" "PENDING" "REJECTED" "RUNNING"

The study status. Only required if study is in DRAFT as part of study creation/update.


studyResultStatus	
string
Value: "AVAILABLE"

The status of result of the study.


surveyId	
string

The study survey canonical identifier.


vendorProductId	
string

Associated vendor product canonical identifier.


advertiserId	
string

The associated advertiser identifier. Immutable field.


audienceTargetingGroup	
object (AudienceTargetingGroupV1M2)

The model for holding Audiece targeting group. The includedAudienceGroups and excludedAudienceGroups are always joined with AND operator.


brandName	
string

The study brand name.


peerNames	
Array of strings [ 0 .. 100 ] items

A list of peer names for the study brand.


productCategory	
string

The study product category.

Responses
200

Success.

400

Bad request.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

Request samples
Payload
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"externalReferenceId": "string",
"name": "string",
"status": "APPROVED",
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"peerNames": 
[
"string"
],
"productCategory": "string"
}
Response samples
200400401403404415429
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"id": "string",
"comment": "string",
"createDate": "2019-08-24T14:15:22Z",
"endDate": "2019-08-24T14:15:22Z",
"externalReferenceId": "string",
"lastUpdatedDate": "2019-08-24T14:15:22Z",
"name": "string",
"reviewDate": "2019-08-24T14:15:22Z",
"startDate": "2019-08-24T14:15:22Z",
"status": "APPROVED",
"statusReasons": 
[
"string"
],
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"peerNames": 
[
"string"
],
"productCategory": "string"
}
Update DSP AUDIENCE_RESEARCH study. This will be a full update.
PUT
/dsp/measurement/studies/audienceResearch/{studyId}

Update DSP AUDIENCE_RESEARCH study. This will be a full update.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

PATH PARAMETERS
studyId
required
	
string

The canonical identifier that represents a unique study.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: application/vnd.studymanagement.v1.2+json

Update object for DSP AUDIENCE_RESEARCH study.

externalReferenceId	
string

Optional field. For some vendors, advertisers are required to provide this vendor assigned reference identifier for EXTERNAL_BILLING studies.


name	
string

The study name.


status	
string (StudyStatusV1)
Enum: "APPROVED" "CANCELLED" "DRAFT" "ENDED" "INFEASIBLE" "PENDING" "REJECTED" "RUNNING"

The study status. Only required if study is in DRAFT as part of study creation/update.


studyResultStatus	
string
Value: "AVAILABLE"

The status of result of the study.


surveyId	
string

The study survey canonical identifier.


vendorProductId	
string

Associated vendor product canonical identifier.


advertiserId	
string

The associated advertiser identifier. Immutable field.


audienceTargetingGroup	
object (AudienceTargetingGroupV1M2)

The model for holding Audiece targeting group. The includedAudienceGroups and excludedAudienceGroups are always joined with AND operator.


brandName	
string

The study brand name.


peerNames	
Array of strings [ 0 .. 100 ] items

A list of peer names for the study brand.


productCategory	
string

The study product category.

Responses
200

Success.

400

Bad request.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

Request samples
Payload
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"externalReferenceId": "string",
"name": "string",
"status": "APPROVED",
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"peerNames": 
[
"string"
],
"productCategory": "string"
}
Response samples
200400401403404415429
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"id": "string",
"comment": "string",
"createDate": "2019-08-24T14:15:22Z",
"endDate": "2019-08-24T14:15:22Z",
"externalReferenceId": "string",
"lastUpdatedDate": "2019-08-24T14:15:22Z",
"name": "string",
"reviewDate": "2019-08-24T14:15:22Z",
"startDate": "2019-08-24T14:15:22Z",
"status": "APPROVED",
"statusReasons": 
[
"string"
],
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"peerNames": 
[
"string"
],
"productCategory": "string"
}
Get result of a DSP AUDIENCE_RESEARCH study.
GET
/dsp/measurement/studies/audienceResearch/{studyId}/result

Get result of a DSP AUDIENCE_RESEARCH study. Returns 200 successful response if json resource is requested in Accept header. Returns a 307 Temporary Redirect response if any of the file types is requested and response includes a location header with the value set to an AWS S3 path where the result is located. The path expires after 60 seconds.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

PATH PARAMETERS
studyId
required
	
string

The canonical identifier that represents a unique study.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.


Accept
required
	
string

The version(s) of the requested resource. Available version(s) - application/vnd.measurementresult.v1.2+json, text/vnd.measurementresult.v1.2+csv.

Responses
200

Successful operation.

307

Successful operation for downloading result file.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Response samples
200400401403404415429500
Content type
application/vnd.measurementresult.v1.2+json
Copy
Expand allCollapse all
{
"studyId": "string",
"surveyResponses": 
[
{}
],
"totalResponses": 0
}
Gets one or more DSP BRAND_LIFT studies with requested study identifiers or an advertiser identifier.
GET
/dsp/measurement/studies/brandLift

Gets one or more DSP BRAND_LIFT studies with requested study identifiers or an advertiser identifier.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
studyIdFilters	
Array of strings [ 1 .. 50 ] items

Study canonical identifier to filter with. Either one of studyIdFilters or advertiserId should be provided.


advertiserId	
string

The advertiser canonical identifier. Either one of studyIdFilters or advertiserId should be provided.


nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Response samples
200400401403404415429500
Content type
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json
Copy
Expand allCollapse all
{
"measurements": 
[
{}
],
"nextToken": "string"
}
Create new DSP BRAND_LIFT studies.
POST
/dsp/measurement/studies/brandLift

Create new DSP BRAND_LIFT studies.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.

REQUEST BODY SCHEMA: 
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json

An array of study objects. For each object, specify required fields and their values. Maximum length of the array is 1.

Array (= 1 items)
externalReferenceId	
string

Optional field. For some vendors, advertisers are required to provide this vendor assigned reference identifier for EXTERNAL_BILLING studies.


id	
string

The study canonical identifier. Immutable field. This is required for update.


name	
string

The study name.


status	
string (StudyStatusV1)
Enum: "APPROVED" "CANCELLED" "DRAFT" "ENDED" "INFEASIBLE" "PENDING" "REJECTED" "RUNNING"

The study status. Only required if study is in DRAFT as part of study creation/update.


studyResultStatus	
string
Value: "AVAILABLE"

The status of result of the study.


submissionType	
string (StudySubmissionTypeV1)
Enum: "DRAFT" "SUBMISSION"

The submission type for the creation and updating of studies. Currently, this submission type is supported for brand lift studies only. This is an optional parameter in each of the request objects and its default value is SUBMISSION if not provided. A value of SUBMISSION indicates that a study should be submitted for approval. A value of DRAFT indicates that a study should be saved but not submitted.


surveyId	
string

The study survey canonical identifier.


vendorProductId	
string

Associated vendor product canonical identifier.


advertiserId	
string

The associated advertiser identifier. Immutable field.


excludedLineItemIds	
Array of strings [ 0 .. 100 ] items

A list of canonical lineItem identifiers that are excluded from the study.


orderIds	
Array of strings [ 1 .. 100 ] items

A list of canonical order identifiers that are associated with the study. By default all lineItems in those orders will be included.


benchmarkCategory	
string (BenchmarkCategoryV1)
Enum: "APPLIANCES" "APPS_AND_GAMES" "ARTS_CRAFTS_AND_SEWING" "AUTOMOTIVE" "BABY" "BEAUTY_AND_PERSONAL_CARE" "BEVERAGES" "BOOKS" "CELL_PHONES_AND_ACCESSORIES" "CLOTHING_SHOES_AND_JEWELRY" "COMPUTERS_AND_ACCESSORIES" "DIGITAL_MUSIC" "EDUCATION" "ELECTRONICS" "FINANCIAL_AND_INSURANCE" "FOOD" "HEALTH_AND_HOUSEHOLD" "HOME_AND_KITCHEN" "HOSPITALITY" "KITCHEN_AND_DINING" "MOVIES_AND_TV" "OFFICE_PRODUCTS" "PATIO_LAWN_AND_GARDEN" "PET_SUPPLIES" "RESTAURANTS" "SOFTWARE" "SPORTS_AND_OUTDOORS" "TELECOMMUNICATIONS_SERVICES" "TOOLS_AND_HOME_IMPROVEMENT" "TOYS_AND_GAMES" "VIDEO_GAMES"

The study benchmark product category.


brandName	
string

The study brand name.


peerNames	
Array of strings [ 0 .. 100 ] items

A list of peer names for the study brand.


productCategory	
string

The study product category.

Responses
207

Multi-status.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

422

Unprocessable Entity - The syntax of the request is correct, but the server was unable to process the contained instructions.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json
Copy
Expand allCollapse all
[
{
"externalReferenceId": "string",
"id": "string",
"name": "string",
"status": "APPROVED",
"studyResultStatus": "AVAILABLE",
"submissionType": "DRAFT",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"excludedLineItemIds": 
[],
"orderIds": 
[],
"benchmarkCategory": "APPLIANCES",
"brandName": "string",
"peerNames": 
[],
"productCategory": "string"
}
]
Response samples
207401403404415422429500
Content type
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json
Copy
Expand allCollapse all
{
"requestId": "string",
"responses": 
[
{}
]
}
Update DSP BRAND_LIFT studies. This will be a full update.
PUT
/dsp/measurement/studies/brandLift

Update DSP BRAND_LIFT studies. This will be a full update.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.

REQUEST BODY SCHEMA: 
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json

An array of measurement objects. For each object, specify required fields and their values. Maximum length of the array is 1.

Array (= 1 items)
externalReferenceId	
string

Optional field. For some vendors, advertisers are required to provide this vendor assigned reference identifier for EXTERNAL_BILLING studies.


id	
string

The study canonical identifier. Immutable field. This is required for update.


name	
string

The study name.


status	
string (StudyStatusV1)
Enum: "APPROVED" "CANCELLED" "DRAFT" "ENDED" "INFEASIBLE" "PENDING" "REJECTED" "RUNNING"

The study status. Only required if study is in DRAFT as part of study creation/update.


studyResultStatus	
string
Value: "AVAILABLE"

The status of result of the study.


submissionType	
string (StudySubmissionTypeV1)
Enum: "DRAFT" "SUBMISSION"

The submission type for the creation and updating of studies. Currently, this submission type is supported for brand lift studies only. This is an optional parameter in each of the request objects and its default value is SUBMISSION if not provided. A value of SUBMISSION indicates that a study should be submitted for approval. A value of DRAFT indicates that a study should be saved but not submitted.


surveyId	
string

The study survey canonical identifier.


vendorProductId	
string

Associated vendor product canonical identifier.


advertiserId	
string

The associated advertiser identifier. Immutable field.


excludedLineItemIds	
Array of strings [ 0 .. 100 ] items

A list of canonical lineItem identifiers that are excluded from the study.


orderIds	
Array of strings [ 1 .. 100 ] items

A list of canonical order identifiers that are associated with the study. By default all lineItems in those orders will be included.


benchmarkCategory	
string (BenchmarkCategoryV1)
Enum: "APPLIANCES" "APPS_AND_GAMES" "ARTS_CRAFTS_AND_SEWING" "AUTOMOTIVE" "BABY" "BEAUTY_AND_PERSONAL_CARE" "BEVERAGES" "BOOKS" "CELL_PHONES_AND_ACCESSORIES" "CLOTHING_SHOES_AND_JEWELRY" "COMPUTERS_AND_ACCESSORIES" "DIGITAL_MUSIC" "EDUCATION" "ELECTRONICS" "FINANCIAL_AND_INSURANCE" "FOOD" "HEALTH_AND_HOUSEHOLD" "HOME_AND_KITCHEN" "HOSPITALITY" "KITCHEN_AND_DINING" "MOVIES_AND_TV" "OFFICE_PRODUCTS" "PATIO_LAWN_AND_GARDEN" "PET_SUPPLIES" "RESTAURANTS" "SOFTWARE" "SPORTS_AND_OUTDOORS" "TELECOMMUNICATIONS_SERVICES" "TOOLS_AND_HOME_IMPROVEMENT" "TOYS_AND_GAMES" "VIDEO_GAMES"

The study benchmark product category.


brandName	
string

The study brand name.


peerNames	
Array of strings [ 0 .. 100 ] items

A list of peer names for the study brand.


productCategory	
string

The study product category.

Responses
207

Multi-status.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

422

Unprocessable Entity - The syntax of the request is correct, but the server was unable to process the contained instructions.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Request samples
Payload
Content type
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json
Copy
Expand allCollapse all
[
{
"externalReferenceId": "string",
"id": "string",
"name": "string",
"status": "APPROVED",
"studyResultStatus": "AVAILABLE",
"submissionType": "DRAFT",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"excludedLineItemIds": 
[],
"orderIds": 
[],
"benchmarkCategory": "APPLIANCES",
"brandName": "string",
"peerNames": 
[],
"productCategory": "string"
}
]
Response samples
207401403404415422429500
Content type
application/vnd.studymanagement.v1+json
application/vnd.studymanagement.v1.1+json
application/vnd.studymanagement.v1.2+json
application/vnd.studymanagement.v1.3+json
application/vnd.studymanagement.v1+json
Copy
Expand allCollapse all
{
"requestId": "string",
"responses": 
[
{}
]
}
Gets one or more DSP CREATIVE_TESTING studies with requested study identifiers or an advertiser identifier.
GET
/dsp/measurement/studies/creativeTesting

Gets one or more DSP CREATIVE_TESTING studies with requested study identifiers or an advertiser identifier.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

QUERY PARAMETERS
studyIds	
Array of strings [ 1 .. 50 ] items

Study canonical identifier to filter with. Either one of studyIds or advertiserId should be provided.


advertiserId	
string

The advertiser canonical identifier. Either one of studyIds or advertiserId should be provided.


nextToken	
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.


maxResults	
integer [ 1 .. 100 ]
Default: 10

Sets the maximum number of studies in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

Responses
200

Successful operation.

400

Bad Request or request body is not matching with input model.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

Response samples
200400401403404415429500
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"measurements": 
[
{}
],
"nextToken": "string"
}
Create new DSP CREATIVE_TESTING study.
POST
/dsp/measurement/studies/creativeTesting

Create new DSP CREATIVE_TESTING study.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required
	
string

The identifier of a client associated with a "Login with Amazon" account.


Amazon-Advertising-API-Scope	
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId	
string

The identifier that describe DSP advertiser level accounts that exists under a manager account (previously under a DSP entity). Exposed in the /dsp/advertisers API.

REQUEST BODY SCHEMA: application/vnd.studymanagement.v1.2+json

Create object for DSP CREATIVE_TESTING study.

externalReferenceId	
string

Optional field. For some vendors, advertisers are required to provide this vendor assigned reference identifier for EXTERNAL_BILLING studies.


name	
string

The study name.


status	
string (StudyStatusV1)
Enum: "APPROVED" "CANCELLED" "DRAFT" "ENDED" "INFEASIBLE" "PENDING" "REJECTED" "RUNNING"

The study status. Only required if study is in DRAFT as part of study creation/update.


studyResultStatus	
string
Value: "AVAILABLE"

The status of result of the study.


surveyId	
string

The study survey canonical identifier.


vendorProductId	
string

Associated vendor product canonical identifier.


advertiserId	
string

The associated advertiser identifier. Immutable field.


assets	
Array of objects (AssetV1M2) [ 1 .. 10 ] items

A list of assets to be used for the creative testing study as part of either the survey question or the response. In case of API responses, number of assets returned would be limited to 10 even if a creative testing study has more than 10 assets associated with it.


audienceTargetingGroup	
object (AudienceTargetingGroupV1M2)

The model for holding Audiece targeting group. The includedAudienceGroups and excludedAudienceGroups are always joined with AND operator.


brandName	
string

The study brand name.


productCategory	
string

Optional study product category.

Responses
200

Success.

400

Bad request.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

415

Unsupported Media Type - Version not supported.

429

Too Many Requests - Request was rate-limited. Retry later.

Request samples
Payload
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"externalReferenceId": "string",
"name": "string",
"status": "APPROVED",
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"assets": 
[
{}
],
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"productCategory": "string"
}
Response samples
200400401403404415429
Content type
application/vnd.studymanagement.v1.2+json
Copy
Expand allCollapse all
{
"id": "string",
"comment": "string",
"createDate": "2019-08-24T14:15:22Z",
"endDate": "2019-08-24T14:15:22Z",
"externalReferenceId": "string",
"lastUpdatedDate": "2019-08-24T14:15:22Z",
"name": "string",
"reviewDate": "2019-08-24T14:15:22Z",
"startDate": "2019-08-24T14:15:22Z",
"status": "APPROVED",
"statusReasons": 
[
"string"
],
"studyResultStatus": "AVAILABLE",
"surveyId": "string",
"vendorProductId": "string",
"advertiserId": "string",
"assets": 
[
{}
],
"audienceTargetingGroup": 
{
"excludedAudienceGroups": 
[],
"includedAudienceGroups": 
[]
},
"brandName": "string",
"productCategory": "string"
}
Update DSP CREATIVE_TESTING study. This will be a full update.
PUT
/dsp/measurement/studies/creativeTesting/{studyId}

Update DSP CREATIVE_TESTING study. This will be a full update.

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["campaign_view"]

PATH PARAMETERS
studyId
required
	
string

The canonical identifier that represents a unique study.

HEADER PARAMETERS
Amazon-Ad"
### Ran Playwright code
```js
await page.evaluate('() => {
  return new Promise((resolve) => {
    let attempts = 0;
    const check = () => {
      attempts++;
      const bodyText = document.body.innerText;
      if (bodyText.length > 1000 && !bodyText.startsWith('Loading')) {
        // Content loaded - grab first 50000 chars immediately
        resolve(bodyText.substring(0, 50000));
      } else if (attempts > 40) {
        resolve('TIMEOUT: ' + bodyText.substring(0, 1000));
      } else {
        setTimeout(check, 300);
      }
    };
    check();
  });
}');
```