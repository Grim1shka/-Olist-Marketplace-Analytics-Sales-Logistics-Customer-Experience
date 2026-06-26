CREATE OR REPLACE VIEW analytics.dim_products
AS SELECT p.product_id,
    COALESCE(pc.product_category_name_english, p.product_category_name) AS category,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
   FROM raw.products p
     LEFT JOIN raw.product_category pc ON p.product_category_name::text = pc.product_category_name::text;
