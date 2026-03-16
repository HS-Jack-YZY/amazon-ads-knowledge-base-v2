---
title: Rule based audiences
description: How to use rule based audiences in AMC
type: guide
interface: api
tags:
    - rule-based audience
    - custom audience
    - AMC audience creation
keywords:
    - rule based audience
    - AMC audience
    - audience creation
    - custom audience
    - targeting
    - lookalike audiences
    - sponsored brands audience
    - sponsored products audience
    - sponsored display audience
    - audience targeting
    - advertising reach



---
# AMC rule-based audience creation

With **AMC rule-based audience creation**, advertisers can now go one step further from deriving audience insights to directly creating custom audiences for use in Amazon Demand Side Platform (Amazon DSP), Sponsored Brands, Sponsored Products, and Sponsored Display. Advertisers have the same flexibility to use a query to create custom audiences in AMC that best support their advertising and business goals, or create a seed group for lookalike modeling.

Using the rule-based audiences API , you can build and activate custom audiences utilizing eligible signals in your AMC instance, across Sponsored Brands, Sponsored Products, Sponsored Display, Amazon DSP, and Amazon shopping insights (beta), as well as your own signals brought to AMC.

Audiences created in AMC are made available in your advertiser account (Amazon DSP or sponsored ads accounts). These audiences can be used in targeting in Amazon DSP or Sponsored Display and in bid modifiers in Sponsored Products and Sponsored Brands.

**AMC audiences for Amazon DSP**

You can create AMC custom audiences for relevant line items similar to how regular Amazon DSP audiences are selected today.

**AMC audiences for sponsored ads**

You can create AMC custom audiences for use in the respective sponsored ads products, as described below:

- Sponsored Brands: you can selectively modify the bids for them when launching your campaigns.
- Sponsored Products: by adjusting bids when creating and managing campaigns.
- Sponsored Display: where you can specify the custom AMC audience for targeting with your campaigns.

### Rule-based audiences API endpoints

The rule-based audiences service provides the following API endpoints to create and manage audiences:

| Method | Endpoint                                   | Description                                                                        |
| ------ | ------------------------------------------ | ---------------------------------------------------------------------------------- |
| POST   | /amc/audiences/query                       | Create a rule-based audience and send it to Amazon DSP or a sponsored ads account. |
| GET    | /amc/audiences/query                       | List status and other metadata for all audiences. Get all rule-based audience      |
| GET    | /amc/audiences/query/{audienceExecutionId} | List rule-based audience metadata for a specific audience execution identifier     |
| PUT    | /amc/audiences/query/{audienceExecutionId} | Update rule-based audience metadata for a specific audience execution identifier   |
| DEL    | /amc/audiences/query/{audienceExecutionId} | Deletes failed rule-based audience for a specific audience execution identifier    |

### Rate limits

The following table lists throttling limits for rule-based audience APIs.

| Endpoint                                       | Rate limit | Burst limit |
| ---------------------------------------------- | ---------- | ----------- |
| POST /amc/audiences/query                      | 5          | 5           |
| GET /amc/audiences/query                       | 5          | 10          |
| GET /amc/audiences/query/{audienceExecutionId} | 5          | 10          |

The rate limit defines the number of allowed requests per second. The burst limit defines the number of requests your API can handle concurrently.

## Create rule-based audiences

Before you can start creating rule-based audiences, you must first define your use case for which you want to create audiences. And, then write appropriate queries that will give you the best fit for your use case.

### Available data for rule-based audiences queries

To understand the data available, refer to the [AMC Data sources](guides/amazon-marketing-cloud/datasources/overview). The following is a list of AMC data sources that can be used to create AMC rule-based audiences:

