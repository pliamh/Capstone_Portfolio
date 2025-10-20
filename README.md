# Patrick Horgan — Applied Data Science Capstone Portfolio


## Scalable Retail Analytics: From Spreadsheets to a Production-Ready ML Pipeline

End-to-end project building a normalized relational database, professional data-quality pipeline, and forecasting models for a growing grocery chain (3 → 10 stores).  
Work includes schema design (Postgres), reliable ETL, feature engineering (calendar, holiday, weather), and short-term demand forecasting with backtesting and clear business recommendations.

**What’s inside**
- Database: ERD → 3NF schema (Postgres) + idempotent ETL  
- Data Quality: systematic audits, imputations, leakage checks  
- Forecasting: SARIMA/Prophet and tree-based baselines with regressors (calendar, holiday, weather, weekend)  
- Reports: executive summaries, visuals, and model evaluation 


---



## 🧠 Overview



**Course:** DTSC 691 — Applied Data Science Capstone

**Project Theme:** Grocery Store Analytics

**Goal:** Transform raw, messy grocery store data into actionable insights through:

**Portfolio deliverables**

- [Data Modeling — From Spreadsheets to Schema](deliverables/01_data_modeling_spreadsheets_to_schema.ipynb.pdf)
- [Data Quality — Validation & Imputation](deliverables/02_data_quality_validation_and_imputation.ipynb.pdf)
- [Trends & Forecasting — Seasonality, Holidays & Weather](deliverables/03_trends_seasonality_and_forecasting.ipynb.pdf)




---



## 📁 Folder Guide

| Folder | Description |
|:--|:--|
| **01_data_modeling_spreadsheets_to_schema** | Schema design and data-modeling foundation |
| **02_data_quality_validation_and_imputation** | Data cleaning, validation, and imputation processes |
| **03_trends_seasonality_and_forecasting** | Trend, seasonality, and forecasting analyses |
| **deliverables/** | Final PDF reports for each phase (viewable directly on GitHub) |
| **reports/** | Auto-generated outputs from forecasting models |




---



## 🧰 Tools & Languages

**Python** — pandas, numpy, matplotlib, scikit-learn, statsmodels, holidays, meteostat  
**SQL** — schema design, normalization, and query optimization  
**Jupyter Notebooks** — exploratory data analysis and reporting  
**Excel** — data validation and presentation of business metrics


---



## ▶️ How to Run (optional)

You don’t need to run anything to view results—see `/deliverables` for the PDFs.  
If you want to reproduce plots and artifacts locally:

1. Clone and enter the repo
   ```bash
   git clone https://github.com/pliamh/Capstone_Portfolio.git
   cd Capstone_Portfolio

2. Create a virtual environment and install deps

Windows (PowerShell):
```
python -m venv .venv
.\.venv\Scripts\Activate
python -m pip install -U pip
pip install -r requirements.txt
```
macOS / Linux:
```
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -U pip
pip install -r requirements.txt
```
3. Open the notebooks (or run scripts) in the phase folders:

- [01_data_modeling_spreadsheets_to_schema/](01_data_modeling_spreadsheets_to_schema)
- [02_data_quality_validation_and_imputation/](02_data_quality_validation_and_imputation)
- [03_trends_seasonality_and_forecasting/](03_trends_seasonality_and_forecasting)


---



## 📊 About This Portfolio



This portfolio highlights my ability to:

\- Build end-to-end data pipelines  

\- Apply statistical and machine-learning methods  

\- Communicate technical results clearly to non-technical audiences


## 🎥 Presentation Slides
[View my Slideshow Presentation Here!](https://docs.google.com/presentation/d/1qvE5fw_8k-x9Axo0eDVxJbywCQL9gbGUixdWl6yciRs/edit?slide=id.p1#slide=id.p1).




All data here is either publicly available or anonymized for demonstration.

