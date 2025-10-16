
# Data Dictionary — Challenge 3 Dataset

This dataset spans **2018–2022 (5 years)** of daily sales across 3 stores and 4 product categories.  
It is clean (no injected errors), designed for trend discovery, ARIMA/SARIMA forecasting,  
and unsupervised holiday/seasonality detection.

---

## stores.csv
| Column   | Type   | Description                | Example   |
|----------|--------|----------------------------|-----------|
| store_id | int    | Unique store identifier    | 1         |
| city     | string | City location of the store | Seattle   |
| size     | string | Store size category        | Large     |
| region   | string | Regional grouping          | NW        |

---

## categories.csv
| Column        | Type   | Description                                       | Example   |
|---------------|--------|---------------------------------------------------|-----------|
| category_id   | int    | Unique product category identifier                | 2         |
| name          | string | Category name                                     | Bakery    |
| seasonal_flag | int    | 1 = seasonal/holiday-driven, 0 = non-seasonal     | 1         |
| perishability | string | Perishability level                               | High      |

---

## dates.csv
| Column  | Type   | Description                        | Example   |
|---------|--------|------------------------------------|-----------|
| date    | date   | Calendar date                      | 2019-07-04 |
| dow     | int    | Day of week (0=Mon, 6=Sun)         | 3         |
| dom     | int    | Day of month                       | 4         |
| woy     | int    | ISO week of year                   | 27        |
| month   | int    | Month number (1–12)                | 7         |
| quarter | int    | Calendar quarter (1–4)             | 3         |
| year    | int    | Calendar year                      | 2019      |

---

## sales.csv
| Column        | Type   | Description                                       | Example   |
|---------------|--------|---------------------------------------------------|-----------|
| date          | date   | Transaction date                                  | 2019-11-28 |
| store_id      | int    | Foreign key → stores.store_id                     | 1         |
| category_id   | int    | Foreign key → categories.category_id              | 3         |
| sales_qty     | int    | Quantity of items sold                            | 450       |
| sales_revenue | float  | Total revenue for that store × category × date    | 3725.50   |

---

### Embedded Seasonal/Holiday Signals
- **Weekly seasonality**: weekends ~15–20% higher  
- **Annual cycle**: sinusoidal (summer peak, winter holiday peak)  
- **Holiday uplift (not pre-labeled):**
  - Easter (Bakery, Beverages)
  - July 4 (Meat, Beverages)
  - Thanksgiving (Meat, Bakery)
  - Christmas/New Year (Bakery, Beverages)
- **Trend**: ~2% growth per year  
- **Weather effect**: simplified (hot-day BBQ/beverages, cold-day soups)  
