# Experian vehicle purchases

**Analytics table:** `experian_vehicle_purchases`

## Description

Through their partnership with the Department of Motor Vehicles (DMV), Experian enables automotive advertisers to measure the impact of Amazon DSP campaigns against vehicle purchases. For vehicle purchases, there is a two month delay (lag) and data is refreshed at the end of each month. This means the current and prior calendar month do not have a complete view of vehicle purchases. You may need to wait X days (where X = length of attribution window) after the campaign ends to receive complete results. For example, if using a 60 day attribution window, and the campaign end date plus 60 days falls into the current or prior month, you will not receive a complete view of attributed vehicle purchases.

## Schema

| Column | Type | Metric/Dimension | Description | Aggregation Threshold |
|--------|------|-------------------|-------------|-----------------------|
| new_or_used | STRING | DIMENSION | Indicates whether the vehicle was purchased new or used. Column will contain "N" for new, and "U" for used. | LOW |
| no_3p_trackers | BOOLEAN | DIMENSION | Is this item not allowed to use 3P tracking | NONE |
| purchase_date | DATE | DIMENSION | Purchase Date of vehicle | LOW |
| reported_dealership | STRING | DIMENSION | The name of the dealership which sold the vehicle, as reported by the DMV (Department of Motor Vehicles). | MEDIUM |
| user_id | STRING | DIMENSION | Resolved User ID (or null) | VERY_HIGH |
| user_id_type | STRING | DIMENSION | Type of user ID | LOW |
| vehicle_class | STRING | DIMENSION | The vehicle class, e.g, "Luxury" | LOW |
| vehicle_fuel_type | STRING | DIMENSION | The fuel type (i.e., gas, electric) of the purchased vehicle | LOW |
| vehicle_make | STRING | DIMENSION | The make (brand) of the vehicle purchased. | LOW |
| vehicle_model | STRING | DIMENSION | The model name of the vehicle purchased. | MEDIUM |
| vehicle_model_year | INTEGER | DIMENSION | Model Year of vehicle purchased | LOW |
| vehicle_registered_state | STRING | DIMENSION | The state where the purchased vehicle was registered. | LOW |
| vehicle_type | STRING | DIMENSION | The type/segment (i.e., SUV) of the purchased vehicle | LOW |
