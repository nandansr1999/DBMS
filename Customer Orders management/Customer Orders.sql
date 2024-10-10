create database customerorder;
use customerorder;

create table Customers (
    customer_id int primary key auto_increment,
    _name varchar(100),
    email varchar(100),
    phone varchar(15)
);

create table Orders (
    order_id int primary key auto_increment,
    order_date date,
    amount decimal(10, 2),
    customer_id int,
    foreign key (customer_id) references Customers(customer_id)
);

insert into Customers ( _name, email, phone) values
('Amal', 'amalkp@gmail.com', '82771821832'),
('Akshay', 'akshay@gmail.com', '9537278190'),
('Alice', 'Alice@gmail.com', '8728120962');

insert into Orders (order_date, amount, customer_id) values
('2023-01-15', 200.00, 1),  
('2023-01-20', 100.00, 2),  
('2023-02-10', 50.00, 1),   
('2023-03-05', 300.00, 3),  
('2023-03-15', 150.00, 2);  

select c._name, o.amount
from Customers c
join Orders o on c.customer_id = o.customer_id;

update Orders
set amount = amount * 1.10
where customer_id = (select customer_id from Customers where _name = 'Alice');

delete from Orders
where amount < 150.00;
