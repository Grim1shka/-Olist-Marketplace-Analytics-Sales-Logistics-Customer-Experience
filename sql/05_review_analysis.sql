CREATE OR REPLACE VIEW analytics.review_analysis
AS SELECT r.order_id,
    r.review_score,
    d.delivery_days
   FROM raw.reviews r
     LEFT JOIN analytics.delivery_analysis_v2 d ON r.order_id::text = d.order_id::text
  WHERE d.delivery_days IS NOT NULL;
