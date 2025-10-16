Kaggle Challenge 1 — Denormalized Spreadsheets (Synthetic Data)
Year: 2024
Files:
- Products_2024.csv — product catalog (intentionally includes vendor + dept + size to encourage normalization)
- Promotions_2024.csv — weekly promotions per-product (with duplicated product info)
- Inventory_Snapshots_2024.csv — monthly on-hand snapshots per store/product (duplicated store + product attributes)
- Sales_2024_Q1.csv ... Sales_2024_Q4.csv — line-item sales (denormalized); each quarter uses a different datetime format

Notes:
- Sales data repeats store, vendor, and product attributes on every line.
- Datetime formats by quarter:
  Q1: MM/DD/YYYY HH:MM
  Q2: YYYY-MM-DD HH:MM
  Q3: DD-Mon-YYYY HH:MM
  Q4: MM/DD/YY hh:MM AM/PM
- Pricing:
  * regular_price and unit_cost are product-level baselines
  * unit_price_effective reflects promotions (PCT_OFF, LOYALTY_PCT, BOGO50)
  * line_subtotal = unit_price_effective * quantity
  * tax_amount applies only to Wellness at 10.1% (others 0%)

Suggested Tasks:
1) Reverse engineer an ERD from these spreadsheets and design a normalized schema
   (e.g., Stores, Products, Vendors, Departments, Promotions, Receipts, LineItems, InventorySnapshots).
2) Ingest and normalize data into your RDB.
3) Write queries to answer simple analytics (e.g., weekly sales by department, promo lift, member vs non-member mix).
4) (Optional) Build a small model (e.g., baseline demand forecast or promo uplift).

Row counts:
- Products: 60
- Promotions: 530
- Inventory Snapshots: 2,160
- Sales Q1..Q4: 13,545, 13,479, 13,097, 13,165 (total 53,286)
