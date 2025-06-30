
-- Insert into dim_store
INSERT INTO dim_store (store_id, region)
SELECT store_id, region
FROM (
  SELECT store_id, region,
         ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY COUNT(*) DESC) AS rn
  FROM inventory_forecasting_staging
  GROUP BY store_id, region
) ranked
WHERE rn = 1;

-- Insert into dim_product
INSERT INTO dim_product (product_id, category)
SELECT DISTINCT product_id, category
FROM inventory_forecasting_staging;

-- Insert into dim_weather
INSERT INTO dim_weather (weather_condition)
SELECT DISTINCT weather_condition
FROM inventory_forecasting_staging;

-- Fix raw date and populate date column
UPDATE inventory_forecasting_staging
SET date = STR_TO_DATE(raw_date, '%d-%m-%Y')
WHERE raw_date IS NOT NULL AND raw_date != '0000-00-00';

-- Insert into dim_date
INSERT IGNORE INTO dim_date (date_key, seasonality, holiday_promotion)
SELECT DISTINCT date, seasonality, holiday_promotion
FROM inventory_forecasting_staging
WHERE date IS NOT NULL AND date != '0000-00-00';

-- Insert into fact_inventory
INSERT INTO fact_inventory (
  date_key,
  store_id,
  product_id,
  weather_id,
  inventory_level,
  units_sold,
  units_ordered,
  demand_forecast,
  price,
  discount,
  holiday_or_promo,
  competitor_price,
  seasonality
)
SELECT 
  s.date,
  s.store_id,
  s.product_id,
  w.weather_id,
  s.inventory_level,
  s.units_sold,
  s.units_ordered,
  s.demand_forecast,
  s.price,
  s.discount,
  s.holiday_promotion,
  s.competitor_pricing,
  s.seasonality
FROM inventory_forecasting_staging s
JOIN dim_weather w ON s.weather_condition = w.weather_condition
JOIN dim_date d ON s.date = d.date_key
JOIN dim_store st ON s.store_id = st.store_id
JOIN dim_product p ON s.product_id = p.product_id;
