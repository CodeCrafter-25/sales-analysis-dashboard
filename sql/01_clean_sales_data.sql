-- Sales Analysis Dashboard
-- BigQuery project: sales-dashboard-project-460219
-- IMPORTANT: In BigQuery Query settings, set Data location to europe-west4
-- before running this script.

CREATE OR REPLACE TABLE
  `sales-dashboard-project-460219.sales_profit.sales_data_profit_clean` AS

WITH typed_data AS (
  SELECT
    SAFE_CAST(`Row ID` AS INT64) AS row_id,
    NULLIF(TRIM(CAST(`Order ID` AS STRING)), '') AS order_id,

    COALESCE(
      SAFE_CAST(`Order Date` AS DATE),
      SAFE.PARSE_DATE('%d/%m/%Y', TRIM(CAST(`Order Date` AS STRING))),
      SAFE.PARSE_DATE('%m/%d/%Y', TRIM(CAST(`Order Date` AS STRING)))
    ) AS order_date,

    COALESCE(
      SAFE_CAST(`Ship Date` AS DATE),
      SAFE.PARSE_DATE('%d/%m/%Y', TRIM(CAST(`Ship Date` AS STRING))),
      SAFE.PARSE_DATE('%m/%d/%Y', TRIM(CAST(`Ship Date` AS STRING)))
    ) AS ship_date,

    NULLIF(TRIM(CAST(`Ship Mode` AS STRING)), '') AS ship_mode,
    NULLIF(TRIM(CAST(`Customer ID` AS STRING)), '') AS customer_id,
    NULLIF(TRIM(CAST(`Customer Name` AS STRING)), '') AS customer_name,
    NULLIF(TRIM(CAST(`Segment` AS STRING)), '') AS segment,
    NULLIF(TRIM(CAST(`Country` AS STRING)), '') AS country,
    NULLIF(TRIM(CAST(`City` AS STRING)), '') AS city,
    NULLIF(TRIM(CAST(`State` AS STRING)), '') AS state,
    NULLIF(
      REGEXP_REPLACE(TRIM(CAST(`Postal Code` AS STRING)), r'\.0$', ''),
      ''
    ) AS postal_code,
    NULLIF(TRIM(CAST(`Region` AS STRING)), '') AS region,
    NULLIF(TRIM(CAST(`Product ID` AS STRING)), '') AS product_id,
    NULLIF(TRIM(CAST(`Category` AS STRING)), '') AS category,
    NULLIF(TRIM(CAST(`Sub-Category` AS STRING)), '') AS sub_category,
    NULLIF(TRIM(CAST(`Product Name` AS STRING)), '') AS product_name,

    ROUND(SAFE_CAST(`Sales` AS NUMERIC), 2) AS sales,
    ROUND(SAFE_CAST(`Margin` AS FLOAT64), 4) AS margin_rate,
    ROUND(SAFE_CAST(`Cost` AS NUMERIC), 2) AS cost,
    ROUND(SAFE_CAST(`Profit` AS NUMERIC), 2) AS profit,
    ROUND(SAFE_CAST(`ROI` AS FLOAT64), 4) AS roi_rate

  FROM
    `sales-dashboard-project-460219.sales_profit.sales_data_profit`
),

cleaned_data AS (
  SELECT
    *,
    ROUND(margin_rate * 100, 2) AS margin_pct,
    ROUND(roi_rate * 100, 2) AS roi_pct,
    DATE_TRUNC(order_date, MONTH) AS order_month,
    FORMAT_DATE('%Y-%m', order_date) AS year_month,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS month_num,
    FORMAT_DATE('%B', order_date) AS month_name,
    FORMAT_DATE('%A', order_date) AS weekday,
    DATE_DIFF(ship_date, order_date, DAY) AS shipping_days
  FROM typed_data
  WHERE
    sales IS NOT NULL
    AND order_date IS NOT NULL
    AND order_id IS NOT NULL
    AND city IS NOT NULL
    AND category IS NOT NULL
)

SELECT *
FROM cleaned_data;

-- Validation summary. Expected for the current uploaded CSV:
-- row_count = 9800
-- missing_postal_codes = 11
-- invalid_profit_rows = 0
SELECT
  COUNT(*) AS row_count,
  COUNTIF(postal_code IS NULL) AS missing_postal_codes,
  COUNTIF(ABS(sales - cost - profit) > 0.02) AS invalid_profit_rows,
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS last_order_date,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(cost), 2) AS total_cost,
  ROUND(SUM(profit), 2) AS total_profit
FROM
  `sales-dashboard-project-460219.sales_profit.sales_data_profit_clean`;
