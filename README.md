# Sql_project
# 🛒 Urban Retail Co. – Inventory Management SQL Solution

**Author:** 
[Avni Katarey]
[BhumikaAggwl](https://github.com/BhumikaAggwl)

**Last Updated:** June 2025

This project provides a comprehensive SQL-driven inventory monitoring and optimization system for Urban Retail Co., a fast-growing retail chain. The system transforms raw transactional data into actionable insights through advanced SQL queries, performance dashboards, and reporting.

---

## 📁 Repository Structure

| File / Folder        | Description |
|----------------------|-------------|
| `create_tables.sql`  | Normalized schema design for `stores`, `products`, `suppliers`, and `inventory_transactions` tables |
| `insert_data.sql`    | Sample data insertion script to populate the schema with mock store, product, and transaction data |
| `erd.pdf` / `proj_ERD.html` | Entity Relationship Diagram showing the schema design |
| `urban_inventory_solution.sql` | 📌 Core SQL solution with analytics queries, KPIs, classification models, and forecasting |
| `inventory_forecasting.db` | SQLite database containing raw transaction data from the business |
| `README.md`          | You're here! 📘

---

## 📊 Features & Capabilities

✅ **Inventory Analytics & Forecasting**
- Reorder point estimation
- Stockout detection & risk classification
- Inventory turnover and age analysis
- Seasonal trend forecasting

✅ **Operational Dashboards**
- KPI summary per region, store, and category
- Product movement classification (ABC analysis)
- Supplier performance and reliability scoring

✅ **Performance Optimization**
- Actionable inventory adjustment recommendations
- Data-driven reorder logic based on 90-day rolling trends

---

## 📌 Use Cases

This solution is ideal for:
- Data analysts in retail and supply chain domains
- Inventory planners seeking automated alerts
- BI teams looking to integrate SQL backends with dashboards (Tableau / Power BI)

---

## 🚀 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/BhumikaAggwl/urban-retail-sql-inventory.git
   cd urban-retail-sql-inventory
2. Load the schema:
```bash
 sqlite3 inventory_forecasting.db < create_tables.sql
```
3.Insert sample data:
```bash
sqlite3 inventory_forecasting.db < insert_data.sql
```
4.Run the analytics queries from:
```bash
urban_inventory_solution.sql
```
Or open the .db file with DB Browser for SQLite and execute SQL interactively.

** 📈 Sample Output (KPI Snapshot)

| Store | Stockout Rate | Inventory Turnover | Status            |
| ----- | ------------- | ------------------ | ----------------- |
| ST001 | 6.2%          | 5.4×               | ✅ Good            |
| ST002 | 11.4%         | 3.1×               | ⚠ Needs Attention |
| ST003 | 18.9%         | 2.4×               | 🔴 Critical       |


##📄 License
This project is for educational and demonstration purposes. For commercial usage, please seek prior permission.
