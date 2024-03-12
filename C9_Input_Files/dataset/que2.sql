/*Question 2 - generate a report that provides number of stores in a city. Arrange it in descending order*/
USE retail_events_db;
SELECT city, 
COUNT(store_id) as Stores_Count
FROM dim_stores
GROUP BY city
ORDER BY Stores_count DESC;
