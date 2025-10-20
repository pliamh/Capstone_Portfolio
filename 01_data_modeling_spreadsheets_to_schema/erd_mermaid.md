
```mermaid
erDiagram
  PRODUCTS {
    INT product_upc PK
    STRING product_name
    STRING brand
    STRING department_name
    STRING category_name
    STRING size
    STRING unit
    STRING vendor_name
    STRING vendor_phone
    FLOAT regular_price
    FLOAT unit_cost
    INT pack_size
  }

  SALES {
    STRING receipt_id PK
    INT    line_number PK
    DATETIME sale_datetime
    DATE   txn_date
    INT    store_id
    STRING cashier_name
    STRING tender_type
    STRING customer_segment
    INT    product_upc FK
    INT    qty
    FLOAT  unit_price
    FLOAT  line_amount
    FLOAT  unit_price_effective
    FLOAT  line_subtotal
    FLOAT  tax_amount
    BOOLEAN weekend_flag
    INT    promo_id
    STRING promo_type
  }

  INVENTORY_SNAPSHOT {
    DATE   snapshot_date PK
    INT    store_id PK
    INT    product_upc FK PK
    INT    on_hand_qty
    FLOAT  unit_cost
    FLOAT  inventory_cost_value
  }

  PROMOTIONS {
    INT    promo_id PK
    INT    product_upc FK
    STRING promo_type
    INT    discount_percent
    DATE   start_date
    DATE   end_date
  }

  STORE {
    INT    store_id PK
    STRING store_name
    STRING store_address
    STRING store_city
    STRING store_state
    INT    store_zip
  }

  DIM_DATE {
    DATE   d PK
    INT    y
    INT    q
    INT    m
    INT    dow
    BOOLEAN is_holiday
  }

  PRODUCTS ||--o{ SALES : "sold as"
  PRODUCTS ||--o{ INVENTORY_SNAPSHOT : "stocked as"
  PRODUCTS ||--o{ PROMOTIONS : "promoted as"

  PROMOTIONS ||--o{ SALES : "applied to"

  STORE ||--o{ SALES : "has"
  STORE ||--o{ INVENTORY_SNAPSHOT : "tracks"

  DIM_DATE ||--o{ SALES : "occurs on"
  DIM_DATE ||--o{ INVENTORY_SNAPSHOT : "snapshot on"
