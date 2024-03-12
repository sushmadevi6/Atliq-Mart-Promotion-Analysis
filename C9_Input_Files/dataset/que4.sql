/*Question 4 -Calculation of ISU (Incremental Sold Quantity) for each category.
Ranking category based on ISU% */
SELECT p.category,
(round((SUM(ft.`quantity_sold(after_promo)`)-
SUM(ft.`quantity_sold(before_promo)`))/
 SUM(ft.`quantity_sold(before_promo)`)*100,2)) as ISU_percentage,
RANK() OVER (order by ((SUM(ft.`quantity_sold(after_promo)`)-
SUM(ft.`quantity_sold(before_promo)`))/
 SUM(ft.`quantity_sold(before_promo)`)*100) DESC) as rank_order
FROM dim_products as p
JOIN fact_events as ft
ON p.product_code = ft.product_code
WHERE ft.campaign_id = 'CAMP_DIW_01'
group by p.category;