SELECT 
    warehouse_id, location, Processing_Time_Min
FROM
    warehouses
ORDER BY Processing_Time_Min DESC
LIMIT 3;


SELECT 
    Warehouse_ID,
    COUNT(order_id) AS total,
    SUM(CASE
        WHEN Delivery_Status = 'Delayed' THEN 1
        ELSE 0
    END) AS delayed_
FROM
    orders
GROUP BY Warehouse_ID
ORDER BY Warehouse_ID;


with globalaverage as(
select round(avg(Processing_Time_Min),2) as global_avg_time 
from warehouses)

select w.warehouse_id, w.location, w.Processing_Time_Min, g.global_avg_time
from warehouses w 
cross join
globalaverage g
where  w.Processing_Time_Min >  g.global_avg_time
order by w.Processing_Time_Min desc;


with rankwarehouse as (
select warehouse_id,round((sum(case when Delivery_Status ='On Time' then 1 else 0 end) / count(order_id)) * 100,2) as on_time_percentage
from orders 
group by Warehouse_ID)

select warehouse_id, on_time_percentage,
rank() over( order by on_time_percentage desc) as Performance_rank
from rankwarehouse;



