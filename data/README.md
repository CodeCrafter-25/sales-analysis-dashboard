# Data

This folder contains the datasets used in the Sales Analysis Dashboard project.

## Raw Data

`raw/train.csv` is the original Superstore Sales Dataset downloaded from Kaggle.

The dataset contains sales orders, customer information, product details, shipping data, and geographical fields.

## Processed Data

`processed/sales_data_with_profit.csv` is an extended version of the original dataset prepared for analysis.

The following calculated fields were added:

* Cost
* Profit
* Margin
* ROI

These profitability metrics were created for analytical and portfolio purposes. They represent a modeled scenario and do not reflect actual company accounting data.

The data was cleaned and prepared using SQL in BigQuery.
