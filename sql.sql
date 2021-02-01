/*Haritha Weerathunga*/

/*Construct SQL Statements for following scenarios.
Find all customers, had bought more than two products in their orders from 2015-12-31 to
2016-12-31. */

select c.cust_name, c.cust_id,o.order_date,count(o.cust_id) as frequency
from customers c, orders o
where c.cust_id = o.cust_id and o.order_date between '2015-12-31' and '2016-12-31'
group by o.cust_id
having count(o.cust_id) > 2



/*Find the department which has the highest number of employees.*/

select d.dept_name, count (*) as employeecount
from employees e inner join departments d
on e.dept_id = d.dept_id
group by d.dept_name
having employeecount in (
	select max(no_of_employees) from (select dept_id,count(*) as no_of_employees from employees group by dept_id)
)
order by d.dept_name;



/*Find the employees who earns more than average salary of the company.*/

select emp_name,salary
from employees e
where salary > (select avg(salary) from employees)



/*Find the customer who has the most order value after 2015-05-15.*/

select e.emp_name, max(o.order_value) as Max_Order_Value
from employees e, orders o
where o.order_date > '2015-05-15'





/*Calculate the increment of 30 USD per each service year to 2018-12-31 for each employee
and the new salary.*/


SELECT e.emp_name,e.hire_date, e.salary as prev_salary,
((strftime('%s',"2018-12-31") - strftime('%s', e.hire_date))/(86400*360))*30 as increment,(e.salary +((strftime('%s',"2018-12-31") - strftime('%s', e.hire_date))/(86400*360))*30) as salary
from employees e;

















