create database commerce;
use commerce;

create table Customers(
customer_id int primary key auto_increment,
_name varchar(100) not null,
email varchar(100) unique not null,
phone varchar(100) not null
);

create table Products(
product_id int primary key auto_increment,
product_name varchar(100) not null,
price decimal(10,2) not null,
stock int not null
);

create table Orders(
order_id int primary key auto_increment,
customer_id int not null,
order_date date not null,
total_amount decimal(10,2) not null,
foreign key(customer_id) references Customers(customer_id)
);

create table OrderDetails(
order_detail_id int primary key auto_increment,
order_id int not null,
product_id int not null,
quantity int not null,
price decimal(10,2) not null,
foreign key(order_id) references Orders(order_id),
foreign key(product_id) references products(product_id)
);