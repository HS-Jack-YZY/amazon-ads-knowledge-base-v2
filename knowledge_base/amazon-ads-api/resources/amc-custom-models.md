---
title: AMC Custom Models
source: https://advertising.amazon.com/API/docs/en-us
section: AMC
---

# AMC Custom Models

**Version**: 3.0

Create TrainedModelInferenceJobs using MlInputChannel and TrainedModel.

## Endpoints

### POST `/amc/models/v1/mlDataExports`

**Creates workflow to export ML data for model-based audiences.**

Creates an export request to allow access to output ML data.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/mlDataExports/list`

**List MlDataExport metadata.**

Returns list of MlDataExport metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/mlDataExports/{mlDataExportId}`

**Get MlDataExport metadata for a given mlDataExportId.**

Returns MlDataExport metadata information for a given instanceId and mlDataExportId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| mlDataExportId | path | True | string | Identifier that uniquely represents an AMC model based audience mlDataExport. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/mlInputChannels`

**Creates workflow to create a MlInputChannel for model-based audiences.**

Creates a MlInputChannel, which is input for TrainedModel and TrainedModelInferenceJob

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/mlInputChannels/list`

**List MlInputChannel metadata.**

Returns list of MlInputChannel metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### DELETE `/amc/models/v1/mlInputChannels/{mlInputChannelId}`

**Delete MlInputChannel metadata for a given mlInputChannelId.**

Deletes MlInputChannel metadata information for a given instance and mlInputChannelId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| mlInputChannelId | path | True | string | A unique ID that represents an AMCMlInputChannel object |

**Responses:** `204`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/mlInputChannels/{mlInputChannelId}`

**Get MlInputChannel metadata for a given mlInputChannelId.**

Returns MlInputChannel metadata information for a given instanceId and mlInputChannelId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| mlInputChannelId | path | True | string | A unique ID that represents an AMCMlInputChannel object |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/modeledDatasetUploadJobs`

**Creates workflow to create a ModeledDatasetUploadJob for model-based audiences.**

Creates a ModeledDatasetUploadJob to copy TrainedModelInferenceJob and TrainedMode results to ModeledDataset.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/modeledDatasetUploadJobs/list`

**List ModeledDatasetUploadJob metadata.**

Returns list of ModeledDatasetUploadJob metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/modeledDatasetUploadJobs/{modeledDatasetUploadJobId}`

**Get ModeledDatasetUploadJob metadata for a given modeledDatasetUploadJobId.**

Returns ModeledDatasetUploadJob metadata information for a given instanceId and modeledDatasetUploadJobId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| modeledDatasetUploadJobId | path | True | string | Identifier that uniquely represents an AMC model based audience modeledDatasetUploadJob. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/modeledDatasets`

**Creates workflow to create a ModeledDataset for model-based audiences.**

Creates a ModeledDataset, which can be used for ModeledDatasetUploadJob.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/modeledDatasets/list`

**List ModeledDataset metadata.**

Returns list of ModeledDataset metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### DELETE `/amc/models/v1/modeledDatasets/{modeledDatasetId}`

**Delete ModeledDataset metadata for a given modeledDatasetId.**

Deletes ModeledDataset metadata information for a given instance and modeledDatasetId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| modeledDatasetId | path | True | string | Identifier that uniquely represents an AMC model based audience modeledDataset. |

**Responses:** `204`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/modeledDatasets/{modeledDatasetId}`

**Get ModeledDataset metadata for a given modeledDatasetId.**

Returns ModeledDataset metadata information for a given instanceId and modeledDatasetId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| modeledDatasetId | path | True | string | Identifier that uniquely represents an AMC model based audience modeledDataset. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModelInferenceJobs`

**Creates workflow to create a TrainedModelInferenceJob for model-based audiences.**

Creates a TrainedModelInferenceJob that makes inferences using TrainedModel and MlInputChannel.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModelInferenceJobs/list`

**List TrainedModelInferenceJob metadata.**

Returns list of TrainedModelInferenceJob metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/trainedModelInferenceJobs/{trainedModelInferenceJobId}`