| Dataset category                | Dataset                                                                   | Available for Amazon DSP audience queries? | Available for sponsored ads audience queries? |
| ------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------ | ---------------------------------------------- |
| Amazon ads                      | amazon\_attributed\_events\_by\_conversion\_time\_for\_audiences          | Y                                          | Y                                              |
| Amazon ads                      | amazon\_attributed\_events\_by\_traffic\_time\_for\_audiences             | Y                                          | Y                                              |
| Amazon ads                      | conversions\_for\_audiences                                               | Y                                          | Y                                              |
| Amazon ads                      | conversions\_with\_relevance\_for\_audiences                              | Y                                          | Y                                              |
| Amazon ads                      | dsp\_clicks\_for\_audiences                                               | Y                                          | Y                                              |
| Amazon ads                      | dsp\_impressions\_by\_matched\_segments\_for\_audiences                   | Y                                          | Y                                              |
| Amazon ads                      | dsp\_impressions\_by\_user\_segments\_for\_audiences                      | Y                                          | Y                                              |
| Amazon ads                      | dsp\_impressions\_for\_audiences                                          | Y                                          | Y                                              |
| Amazon ads                      | dsp\_views\_for\_audiences                                                | Y                                          | Y                                              |
| Amazon ads                      | sponsored\_ads\_traffic\_for\_audiences                                   | Y                                          | Y                                              |
| Amazon ads                      | dsp\_video\_events\_feed\_for\_audiences                                  | Y | N |         
| Paid features   | conversions\_all\_for\_audiences                                          | Y                                          | Y                                              |
| Paid features   | audience\_segments\_amer\_inmarket\_for\_audiences                        | Y                                          | N                                              |
| Paid features   | audience\_segments\_amer\_lifestyle\_for\_audiences                       | Y                                          | N                                              |
| Paid features   | audience\_segments\_apac\_inmarket\_for\_audiences                        | Y                                          | N                                              |
| Paid features   | audience\_segments\_apac\_lifestyle\_for\_audiences                       | Y                                          | N                                              |
| Paid features   | audience\_segments\_eu\_inmarket\_for\_audiences                          | Y                                          | N                                              |
| Paid features | audience\_segments\_eu\_lifestyle\_for\_audiences                         | Y                                          | N                                              |
| Paid features    | segment\_metadata\_for\_audiences                                         | Y                                          | N                                              |
| Paid features    | amazon\_brand\_store\_page\_views\(\_non\_endemic\)\_for\_audiences       | Y                                          | N                                              |
| Paid features   | amazon\_brand\_store\_engagement\_events\(\_non\_endemic)\_for\_audiences | Y                                          | N                                              |
| Paid features    | amazon\_retail\_purchases\_for\_audiences | Y                                          | Y    |
| Paid features    | amazon\_your\_garage\_all\_for\_audiences | Y                                          | Y    |
| Paid features    | amazon\_pvc\_enrollments\_for\_audiences | Y                                          | Y    |
| Paid features    | amazon\_pvc\_streaming\_events\_feed\_for\_audiences | Y                                          | Y    |
| Paid features    | ncs\_cpg\_insights\_stream\_for\_audiences   | Y    | N   |
| Advertiser Uploaded             | First\-party table names \(will not include the \_for\_audiences suffix\) | Y                                          | Y                                              |


If you wish to use an Advertiser Uploaded table, there is no change to the table name; however the `user_id ` column is the column identified as `isMainUserId` when uploaded.

### Rule-based audiences: header parameters

The following header parameters are required for all rule-based audience requests

| Header                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Amazon\-Advertising\-API\-ClientId             | The client ID related to a Login with Amazon application.                                                                                                                                                                                                                                                                                                                                                                                           |
| Authorization                                  | A valid API access token in the format Bearer {token}\.                                                                                                                                                                                                                                                                                                                                                                                             |
| Accept                                         | application/json                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Amazon\-Marketing\-Cloud\-Audience\-InstanceId | The Amazon Marketing Cloud instance identifier\. This identifier can be found on the Instance Info page of the AMC UI\.                                                                                                                                                                                                                                                                                                                             |
| Amazon\-Advertising\-API\-EntityId             | The Amazon Marketing Cloud entity identifier. Your AMC Amazon Ads account executive would have provided you this identifier when you on-boarded to AMC. Alternatively, access the AMC console with your user identifier and password, and grab the entity identifier value that is displayed in the URL. The alphanumeric code that is prefixed with ENTITY is your account identifier. An example of an entity identifier is:  ENTITY1AA1AA11AAA1. |

