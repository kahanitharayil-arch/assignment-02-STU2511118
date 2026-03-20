## ETL Decisions

### Decision 1 — Standardizing Category Names

Problem:
The raw dataset contained inconsistent category values such as "electronics", "Electronics", "Groceries", and "Grocery". These inconsistencies would lead to incorrect aggregations in analytical queries.

Resolution:
All category values were standardized to consistent capitalized values:
- Electronics
- Clothing
- Groceries

This ensures accurate grouping and reporting in BI queries.

---

### Decision 2 — Standardizing Date Format

Problem:
The raw dataset contained inconsistent date formats which could cause issues when performing time-based analytics such as monthly sales trends.

Resolution:
All dates were converted into a standardized ISO format (YYYY-MM-DD) and loaded into a dedicated `dim_date` table. Additional attributes such as month, quarter, and year were derived to support analytical queries.

---

### Decision 3 — Pre-computing Total Sales Measure

Problem:
The raw dataset only contained `units_sold` and `unit_price`. Analytical queries frequently require total revenue calculations, which would require repeated computation.

Resolution:
A new measure `total_sales` was created in the `fact_sales` table as:

total_sales = units_sold × unit_price

This improves query performance and simplifies analytical SQL queries.