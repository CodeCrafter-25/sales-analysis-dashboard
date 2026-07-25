# Sales Analysis Dashboard

## Project Overview

This portfolio project analyzes the sales and profitability performance of a fictional US superstore. The goal is to identify trends across time, product categories, customer segments, and regions and present the results in an interactive Tableau dashboard.

## Current Status

**Status:** In progress

- Working dataset identified and validated
- Previous Tableau dashboard available as a baseline
- BigQuery project recovered
- SQL cleaning workflow being rebuilt
- GitHub repository structure being created
- Final dashboard, insights, and documentation are still in progress

## Tools

- **BigQuery** — data loading, cleaning, validation, and feature preparation
- **SQL** — transformations and data-quality checks
- **Tableau Public** — interactive dashboard and visual analysis
- **GitHub** — project documentation and version control

## Dataset

The current processed dataset contains **9,800 rows and 22 columns** and covers orders from **2015-01-03 to 2018-12-30**.

Main groups of fields:

- Orders and shipping
- Customers and segments
- Geography
- Products and categories
- Sales, cost, profit, margin, and ROI

### Source

The file structure and record count strongly match the Kaggle **Superstore Sales Dataset** by Rohit Sahoo:

https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting

The exact original download source should be confirmed before the project is marked as final.

### Profitability Model

The original sales dataset did not contain the current profitability fields. In the processed version, margin rates are assigned by category:

- Office Supplies: 20%
- Furniture: 30%
- Technology: 40%

The derived metrics follow these relationships:

- `Cost = Sales × (1 - Margin)`
- `Profit = Sales - Cost`
- `ROI = Profit / Cost`

Because this is a modeled profitability scenario, the dashboard findings should be described as scenario-based rather than actual company accounting results.

## Data Quality Notes

- Sales, Cost, Profit, Margin, and ROI have no missing values.
- Postal Code contains 11 missing values.
- Order Date and Ship Date use `DD/MM/YYYY` in the CSV.
- There are repeated combinations of Order ID, Customer ID, and Product ID. Most have different sales values, so they should not be removed automatically.
- All current Profit values are positive because profit is generated from positive category-level margin assumptions.

## BigQuery

**Project ID:** `sales-dashboard-project-460219`

Recommended tables:

- `sales_profit.sales_data_profit` — uploaded source/processed CSV
- `sales_profit.sales_data_profit_clean` — cleaned table created by SQL

The BigQuery query processing location must match the dataset location. The current project is configured in `europe-west4`.

## Tableau Dashboard

### Current Working Version

[Open the Sales Analysis Dashboard in Tableau Public](https://public.tableau.com/views/SalesAnalysisDashboardv2_0/SalesAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

The dashboard is currently being reviewed and improved for the final portfolio version.

### Previous Version

[View the previous dashboard version](https://public.tableau.com/views/SalesAnalysisDashboard_17452793623070/SalesAnalysisDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Planned Dashboard Sections

- KPI cards: Sales, Cost, Profit, Margin, ROI, Orders, Customers
- Sales and profit trends over time
- Performance by category and sub-category
- Regional and state analysis
- Customer segment analysis
- Top products and customers
- Shipping performance
- Interactive filters

## Repository Structure

```text
sales-analysis-dashboard/
├── README.md
├── data/
│   └── README.md
├── sql/
│   └── 01_clean_sales_data.sql
├── images/
│   └── dashboard-preview.png
└── docs/
    └── project-status.md
```

## Next Steps

1. Confirm or recreate the BigQuery dataset and source table.
2. Run the cleaning SQL in `europe-west4`.
3. Validate the cleaned table totals and row count.
4. Review the old Tableau workbook and decide which charts to keep.
5. Rebuild the final dashboard with a consistent layout and color system.
6. Add business insights and recommendations.
7. Replace this progress README with the final case-study version.
