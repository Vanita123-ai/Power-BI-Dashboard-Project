use jithin;
select *from projectsql;

--  1.print the total customers list.

select distinct cust_name as Customers_List from projectsql;

--  2.Print the total employees list.

select distinct employee_name as Employees_list from projectsql;

--  3.list of bottom 5 data of manufactured quantities with department name, employee name, machine code.

select department_name,Employee_name,Machine_Code, sum(manufactured_qty) as Total_mfg_Quantity from projectsql group by department_name,
Employee_Name, Machine_Code order by total_mfg_quantity limit 5;

--  4.Total manufactured quantity and rejected quantity based on the work order month

select wo_month,sum(manufactured_qty) as total_mfg_quantity, sum(rejected_qty) as total_rejected_qty from projectsql group by wo_month order by WO_Month;

--  5.Top 5 employees with rejected quantity

select employee_name,sum(rejected_qty) as total_rejected_quantity from projectsql group by Employee_Name order by total_rejected_quantity desc limit 5;

--  6.Top 5 machines(machine code) with rejected quantity

select machine_code,sum(rejected_qty) as total_rejected_quantity from projectsql group by machine_Code order by total_rejected_quantity desc limit 5;

--  7.total rejected quantity based on the department

select department_name,sum(rejected_qty) as total_rejected_qantity from projectsql group by Department_Name order by total_rejected_qantity desc;

--  8.Print statement which has more than 1000 rejected quantity

select *from projectsql where rejected_qty>1000;

--  9.print statement of closed work order status

select *from projectsql where wo_status="closed";

--  10.Average Production Efficiency Per Department

select department_name, round(avg(production_efficiency),2) as average_of_production_efficiency 
from projectsql group by Department_Name order by average_of_production_efficiency desc;

--  11.Top 2 low production efficiecy operation name

select operation_name,round(avg(production_efficiency)) as production_efficiency from projectsql group by operation_name order by production_efficiency limit 2 ;

--  12.Top  5 customers by work order quantity

select cust_name, sum(wo_qty) as work_order_quantity from projectsql group by Cust_Name order by work_order_quantity desc limit 5;

--  13.Top 5 Employees by Production Output

select employee_name, sum(produced_qty) as total_produced_quantity from projectsql group by Employee_Name order by total_produced_quantity desc limit 5;

--  14.Employee Efficiency Distribution

select Efficiency_range, count(*) as employee_count from (select employee_name,
case when production_efficiency >= 95 then "95-100%"
when production_efficiency >=90 then "90-95%"
else "Below 90%" end as efficiency_range from projectsql)
as efficiency_groups group by Efficiency_range order by employee_count;



