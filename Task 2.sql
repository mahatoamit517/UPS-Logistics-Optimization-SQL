SELECT 
    Order_id,
    DATEDIFF(Actual_Delivery_Date,
            Expected_Delivery_Date) AS delay_days
FROM
    orders
WHERE
    Delivery_Status = 'Delayed';

SELECT 
    route_id,
    ROUND(AVG(DATEDIFF(Actual_Delivery_Date,
                    Expected_Delivery_Date)),
            2) AS avg_delay_days
FROM
    orders
WHERE
    Delivery_Status = 'Delayed'
GROUP BY Route_ID
ORDER BY avg_delay_days DESC
LIMIT 10;


select warehouse_id, order_id, 
rank() over(partition by warehouse_id order by datediff(Actual_Delivery_Date,Expected_Delivery_Date) desc ) as delay_rank
from orders where Delivery_Status = 'Delayed';