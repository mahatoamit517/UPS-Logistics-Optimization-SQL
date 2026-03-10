SELECT 
    Route_ID,
    ROUND(AVG(DATEDIFF(Actual_Delivery_Date, Order_Date)),
            2) AS avg_delivery_days
FROM
    orders
GROUP BY Route_ID
ORDER BY Route_ID;


SELECT 
    Route_ID, Traffic_Delay_Min
FROM
    routes order by Traffic_Delay_Min desc;
    
    
  SELECT 
    route_id,
    ROUND((Distance_KM / (Average_Travel_Time_Min / 60)),
            2) AS efficiency_ratio
FROM
    routes;  
    
    

SELECT 
    route_id,
    ROUND((Distance_KM / (Average_Travel_Time_Min / 60)),
            2) AS efficiency_ratio
FROM
    routes
ORDER BY efficiency_ratio
LIMIT 3;  
    

with routestats as (
select route_id, count(route_id) as total, sum(case when Delivery_Status='Delayed' then 1 else 0 end) as delayed_,
round(sum(case when Delivery_Status='Delayed' then 1 else 0 end) * 100/count(route_id),2) as delay_percentage
from orders
group by route_id)
select * from routestats where delay_percentage > 20 order by delay_percentage desc;
