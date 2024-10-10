create database library;
use library;

create table Authors (
author_id int primary key auto_increment,
_name varchar(100) not null,
country varchar(100) not null
);

create table Books (
book_id int primary key auto_increment,
title varchar(100) not null,
author_id int not null,
publication_year int not null,
foreign key(author_id) references Authors(author_id)
);

create table Users(
user_id int primary key  auto_increment,
_name varchar(100) not null,
email varchar(100) unique not null,
membership_date date not null
);

create table Loans(
loan_id int primary key auto_increment,
book_id int not null,
user_id int not null,
loan_date date not null,
return_date date not null,
foreign key(book_id) references Books(book_id),
foreign key(user_id) references Users(user_id)
);