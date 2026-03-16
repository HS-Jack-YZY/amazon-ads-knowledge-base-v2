---
title: Amazon DSP Conversions API
source: https://advertising.amazon.com/API/docs/en-us/dsp-conversion-builder
section: Amazon DSP
---

API reference

Resources

Amazon DSP

Conversions API
This API enables advertisers to import their conversion data from a variety of sources into Amazon DSP for conversion tracking and reporting.
Version 1
OAS 3.0.1
Download OpenAPI spec
Server details
Conversions
Amazon Ad Tag
Amazon Conversion Definitions
Apps
Conversion Ad Tag Association
Conversion Event Data
Conversion Order Association
Data Deletion Requests
Amazon Ad Tag
Gets a list of available event metadata for the given ad tag.
GET
/accounts/{accountId}/dsp/adTagEvents/{adTagId}/list

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_view"]

Authorized resource type: Global Manager Account ID

Parameter name: Amazon-Ads-Manager-Account-ID

Parameter in: header

Requires one of these permissions: ["ads_data_manager_view"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.


adTagId
required

string

The identifier of the ad tag.

QUERY PARAMETERS
searchTerm
string

A string used to fuzzy search for event metadata by event name.


startDateTime
string <date-time>
Example: startDateTime=2022-02-20T23:49:00Z

A date string to create a time window for events that have seen activity. If not set, a start date 30 days before the request was sent will be chosen. The oldest start date is 1 year before the request was sent to this api.


nextToken
string

Token from a previous request. Use to control pagination of the returned array.


maxResults
integer [ 1 .. 100 ]
Default: "10"

Sets the maximum number of associated conversions in the returned array. Use in conjunction with the nextToken parameter to control pagination. The range for maxResults is [1,100] with default as 10. For example, supplying maxResults=20 with a previously returned token will fetch up to the next 20 items. In some cases, fewer items may be returned.


endDateTime
string <date-time>
Example: endDateTime=2022-02-25T23:49:00Z

A date string to create a time window for events that have seen activity. If not set, the day and time the request was sent will be chosen as the end date. The maximum end date is the day the request to this api was sent.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. This header is required for access to any DSP data when you have been directly invited to the advertiser.


Amazon-Ads-Manager-Account-ID
string

The identifier of an Amazon Ads Manager Account. This ID can be retrieved by making a GET request to the /managerAccounts endpoint.

Responses
200

Success.

400

Bad Request.

401

Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.

403

Forbidden. The request failed because the user does not have access to the specified resource.

429

Too Many Requests. The request was rate-limited. Retry later.

500

Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

Response samples
200400401403429500
Content type
application/vnd.dspamazonadtagevents.v1+json
Copy
Expand allCollapse all
{
"amazonAdTagEvents":
[
{}
],
"maxResults": 0,
"nextToken": "string"
}
Gets an Amazon Ad Tag for a given advertiser
GET
/accounts/{accountId}/dsp/amazonAdTag

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_view"]

Authorized resource type: Global Manager Account ID

Parameter name: Amazon-Ads-Manager-Account-ID

Parameter in: header

Requires one of these permissions: ["ads_data_manager_view"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. This header is required for access to any DSP data when you have been directly invited to the advertiser.


Amazon-Ads-Manager-Account-ID
string

The identifier of an Amazon Ads Manager Account. This ID can be retrieved by making a GET request to the /managerAccounts endpoint.

Responses
200

Success.

400

Bad Request.

401

Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.

429

Too Many Requests. The request was rate-limited. Retry later.

500

Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

Response samples
200400401429500
Content type
application/vnd.dspamazonadtags.v1+json
Copy
Expand allCollapse all
{
"adTag":
{
"createDateTime": "2023-01-01T23:49:00Z",
"tagId": "string"
}
}
Amazon Conversion Definitions
Batch create conversion definitions.
POST
/accounts/{accountId}/dsp/conversionDefinitions

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_edit"]

Authorized resource type: Global Manager Account ID

Parameter name: Amazon-Ads-Manager-Account-ID

Parameter in: header

Requires one of these permissions: ["ads_data_manager_edit"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. This header is required for access to any DSP data when you have been directly invited to the advertiser.


Amazon-Ads-Manager-Account-ID
string

The identifier of an Amazon Ads Manager Account. This ID can be retrieved by making a GET request to the /managerAccounts endpoint.

REQUEST BODY SCHEMA:
application/vnd.dspconversiondefinition.v1+json
application/vnd.dspconversiondefinition.v2+json
application/vnd.dspconversiondefinition.v1+json
Array ([ 1 .. 10 ] items)
conversionType
required

string (ConversionDefinitionTypeV1)
Enum: "ADD_TO_SHOPPING_CART" "APPLICATION" "CHECKOUT" "CONTACT" "LEAD" "OFF_AMAZON_PURCHASES" "OTHER" "PAGE_VIEW" "SEARCH" "SIGN_UP" "SUBSCRIBE"

Conversion Types:

ADD_TO_SHOPPING_CART - When customers add a product to their shopping cart
APPLICATION - When customers submit an application
CHECKOUT - When customers submit an application
CONTACT - When customers provide supplies contact information, such as email, phone number, etc.
LEAD - When customers perform an action that initiates a sales lead
OFF_AMAZON_PURCHASES - When customers make a purchase for a service or product
PAGE_VIEW - When customers make a purchase for a service or product
SEARCH - When customers perform a search for a product
SIGN_UP - When customers sign up for a product or service
SUBSCRIBE - When customers sign up for your service
OTHER - Customer actions that don't fit the definition of the standard conversion types


countingMethod
required

string (ConversionDefinitionCountingMethodV1)
Enum: "EVERY" "FIRST"

Method used to determine whether all or only the first conversion event per user, per conversion definition are ingested within a 24 hour window.


name
required

string [ 1 .. 256 ] characters

The name of the ConversionDefinition.


source
required

string (ConversionDefinitionSourceV1)
Enum: "AMAZON_AD_TAG" "SERVER_TO_SERVER"

The source of the conversion definition. The source must be compatible with the specified sourceType value according to the following mapping:

SERVER_TO_SERVER: Compatible with ANDROID, FIRE_TV, FIRE_TABLET, OFFLINE, WEBSITE, and IOS

sourceType
required

string (ConversionDefinitionSourceTypeV1)
Enum: "ANDROID" "FIRE_TABLET" "FIRE_TV" "IOS" "OFFLINE" "WEBSITE"

The type of source for the conversion definition. The sourceType must be compatible with the specified source value according to the following mapping:

ANDROID: Compatible with SERVER_TO_SERVER
FIRE_TV: Compatible with SERVER_TO_SERVER
FIRE_TABLET: Compatible with SERVER_TO_SERVER
IOS: Compatible with SERVER_TO_SERVER
OFFLINE: Compatible with SERVER_TO_SERVER
WEBSITE: Compatible with AMAZON_AD_TAG and SERVER_TO_SERVER

value
required

number <double> decimal places <= 2 <= 9999999999999

The value of the event.
When the conversionType of the associated Conversion Definition is OFF_AMAZON_PURCHASES, this represents a monetary value. Must be a minimum of 0 and must not exceed 2 decimal points. If not specified, a default of 0 will be applied.
When the conversionType of the associated Conversion Definition is not OFF_AMAZON_PURCHASES, this represents a non-monetary value based on a scale of your choosing. Can be negative and must not exceed 2 decimal points. If not specified on the conversion definition, a default of 1 will be applied.

Responses
207

Multi-status.

401

Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.

403

Forbidden. The request failed because the user does not have access to the specified resource.

429

Too Many Requests. The request was rate-limited. Retry later.

Request samples
Payload
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
[
{
"conversionType": "ADD_TO_SHOPPING_CART",
"countingMethod": "EVERY",
"name": "string",
"source": "AMAZON_AD_TAG",
"sourceType": "ANDROID",
"value": 9999999999999
}
]
Response samples
207401403429
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
{
"error":
[
{}
],
"success":
[
{}
]
}
Batch update conversion definitions.
PUT
/accounts/{accountId}/dsp/conversionDefinitions

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_edit"]

Authorized resource type: Global Manager Account ID

Parameter name: Amazon-Ads-Manager-Account-ID

Parameter in: header

Requires one of these permissions: ["ads_data_manager_edit"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. This header is required for access to any DSP data when you have been directly invited to the advertiser.


Amazon-Ads-Manager-Account-ID
string

The identifier of an Amazon Ads Manager Account. This ID can be retrieved by making a GET request to the /managerAccounts endpoint.

REQUEST BODY SCHEMA:
application/vnd.dspconversiondefinition.v1+json
application/vnd.dspconversiondefinition.v2+json
Array ([ 1 .. 10 ] items)
conversionDefinitionId
required

string

The identifier of the ConversionDefinition.


conversionType
string (ConversionDefinitionTypeV1)
Enum: "ADD_TO_SHOPPING_CART" "APPLICATION" "CHECKOUT" "CONTACT" "LEAD" "OFF_AMAZON_PURCHASES" "OTHER" "PAGE_VIEW" "SEARCH" "SIGN_UP" "SUBSCRIBE"


countingMethod
string (ConversionDefinitionCountingMethodV1)
Enum: "EVERY" "FIRST"


name
string

The name of the ConversionDefinition.


source
string (ConversionDefinitionSourceV1)
Enum: "AMAZON_AD_TAG" "SERVER_TO_SERVER"


sourceType
string (ConversionDefinitionSourceTypeV1)
Enum: "ANDROID" "FIRE_TABLET" "FIRE_TV" "IOS" "OFFLINE" "WEBSITE"


value
number <double>

The default value of each conversion event.

Responses
207

Multi-status.

401

Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.

403

Forbidden. The request failed because the user does not have access to the specified resource.

429

Too Many Requests. The request was rate-limited. Retry later.

Request samples
Payload
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
[
{
"conversionDefinitionId": "string",
"conversionType": "ADD_TO_SHOPPING_CART",
"countingMethod": "EVERY",
"name": "string",
"source": "AMAZON_AD_TAG",
"sourceType": "ANDROID",
"value": 0.1
}
]
Response samples
207401403429
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
{
"error":
[
{}
],
"success":
[
{}
]
}
Retrieve a list of conversion definitions based on filters.
POST
/accounts/{accountId}/dsp/conversionDefinitions/list

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_view"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header and choose profile id profileId from the response to pass it as input.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. This header is required for access to any DSP data when you have been directly invited to the advertiser.

REQUEST BODY SCHEMA: application/vnd.dspconversiondefinition.v1+json
required

Filters to apply when retrieving conversion definitions.

filters
Array of objects (ConversionDefinitionFilterV1) [ 0 .. 10 ] items

maxResults
integer [ 1 .. 100 ]
Default: "10"

Sets the maximum number of conversions in the returned array.


nextToken
string

Token from a previous request. Use in conjunction with the maxResults parameter to control pagination of the returned array.

Responses
200

Success.

400

Bad Request.

401

Unauthorized. The request failed because the user is not authenticated or is not allowed to invoke the operation.

403

Forbidden. The request failed because the user does not have access to the specified resource.

429

Too Many Requests. The request was rate-limited. Retry later.

500

Internal Server Error. Something went wrong on the server. Retry later and report an error if unresolved.

Request samples
Payload
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
{
"filters":
[
{}
],
"maxResults": "10",
"nextToken": "string"
}
Response samples
200400401403429500
Content type
application/vnd.dspconversiondefinition.v1+json
Copy
{
"conversionDefinitions":
[
{}
],
"maxResults": 0,
"nextToken": "string"
}
Apps
Retrieve associated Mobile Measurement Partner App for a ConversionDefinition.
GET
/accounts/{accountId}/dsp/conversionDefinitions/{conversionDefinitionId}/mobileMeasurementPartnerAppRegistration

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_view"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.


conversionDefinitionId
required

string

The identifier of the ConversionDefinition.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The identifier of a client associated with a Login with Amazon account.


Amazon-Advertising-API-Scope
string

The identifier of a profile associated with the advertiser account.


Amazon-Ads-AccountId
string

Account Identifier you use to access the DSP.

Responses
200

Success.

400

Bad Request.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

500

Internal Server Error.

Response samples
200400401403429500
Content type
application/vnd.dspassociatedmobilemeasurementpartnerappregistration.v1+json
Copy
{
"associatedMobileApp":
{
"appName": "string",
"bundleId": "string",
"conversionsCreated": 0,
"lastEventReceived": "2019-08-24T14:15:22Z",
"mmpAppId": "string",
"mmpName": "ADJUST",
"platform": "ANDROID",
"skanConversionsCreated": 0
},
"eventName": "string"
}
Create a new Mobile Measurement Partner app registration.
POST
/accounts/{accountId}/dsp/mobileMeasurementPartners

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Parameter name: Amazon-Ads-AccountId

Parameter in: header

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

Account Identifier you use to access the DSP. This is your DSP Advertiser ID. DSP Entity ID is not supported.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
required
Array ([ 1 .. 10 ] items)
appName
required

string

The name of the application.


bundleId
required

string

The ID of the application with the app store it is registered with. The bundleId + platform + mmpName must be unique within your advertiser account.


mmpName
required

string (MobileMeasurementPartnerNameV1)
Enum: "ADJUST" "AIRBRIDGE" "APPSFLYER" "BRANCH" "KOCHAVA" "SINGULAR" "TENJIN"

platform
required

string (MobileMeasurementPartnerPlatformV1)
Enum: "ANDROID" "FIRE_TV"
Responses
207

Multi-status.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Payload
Content type
application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
Copy
[
{
"appName": "string",
"bundleId": "string",
"mmpName": "ADJUST",
"platform": "ANDROID"
}
]
Response samples
207401403429
Content type
application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
Copy
{
"error": [{}],
"success": [{}]
}
Update a Mobile Measurement Partner app registration.
PUT
/accounts/{accountId}/dsp/mobileMeasurementPartners

Authorized resource type: DSP Rodeo Entity ID, DSP Advertiser Account ID

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
required
Array (= 1 items)
appName
string

bundleId
string

mmpAppId
required

string

Responses
207

Multi-status.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Payload
Copy
[
{
"appName": "string",
"bundleId": "string",
"mmpAppId": "string"
}
]
Response samples
207401403429
Copy
{
"error": [{}],
"success": [{}]
}
Marks a Mobile Measurement Partner app registration as deleted.
POST
/accounts/{accountId}/dsp/mobileMeasurementPartners/delete

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
required
Array (= 1 items)
mmpAppId
required

string
Responses
200

Success.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Copy
[
{
"mmpAppId": "string"
}
]
Response samples
200401403429
Copy
{
"error": [{}],
"success": [{}]
}
List Mobile Measurement Partner App Registrations
POST
/accounts/{accountId}/dsp/mobileMeasurementPartners/list

Requires one of these permissions: ["event_manager_view"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspmobilemeasurementpartnerappregistration.v1+json
required
filters
Array of objects (MobileMeasurementPartnerAppRegistrationFilterV1) [ 0 .. 10 ] items

maxResults
integer [ 1 .. 100 ]
Default: "10"

nextToken
string

Responses
200

Success.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Copy
{
"filters": [{}],
"maxResults": "10",
"nextToken": "string"
}
Response samples
200401403429
Copy
{
"appRegistrations": [{}],
"maxResults": 0,
"nextToken": "string"
}
Conversion Ad Tag Association
Retrieve associated Amazon adTag event for a ConversionDefinition.
GET
/accounts/{accountId}/dsp/conversionDefinitions/{conversionDefinitionId}/adTagEventAssociations

Requires one of these permissions: ["event_manager_view"]

PATH PARAMETERS
accountId
required

string

conversionDefinitionId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

Responses
200

Success.

400

Bad Request.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

500

Internal Server Error.

Response samples
200400401403429500
Content type
application/vnd.dspconversionadtageventassociation.v1+json
Copy
{
"adTagEventName": "string",
"adTagId": "string"
}
Associate/Dissociate an Amazon adTag event to a ConversionDefinition.
POST
/accounts/{accountId}/dsp/conversionDefinitions/{conversionDefinitionId}/adTagEventAssociations

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

conversionDefinitionId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

Amazon-Ads-Manager-Account-ID
string

REQUEST BODY SCHEMA: application/vnd.dspconversionadtageventassociation.v1+json
adTagEventName
required

string

adTagId
required

string

operation
required

string
Enum: "ADD" "REMOVE"
Responses
200

Success.

400

Bad Request.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

500

Internal Server Error.

Request samples
Copy
{
"adTagEventName": "string",
"adTagId": "string",
"operation": "ADD"
}
Response samples
200400401403429500
Copy
{
"adTagEventName": "string",
"adTagId": "string"
}
Conversion Event Data
Import conversion event data. This API expects one source per request across all conversion event data and supports partial import.
POST
/accounts/{accountId}/dsp/conversionDefinitions/eventData

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspconversioneventimport.v1+json
required
eventData
required

Array of objects (ConversionEventDataV1) [ 1 .. 100 ] items

source
required

string (ConversionDefinitionSourceV1)
Enum: "AMAZON_AD_TAG" "SERVER_TO_SERVER"

Responses
207

Multi-status.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Copy
{
"eventData": [{}],
"source": "AMAZON_AD_TAG"
}
Response samples
207401403429
Copy
{
"error": [{}],
"success": [{}]
}
Conversion Order Association
Retrieve associated conversion definitions for orders.
POST
/accounts/{accountId}/dsp/batchOrders/conversionDefinitionAssociations

Requires one of these permissions: ["campaign_view"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspbatchgetconversiondefinitions.v1+json
required
maxResults
integer [ 1 .. 100 ]
Default: "10"

nextToken
string

orderIds
Array of strings [ 0 .. 100 ] items
Responses
200

Success.

400

Bad Request.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

500

Internal Server Error.

Request samples
Copy
{
"maxResults": "10",
"nextToken": "string",
"orderIds": ["string"]
}
Response samples
200400401403429500
Copy
{
"conversionDefinitions": [{}],
"maxResults": "string",
"nextToken": "string"
}
Retrieve associated conversion definitions for an order.
GET
/accounts/{accountId}/dsp/orders/{orderId}/conversionDefinitionAssociations

Requires one of these permissions: ["campaign_view"]

PATH PARAMETERS
accountId
required

string

orderId
required

string

QUERY PARAMETERS
nextToken
string

maxResults
integer [ 1 .. 100 ]
Default: "10"

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

Responses
200

Success.

400

Bad Request.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

500

Internal Server Error.

Response samples
200400401403429500
Content type
application/vnd.dspcampaignconversionassociation.v3+json
Copy
{
"conversionDefinitions": [{}],
"maxResults": "string",
"nextToken": "string"
}
Associate/Dissociate conversion definitions to an order.
POST
/accounts/{accountId}/dsp/orders/{orderId}/conversionDefinitionAssociations

Requires one of these permissions: ["campaign_edit"]

PATH PARAMETERS
accountId
required

string

orderId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA:
application/vnd.dspcampaignconversionassociation.v3+json
Array ([ 1 .. 100 ] items)
conversionDefinitionId
required

string

conversionWeight
number <double> decimal places <= 2 [ 0 .. 10 ]

The weight assigned to this conversion definition for optimization purposes.

operation
required

string
Enum: "ADD" "REMOVE"
Responses
207

Success.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Copy
[
{
"conversionDefinitionId": "string",
"conversionWeight": 10,
"operation": "ADD"
}
]
Response samples
207401403429
Copy
{
"error": [{}],
"success": [{}]
}
Data Deletion Requests
Deletes existing event data associated with user(s). Supply all match keys associated with the user. Events processed before the deletion request will be deleted from our advertising systems. However, any events for these users sent after the deletion request will not be deleted.
POST
/accounts/{accountId}/dsp/conversionDefinitions/delete

Requires one of these permissions: ["event_manager_edit"]

PATH PARAMETERS
accountId
required

string

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

Amazon-Advertising-API-Scope
string

Amazon-Ads-AccountId
string

REQUEST BODY SCHEMA: application/vnd.dspuserdeletionrequest.v1+json
required
deletionRequests
required

Array of objects (EventDeletionRequestV1) [ 1 .. 500 ] items
Responses
207

Accepted.

401

Unauthorized.

403

Forbidden.

429

Too Many Requests.

Request samples
Copy
{
"deletionRequests": [{}]
}
Response samples
207401403429
Copy
{
"error": [{}],
"success": [{}]
}
