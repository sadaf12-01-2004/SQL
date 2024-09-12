use worker;

CREATE TABLE worker (
    worker_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    joining_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL
);
INSERT INTO worker (worker_id, first_name, last_name, salary, joining_date, department)
VALUES (1, 'Monika', 'Arora', 100000.00, '2014-02-20', 'HR'),
	(2, 'Niharika', 'Verma', 80000.00, '2014-06-11', 'Admin'),
    (3, 'Vishal', 'singhal', 300000.00, '2014-02-20', 'HR'),
    (4, 'Amitabh', 'Singh', 500000.00, '2014-02-20', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000.00, '2014-06-11', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000.00, '2014-06-11', 'Account'),
    (7, 'Satish', 'Kumar', 75000.00, '2014-01-20', 'Account'),
    (8, 'Geetika', 'chauhan', 75000.00, '2014-04-11', 'Admin');
    
    select * from worker;
    
    -- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker
order by first_name ASC , department DESC;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select * from worker
where first_name like "vipul" and "satish";

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker
where first_name like '_____h';

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.
select * from worker 
where salary between 1 and 100000;

-- 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table
select joining_date,department,first_name,count(*)
from worker
group by joining_date,department,first_name
having count(*);

-- 6. Write an SQL query to show the top 6 records of a table.
 select * from worker 
 limit 6;
 
--  7. Write an SQL query to fetch the departments that have less than five people in them.
select department 
from worker 
group by department
having count(*) < 5;

-- 8. Write an SQL query to show all departments along with the number of people in there. 
select department, count(*) as total_worker
from worker
group by department;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department
select department,max(salary) as max_salary
from worker
group by department;

								     --  QUESTION 2-- 
create database school;
use school;

create table student (
student_id int primary key,
student_name varchar (50),
gender varchar (20),
percentage decimal (10,2),
class int,
section varchar (1),
std_stream varchar (20),
DOB date );

insert into student (student_id,student_name,gender,percentage,class,section,std_stream,DOB)
values (1001,'Surekha joshi','female',82,12,'A','Science','1998-03-08'),
	(1002,'Maahi Agarwal','female',56,11,'C','Commerce','2008-11-23'),
    (1003,'Sanam Verma','male',59,11,'C','Commerce','2006-06-29'),
    (1004,'Ronit Kumar','male',63,11,'C','Commerce','1997-11-05'),
    (1005,'Dipesh Pulkit','male',78,11,'B','Science','2003-09-14'),
    (1006,'Jahanvi Puri','female',60,11,'B','Commerce','2008-07-11'),
    (1007,'Sanam Kumatr','male',23,12,'F','Commerce','1998-03-08'),
    (1008,'Sahil Saras','male',56,11,'C','Commerce','2008-11-07'),
    (1009,'Akshra Agarwal','female',72,12,'B','Commerce','1996-10-01'),
    (1010,'Stuti Mishra','female',39,11,'F','Science','2008-11-23'),
    (1011,'Harsh Agarwal','male',42,11,'C','Science','1998-3-8'),
    (1012,'Nikunj Agarwal','male',49,12,'C','Commerce','1998-06-28'),
    (1013,'Akriti Sharma','female',89,12,'A','Science','2008-11-23'),
    (1014,'Tani Rastogi','female',82,12,'A','Science','1998-3-8');
    
    -- 1 To display all the records form STUDENT table. 
select * from student;

-- 2. To display any name and date of birth from the table STUDENT.
select student_name,DOB
from student ;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table.  
select * from student
where percentage >= 80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80
select student_name,std_stream,percentage
from student
where percentage > 80;

-- 5. To display all records of science students whose percentage is more than 75 form student table.
select * from student
where std_stream = 'science' and percentage > 75;