use sqlsession;
select * from employee where name like 'a%';
select * from employee where name like '%a%';
select * from employee where name like '%__n%';
select * from employee where name like '%__n';
select * from employee where name like '%a_';
select * from employee where name like '%a';
-- select * from employee where name like 'Rahul';
insert into employee values(11, "Rahul", "hr", 65000, 24, null);

select * from employee
where salary > (select salary from employee where name = "Mohit");

select * from employee where dept = "hr";

select * from employee where id in (3, 5, 17, 6);

select * from employee where salary > any (select salary from employee where dept = "hr");
select * from employee where salary > all (select salary from employee where dept = "hr");

insert into employee values(12, "Rahul", "hr", 65000, 24, null);
select * from employee where dept = "hr"
union
select * from employee where dept = "developer";

select name, age from employee where dept = "hr"
union
select name, age from employee where dept = "developer";

select name, age from employee where dept = "hr"
union all
select name, age from employee where dept = "developer";

-- ------------------------------------------------------------------------
insert into dept values(102, "hr", "Hosur", "Venkatesh");
select * from employee1;

alter table employee1 drop constraint fk3;
alter table employee1 add constraint fk4 foreign key(deptid) references dept(id) on delete cascade;

-- Insert 15 random records into the employee1 table
insert into employee1 (id, name, age, salary, deptid) values
(1, 'Alice Johnson', 30, 50000.00, 100),
(2, 'Bob Smith', 45, 60000.00, 101),
(3, 'Charlie Brown', 28, 55000.00, null),
(4, 'Diana Prince', 34, 65000.00, 102),
(16, 'Ethan Hunt', 40, 70000.00, 100),
(17, 'Fiona Glenanne', 25, 48000.00, 101),
(7, 'George Washington', 52, 72000.00, null),
(8, 'Hannah Montana', 29, 49000.00, 102),
(9, 'Ivy League', 38, 68000.00, 100),
(10, 'Jack Sparrow', 35, 54000.00, 101),
(11, 'Katrina Kaif', 27, 53000.00, null),
(12, 'Louis Armstrong', 47, 60000.00, 102),
(13, 'Mia Khalifa', 33, 59000.00, 100),
(14, 'Nathan Drake', 31, 57000.00, 101),
(15, 'Olivia Pope', 29, 65000.00, null),
(18, null, null, null, 1020);

select * from employee1
inner join
dept
on employee1.deptid = dept.id;

select * from employee1
inner join
dept
on employee1.deptid = dept.id
where employee1.deptid = 102;

select * from employee1
left outer join
dept
on employee1.deptid = dept.id;

select * from employee1
right outer join
dept
on employee1.deptid = dept.id;

select e.id, e.name, d.name, d.manager from employee1 as e
right outer join
dept d
on e.deptid = d.id;

select * from employee1
left outer join
dept
on employee1.deptid = dept.id
union
select * from employee1
right outer join
dept
on employee1.deptid = dept.id;

select * from employee1
cross join
dept;

select * from employee1;
-- -----------------------------------------------------------------------------------
create table employee3
(
EmpId int primary key,
EmpName varchar(30) not null,
MgrId int
);

insert into employee3 (EmpId, EmpName, MgrId) values
(1, 'Sumit', null),
(2, 'Rohit', 1),
(3, 'Kumar', 1),
(4, 'Manas', 1),
(5, 'Sachin', 2);

select e1.EmpName as Employee_Name, e2.EmpName as Manager_Name
from employee3 e1
left join
employee3 e2
on e1.MgrId = e2.EmpId;

select e1.EmpName as Employee_Name, e2.EmpName as Manager_Name
from employee3 e1, employee3 e2
where e1.MgrId = e2.EmpId;

select * from employee1;

set autocommit = 0;

insert into employee1 values(19, "Munish", 30, 60000, 100);
commit;
insert into employee1 values(20, "Sundar", 30, null, 102);
rollback;

update employee1 set salary = 70000 where id = 7;
savepoint a;

update employee1 set age = 40 where id = 7;
savepoint b;

update employee1 set name = "Manas M" where id= 7;
savepoint c;

rollback to b;
commit;

select id, name, upper(name), length(name), lower(name), concat(name, " welcome") as Message from employee1;
select id, name, salary, round(salary/30) as PerDaySalary from employee1;

update employee1 set name = "Sutharsan" where id = 1;

select * from employee1 where name = "sutharsan";

select id, name, salary, salary/30, round(salary/30), floor(salary/ 30), ceil(salary/ 30) from employee1;

-- --------------------------------------------------------------------------------------------------
set autocommit = 1;
alter table employee1
add column Date_Of_Birth date,
add column Date_Of_Joining date;

UPDATE employee1
SET Date_OF_Birth = '1990-02-15', Date_Of_Joining = '2015-03-01'
WHERE id = 1;
UPDATE employee1
SET Date_OF_Birth = '1985-05-22', Date_Of_Joining = '2010-06-15'
WHERE id = 2;
UPDATE employee1
SET Date_OF_Birth = '1992-11-09', Date_Of_Joining = '2018-07-23'
WHERE id = 3;
UPDATE employee1
SET Date_OF_Birth = '1988-08-30', Date_Of_Joining = '2013-09-05'
WHERE id = 4;
UPDATE employee1
SET Date_OF_Birth = '1995-12-17', Date_Of_Joining = '2020-01-14'
WHERE id = 5;
UPDATE employee1
SET Date_OF_Birth = '1987-06-05', Date_Of_Joining = '2012-02-20'
WHERE id = 6;
UPDATE employee1
SET Date_OF_Birth = '1991-04-25', Date_Of_Joining = '2016-05-10'
WHERE id = 7;
UPDATE employee1
SET Date_OF_Birth = '1989-01-11', Date_Of_Joining = '2014-03-18'
WHERE id = 8;
UPDATE employee1
SET Date_OF_Birth = '1994-07-19', Date_Of_Joining = '2019-10-30'
WHERE id = 9;
UPDATE employee1
SET Date_OF_Birth = '1993-03-27', Date_Of_Joining = '2018-06-12'
WHERE id = 10;
UPDATE employee1
SET Date_OF_Birth = '1990-10-03', Date_Of_Joining = '2015-11-22'
WHERE id = 11;
UPDATE employee1
SET Date_OF_Birth = '1986-02-14', Date_Of_Joining = '2011-04-05'
WHERE id = 12;
UPDATE employee1
SET Date_OF_Birth = '1995-09-07', Date_Of_Joining = '2020-08-17'
WHERE id = 13;
UPDATE employee1
SET Date_OF_Birth = '1984-12-28', Date_Of_Joining = '2010-07-06'
WHERE id = 14;
UPDATE employee1
SET Date_OF_Birth = '1991-05-16', Date_Of_Joining = '2016-09-11'
WHERE id = 15;
UPDATE employee1
SET Date_OF_Birth = '1987-11-04', Date_Of_Joining = '2013-02-25'
WHERE id = 16;
UPDATE employee1
SET Date_OF_Birth = '1993-08-13', Date_Of_Joining = '2018-10-29'
WHERE id = 17;
UPDATE employee1
SET Date_OF_Birth = '1992-06-21', Date_Of_Joining = '2017-12-07'
WHERE id = 19;










