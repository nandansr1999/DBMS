create database employeemanage;
use employeemanage;

create table Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT ,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary INT,
    department VARCHAR(100)
);
insert into Employees (first_name, last_name, salary, department) values
('Abhishek', 'das', 50000, 'IT'),
('Rithwik', 'ramesh', 55000, 'HR'),
('Anurag', 'rathnan', 70000, 'Finance'),
('Akshay', 'Dinesh', 45000, 'IT'),
('Amal', 'kp', 60000, 'Sales');

select * from Employees;

alter table Employees
add date_of_joining date;

update Employees
set salary = 60000
where department = 'IT';

select * from Employees
where salary > 60000;

drop table Employees;
