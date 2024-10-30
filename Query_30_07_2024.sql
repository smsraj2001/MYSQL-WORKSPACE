create schema sqlsession;

use sqlsession;

create table employee
(
	id int, 
    name varchar(30),
    dept varchar(30),
    salary double,
    age int
);
describe employee;
desc employee;

insert into employee values(1, "John", "hr", 50000, 26);    
insert into employee values(2, "Rohit", "hr", 45000, 24); 
insert into employee values(3, "Manas", "developer", 70000, 26);   

Select * from employee; 
Select id, name, age from employee;

insert into employee (id, name, dept) values(4, "Mohit", "developer");
update employee set salary = 60000, age = 24
where id = 4;

insert into employee (id, name, dept) values(5, "Raj", "developer");
update employee set salary = 90000, age = 25
where id = 5;

Select * from employee; 

/* rename table employee to emp; */
rename table emp to employee;

alter table employee add column (location varchar(30));
alter table employee rename column location to loc;
alter table employee rename column loc to workplace;

alter table employee modify column workplace varchar(100);

desc employee;

alter table employee drop workplace;

/* ------------------------------------------------------------------*/

select id, name, salary, salary/30 as perdaysalary from employee;
select * from employee where dept = 'hr' and age > 25;
select * from employee where dept != 'hr';

select * from employee order by age;
select * from employee where dept = 'hr' order by age desc;

insert into employee values(6, "Suresh", "hr", 84000, null);
insert into employee values(7, "Anuj", "tester", 64000, 31, null);
insert into employee values(8, "Hari", "tester", 74000, 29, null);
insert into employee values(9, "Shyam", "developer", 64000, 28, null);
insert into employee values(10, "Manoj", "tester", 870000, 30, null);

select count(id) from employee;
select dept from employee;
select dept from employee group by dept;
select dept, sum(salary) from employee group by dept;
select dept, min(salary) from employee group by dept;

select dept, count(id) from employee where dept != "hr" group by dept;

select dept, count(id) from employee where dept != "hr" group by dept having count(id) > 3;

/* ------------------------------------------------------------------*/

use sqlsession;

create table employee2
(
id int primary key,
name varchar(30) not null,
age int check(age > 22),
dept varchar(30) default 'trainee',
email varchar(30) unique,
passport varchar(30) unique
);
desc employee2;

insert into employee2 values(1, "Manish", 30, 'hr', "manish@gmail.com", "pass1234");
insert into employee2 values(2, "Suraj", 31, 'hr', "suraj@gmail.com", "pass@1234");
-- The below one is error as name is not null.
-- insert into employee2(id, age, dept, email, passport) values(3, 26, "developer", "rahul@gmail.com", "pass2345");
insert into employee2(id, name, age, email, passport) values(3, "Rahul", 26, "rahul@gmail.com", "pass2345");
select * from employee2;

insert into employee2(id, name, age, email, passport) values(4, "Mohit", 2, "rahul@gmail.com", "pass$2345");

select * from employee2;
create table dept
(
id int primary key,
name varchar(30) not null,
location varchar(30),
manager varchar(30) 
);

insert into dept values(100, "digital", "Electronic City", "Naveen");
insert into dept values(101, "data", "Hosur", "Praveen");

select * from dept;

create table employee1
(
id int,
name varchar(30),
age int,
salary double,
deptid int,
constraint pk1 primary key(id),
constraint fk1 foreign key(deptid) references dept(id)
);

insert into employee1 values(1, "Seelam", 25, 70000, 100);
insert into employee1 values(2, "Rahul", 25, 80000, 100);
insert into employee1 values(3, "Nikil", 25, 90000, 100);
insert into employee1 values(4, "Roshan", 25, 70000, 100);
insert into employee1 values(5, "Surya", 25, 70000, 101);
insert into employee1 values(6, "Harshada", 25, 70000, 101);

alter table employee1 drop constraint fk1;

alter table employee1 add constraint fk2 foreign key(deptid) references dept(id) on delete cascade;

delete from dept where id = 100;
select * from employee1;

alter table employee1 drop constraint fk2;

alter table employee1 add constraint fk3 foreign key(deptid) references dept(id) on delete set null;

delete from dept where id = 101;
select * from employee1;

