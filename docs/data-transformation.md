# Data Transformation Methodology

## Overview

The project uses two versions of the dataset:

- `data/raw/train.csv` — the original Superstore Sales Dataset
- `data/processed/sales_data_with_profit.csv` — the working dataset extended with modeled profitability fields

The profitability fields were added for portfolio analysis because the original dataset did not contain cost or profit information.

## Profitability Model

A fixed margin rate was assigned to each product category:

- Office Supplies: 20%
- Furniture: 30%
- Technology: 40%

The following fields were calculated:

- `Margin` — category-level margin rate
- `Cost = Sales × (1 - Margin)`
- `Profit = Sales - Cost`
- `ROI = Profit / Cost`

These values represent a modeled business scenario and should not be treated as actual company accounting results.

## BigQuery Cleaning Process

The processed CSV was uploaded to BigQuery as:

`sales_profit.sales_data_profit`

The SQL script `sql/01_clean_sales_data.sql` creates the cleaned table:

`sales_profit.sales_data_profit_clean`

The cleaning process includes:

- converting Row ID to an integer;
- parsing Order Date and Ship Date;
- trimming text fields;
- converting blank strings to NULL;
- preserving Postal Code as text;
- converting Sales, Cost, Profit, Margin, and ROI to numeric data types;
- removing rows without essential order fields;
- creating percentage versions of Margin and ROI;
- creating month, year, weekday, and shipping-duration fields.

## Important Distinction

The current BigQuery SQL script cleans and standardizes the processed dataset.

It does not generate the original category-level Margin, Cost, Profit, and ROI fields from `train.csv`. Those modeled fields were already present in `sales_data_with_profit.csv` before the BigQuery cleaning stage.

## Validation

The cleaned BigQuery table was validated with the following results:

- Rows: 9,800
- Missing Postal Code values: 11
- Invalid profit calculations: 0
- Sales, cost, and profit totals matched the processed CSV