**Get TrainedModelInferenceJob metadata for a given trainedModelInferenceJobId.**

Returns TrainedModelInferenceJob metadata information for a given instanceId and trainedModelInferenceJobId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| trainedModelInferenceJobId | path | True | string | A unique ID that represents an AMCMlInputChannel object |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModelInferenceJobs/{trainedModelInferenceJobId}/cancel`

**Cancel TrainedModelInferenceJob for a given trainedModelInferenceJobId.**

Cancels TrainedModelInferenceJob for a given instance and trainedModelInferenceJobId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| trainedModelInferenceJobId | path | True | string | A unique ID that represents an AMCMlInputChannel object |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModels`

**Creates a workflow to create a TrainedModel for model-based audiences.**

Creates a TrainedModel, which can be used for TrainedModelInferenceJob

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |

**Responses:** `200`, `400`, `403`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModels/list`

**List TrainedModel metadata.**

Returns list of TrainedModel metadata information for a given instanceId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| maxResults | query | False | integer | Optional. Limits the number of items to return in the response. Max value is 100. Defaults to 100. |
| nextToken | query | False | string | Optional. Token to retrieve subsequent page of results. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### DELETE `/amc/models/v1/trainedModels/{trainedModelId}`

**Delete TrainedModel metadata for a given trainedModelId.**

Deletes TrainedModel metadata information for a given instance and trainedModelId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| trainedModelId | path | True | string | Identifier that uniquely represents an AMC model based audience trained model. |

**Responses:** `204`, `400`, `403`, `404`, `429`, `500`, `504`

---

### GET `/amc/models/v1/trainedModels/{trainedModelId}`

**Get TrainedModel metadata for a given trainedModelId.**

Returns TrainedModel metadata information for a given instanceId and trainedModelId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| trainedModelId | path | True | string | Identifier that uniquely represents an AMC model based audience trained model. |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---

### POST `/amc/models/v1/trainedModels/{trainedModelId}/cancel`

**Cancel TrainedModel for a given trainedModelId.**

Cancels TrainedModel for a given instance and trainedModelId.

Tags: Custom Models

**Parameters:**

| Name | In | Required | Type | Description |
|------|-----|----------|------|-------------|
|  |  | False |  |  |
|  |  | False |  |  |
|  |  | False |  |  |
| trainedModelId | path | True | string | A unique ID that represents an AMCMlTrainedModel object |

**Responses:** `200`, `400`, `403`, `404`, `429`, `500`, `504`

---


## Schemas (64 total)

- **AMCModelBasedAudienceCMAAArn**: The ARN returned when the customer associates an algorithm with a membership.
- **AMCModelBasedAudienceConfiguredModelAlgorithmAssociations**: The ARN returned when the customer associates an algorithm with a membership.
- **AMCModelBasedAudienceCreateMlDataExportInput**: Create MlDataExport input
- **AMCModelBasedAudienceCreateMlDataExportOutput**: Response on a successful creation of a MlDAtaExport create.
- **AMCModelBasedAudienceCreateMlInputChannelInput**: Model based audience MlInputChannel create input
- **AMCModelBasedAudienceCreateMlInputChannelOut**: Model based audience MlInputChannel create output
- **AMCModelBasedAudienceCreateModeledDatasetInput**: Create ModeledDataset input
- **AMCModelBasedAudienceCreateModeledDatasetOutput**: Response on a successful creation of a ModeledDataset.
- **AMCModelBasedAudienceCreateModeledDatasetUploadJobInput**: CreateModeledDatasetUploadJobInput
- **AMCModelBasedAudienceCreateModeledDatasetUploadJobOutput**: Response on a successful creation of a ModeledDataset.
- **AMCModelBasedAudienceCreateTrainedModelInput**: Model based audience trained model execution metadata information.
- **AMCModelBasedAudienceCreateTrainedModelOutput**: Response on a successful creation of a TrainedModel.
- **AMCModelBasedAudienceEnvironment**: The environment variables to set in the Docker container.
- **AMCModelBasedAudienceGetMlDataExportOutput**: Model based audience MLDataExport metadata information.
- **AMCModelBasedAudienceGetModeledDatasetOutput**: Model based audience trained model inference job execution metadata information.
- **AMCModelBasedAudienceGetModeledDatasetUploadJobOutput**: Model based audience trained model inference job execution metadata information.
- **AMCModelBasedAudienceGetTrainedModelInferenceJobOutput**: Model based audience trained model inference job execution metadata information.
- **AMCModelBasedAudienceGetTrainedModelOutput**: Model based audience trained model execution metadata information.
- **AMCModelBasedAudienceHyperParameters**: Algorithm-specific parameters that influence the quality of the model.
- **AMCModelBasedAudienceIdempotencyKey**: Idempotency key to prevent duplicate records.
- **AMCModelBasedAudienceIncrementalTrainingDataChannel**: A named input source that the container will consume. This is the location of a model which will be 
- **AMCModelBasedAudienceIncrementalTrainingDataChannels**: A list of trained models to perform incremental training against.
- **AMCModelBasedAudienceListMlDataExportOutput**: 
- **AMCModelBasedAudienceListModeledDatasetOutput**: 
- **AMCModelBasedAudienceListModeledDatasetUploadJobsOutput**: 
- **AMCModelBasedAudienceListTrainedModelInferenceJobOutput**: 
- **AMCModelBasedAudienceListTrainedModelsOutput**: 
- **AMCModelBasedAudienceMlDataExportId**: MlDataExportId
- **AMCModelBasedAudienceMlDataExportPresignedUrls**: 
- **AMCModelBasedAudienceMlInputChannel**: A named input source that the container will consume. This is the location of the output of the quer
- **AMCModelBasedAudienceMlInputChannelExecutionMetadata**: MlInputChannelExecutionMetadata
- **AMCModelBasedAudienceMlInputChannelId**: A unique ID that represents an AMCMlInputChannel object
- **AMCModelBasedAudienceMlInputChannelMetadataList**: 
- **AMCModelBasedAudienceMlInputChannels**: a list of mlInputChannels
- **AMCModelBasedAudienceModeledDatasetId**: Identifier that uniquely represents an AMC model based audience modeled dataset
- **AMCModelBasedAudienceModeledDatasetSchema**: ModeledDataset schema
- **AMCModelBasedAudienceModeledDatasetTableColumn**: Object to store tableColumn
- **AMCModelBasedAudienceModeledDatasetUploadJobId**: Identifier that uniquely represents an AMC model based audience modeled dataset upload job
- **AMCModelBasedAudienceModeledDatasetUploadJobUpdateStrategy**: UpdateStrategy of ModeledDatasetUploadJob
- **AMCModelBasedAudienceQueryParameters**: Defines the AMC query to run against AMC data whose output will be used for model training.
- **AMCModelBasedAudienceResourceConfig**: Configuration options for an training resource.
- **AMCModelBasedAudienceStoppingCondition**: Specifies a limit to how long a model training job can run.
- **AMCModelBasedAudienceTrainedModelId**: Identifier that uniquely represents an AMC model based audience trained model.
- **AMCModelBasedAudienceTrainedModelIds**: A list of trainedModelIds
- **AMCModelBasedAudienceTrainedModelInferenceJobId**: A unique ID that represents a trained model inference job
- **AMCModelBasedAudienceTrainedModelInferenceJobIds**: A list of trainedModelInferenceJobIds
- **AMCModelBasedAudienceTrainedModelInferenceJobRequest**: Model based audience TrainedModelInferenceJob execution metadata information.
- **AMCModelBasedAudienceTrainedModelInferenceJobResponse**: Model based audience trained model inference job execution metadata information.
- **ComplexDataType**: 
- **DataTypes**: 

... and 14 more schemas
