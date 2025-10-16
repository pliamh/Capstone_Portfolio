
-- Postgres DDL generated from the ERD
-- Tables: products, stores, dim_date, promotions, sales_txn, inventory_snapshot

BEGIN;

CREATE TABLE IF NOT EXISTS products (
  product_upc        BIGINT PRIMARY KEY,
  product_name       TEXT NOT NULL,
  brand              TEXT,
  department_name    TEXT,
  category_name      TEXT,
  size               TEXT,
  unit               TEXT,
  vendor_name        TEXT,
  vendor_phone       TEXT,
  regular_price      NUMERIC(10,2),
  unit_cost          NUMERIC(10,2),
  pack_size          INTEGER CHECK (pack_size IS NULL OR pack_size >= 0)
);

CREATE TABLE IF NOT EXISTS stores (
  store_id       INTEGER PRIMARY KEY,
  store_name     TEXT,
  store_address  TEXT,
  store_city     TEXT,
  store_state    VARCHAR(2),
  store_zip      INTEGER
);

CREATE TABLE IF NOT EXISTS dim_date (
  d           DATE PRIMARY KEY,
  y           INTEGER,
  q           INTEGER CHECK (q BETWEEN 1 AND 4),
  m           INTEGER CHECK (m BETWEEN 1 AND 12),
  dow         INTEGER CHECK (dow BETWEEN 0 AND 6),
  is_holiday  BOOLEAN
);

CREATE TABLE IF NOT EXISTS promotions (
  promo_id          INTEGER PRIMARY KEY,
  product_upc       BIGINT REFERENCES products(product_upc),
  promo_type        TEXT,
  discount_percent  NUMERIC(5,2) CHECK (discount_percent BETWEEN 0 AND 100),
  start_date        DATE NOT NULL,
  end_date          DATE NOT NULL,
  CHECK (start_date <= end_date)
);

CREATE TABLE IF NOT EXISTS sales_txn (
  receipt_id            TEXT NOT NULL,
  line_number           INTEGER NOT NULL,
  sale_datetime         TIMESTAMP,
  txn_date              DATE NOT NULL,
  store_id              INTEGER REFERENCES stores(store_id),
  cashier_name          TEXT,
  tender_type           TEXT,
  customer_segment      TEXT,
  product_upc           BIGINT REFERENCES products(product_upc),
  qty                   INTEGER NOT NULL CHECK (qty >= 0),
  unit_price            NUMERIC(10,2),
  line_amount           NUMERIC(12,2),
  unit_price_effective  NUMERIC(10,2),
  line_subtotal         NUMERIC(12,2),
  tax_amount            NUMERIC(12,2),
  weekend_flag          BOOLEAN,
  promo_id              INTEGER REFERENCES promotions(promo_id),
  promo_type            TEXT,
  PRIMARY KEY (receipt_id, line_number)
);

CREATE TABLE IF NOT EXISTS inventory_snapshot (
  snapshot_date         DATE NOT NULL,
  store_id              INTEGER NOT NULL REFERENCES stores(store_id),
  product_upc           BIGINT  NOT NULL REFERENCES products(product_upc),
  on_hand_qty           INTEGER CHECK (on_hand_qty IS NULL OR on_hand_qty >= 0),
  unit_cost             NUMERIC(10,2),
  inventory_cost_value  NUMERIC(12,2),
  PRIMARY KEY (snapshot_date, store_id, product_upc)
);

-- Helpful analytics / join indexes
CREATE INDEX IF NOT EXISTS idx_sales_txn_date       ON sales_txn (txn_date);
CREATE INDEX IF NOT EXISTS idx_sales_store          ON sales_txn (store_id);
CREATE INDEX IF NOT EXISTS idx_sales_product        ON sales_txn (product_upc);
CREATE INDEX IF NOT EXISTS idx_sales_store_date     ON sales_txn (store_id, txn_date);

CREATE INDEX IF NOT EXISTS idx_promos_product_range ON promotions (product_upc, start_date, end_date);

CREATE INDEX IF NOT EXISTS idx_inv_store_prod_date  ON inventory_snapshot (store_id, product_upc, snapshot_date);

COMMIT;
