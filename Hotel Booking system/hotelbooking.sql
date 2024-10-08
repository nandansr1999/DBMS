create database hotelsystems;
use hotelsystems;

create table Hotels(
hotel_id int primary key auto_increment,
_name varchar(100) not null,
location varchar(100) not null
);

create table Rooms(
room_id int primary key auto_increment,
hotel_id int not null,
room_number varchar(100) not null,
room_types varchar(100) not null,
price_per_night decimal(10,2) not null,
foreign key(hotel_id) references Hotels(hotel_id)
);

create table Customers(
customer_id int primary key auto_increment,
_name varchar(100) not null,
email varchar(100) unique not null,
phone varchar(100) not null
);

create table Bookings(
booking_id int primary key auto_increment,
room_id int not null,
customer_id int not null,
check_in_date date not null,
check_out_date date not null,
foreign key(room_id) references Rooms(room_id),
foreign key(customer_id) references Customers(customer_id)
);