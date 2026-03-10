Create database ups_project;

use ups_project;

select count(order_id) from orders;
select count(distinct order_id) from orders;

alter table orders
modify column Actual_Delivery_Date date;

alter table shipmenttrackingtable
modify column Checkpoint_Time date;

alter table warehouses
modify column Dispatch_Time time;

select * from orders where Order_Date>Actual_Delivery_Date;