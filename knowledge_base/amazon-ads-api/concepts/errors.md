---
title: Error responses and error status codes
description: Error response schema and error status codes in the Amazon Ads API
type: guide
interface: api
tags:
    - Operations
keywords:
    - response
    - bad request
    - unauthorized
    - matching advertiser
---

# Error responses and error status codes

## Error response

This is the universal format for error response objects.

```JSON
{
    "title": "Error",
    "type": "object",
    "properties": {
       "code": {
           "description": "An enumerated error code for machine use",
           "type": "string"
       },
       "details": {
           "description": "A human-readable description of the error. ",
           "type": "string"
       }
    }
}
```

## Status codes

The following codes may be returned by the service and should be handled by the client:

| Status Code | Notes |
| --- | --- |
| `200 - OK` | Standard respond for successful non-batch requests. |
| `202 - Accepted ` | The request has been accepted and is processing. Used mostly for asynchronous requests. |
| `207 - Multi-status` | Standard response for batch requests. The request returns the response code related to each sub-request. 207 can contain both success and error responses. |
| `307 - Temporary Redirect` | Usually seen in requests to download a file. |
| `400 - Bad Request` | General request error that doesn't fall into any other category. |
| `401 - Unauthorized` | Request failed because user is not authenticated. |
| `401 - No matching advertiser found for scope` | Could not find an advertiser that matches the provided scope. |
| `401 - Scope header is missing` | `Amazon-Advertising-API-Scope` header is not present. |
| `401 - Not authorized to access scope` | Not authorized to manage this profile. Please check permissions and consent from the advertiser. |
| `403 - Forbidden` | Request failed because user does not have access to a specified resource. |
| `404 - Not Found` | Requested resource does not exist or is not visible for the authenticated user. |
| `406 - Not Acceptable` | The `Accept` header for your request is not supported. |
| `415 - Unsupported Media Type` | The `Accept` or `Content-Type` header for your request is not supported. | 
| `422 - Unprocessable Entity` | Request was understood, but contained incorrect parameters. |
| `429 - Too Many Requests` | Request was rate-limited. Retry later. |
| `500 - Internal Error` | Something went wrong on the server. Retry later and report an error if unresolved. |
| `502 - Internal Error`| Something went wrong on the server. Retry later and report an error if unresolved. |
| `504 - Internal Error` | Something went wrong on the server. Retry later and report an error if unresolved. |

