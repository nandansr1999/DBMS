create database movieticket;
use  movieticket;

create table Movies (
movie_id int primary key auto_increment,
title varchar(100) not null,
release_year int not null,
duration int not null
);

create table Theater (
theater_id int primary key auto_increment,
name varchar(100) not null,
location varchar(100) unique not null
);

create table Showtime (
showtime_id int primary key auto_increment,
movie_id int not null,
theater_id int not null,
status varchar(20),
foreign key(movie_id) references Movies(movie_id),
foreign key(theater_id) references Theater(theater_id)
);