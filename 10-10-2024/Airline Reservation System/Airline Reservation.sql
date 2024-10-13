create database AirlinesS;
use AirlinesS;

create table Flights (
    flight_id int primary key,
    flight_number varchar(50),
    destination varchar(100)
);

create table Passengers (
    passenger_id int primary key,
    pass_name varchar(100),
    email varchar(100) unique
);

create table Reservations (
    reservation_id int primary key,
    flight_id int,
    passenger_id int,
    reservation_date date,
    foreign key (flight_id) references Flights(flight_id),
    foreign key (passenger_id) references Passengers(passenger_id)
);

insert into Flights (flight_id, flight_number, destination) values
(1, 'AA123', 'New York'),
(2, 'BA456', 'London'),
(3, 'CA789', 'Tokyo'),
(4, 'DA101', 'New York'),
(5, 'EA202', 'Paris');

insert into Passengers (passenger_id, pass_name, email) values
(1, 'Krithik', 'krithikk@example.com'),
(2, 'Vyshnv', 'Vyshnavny@example.com'),
(3, 'Charlie', 'charlie7@example.com'),
(4, 'James Tom', 'jamesToM@example.com');

insert into Reservations (reservation_id, flight_id, passenger_id, reservation_date) values
(1, 1, 1, '2024-09-10'),
(2, 1, 2, '2024-09-20'),
(3, 3, 3, '2024-09-15'),
(4, 4, 1, '2024-09-30'),
(5, 2, 4, '2024-09-21');

select Passengers.pass_name, Flights.flight_number
from Reservations
inner join Passengers on Reservations.passenger_id = Passengers.passenger_id
inner join Flights on Reservations.flight_id = Flights.flight_id;

select Flights.flight_number, Passengers.pass_name
from Flights
left join Reservations on Flights.flight_id =  Reservations.flight_id
left join Passengers on Reservations.passenger_id = Passengers.passenger_id;

select Reservations.reservation_id, Passengers.pass_name, Flights.flight_number, Reservations.reservation_date
from Reservations
inner join Passengers on Reservations.passenger_id = Passengers.passenger_id
inner join Flights on Reservations.flight_id = Flights.flight_id
where Flights.destination = 'New York';