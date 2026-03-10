SELECT 
    r.Start_Location AS Region,
    ROUND(AVG(DATEDIFF(o.Actual_Delivery_Date,
                    o.Expected_Delivery_Date)),
            2) AS avg_delay_days
FROM
    orders o
        JOIN
    routes r ON o.Route_ID = r.Route_ID
WHERE
    o.Delivery_Status = 'Delayed'
GROUP BY Region
ORDER BY avg_delay_days DESC;



SELECT 
    ROUND((SUM(CASE
                WHEN Delivery_Status = 'On Time' THEN 1
                ELSE 0
            END) / COUNT(Delivery_Status)) * 100,
            2) AS on_time_percentage
FROM
    orders;
    
    
SELECT 
    Route_ID, Traffic_Delay_Min
FROM
    routes order by Traffic_Delay_Min desc;
   
