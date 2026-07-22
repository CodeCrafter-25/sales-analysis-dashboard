# Project Status — Sales Analysis Dashboard

Last updated: 2026-07-22

## Main Links:
* Tableau baseline: https://public.tableau.com/views/SalesAnalysisDashboard_17452793623070/SalesAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
* BigQuery project ID: sales-dashboard-project-460219
* Probable Kaggle source: https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting
* GitHub repository: not created yet.

## Key Files

* Working dataset: sales_data_with_profit.csv
* Current cleaning SQL: 01_clean_sales_data.sql
* Previous SQL version: recovered, but incomplete
* Final Tableau workbook: not ready
* Final dashboard image: not ready

## Dataset Audit
* Rows: 9,800
* Columns: 22
* Order dates: 2015-01-03 to 2018-12-30
* Blank Postal Code values: 11
* Blank Sales / Cost / Profit / Margin / ROI values: 0
* Total Sales: 2,261,536.78
* Total Cost: 1,570,873.82
* Total Profit: 690,664.34
* Duplicate Row ID values: 0
* Repeated Order ID + Customer ID + Product ID combinations: 8 groups

## Current Stage

### Stage 1 — Project recovery and repository setup

#### Completed
* Located the working dataset
* Located the old Tableau dashboard
* Located the BigQuery project
* Recovered an older SQL query
* Audited the current CSV

#### In Progress
* Restoring the BigQuery table
* Correcting the query location
* Rebuilding the cleaning SQL
* Creating the GitHub repository

#### Next
* Validate BigQuery output
* Save SQL to GitHub
* Add initial README and repository structure
* Review the old Tableau dashboard
* Define the final dashboard specification

#### Important Decisions
* Treat sales_data_with_profit.csv as the current working processed dataset, not as permanently final until source and methodology are documented.
* Do not automatically remove repeated order/product combinations.
* Keep Postal Code as text.
* Keep Margin and ROI both as decimal rates and add percentage display fields.
* Document the profit figures as a modeled scenario based on category margins.
