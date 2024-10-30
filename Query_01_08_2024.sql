use sqlsession;

select * from employee;
select * from employee1;

-- select dept.name, sum(salary) from employee1
-- join dept on dept.id = employee1.deptid
-- group by dept.name;

select dept, sum(salary) from employee
group by dept;

select id, name, dept, salary, sum(salary) over(partition by dept) as sumsalary
from employee;

select id, name, dept, salary, count(id) over(partition by dept) as empcount
from employee;

select id, name, dept, salary, 
rank() over(order by salary desc) as emprank
from employee;

-- Department-wise rank
select id, name, dept, salary, 
rank() over(partition by dept order by salary desc) as emprank
from employee;

-- Department-wise dense rank
select id, name, dept, salary, 
dense_rank() over(partition by dept order by salary desc) as emprank
from employee;

select * from (
select id, name, dept, salary,
rank() over(order by salary desc) as emprank
from employee
) as emp where emprank = 4;
select * from employee;

select * from (
select id, name, dept, salary,
rank() over(partition by dept order by salary desc) as emprank
from employee
) as emp where emprank = 2 and dept = 'hr';

create view hrname as
select id, name from employee where dept = 'hr';

select * from hrname;

insert into hrname(id, name) values(5, "SMS");