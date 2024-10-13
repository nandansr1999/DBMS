create database Movierental;
use Movierental;

create table Movies (
    movie_id int primary key,
    title varchar(100),
    genre varchar(50)
);

create table Customers (
    customer_id int primary key,
    cus_name varchar(100),
    membership_type varchar(50)
);

create table Rentals (
    rental_id int primary key,
    movie_id int,
    customer_id int,
    rental_date date,
    foreign key (movie_id) references Movies(movie_id),
    foreign key (customer_id) references Customers(customer_id)
);

insert into Movies (movie_id, title, genre) values
(1, 'The Shawshank Redemption', 'Drama'),
(2, 'The Godfather', 'Crime'),
(3, 'The Dark Knight', 'Action'),
(4, 'Pulp Fiction', 'Thriller'),
(5, 'The Dark Knight Rises', 'Action');

insert into Customers (customer_id, cus_name, membership_type) values
(1, 'Akshay', 'Premium'),
(2, 'Devika', 'Standard'),
(3, 'Tushar', 'Premium'),
(4, 'Anupam', 'Standard');

insert into Rentals (rental_id, movie_id, customer_id, rental_date) values
(1, 1, 1, '2024-08-01'),
(2, 2, 3, '2024-08-02'),
(3, 3, 2, '2024-08-03'),
(4, 4, 3, '2024-08-04'),
(5, 5, 1, '2024-08-05');

select Customers.cus_name, Movies.title
from Rentals
inner join Customers on Rentals.customer_id = Customers.customer_id
inner join Movies on Rentals.movie_id = Movies.movie_id;

select Movies.title, Customers.cus_name
from Movies
left join Rentals on Movies.movie_id = Rentals.movie_id
left join Customers on Rentals.customer_id = Customers.customer_id;

select Customers.cus_name, count(Rentals.rental_id) as total_rentals
from Customers
left join Rentals on Customers.customer_id = Rentals.customer_id 
group by Customers.cus_name;