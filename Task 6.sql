with rankshipment as (
select order_id,Checkpoint,Checkpoint_Time,
row_number() over(partition by order_id order By Checkpoint desc) as rn
from shipmenttrackingtable)

select order_id, checkpoint as last_checkpoint, Checkpoint_Time
from rankshipment
where rn=1;


SELECT 
    Delay_Reason, COUNT(Delay_Reason) AS frequency
FROM
    shipmenttrackingtable
WHERE
    Delay_Reason IS NOT NULL
        AND Delay_Reason <> 'None'
GROUP BY Delay_Reason
ORDER BY frequency DESC;



SELECT 
    order_id, COUNT(Checkpoint) AS delay_checkpoints
FROM
    shipmenttrackingtable
GROUP BY Order_ID
HAVING COUNT(Checkpoint) > 2;

