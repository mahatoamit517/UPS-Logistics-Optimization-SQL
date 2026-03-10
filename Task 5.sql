select agent_id,Route_ID, On_Time_Percentage,
rank() over(partition by Route_ID order by On_Time_Percentage desc) as rank_
from deliveryagents;


SELECT 
    agent_id, On_Time_Percentage
FROM
    deliveryagents
WHERE
    On_Time_Percentage < 80 order by On_Time_Percentage desc ;
    
    
select 'top 5 agent' as category, round(avg(Avg_Speed_KM_HR),2) as avg_speed_kmph
from (select Avg_Speed_KM_HR from deliveryagents order by On_Time_Percentage desc limit 5) as top_pool

union all

select 'bottom 5 agent',round(avg(Avg_Speed_KM_HR),2)
from (select Avg_Speed_KM_HR from deliveryagents order by On_Time_Percentage asc limit 5) as bottom_pool; 

