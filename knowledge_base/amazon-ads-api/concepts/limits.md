---
title: Limits, constraints, and quotas
description: Information about limits, including service limits, bid constraints, and valid characters in the Amazon Ads API
type: guide
interface: api
tags:
    - Operations
keywords:
    - p99
    - response time
    - bid constraint
    - default budget
---

# Limits, constraints, and quotas

This document includes tables describing limits, constraints, and quotas in the Amazon Ads API, including:

- [Service limits](reference/concepts/limits#service-limits)
- [Bid constraints by marketplace](reference/concepts/limits#bid-constraints-by-marketplace)
- [Budget constraints by marketplace](reference/concepts/limits#budget-constraints-by-marketplace)
- [Valid characters](reference/concepts/limits#valid-characters)
    - [Keyword character constraints](reference/concepts/limits#keyword-character-constraints)
    - [Entity name character constraints](reference/concepts/limits#entity-name-character-constraints)

For more information on rate limiting ("throttling"), please see [Rate Limiting](reference/concepts/rate-limiting).

## Service limits

| Operation | P99 Guarantee |
| --- | --- |
| Synchronous CRUD operations | 30s |
| Impression/click event to availability via API| 12h |
| Impression/click invalidation | 72h |
| Async report generation time | 15m |
| Async snapshot generation time | 15m |

## Bid constraints by marketplace

This table details the maximum allowable bid (in local currency) for keywords or targets by marketplace for Sponsored Products (SP), Sponsored Brands (SB), Sponsored Brands Video (SBV), and Sponsored Display (SD). This also includes differences between vCPM and CPC for different goal types like Grow Brand Impression Share (BIS) and Aquire New Customers (NTB).

| Marketplace | Currency | Min / Max bid for SP | Min / Max bid for SD (CPC) | Min / Max bid for SD (vCPM) | Min / Max bid for SB (CPC) Image | Min / Max for SBV (CPC) Video | Min / Max bid for SB (vCPM) Image - BIS |  Min / Max bid for SBV (vCPM) Video - BIS  | Max bid for SB (vCPM) Image - NTB |  Min / Max bid for SBV (vCPM) Video - NTB  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| MX | MXN | 0.1/20000 | 0.1/20000 | 5/20000 |0.10/20000 | 0.15/20000 | 128/800000 |  80/800000 | 8/800000 |  24/800000 | 
| UK | GBP | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/31 | 0.15/31 | 4/5000 | 8/5000 | 1/5000 |  2/5000 | 
| DE | EUR | 0.02/1000 | 0.02/1000 | 1/1000 | 0.10/39 | 0.15/39 | 5/5000 | 7/5000 | 1/5000 |  3/5000 | 
| CA | CAD | 0.02/1000 | 0.02/1000 | 1/1000 | 0.10/49 | 0.15/49 | 11/5000 | 11/5000 | 1/5000 |  2/5000 | 
| AU | AUD | 0.02/1410 | 0.2/1000 | 1/1000 |0.10/70 | 0.15/70 | 14/2800 | 20/2800 | 3/2800 |  3/2800 | 
| US | USD | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/49 | 0.25/49 | 8/5000 | 12/5000 | 1/5000 |  4/5000 | 
| FR | EUR | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/39 | 0.15/39 | 4/5000 | 8/5000 | 1/5000 |  2/5000 | 
| ES | EUR | 0.02/1000 | 0.02/1000 | 1/1000 | 0.10/39 | 0.15/39 | 4/5000 | 7/5000 | 2/5000 |  2/5000 | 
| IT | EUR | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/39 | 0.15/39 | 4/5000 | 6/5000 | 1/5000 |  2/5000 | 
| NL | EUR | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/39 | 0.15/39 | 6/1560 | 8/1560 | 1/1560 |  2/1560 | 
| JP | JPY | 2/100000 | 2/100000 | 100/100000 |10.0/7760 |  15.0/7760 | 560/310400 | 800/310400 | 100/310400 |  356/310400 | 
| AE | AED | 0.24/184 | 0.2/3670 | 1/3670|0.40/184 | 0.6/184 | 44/7360 | 28/7360 | 4/7360 |  8/7360 | 
| BR | BRL | 0.07/3700 | 0.07/3700 | 2/3700 |0.53/200 | 0.8/25000 | 37/8000 | 53/8000 | 6/8000 |  10/8000 | 
| SG | SGD | 0.02/1100 | .14/1410 | 4/1410 |0.14/100 | 0.2/1400 | 6/4000 | 29/4000 | 4/4000 |  8/4000 | 
| SE | SEK | 0.18/9300 | 0.18/1000 | 1/1000 |0.90/500| 1.30/500 | 36/20000 | 276/20000 | 2/200000 |  2/200000 | 
| IN | INR | 1/5000 | 1/5000 | 4/5000 | 1/500 | 1.5/500 | 84/80000 |  200/80000 | 28/800000 |  111/800000 | 
| PL | PLN | 0.04/2000 | 0.02/1000 | 1/1000 | 0.2/200 | 0.3/200 | 92/8000  | 180/8000 | 1/80000 |  2/80000 | 
| TR | TRY | 0.05/2500 | 0.05/2500 | 1.85/2500 |0.2/200 | 0.3/200 | 74/8000 | 0.3/200 | 106/8000 | 2/80000 | 
| EG | EGP | 0.15/5.50 | 0.15/7400 | 5/7400 |0.7/400 | 1/400 | 160/16000 | 300/16000 | 5/160000 |  10/160000 | 
| SA | SAR | 0.10/3670 | 0.10/3670 | 4/3670 |0.40/184| 0.60/184 | 28/7360 | 40/7360 | 5/7360|  12/7360 | 
| BE | EUR | 0.02/1000 | 0.02/1000 | 1/1000 |0.10/39 | 0.15/39 | 4/1560 | 6/1560 | 1/1560 |  2/1560 | 
| ZA | ZAR | 1/7000 |  0.7/1000 | 1.5/1000 | 0.7/350 | 1.1/350 | 0.7/350 | 1.1/350 | 0.7/350 | 1.1/350 |
| IE | EUR | 0.02/1000 | NA | NA | 0.10/39| 0.15/39 | 4/1560 | 6/1560 | 1/1560 |  2/1560 | 

### Amazon DSP

|Marketplace	|Currency	|Min/Max baseBid - DISPLAY (when `maxAverageCPM` is null)	|Min/Max `maxAverageCPM` - DISPLAY	|Min/Max baseBid - VIDEO (when `maxAverageCPM` is null)	|Min/Max `maxAverageCPM` - VIDEO	|
|---	|---	|---	|---	|---	|---	|
|US	|USD	|0.01/39.99	|0.01/79.99	|0.01/116.99	|0.01/233.99	|

Notes:

* When `maxAverageCPM` is **not** null, then the max `baseBid` is the same as the max `maxAverageCPM`.
* The API min/max bids for other currencies can be calculated by converting the USD amounts below to other currencies. Due to variable FX rates, this number may change over time. Amazon DSP uses [OANDA](https://developer.oanda.com/rest-live-v20/introduction/) for currency conversion.
* The mix/max amounts in the UI for non-US countries differ from those in the API (typically, the API max is lower than the UI max).

## Budget constraints by marketplace

### Sponsored Products

|Marketplace	|Entity type	|Min daily	|Max daily	|
|---	|---	|---	|---	|
|US	|Seller, vendor	|1	|1000000	|
|CA	|Seller, vendor	|1	|1000000	|
|UK	|Seller, vendor	|1	|1000000	|
|DE	|Seller, vendor	|1	|1000000	|
|FR	|Seller, vendor	|1	|1000000	|
|IT	|Seller, vendor	|1	|1000000	|
|ES	|Seller, vendor	|1	|1000000	|
|IN	|Seller, vendor	|50	|21000000	|
|JP	|Seller, vendor	|100	|21000000	|
|CN	|Seller, vendor	|1	|21000000	|
|AU	|Seller, vendor	|1.4	|1500000	|
|MX	|Seller, vendor	|1	|21000000	|
|UAE	|Seller, vendor	|4	|3700000	|
|SA	|Seller, vendor	|4	|3700000	|
|BR	|Seller, vendor	|1.32	|5300000	|
|NL	|Seller, vendor	|1	|1000000	|
|SG	|Seller, vendor	|1.39	|1300000	|
|TR	|Seller, vendor	|2	|2500000	|
|PL	|Seller, vendor	|2	|2000000	|
|SE | Seller, vendor | 9 | 9300000 |
|EG | Seller, vendor | 7 | 7400000|
|BE	|Seller, vendor	|1	|1000000	|
|ZA | Seller, vendor | 20 | 7000000 | 
|IE	|Seller, vendor	|1	|1000000	|

### Sponsored Brands

|Marketplace	|Entity Type	|Min daily	|Max daily	|Min lifetime	|Max lifetime	|
|---	|---	|---	|---	|---	|---	|
|US	|Seller, vendor	|1	|1000000	|100	|20000000	|
|CA	|Seller, vendor	|1	|1000000	|100	|20000000	|
|UK	|Seller, vendor	|1	|1000000	|100	|20000000	|
|DE	|Seller, vendor	|1	|1000000	|100	|20000000	|
|FR	|Seller, vendor	|1	|1000000	|100	|20000000	|
|IT	|Seller, vendor	|1	|1000000	|100	|20000000	|
|ES	|Seller, vendor	|1	|1000000	|100	|20000000	|
|IN	|Seller	|100	|21000000	|5000	|200000000	|
|IN	|Vendor	|500	|21000000	|5000	|200000000	|
|JP	|Seller, vendor	|100	|21000000	|10000	|21000000	|
|CN	|Seller, vendor	|1	|21000000	|100	|200000000	|
|AU	|Seller, vendor	|1.4	|1500000	|141	|28000000	|
|MX	|Seller, vendor	|1	|21000000	|1000	|200000000	|
|UAE	|Seller, vendor	|4	|3700000	|367	|74000000	|
|SA	|Seller, vendor	|4	|3700000	|367	|74000000	|
|BR	|Seller, vendor	|4	|3700000	|367	|74000000	|
|NL	|Seller, vendor	|4	|3700000	|367	|74000000	|
|SG	|Seller, vendor	|4	|3700000	|367	|74000000	|
|TR	|Seller, vendor	|2	|2700000	|250	|53000000	|
|PL	|Seller, vendor	|2	|2400000	|200	|47000000	|
|SE | Seller, vendor | 9 | 9400000 | 900 | 187000000 |
|EG | Seller, vendor | 7 | 7600000 | 750 | 151000000| 
|BE	|Seller, vendor	|1	|1000000	|100	|20000000	|
|ZA | Seller, vendor | 6 | 7000000| 650 | 140000000 |
|IE | Seller, vendor  | 1 | 1000000 | 100 | 2000000 |

### Sponsored Display

|Marketplace	|Entity Type	|Min daily	|Max daily	|
|---	|---	|---	|---	|
|US	|Seller	|1	|1000000	|
|US	|Vendor	|1	|50000	|
|CA	|Seller	|1	|1000000	|
|CA	|Vendor	|1	|50000	|
|UK	|Seller	|1	|1000000	|
|UK	|Vendor	|1	|50000	|
|DE	|Seller	|1	|1000000	|
|DE	|Vendor	|1	|50000	|
|FR	|Seller	|1	|1000000	|
|FR	|Vendor	|1	|50000	|
|IT	|Seller	|1	|1000000	|
|IT	|Vendor	|1	|50000	|
|ES	|Seller	|1	|1000000	|
|ES	|Vendor	|1	|50000	|
|IN	|Seller	|50	|21000000	|
|IN	|Vendor	|50	|5000000	|
|JP	|Seller	|100	|21000000	|
|JP	|Vendor	|100	|5000000	|
|AU	|Seller, vendor	|1.4	|1500000	|
|MX	|Seller, vendor	|1	|21000000	|
|UAE	|Seller, vendor	|4	|3700000	|
|BR	|Seller, vendor	|1.32	|5300000	|
|NL	|Seller, vendor	|1	|1000000	|
|SG	|Seller, vendor	|4	|1300000	|
|SE |Seller, vendor |1| 1000000|
|EG |Seller, vendor | 7 | 7600000|
|PL |Seller, vendor | 1 | 1000000 |
|SA | Seller, vendor | 4 | 3700000 |
|TR | Seller, vendor | 2 | 2700000 |
|BE | Seller, vendor | 1 | 1000000 |
|ZA | Seller, vendor | 6 | 7000000| 

## Metric minimum threshold values

### Sponsored Display

When creating Sponsored Display rules, metric threshold is a required field. The threshold values has defined minimums depending on the metric names per marketplace in the following table.

| Marketplace    |Metric name     |  Minimum threshold |
|---    |---     |--- |
|US|COST PER CLICK|0.5|
|US|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|US|COST PER ORDER|5|
|CA|COST PER CLICK|0.1|
|CA|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|CA|COST PER ORDER|3|
|MX|COST PER CLICK|0.1|
|MX|COST PER THOUSAND VIEWABLE IMPRESSIONS|5|
|MX|COST PER ORDER|2|
|BR|COST PER CLICK|0.07|
|BR|COST PER THOUSAND VIEWABLE IMPRESSIONS|7|
|BR|COST PER ORDER|4|
|UK|COST PER CLICK|0.02|
|UK|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|UK|COST PER ORDER|2|
|DE|COST PER CLICK|0.02|
|DE|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|DE|COST PER ORDER|1|
|FR|COST PER CLICK|0.05|
|FR|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|FR|COST PER ORDER|3|
|IT|COST PER CLICK|0.O5|
|IT|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|IT|COST PER ORDER|3|
|ES|COST PER CLICK|0.05|
|ES|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|ES|COST PER ORDER|3|
|IN|COST PER CLICK|2|
|IN|COST PER THOUSAND VIEWABLE IMPRESSIONS|15|
|IN|COST PER ORDER|50|
|AE|COST PER CLICK|0.2|
|AE|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|AE|COST PER ORDER|10|
|NL|COST PER CLICK|0.3|
|NL|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|NL|COST PER ORDER|1|
|SE|COST PER CLICK|0.2|
|SE|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|SE|COST PER ORDER|2|
|PL|COST PER CLICK|0.2|
|PL|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|PL|COST PER ORDER|1.5|
|EG|COST PER CLICK|0.2|
|EG|COST PER THOUSAND VIEWABLE IMPRESSIONS|5|
|EG|COST PER ORDER|6|
|TR|COST PER CLICK|0.2|
|TR|COST PER THOUSAND VIEWABLE IMPRESSIONS|2|
|TR|COST PER ORDER|0.4|
|SA|COST PER CLICK|0.2|
|SA|COST PER THOUSAND VIEWABLE IMPRESSIONS|4|
|SA|COST PER ORDER|5|
|BE|COST PER CLICK|0.02|
|BE|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|BE|COST PER ORDER|0.3|
|JP|COST PER CLICK|8|
|JP|COST PER THOUSAND VIEWABLE IMPRESSIONS|100|
|JP|COST PER ORDER|100|
|AU|COST PER CLICK|0.15|
|AU|COST PER THOUSAND VIEWABLE IMPRESSIONS|1|
|AU|COST PER ORDER|5|
|SG|COST PER CLICK|0.2|
|SG|COST PER THOUSAND VIEWABLE IMPRESSIONS|4|
|SG|COST PER ORDER|1|

## Default budgets

### Sponsored Display

When creating Sponsored Display campaigns, budget is not a required field. If you don't input a budget, your campaign will take the default budget for your region.

|Country code	|Default budget in local currency	|
|---	|---	|
|AU	|100	|
|BR	|150	|
|CA	|100	|
|DE	|100	|
|EG	|500	|
|ES	|100	|
|FR	|100	|
|IN	|1000	|
|IT	|100	|
|JP	|10000	|
|SA	|400	|
|MX	|150	|
|NL	|100	|
|PL	|100	|
|SE	|100	|
|SG	|300	|
|TR	|300	|
|BE	|100	|
|UK	|100	|
|AE	|400	|
|US	|100	|
|ZA | 100|

## Keyword character constraints

- You can use a blank space in a keyword, but leading or tailing space are not allowed.
- When using the period (`.`) character, it can only be used in the middle of keywords or in the middle of blank spaces.
- When using the hyphen (`-`) or the plus (`+`) characters, they can only be used in the middle of keywords and cannot have blank spaces around them. This applies only to keywords, campaign names do not have this restriction.
- The double-quote (`"`) character must be used in pairs (for example, `leather "rocker" jacket`). Phrases with a single use of the character (for example, `40" screen`) are not supported.
- The maximum length of characters in a keyword is 80.
- The maximum number of parts for a positive keyword is 10.
- The maximum number of parts for a negative keyword is 4.
- For negativeExact match type, the negative keyword can have up to 10 parts.
- Basic Latin characters, `a-z` and `A-Z`, are supported as well as the following Unicode scopes: 
  - Select ranges from the Latin-1 Supplement, specifically: \u00AE, \u00C0-\u00C9, \u00CA-\u00CF, \u00D1-\u00D6, \u00D9-\u00DC, \u00DF, \u00E0-\u00E9, \u00EA-\u00EF, \u00F1-\u00F6, \u00F9-\u00FC, \u00FF
  - Select ranges from Latin Extended-A, specifically: \u0104-\u0107, \u0118-\u0119, \u0130-\u0131, \u0141-\u0144, \u015A-\u015F, \u0179-\u017E
  - Latin Extended Additional characters: \u0152-\u0153 and \u0178
  - Hiragana (3000-309F)
  - Katakana (30A0-30FF)
  - Kanji (4E00-9FFF)
  - Devanagari (0900-097F)
  - Tamil script (0B80-0BFF)
  - Arabic script (0600-06FF)

### Valid keyword symbols

|||||||||
|--- |--- |--- |--- |--- |--- |--- |--- |
| - | & | \ | + | [ | ]| \t | \n |
| \r | ' | " |   |   |   |   |  |

## Entity name character constraints

- You can use a blank space in an entity name, but leading or tailing space are not allowed.
- The maximum length of a campaign name is 128 characters for sellers and 116 characters for vendors.
- The maximum length of an ad group is 255 characters.
- Basic Latin characters, `a-z` and `A-Z`, are supported as well as the following Unicode scopes: 
  - Select ranges from the Latin-1 Supplement, specifically: \u00AE, \u00C0-\u00C9, \u00CA-\u00CF, \u00D1-\u00D6, \u00D9-\u00DC, \u00DF, \u00E0-\u00E9, \u00EA-\u00EF, \u00F1-\u00F6, \u00F9-\u00FC, \u00FF
  - Select ranges from Latin Extended-A, specifically: \u0104-\u0107, \u0118-\u0119, \u0130-\u0131, \u0141-\u0144, \u015A-\u015F, \u0179-\u017E
  - Latin Extended Additional characters: \u0152-\u0153 and \u0178
  - Hiragana (3000-309F)
  - Katakana (30A0-30FF)
  - Kanji (4E00-9FFF)
  - Devanagari (0900-097F)
  - Tamil script (0B80-0BFF)
  - Arabic script (0600-06FF)

Valid symbols for campaign names and ad group names are listed in the table below. In addition to these symbols, the pipe character (`|`) may be used.

### Valid entity name characters
|  |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
| - | $ | " | ' | & | ( | ) | * |
| + | , | . | / | : | ; | = | ? |
| @ | \ | \\\\  | [ | ] | _ | ` | ~ |
| { | } |   |   |   |   |   |   |
