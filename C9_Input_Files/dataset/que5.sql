/*Question 5 - Generate a query with top 5 products, ranked by IR %. 
Report should have product name, category and ir%*/
SELECT p.product_name, p.category,
ROUND((SUM(fte.`quantity_sold(after_promo)`* fte.base_price) -
SUM(fte.`quantity_sold(before_promo)` * fte.base_price))/
SUM(fte.`quantity_sold(before_promo)` * fte.base_price)*100,2) AS 
IR_Percentage
from dim_products as p
JOIN fact_events as fte
ON p.product_code = fte.product_code
group by p.product_name, p.category
Order by IR_percentage DESC
LIMIT 5