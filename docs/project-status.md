# Project Status — Sales Analysis Dashboard

Last updated: 2026-08-19

## Main Links

* Main Tableau dashboard:
  https://public.tableau.com/views/SalesAnalysisDashboardv2_0/SalesAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

* Previous Tableau dashboard:
  https://public.tableau.com/views/SalesAnalysisDashboard_17452793623070/SalesAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

* BigQuery project ID:
  `sales-dashboard-project-460219`

* Kaggle source:
  https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting

* GitHub repository:
  https://github.com/CodeCrafter-25/sales-analysis-dashboard

## Key Files

* Original dataset: `train.csv`
* Working processed dataset: `sales_data_with_profit.csv`
* Current cleaning SQL: `01_clean_sales_data.sql`
* Previous SQL version: recovered, but incomplete
* Main Tableau dashboard: Sales Analysis Dashboard v2.0
* Main Tableau workbook: Sales Analysis Dashboard v2.0
* Current dashboard image: `images/dashboard-preview.png`

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

* Located and validated the working processed dataset
* Confirmed the original Kaggle dataset and source
* Added raw and processed datasets to GitHub
* Located and restored the BigQuery project
* Restored the `sales_profit` dataset
* Loaded `sales_data_profit` with 9,800 rows
* Successfully executed `01_clean_sales_data.sql`
* Created and validated `sales_data_profit_clean`
* Confirmed BigQuery data location as US
* Validated row count and financial totals against the processed dataset
* Identified Sales Analysis Dashboard v2.0 as the main Tableau version
* Kept the previous Tableau dashboard as an archive
* Added four KPI cards: Total Sales, Total Cost, Total Profit, and Overall ROI
* Formatted KPI values
* Added the current dashboard preview to GitHub
* Defined the main business questions for the analysis
* Validated all Tableau KPI values against the processed dataset
* Confirmed that all dashboard filters correctly update KPI cards and visualizations
* Completed the main business insights analysis
* Added business recommendations based on dashboard findings

### Stage 2 — Dashboard refinement and business analysis

#### Completed

* Reviewed dashboard structure against the defined business questions
* Improved chart titles, labels, and visual consistency
* Added and validated dashboard filters
* Completed the final Tableau visual review
* Updated the final dashboard preview
* Completed business insights and recommendations
* Finalized the portfolio README