### Steps to create rule-based audiences

The following section lists the steps, the tables, and the SQL queries that you will need when creating rule-based audiences

#### Step 1: SELECT user\_id

AMC audiences are constructed from `user_ids`. This means, when writing rule-based audience queries, the SELECT statement **must** contain `user_id`.

```
SELECT
  user_id
FROM
  amazon_attributed_events_by_conversion_time_for_audiences
WHERE
  conversion_event_subtype = 'shoppingCart'
```

#### Step 2:  Determine audience size

If you want to know how large an audience is prior to submitting your audience creation request, you can query traditional AMC APIs to get that information.This is a best practice to follow, as audiences may fail to generate if they are of insufficient size. AMC rule-based audiences require a minimum audience size of 2,000 records; target 2,500 records or more to prevent failure. AMC lookalike audiences require a minimum of 500 and a maximum of 500,000.

Here is an example of how a query could be executed in AMC API to count the number of `user_id`s given a set of constraints:

```
SELECT
  COUNT(DISTINCT user_id)
FROM
  amazon_attributed_events_by_conversion_time
WHERE
  conversion_event_subtype = 'shoppingCart'
```

In this example, you can wrap the `user_id` in COUNT because `user_id ` can never be returned in AMC measurement queries.

> [NOTE] While audience size is 2,000 identities, the audience is screened for user_ids that have opted out of audiences during the ingestion process. A best practice is to ensure the audience is larger than 2,000 identities.

#### Step 3: Create audiences

After you've determined the audience size, use the POST operation of the `/amc/audiences/query` resource to create the audience.

> [WARNING] Once you create an audience, you cannot edit the audience name, SQL query, or any other parameters. If you create a second audience with the same parameters (audience name, SQL query, etc.), there will be two identical audiences differentiated by their `audienceExecutionId`, `dspAudienceId`, and `dspCanonicalId`.

