# Project Status — Sales Analysis Dashboard

Last updated: 2026-08-06

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

* Located the working processed dataset
* Confirmed the original Kaggle dataset and source
* Located the main and previous Tableau dashboards
* Identified Sales Analysis Dashboard v2.0 as the main working version
* Classified SalesAnalysisDashboard_17452793623070 as the previous version
* Located the BigQuery project
* Recovered an older SQL query
* Audited the current processed CSV
* Created the GitHub repository
* Added the initial repository structure
* Added the project README
* Saved the current cleaning SQL to GitHub
* Added both Tableau dashboard links to the README
* Requested external feedback on the Tableau portfolio
* Added the original dataset to `data/raw/train.csv`
* Added the processed dataset to `data/processed/sales_data_with_profit.csv`
* Documented the difference between the raw and processed datasets
* Added four KPI cards: Total Sales, Total Cost, Total Profit, and Overall ROI
* Formatted KPI values using currency, percentage, rounding, and million units
* Added the current dashboard preview to the main README
* Removed the temporary `images/1.md` file
* Restored the `sales_profit` BigQuery dataset in the US region
* Restored the `sales_data_profit` source table with 9,800 rows
* Executed the current `01_clean_sales_data.sql`
* Created and validated `sales_data_profit_clean`
* Confirmed that row counts and financial totals match the processed dataset
* Added the dashboard business questions
* Documented the transformation from `train.csv` to `sales_data_with_profit.csv`

  #### In Progress

* Reviewing the final Tableau dashboard
* Preparing key business insights and recommendations
* Updating the final project documentation

#### Next

* Define the final dashboard specification
* Review external feedback before redesigning the dashboard

#### Important Decisions

* Use Sales Analysis Dashboard v2.0 as the main working Tableau version.
* Keep the previous Tableau dashboard as an archive for comparison.
* Treat `sales_data_with_profit.csv` as the current working processed
  dataset, not as permanently final until its methodology is fully
  documented.
* Do not automatically remove repeated order and product combinations.
* Keep Postal Code as text.
* Keep Margin and ROI both as decimal rates and percentage display fields.
* Document the profit figures as a modeled scenario based on category
  margins.
