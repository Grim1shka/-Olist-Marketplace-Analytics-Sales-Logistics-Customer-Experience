CREATE OR REPLACE VIEW analytics.orders_clean
AS SELECT order_id,
    customer_id,
    order_status,
    order_purchase_timestamp[1] AS order_purchase_ts,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
   FROM raw.orders;