Once you create an audience and it is made available in Amazon DSP or in your sponsored ads campaigns, you cannot edit it. If your audience fails, however, you can edit the query, date range, and auto adjust the date. For more information, refer to [Manage failed audiences](#manage-failed-audiences).

#### Step 4: View audiences

Unlike the AMC measurement queries, AMC Audience queries do not send data to your S3 bucket (as it contains private `user_id` data). Instead, audiences are sent directly to the application that requested the audiences, which is Amazon DSP or your sponsored ads campaigns.

### Constraints for AMC audience creation

**Query deal\_id**

If the `deal_id `column is populated for a given row in the following tables, the row containing the deal\_id value will not be available for querying.

- dsp\_clicks\_for\_audiences
- dsp\_impressions\_by\_matched\_segments\_for\_audiences
- dsp\_impressions\_by\_user\_segments\_for\_audiences
- dsp\_impressions\_for\_audiences

**Query tracked\_asin and tracked\_item **

Some `tracked_asin` values reflect products that are sensitive in nature. These `tracked_asin` values have been removed from both tracked\_asin and tracked\_item to prevent them from being used for audience activation.

**user\_behavior\_segment\_ids and matched\_behavior\_segment\_ids**

The **dsp\_impressions\_for\_audiences** table does *not* contain the columns:

- user\_behavior\_segment\_ids
- matched\_behavior\_segment\_ids

**Targetable user_ids**

Only the `adUserId` type is targetable for audience creation, even though your measurement queries may include other user_id types. The 90% `adUserId` coverage is an important factor limiting the full audience size.

**Opt-outs and exclusions**

The final audience omits users that have opted out of targeting, as well as any users identified as potential children, even though their data may be present in your measurement query.

**Deduplication and reconciliation issues**

The incomplete deduplication and merging of user IDs can result in a small percentage of users being excluded from the final audience, even though those audiences may have been counted in your measurement queries.


## Create a rule-based audience

Use the POST operation of the `/amc/audiences/query` endpoint to create a rule-based audience execution metadata.

```
POST /amc/audiences/query
```

This operation starts the execution workflow to create an audience. This is an idempotent operation.

#### Sample request

```
{
  "audienceName":"AudienceDemo",
  "audienceDescription":"Audience created for Audience Demo",
  "advertiserId":"1234567890123",
  "query":"SELECT user_id FROM amazon_attributed_events_by_conversion_time_for_audiences WHERE conversion_event_subtype = 'shoppingCart'",
  "timeWindowStart":"2022-05-25T00:00:00Z",
  "timeWindowEnd":"2022-05-27T01:00:00Z",
  "refreshRateDays":1,
  "timeWindowRelative":"TRUE"
}

```

> [NOTE] When creating audiences for sponsored ads, you must provide the sponsored ads account number as the `advertiserId` for which you are creating this audience. The alphanumeric code that is prefixed with ENTITY is your advertiser id and is displayed in the URL when logged in to your sponsored ads account.   Retrieve your sponsored ads account number either through the Amazon Ads console, or their respective endpoints. You can also use the [GET /amc/instances/{{instanceId}}/advertisers](guides/amazon-marketing-cloud/admin/instance-management) to the get your `advertiserId`.

#### Sample response

```
{
  "audienceExecutionDescription": "Successfully started the simple audience creation workflow!",
  "audienceExecutionId": "c990106b-7f46-4ff2-b79d-c0b5a18edc30",
  "status": "PENDING"
}

```

When creating audiences, it is important for you to understand how the following parameters govern the output of your audience:

- `audienceName`:  The `audienceName`, a required field when creating the audience, will be displayed in the target application (Amazon DSP or your sponsored ads accounts). It is recommended to use a unique audience name each time you create an audience.
- `advertiserId`: The advertiser ID of the Amazon DSP account or the sponsored ads account to which you are activating the audience. The advertiser identifiers for both Amazon DSP and sponsored ads associated with your AMC instance are displayed on the Instance Info page of the AMC console.
- `refreshRateDays: `The value of `refreshRateDays  ` determines how frequently the SQL query is re-run and the existing audience is completely overwritten with new data. The `refreshRateDays` parameter allows you to (1) keep the audience active in the target application and (2) re-run the SQL query at a specified interval.
  For example, if set to 7, the SQL query will be re-run every 7 days and the audience in target application will be updated with the new data. By default, audiences in Amazon DSP and sponsored ads are refreshed daily (that is, they have a refresh rate set to one day). For Amazon DSP audiences, once the audience is associated to a line item, the audience will continue to be refreshed each day. If, however, an audience is not associated to a line item:

  * Within 14 days, the refresh rate will increase to two days.
  * Within 30 days pass, the refresh rate will increase to seven days.
  * Within 100 days pass, the refresh rate will decrease to 0 and the audience will no longer be refreshed.

  Similarly, if the audience query has a static time window (auto adjust date set to No), after 30 days the refresh rate will increase to seven days.
  If a query runs for more than four hours, the refresh rate will increase to two days in an attempt to keep their query queue from becoming obstructed.

  > [WARNING] If `refreshRateDays` is set to 0, the audience will be deactivated in the target application after 30 days. Deactivated audiences have no members; line items using those audiences will not serve ads to the audience.
  >

  If you want to refresh the audience with an updated date range, set `refreshRateDays `parameter to a value greater than 0 and set the `timeWindowRelativeparameter `set to TRUE.
  The default value for this parameter is 21. Only values between 0 and 21 are valid. Other values will cause the POST to fail.

  - `timeWindowRelative`: The timeWindowRelativeparameter allows you to increment the date range of the SQL query by the refreshRateDays value.If timeWindowRelative is set to:

    – TRUE: then when the SQL query is re-run per `refreshRateDays`, the `timeWindowStart` and `timeWindowEnd` is incremented by the value of `refreshRateDays`.
    – FALSE: then `timeWindowStart` and `timeWindowEnd` will not change. If you also set the `refreshRateDays` to a value greater than 0, the SQL query will be continually re-run for the original date range.

  For example, if an audience is created on 1/10/24 and `timeWindowStart` is set to 2024-01-01T00:00:00.000Z; `timeWindowEnd ` is set to 2024-01-09T00:00:00.000Z; `refreshRateDays `is set to 7 `timeWindowRelative` is set to TRUE, then the audience will be updated on 1/17/24 and the SQL query will be re-run with the `timeWindowStart` and `timeWindowEnd` set to 1/8/24 and 1/16/24. The audience will then be subsequently updated again on 1/24/24 with `timeWindowStart` and `timeWindowEnd` set to 1/15/24 and 1/23/24.

> [NOTE] If not set, the value for `timeWindowRelative` defaults to False.

### Get all rule-based audiences for a specific AMC instance

The GET /`amc/audiences/query` endpoint returns list of execution metadata information for a given `instanceId`.

This endpoint accepts `maxResults ` and `nextToken `as query parameters.

The `maxResults `query parameter limits the number of audience execution metadata objects returned in the response. If there are more objects left to retrieve, the response will include an encrypted token (`nextToken`), which can be used to retrieve the next set of results. If the total number of results creates a response larger than 1MB, the results will be truncated to 1MB.

The response body contains all the audience creation metadata, as described on the POST operation. In addition, the following status-related details are returned too:

- `lastRefreshedTime`: The most recent date and time the audience was refreshed (that is, the SQL query was re-run per the `refreshRateDays`) and pushed to advertiser accounts in the target application. Each time the audience is refreshed and the new audience data overwrites the existing audience in the target application, this attribute is updated.

> [NOTE] Initially, this value will be the same as the `createTime`.

- `status`: The status of the audience execution. Can be one of the following:

  - PENDING – The API request has been submitted and is queued for execution.
  - RUNNING – The query is being executed.
  - SUCCEEDED – The query has completed, and the audience has been submitted to the advertiser account in the target application.
  - FAILED – The API request has failed to execute due to user input errors or an internal service exception.
- `statusReason`: If the status field displays FAILED, the `statusReason `provides additional information about why the audience creation failed. For example, the following `statusReason `is returned when you do not use audience-specific tables in the query:
  `statusReason: "Invalid tables in the SQL query: Use audience-specific tables in the query."`

### Get the rule-based audience metadata for a specific audience identifier

`GET /amc/audiences/query/{audienceExecutionId}` returns execution metadata information for a given `instanceId` and `audienceExecutionId`.

Refer to the Response body of the POST parameter operation to get the `audienceExecutionId`

If the response returns the status of SUCCEEDED, you can view the audience in the advertiser account it was created for.

If the response returns a status of FAILED, you can view the [statusReason](#reasons-for-rule-based-audience-creation-failure) to determine the cause of the failure.

> [NOTE] In case your audience creation operation failed, (returned a "FAILED" status) you can either update parameters to recreate the audience or delete the failed audience.

### View and use your custom audiences

#### Amazon DSP

After an audience is created for an Amazon DSP account, it is activated and made available for use in Amazon DSP. To view the audience details:

- Use GET /amc/audiences/query/{audienceExecutionId} to retrieve the DspCanonicalId.
- Use POST /audiences/list, in the request body provide the DspCanonicalId to filter by audienceId .
- Filter through category= Custom-built and subCategory = AMC.

> [WARNING] When using the Amazon DSP API to view the status of your audience, note that Amazon-Advertising-API-Scope header which is retrieved from the [profile ID](https://advertising.amazon.com/API/docs/en-us/guides/get-started/retrieve-profiles).

You can also log into the Amazon Ads console to view the audience. Navigate to **Custom-built** > **AMC** under the **Audience** tab in Amazon DSP.

> [NOTE] When the audience you created appears in Lifestyles under the **Audiences** tab in Amazon DSP, the system will prepend "AMC" to the audienceName. This allows you to filter for all AMC-created audiences in Amazon DSP.

#### Sponsored Products, Sponsored Brands, Sponsored Display

After an audience is created for your sponsored ads account, you can retrieve it using the `POST /targetableEntities/list `endpoint. Use AUDIENCE as the `targetTypeFilter `and pass ["Audience Category", "Custom-built", "AMC"] as the value for `pathsFilter`, as shown below:

```

{
  "adProduct": "SPONSORED_DISPLAY",
  "targetTypeFilter": ["AUDIENCE"],
  "maxResults": 10,
  "pathsFilter": [["Audience Category", "Custom-built", "AMC"]]
 }

```

This call will list all the AMC audiences created for the sponsored ads campaigns. Note the ` audienceId` to activate the audience in your sponsored ads campaigns.

After you retrieve the `audienceId`, you modify the based on specific audience segments when creating **Sponsored Products** campaigns ([POST /sp/campaigns](https://advertising.amazon.com/API/docs/en-us/sponsored-products/3-0/openapi/prod#tag/Campaigns/operation/CreateSponsoredProductsCampaigns)) and **Sponsored Brands** campaigns ([POST /sb/campaigns ](https://advertising.amazon.com/API/docs/en-us/sponsored-products/3-0/openapi/prod#tag/Campaigns/operation/CreateSponsoredProductsCampaigns)).

When creating a Sponsored Display campaign, create a target using [POST/sd/targets](https://advertising.amazon.com/API/docs/en-us/sponsored-display/3-0/openapi#tag/Targeting/operation/createTargetingClauses) and provide the `audienceId` you created using rule-based audiences.

### Manage failed audiences

AMC allows you to update or delete audiences that failed during creation.

By updating or deleting the failed audiences, you can ensure that your audience list contains only relevant audiences.

#### Update a failed rule-based audience

To update a rule-based audience that failed during creation, use the `PUT /amc/audiences/query/{audienceExecutionId}` endpoint of the API to modify the query you used to create your rule-based audience.

This endpoint allows you to update the following parameters:

- `timeWindowStart`
- `timeWindowEnd`
- `query`
- `timeWindowRelative`
- `workflowId`
- `inputParameters`
- `parameterValues`

A successful call returns a HTTP status code of `200 OK` and the audience with updated values is created. The audience will take between 2 - 24 hours to synchronize with the advertiser account in the target application.

#### Delete a failed rule-based audience

Use the `DELETE /amc/audiences/query/{audienceExecutionId}` endpoint to remove audiences that **failed** to create through the POST operation of the `/amc/audiences/query` endpoint.

> [WARNING] The delete operation deletes the failed audience immediately and is irreversible. Be certain before deleting audiences.

#### Reasons for rule-based audience creation failure

If the status field of the `GET /amc/audiences/query/{audienceExecutionId}` endpoint response displays FAILED, the `statusReason` provides additional information about why the audience creation failed.

For example, the following `statusReason` is returned when you do not use audience-specific tables in the query:
"statusReason": "Invalid tables in the SQL query: Use audience-specific tables in the query."

An audience creation can fail due to any of the following reasons:

- The audience submitted does not reach 2,000 user\_ids, which is the minimum number required to create audiences.
- In the SQL query, you referenced a table that was not supported for Audiences.
