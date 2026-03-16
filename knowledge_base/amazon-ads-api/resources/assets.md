---
title: Creative Asset Library
source: https://advertising.amazon.com/API/docs/en-us/creative-asset-library
section: Resources
---

# Creative Assets

Use the creative assets API to create and manage video and image assets for use in Amazon Ads campaigns. For details on using this API, see [Creatives overview](guides/creative-asset/asset-library-overview).

**Version:** 3.0

## Endpoints

### GET /assets

**Summary:** Retrieve an asset

**Operation ID:** getAsset

### GET /assets/batchRegister/{requestId}

**Summary:** Retrieves status of the batch asset registration request, uniquely identified by requestId.

**Operation ID:** getAssetsBatchRegister

### POST /assets/batchRegister

**Summary:** Batch register uploaded assets

**Operation ID:** assetsBatchRegister

### POST /assets/register

**Summary:** Register an uploaded asset

**Operation ID:** registerAsset

### POST /assets/upload

**Summary:** Create an upload location

**Operation ID:** getUploadLocation

### POST /assets/search

**Summary:** Search assets

**Operation ID:** searchAssets
