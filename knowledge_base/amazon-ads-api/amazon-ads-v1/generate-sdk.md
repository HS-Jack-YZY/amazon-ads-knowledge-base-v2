---
title: Generate a client library and SDK from Amazon Ads API specifications
source: https://advertising.amazon.com/API/docs/en-us/guides/get-started/generate-sdk
section: Amazon Ads API v1
---

# Generate a client library and SDK from Amazon Ads API specifications

## Introduction

The Amazon Ads API v1 represents a reimagined approach to the Amazon Ads API, built from the ground up to provide a seamless experience across all Amazon advertising products through a common model. One major benefit of this common model is improved compatibility with code generation tools such as client library generators.

Learn more about Amazon Ads API v1.

The following walkthrough uses OpenAPI Generator to create a client library for campaign management from the Ads API v1 specifications.

> **Generating an SDK in other languages:** Though this walkthrough generates a client library in TypeScript to interface with a TypeScript demonstration client, OpenAPI Generator supports numerous other languages. You can adapt the approach described below to generate your own client libraries and SDKs using OpenAPI Generator or other open-source code generation tool of your choice.

## Prerequisites

### Authentication and authorization

This walkthrough requires that you have already onboarded to the Amazon Ads API as described in our onboarding overview. This enables you to retrieve your client ID and client secret, which are required for the client application described below.

You should also have retrieved an access token, refresh token, and a profile ID as described in our "getting started" overview. The refresh token and profile ID are required for the client application described below.

### Node

The example code below is configured to use Node 24 in your development environment. Adjustments are required to use earlier versions of Node.

### Java

The openapi-generator-cli NPM package is a wrapper around the OpenAPI Generator core, which is a Java project. The generator requires the java executable to be available in your PATH at a minimum version of JDK 11. For more information on Java as a prerequisite, see the documentation for the openapi-generator-cli package.

## Steps

### 1. Set up the workspace

First, create a workspace directory for this demo.

```
cd ~/Desktop
mkdir amazon-ads-workspace
cd amazon-ads-workspace

mkdir packages
cd packages
mkdir amazon-ads-library-demo
mkdir amazon-ads-client-demo
```

The commands above create a workspace with the following structure:

```
amazon-ads-workspace
  packages
    amazon-ads-library-demo
    amazon-ads-client-demo
```

The amazon-ads-library-demo directory will include the necessary input and processing scripts to generate a client library from the Amazon Ads API OpenAPI specification. The amazon-ads-client-demo directory will contain a demonstration client that uses your generated client library.

#### 1a. Create workspace build scripts

Optionally, you can create a package.json in this workspace to add scripts that build each package or the workspace as a whole. This is not required for the steps below.

```
{
  "name": "amazon-ads-workspace",
  "private": true,
  "workspaces": ["packages/*"],
  "scripts": {
    "build": "npm run build --workspaces",
    "build:sdk": "npm run build -w amazon-ads-library-demo",
    "build:client": "npm run build -w amazon-ads-client-demo"
  }
}
```

### 2. Set up the client library package

First, initialize the client library directory as an NPM package, then create two required subdirectories.

```
cd amazon-ads-library-demo
npm init -y
mkdir input
mkdir scripts
```

#### 2a. Add OAS files

The specifications for Ads API v1 campaign management can be downloaded as JSON using the Download OpenAPI spec link in the description section of the specification page. The active selection in the product selection interface determines which specification file is downloaded.

Alternatively, you can download the common specification and the product-specific specifications directly using the following links:

- Common specification (AmazonAdsAPIALL_prod_3p.json)
- Sponsored Products specification (AmazonAdsAPISP_prod_3p.json)
- Sponsored Brands specification (AmazonAdsAPISB_prod_3p.json)
- Amazon DSP specification (AmazonAdsAPIDSP_prod_3p.json)
- Sponsored Display specification (AmazonAdsAPIDSD_prod_3p.json)
- Sponsored Television specification (AmazonAdsAPIST_prod_3p.json)

> **Note:** The common specification, Sponsored Products specification, and Sponsored Brands specification are required for the code examples in the client demo described below.

Add these files to the /input directory. Your file tree should resemble the following:

```
amazon-ads-workspace
  packages
    amazon-ads-library-demo
      input
        AmazonAdsAPIALL_prod_3p.json
        AmazonAdsAPISB_prod_3p.json
        AmazonAdsAPISP_prod_3p.json
      scripts
    amazon-ads-client-demo
```

> **Note:** Preserve the filenames as they are when downloaded. The processing script described below requires filenames matching the AmazonAdsAPI.*_prod_3p.json pattern.

#### 2b. Add the processing script

Given the downloaded OAS files found in /input, this script will prune the contracts (i.e., scrub polymorphism, remove auth header parameters) and output a singular client library in the /generated directory.

The unified models will be found directly under /v1, while the ad product-specific models will each be found in a subdirectory one level below /v1 (i.e. /v1/sp).

Included functions:

- removePolymorphism: Removes polymorphic structures from OpenAPI schemas to simplify the generated TypeScript code.
- renameError: Renames "Error" objects to "ModelError" to avoid conflicts with JavaScript's built-in Error class.
- findInputFiles: Locates all relevant API specification files that need processing.
- getAdProduct: Extracts the advertising product name from the filename to organize generated code into appropriate directories.
- removeRuntimeExports: Removes duplicate runtime exports from generated files to prevent conflicts.
- updateRuntimeImports: Updates import paths to ensure correct runtime file references across different directory levels.
- processSpecFile: Handles the complete processing pipeline for each spec file, including transformation and code generation.
- generateIndexFile: Creates index files to properly export all generated modules.
- setupRootFiles: Organizes the final directory structure and creates root-level exports.

