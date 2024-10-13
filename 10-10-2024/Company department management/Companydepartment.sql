create database Company;
use Company;

create table Department(
department_id int primary key auto_increment,
department_name varchar(50) not null
);

create table Employees(
employee_id int primary key auto_increment,
department_id int not null,
first_name varchar(50) not null,
last_name varchar(50) not null,
foreign key(department_id) references Department(department_id)
);

insert into Department ( department_name) values
('IT'),
('HR'),
('Sales');

insert into Employees ( first_name, last_name, department_id) values
('Jerry', 'Tom', 2),
('Vishnu', 'Saj', 1),
('Sam', 'Prakas', 3),
('Vyshav', 'Raj', 1),
('Shreya', 'Sudhi', 2);

select Employees.first_name, Employees.last_name,Department.department_name
from Employees 
inner join Department on Employees.department_id = Department.department_id;

select Department.department_name, Employees.first_name, Employees.last_name
from Department
left join Employees on Department.department_id = Employees.department_id;

select Employees.first_name, Employees.last_name,Department.department_name
from Employees 
right join Department on Employees.department_id = Department.department_id;
