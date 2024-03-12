/*Question 3 Campaign name and total revenue generation before promotion and after promotion*/ 
SELECT dc.campaign_name,
sum(round(ft.base_price*ft.`quantity_sold(before_promo)`,2))/1000000 as 
total_revenue_before_promo,
sum(round(ft.base_price*ft.`quantity_sold(after_promo)`,2))/1000000 as 
total_revenue_after_promo
FROM fact_events as ft
JOIN dim_campaigns as dc
ON ft.campaign_id = dc.campaign_id
GROUP BY dc.campaign_name
ORDER BY dc.campaign_name ASC;
