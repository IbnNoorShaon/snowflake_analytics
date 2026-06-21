# TPC-H Analytics Dashboard

End-to-end data engineering portfolio project built on Snowflake, dbt, and Streamlit.

## Overview

This project transforms raw TPC-H benchmark data into an interactive analytics dashboard using a modern cloud data stack — no third-party connectors required.

## Tech Stack

| Layer | Tool |
|-------|------|
| Data Warehouse | Snowflake |
| Transformation | dbt Cloud |
| Source Data | Snowflake Sample Data (TPC-H SF1) |
| Dashboard | Streamlit in Snowflake |
| Version Control | GitHub |

## Architecture

```
Snowflake Sample Data (TPC-H)
        ↓
    Bronze Layer       → 8 raw tables (customers, orders, lineitem, nation, region, part, partsupp, supplier)
        ↓
    Silver Layer       → Joined & cleaned (silver_orders, silver_lineitem)
        ↓
    Gold Layer         → Aggregated (gold_revenue_by_nation, gold_order_summary)
        ↓
Streamlit Dashboard    → KPI metrics + 3 interactive charts
```

## Dashboard Features

- **KPI Cards** — Total Revenue ($218B), Total Orders (1.5M), Avg Discount (5%)
- **Revenue by Nation & Region** — color-coded bar chart by region (Africa, America, Asia, Europe, Middle East)
- **Orders Over Time** — line chart from 1992–1998
- **Revenue by Market Segment** — bar chart across 5 segments
- **Region filter** — sidebar dropdown to filter all charts by region

## Dashboard Preview

<img width="676" height="438" alt="Final" src="https://github.com/user-attachments/assets/0deafcd9-f0ed-497f-a608-0c6edbcf865b" />

### Link
https://app.snowflake.com/streamlit/csaviil/pj03709/#/apps/USER$SHAON.PUBLIC.ST926A60CD38EAD9A7439B411F77D1E00F51EA3A0C

## Project Structure

```
models/
├── bronze/        # Raw views on top of Snowflake Sample Data
├── silver/        # Joined and cleaned tables
└── gold/          # Aggregated business metrics
```

## Key Skills Demonstrated

- Medallion architecture (Bronze → Silver → Gold)
- dbt Cloud setup with Snowflake key-pair authentication
- Data modeling with joins across 8 source tables
- Streamlit in Snowflake dashboard with Altair charts
- Git-based version control for dbt models
