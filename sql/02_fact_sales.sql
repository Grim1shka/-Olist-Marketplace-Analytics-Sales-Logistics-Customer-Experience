CREATE OR REPLACE VIEW analytics.fact_sales_v2
AS SELECT oi.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    o.order_status,
    o.order_purchase_ts,
    oi.price,
    oi.freight_value
   FROM raw.order_items oi
     LEFT JOIN analytics.orders_clean o ON oi.order_id::text = o.order_id::text;
