create database bookstore;
use bookstore;

create table Books(
book_id int primary key,
title varchar(50) not null,
author varchar(50) not null
);

create table Customers(
customer_id int primary key,
cus_name varchar(50) not null,
email varchar(50) unique not null
);

create table Sales(
sale_id int primary key,
book_id int,
customer_id int,
sale_date date not null,
foreign key(book_id) references Books(book_id),
foreign key(customer_id) references Customers(customer_id)
);

insert into Books( book_id, title, author) values
(1, 'The Alchemist', 'Paulo Coelho'),
(2, 'The Great Gatsby', 'F. Scott Fitzgerald'),
(3, 'The Hobbit', 'J.R.R. Tolkien'),
(4, 'Dune', 'Frank Herbert');

insert into Customers(customer_id, cus_name,email) values
(1, 'Sandeep George', ' Sandy@gmail.com'),
(2, 'James Tom', ' jamie@gmail.com'),
(3, ' Thushar Raj', ' Thush@gmail.com');

insert into Sales(sale_id, book_id, customer_id, sale_date) values
(1, 1, 1, '2024-01-10'),
(2, 2, 1, '2024-02-20'),
(3, 3, 2, '2024-03-30'),
(4, 4, 3, '2024-04-15');

select Customers.cus_name, Books.title
from Sales
inner join Customers on Sales.customer_id = Customers.customer_id
inner join  Books on Sales.book_id = Books.book_id;

select Customers.cus_name, Books.title
from Books
left join Sales on Books.book_id = Sales.book_id
left join Customers on Sales.customer_id = Customers.customer_id;

select Customers.cus_name, Books.title
from Customers
right join Sales on Customers.customer_id = Sales.customer_id
right join Books on Sales.book_id = Books.book_id;
