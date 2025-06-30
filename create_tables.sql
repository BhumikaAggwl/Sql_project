
-- Create staging table
CREATE TABLE IF NOT EXISTS inventory_forecasting_staging (
  raw_date            VARCHAR(20),
  store_id            VARCHAR(10),
  product_id          VARCHAR(10),
  category            VARCHAR(50),
  region              VARCHAR(20),
  inventory_level     INT,
  units_sold          INT,
  units_ordered       INT,
  demand_forecast     DECIMAL(8,2),
  price               DECIMAL(8,2),
  discount            DECIMAL(8,2),
  weather_condition   VARCHAR(20),
  holiday_promotion   BOOLEAN,
  competitor_pricing  DECIMAL(8,2),
  seasonality         VARCHAR(20),
  date                DATE
);

-- Dimension tables
CREATE TABLE IF NOT EXISTS dim_store (
  store_id VARCHAR(10) PRIMARY KEY,
  region   VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dim_product (
  product_id VARCHAR(10) PRIMARY KEY,
  category   VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dim_weather (
  weather_id INT AUTO_INCREMENT PRIMARY KEY,
  weather_condition  VARCHAR(20) UNIQUE
);

CREATE TABLE IF NOT EXISTS dim_date (
  date_key          DATE PRIMARY KEY,
  seasonality       VARCHAR(20),
  holiday_promotion BOOLEAN
);

-- Fact table
CREATE TABLE IF NOT EXISTS fact_inventory (
  fact_id INT AUTO_INCREMENT PRIMARY KEY,
  date_key DATE,
  store_id VARCHAR(10),
  product_id VARCHAR(10),
  weather_id INT,
  inventory_level INT,
  units_sold INT,
  units_ordered INT,
  demand_forecast DECIMAL(10,2),
  price DECIMAL(10,2),
  discount DECIMAL(5,2),
  holiday_or_promo BOOLEAN,
  competitor_price DECIMAL(10,2),
  seasonality VARCHAR(20),
  FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (weather_id) REFERENCES dim_weather(weather_id)
);
