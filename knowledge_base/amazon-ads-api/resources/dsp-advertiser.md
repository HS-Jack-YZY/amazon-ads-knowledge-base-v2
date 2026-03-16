---
title: Amazon DSP Advertisers
source: https://advertising.amazon.com/API/docs/en-us/dsp-advertiser
section: Amazon DSP
---

API reference

Resources

Amazon DSP

Amazon DSP advertisers
Returns Amazon DSP advertiser information.
Version 1
OAS 3.0.2
License
Download OpenAPI spec
Server details
Advertiser beta
Advertiser
Advertiser
Returns advertiser information based on given adve
GET
/dsp/advertisers/{advertiserId}

Returns advertiser information based on given advertiser id.

PATH PARAMETERS
advertiserId
required

string

Unique id to identify advertiser

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The client identifier of the customer making the request.


Amazon-Advertising-API-Scope
required

string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. For DSP profiles, the type field of the accountInfo object must be set to agency and the subType must not be AMAZON_ATTRIBUTION.

Responses
200

Successful operation

400

Bad Request.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

422

Unprocessable entity - Failed due to invalid parameters.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

502

Bad Gateway Exception.

503

Service Unavailable Exception.

504

Endpoint Request Timed-out Exception.

Response samples
200400401403404422429500502503504
Content type
application/json
Copy
{
"advertiserId": "4728736040201",
"name": "DSP Public API Advertiser",
"currency": "USD",
"url": "www.example.com",
"country": "US",
"timezone": "string"
}
Returns a list of advertisers with information whi
GET
/dsp/advertisers

Returns a list of advertisers with information which satisfy the filtering criteria.

QUERY PARAMETERS
startIndex
integer <int32> <= 29900
Default: 0

Sets a cursor into the requested set of advertisers. Use in conjunction with the count parameter to control pagination of the returned array. 0-indexed record offset for the result set, defaults to 0.


count
integer <int32> [ 1 .. 100 ]
Default: 100

Sets the number of advertisers to be returned in a single call. Maximum of 100 advertisers per call.


advertiserIdFilter
string
Example: advertiserIdFilter=6753579448901,8753890875385

List of comma separated advertiser ids to filter the advertisers. If no advertiser ids provided, all advertisers in this entity will be returned.

HEADER PARAMETERS
Amazon-Advertising-API-ClientId
required

string

The client identifier of the customer making the request.


Amazon-Advertising-API-Scope
required

string

The identifier of a profile associated with the advertiser account. Use GET method on Profiles resource to list profiles associated with the access token passed in the HTTP Authorization header. For DSP profiles, the type field of the accountInfo object must be set to agency and the subType must not be AMAZON_ATTRIBUTION.

Responses
200

Successful operation

400

Bad Request.

401

Unauthenticated request.

403

Forbidden - Request failed because user is not authorized to access a resource.

404

Not Found - Requested resource does not exist or is not visible for the authenticated user.

422

Unprocessable entity - Failed due to invalid parameters.

429

Too Many Requests - Request was rate-limited. Retry later.

500

Internal Server Error.

502

Bad Gateway Exception.

503

Service Unavailable Exception.

504

Endpoint Request Timed-out Exception.

Response samples
200400401403404422429500502503504
Content type
application/json
Copy
Expand allCollapse all
{
"totalResults": 1100,
"response":
[
{}
]
}