The full processing script (processSpecs.cjs) uses OpenAPI Generator CLI to generate TypeScript-fetch client code from the pruned specifications. It handles polymorphism removal, Error class renaming, runtime import management, and index file generation. The script processes each OAS input file, generates code into the appropriate product subdirectory, and creates proper export structure.

The generator command uses the following key options:
- Generator: typescript-fetch
- disallowAdditionalPropertiesIfNotPresent=false
- enumPropertyNaming=PascalCase
- importFileExtension=.js
- modelPropertyNaming=camelCase
- paramNaming=camelCase
- supportsES6=true
- useSingleRequestParameter=true
- withInterfaces=true
- enumUnknownDefaultCase=true

#### 2c. Add configuration files

Replace the content of the existing amazon-ads-library-demo/package.json with the following:

```
{
  "name": "amazon-ads-library-demo",
  "version": "1.0.0",
  "engines": { "node": ">=20.0.0" },
  "engineStrict": true,
  "type": "module",
  "main": "./dist/index.js",
  "module": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "scripts": {
    "clean": "rm -rf generated dist",
    "process-specs": "node scripts/processSpecs.cjs",
    "prebuild": "npm run process-specs",
    "build": "tsc",
    "prepare": "npm run clean && npm run build"
  },
  "devDependencies": {
    "typescript": "^5.8.3",
    "@openapitools/openapi-generator-cli": "^2.21.4",
    "@types/node": "^24.0.14"
  },
  "exports": {
    ".": {
      "import": "./dist/index.js",
      "require": "./dist/index.js",
      "types": "./dist/index.d.ts"
    }
  },
  "files": ["dist"]
}
```

Create amazon-ads-library-demo/tsconfig.json:

```
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "lib": ["es2022", "dom", "dom.iterable"],
    "allowJs": true,
    "allowSyntheticDefaultImports": true,
    "declaration": true,
    "emitDeclarationOnly": false,
    "esModuleInterop": true,
    "outDir": "dist",
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": false,
    "noImplicitThis": true,
    "alwaysStrict": true,
    "noUnusedLocals": false,
    "noUnusedParameters": false,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": false,
    "inlineSourceMap": true,
    "inlineSources": true,
    "experimentalDecorators": true,
    "strictPropertyInitialization": false,
    "typeRoots": ["./node_modules/@types"],
    "skipLibCheck": true
  },
  "include": ["generated"],
  "exclude": ["node_modules"]
}
```

#### 2d. Generate the client library

Before the first time you generate the client library, install the dependencies and create a link:

```
npm install
npm link
```

To generate the client library:

```
npm run build
```

### 3. Set up the client package

First, initialize the client directory as an NPM package:

```
cd ../amazon-ads-client-demo
npm init -y
npm link amazon-ads-library-demo
mkdir src
```

#### 3a. Set up auth credentials

Your client application requires credentials to make a successful request to the API. Create src/auth_config.ts with your client ID, client secret, refresh token, and profile ID. The auth module uses axios to POST to https://api.amazon.com/auth/o2/token with the refresh_token grant type.

#### 3b. Create the client application

Create src/client.ts that uses the generated client library to test several operations:

- Use the common CampaignCreate model to create a Sponsored Products campaign
- Use the SBCampaignCreate model to create a Sponsored Brands campaign
- Use the SPCampaignCreate model to create a Sponsored Products campaign

> **Note:** All campaigns in the script are created in PAUSED state. To test creation of enabled campaigns, we recommend creating a test account.

The client creates a Configuration with basePath 'https://advertising-api.amazon.com' and uses the v1.CampaignsApi to make API calls.

#### 3c. Create configuration files

Replace amazon-ads-client-demo/package.json:

```
{
  "name": "amazon-ads-client-demo",
  "version": "1.0.0",
  "engines": { "node": ">=20.0.0" },
  "engineStrict": true,
  "main": "dist/src/client.js",
  "type": "module",
  "scripts": {
    "build": "tsc",
    "start": "node dist/src/client.js",
    "dev": "ts-node --esm src/client.ts"
  },
  "dependencies": {
    "@types/node": "^24.0.14",
    "ts-node": "^10.9.2",
    "typescript": "^5.8.3",
    "amazon-ads-library-demo": "^1.0.0",
    "axios": "^1.11.0"
  }
}
```

Create amazon-ads-client-demo/tsconfig.json:

```
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ESNext",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "skipLibCheck": true,
    "outDir": "./dist",
    "rootDir": "."
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

#### 3d. Build and test the client

Install dependencies, build, and test:

```
npm install
npm run build
npm run start
```

> **Note:** Sponsored Products campaign creation requires a unique campaign name. Use a unique value to replace "INSERT_UNIQUE_WORD" in client.ts and rebuild after each change.

### 4. Response

Each operation in the demo client logs the response to the console. A successful response includes success, partialSuccess, and error arrays. Successful campaign creation returns the campaign object with campaignId, state, budgets, optimizations, and other fields.

## Next steps

For each OpenAPI specification input, the generated client library exports an object containing both the appropriate models and a set of API classes corresponding to resources in the specification. Each API class includes methods corresponding to available operations in the API.

For instance, an instance of v1.CampaignsApi includes the .createCampaign method. Similar models and methods are available for each resource -- for example, v1.AdGroupsApi includes .createAdGroup. Additional methods are available for query, update, or delete requests.

You can adjust the code in client.ts to experiment with these other resources and operations, then use this client library in your custom client implementation as required for your development goals.
