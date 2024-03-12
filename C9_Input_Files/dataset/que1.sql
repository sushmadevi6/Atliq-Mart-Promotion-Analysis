/*Question 1: Products with base price more than 500 and promotion type BOGOF*/
USE retail_events_db;
SELECT 
p.product_code, 
p.product_name, 
ft.base_price, 
ft.promo_type
FROM dim_products p 
JOIN fact_events ft 
ON p.product_code = ft.product_code
WHERE ft.base_price > 500
  AND ft.promo_type = 'BOGOF';
