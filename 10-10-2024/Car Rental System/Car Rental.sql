create database CarsREnt;
use CarsREnt;

create table Cars (
    car_id int primary key,
    car_model varchar(100),
    daily_rental_rate decimal(10, 2)
);

create table Customers (
    customer_id int primary key,
    cus_name varchar(100),
    license_number varchar(50)
);

create table Rentals (
    rental_id int primary key,
    car_id int,
    customer_id int,
    rental_date date,
    foreign key (car_id) references Cars(car_id),
    foreign key (customer_id) references Customers(customer_id)
);

insert into Cars (car_id, car_model, daily_rental_rate) values
(1, 'Toyota Innova', 4000.00),
(2, 'Honda City', 3500.00),
(3, 'Renault Kwid', 2000.00),
(4, 'Tata Tiago', 2100.00);

insert into Customers (customer_id, cus_name, license_number) values
(1, 'Akshay', 'KLD1234567'),
(2, 'Thushar', 'KLD2345678'),
(3, 'Krithik', 'KLD3456789');

insert into Rentals (rental_id, car_id, customer_id, rental_date) values
(1, 1, 1, '2023-04-01'),
(2, 2, 1, '2023-12-02'),
(3, 3, 2, '2024-10-03'),
(4, 1, 3, '2023-11-04');

select Customers.cus_name, Cars.car_model
from Rentals
inner join Customers on Rentals.customer_id = Customers.customer_id
inner join Cars on Rentals.car_id = Cars.car_id;

select Cars.car_model, Rentals.rental_date, Customers.cus_name
from Cars
left join Rentals on Cars.car_id = Rentals.car_id
left join Customers on Rentals.customer_id = Customers.customer_id;

select Cars.car_model, sum(Cars.daily_rental_rate) as total_revenue
from Rentals
inner join Cars on Rentals.car_id = Cars.car_id
group by Cars.car_model;