---
title: Change History
source: https://advertising.amazon.com/API/docs/en-us/change-history
section: Resources
---

# Change history

Provides information about changes made to campaigns, adgroups, ads, etc

**Version:** 3.0

## Endpoints

### POST /history

**Summary:** History of entity changes.

Returns history of changes for provided event sources that match the filters and time ranges specified. Only events that belong to the authenticated Advertiser can be queried. All times will be in UTC Epoch format. This API accepts identifiers in either the alphanumeric format (default), or the numeric format. If numeric IDs are supplied, then numeric IDs will be returned otherwise, alphanumeric IDs are returned. This API only returns change history for Sponsored Products and Sponsored Brands campaigns. Changes for Sponsored Display campaigns are not returned. Also, it doesn't return information about who made the change.

**API Versioning:** This API supports versioning through the Accept header. Use `Accept: application/vnd.historyresponse.v1.1+json` to access version 1.1 features. **THEME event type requires version 1.1 or higher.** Without the proper Accept header, THEME requests will return a 400 error.

**Requires one of these permissions**:
["advertiser_campaign_edit","advertiser_campaign_view"]

**Operation ID:** getHistory

**Request Body:**

Content-Type: `application/json`

**Responses:**

- **200**: Successful query. Result contains historical events matching query
- **400**: Bad Request. Common causes: Invalid event type for API version (e.g., THEME without version 1.1+), Invalid request parameters, Malformed request body
- **401**: Unauthorized - Request failed because user is not authenticated or is not allowed to invoke the operation.
- **403**: Forbidden - Request failed because user does not have access to a specified resource
- **429**: Too Many Requests - Request was rate-limited. Retry later.
- **500**: Internal Server Error - Something went wrong on the server. Retry later and report an error if unresolved.
