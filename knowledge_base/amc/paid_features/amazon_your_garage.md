# Amazon Your Garage tables

**Analytics table:** `amazon_your_garage_all`

**Audience table:** `amazon_your_garage_all_for_audiences`

## Description

Amazon Your Garage is a virtual vehicle repository which allows customers to add their vehicle’s make and model and quickly locate parts and accessories that fit their saved vehicles. The AMC Amazon Your Garage (AYG) dataset allows you to tap into those user-to-vehicle association signals. When you enroll in Amazon Your Garage, you will have access to the amazon_your_garage_all dataset containing signals such as vehicle type, make, or engine type, which are updated daily with the most recent user-to-vehicle associations.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| creation_date | DATE | DIMENSION | Creation date of the record | LOW |
| garage_bodystyle | STRING | DIMENSION | Vehicle body style attribute | LOW |
| garage_brakes | STRING | DIMENSION | Vehicle brakes attribute | LOW |
| garage_drivetype | STRING | DIMENSION | Vehicle drive type attribute | LOW |
| garage_engine | STRING | DIMENSION | Vehicle engine attribute | LOW |
| garage_engine_output_hp | FLOAT | DIMENSION | Engine output in horsepower | LOW |
| garage_engine_output_kw | FLOAT | DIMENSION | Engine output in kilowatts | LOW |
| garage_make | STRING | DIMENSION | Vehicle make attribute | LOW |
| garage_model | STRING | DIMENSION | Vehicle model attribute | LOW |
| garage_springtypes | STRING | DIMENSION | Spring type attribute | LOW |
| garage_submodel | LONG | DIMENSION | Vehicle submodel identifier | LOW |
| garage_transmission | STRING | DIMENSION | Vehicle transmission attribute | LOW |
| garage_variant | STRING | DIMENSION | Vehicle variant name attribute | LOW |
| garage_year | DATE | DIMENSION | Vehicle year attribute | LOW |
| garage_year_range | DATE | DIMENSION | Vehicle model year range | LOW |
| last_accessed_date | DATE | DIMENSION | Last accessed date for a customer invoked interaction with Amazon Garage  record | LOW |
| marketplace_name | STRING | DIMENSION | This is the marketplace associated with the Amazon Garage record (Note:  not the AMC Paid Feature marketplace). | LOW |
| no_3p_trackers | BOOLEAN | DIMENSION | Is this item not allowed to use 3P tracking | NONE |
| region | STRING | DIMENSION | Region associated with the Amazon marketplace. | LOW |
| status | STRING | DIMENSION | Status of record | LOW |
| update_date | DATE | DIMENSION | Update date for the most recent garage record edit | LOW |
| user_id | STRING | DIMENSION | User ID of the customer | VERY_HIGH |
| vehicle_type | STRING | DIMENSION | Vehicle vehicle type attribute | LOW |
