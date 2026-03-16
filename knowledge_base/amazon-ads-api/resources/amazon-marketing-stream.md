---
title: "Amazon Marketing Stream"
source: https://advertising.amazon.com/API/docs/en-us/amazon-marketing-stream/openapi
section: Amazon Marketing Stream
spec_url: https://dtrnk0o2zy01c.cloudfront.net/openapi/en-us/dest/AmazonMarketingStream_prod_3p.json
---

# Amazon Marketing Stream

**Version**: 3.0

Amazon Marketing Stream lets advertisers stream their campaign and reporting information directly to their AWS account. For more information, see [Stream onboarding](/API/docs/en-us/guides/amazon-marketing-stream/onboarding) and [Data guide](/API/docs/en-us/guides/amazon-marketing-stream/data-guide).

## Endpoints

### GET /dsp/streams/subscriptions

List subscriptions (DSP)

**Operation ID**: `ListDspStreamSubscriptions`

**Responses**: 200, 400, 403, 429, 500

---

### POST /dsp/streams/subscriptions

Create a new subscription (DSP)

**Operation ID**: `CreateDspStreamSubscription`

**Responses**: 200, 400, 403, 409, 429, 500

---

### GET /dsp/streams/subscriptions/{subscriptionId}

Fetch a specific subscription by Id (DSP)

**Operation ID**: `GetDspStreamSubscription`

**Responses**: 200, 400, 403, 404, 429, 500

---

### PUT /dsp/streams/subscriptions/{subscriptionId}

Update an existing subscription (DSP)

**Operation ID**: `UpdateDspStreamSubscription`

**Responses**: 200, 400, 403, 404, 409, 429, 500

---

### GET /streams/subscriptions

List subscriptions

**Operation ID**: `ListStreamSubscriptions`

**Responses**: 200, 400, 401, 403, 404, 429, 500

---

### POST /streams/subscriptions

Create a new subscription

**Operation ID**: `CreateStreamSubscription`

**Responses**: 200, 400, 401, 403, 404, 409, 429, 500

---

### GET /streams/subscriptions/{subscriptionId}

Fetch a specific subscription by Id

**Operation ID**: `GetStreamSubscription`

**Responses**: 200, 400, 401, 403, 404, 429, 500

---

### PUT /streams/subscriptions/{subscriptionId}

Update an existing subscription

**Operation ID**: `UpdateStreamSubscription`

**Responses**: 200, 400, 401, 403, 404, 409, 429, 500

---

## Schemas (23 total)

Full definitions: https://dtrnk0o2zy01c.cloudfront.net/openapi/en-us/dest/AmazonMarketingStream_prod_3p.json

- **StreamSubscription**: {createdDate, dataSetId, destination, destinationArn, notes, status, subscriptionId, updatedDate}
- **SubscriptionEntityStatus**: enum(ACTIVE, ARCHIVED, FAILED_CONFIRMATION, FAILED_PROVISIONING, PENDING_CONFIRMATION, PROVISIONING, SUSPENDED)
- **Destination**: {firehoseDestination, sqsDestination}
- **FirehoseDestination**: {deliveryStreamArn, subscriberRoleArn, subscriptionRoleArn}
- **SqsDestination**: {queueArn}
- **UpdateEntityStatus**: enum(ARCHIVED)
