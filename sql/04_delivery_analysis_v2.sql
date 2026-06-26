CREATE OR REPLACE VIEW analytics.delivery_analysis_v2
AS SELECT order_id,
    customer_id,
    order_status,
    order_purchase_ts,
    order_delivered_customer_date,
    round(EXTRACT(epoch FROM order_delivered_customer_date::timestamp without time zone - order_purchase_ts) / 86400::numeric, 1) AS delivery_days
   FROM analytics.orders_clean
  WHERE order_status::text = 'delivered'::text AND order_delivered_customer_date IS NOT NULL;
