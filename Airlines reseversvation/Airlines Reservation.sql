create database Airlines;
use  Airlines;

create table Flights (
flight_id int primary key auto_increment,
flight_number varchar(100) not null,
departure varchar(100) not null,
arrival varchar(100) not null,
departure_time datetime not null
);

create table passengers (
passenger_id int primary key auto_increment,
name varchar(100) not null,
passport_number varchar(100) unique not null,
email varchar(100) not null
);

create table reservation (
reservation_id int primary key auto_increment,
flight_id int not null,
passenger_id int not null,
status varchar(20),
foreign key(flight_id) references Flights(flight_id),
foreign key(passenger_id) references passengers(passenger_id)
);