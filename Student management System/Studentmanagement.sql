create database Studentmanage;
use Studentmanage;

create table Students(
student_id int primary key auto_increment,
_name varchar(100) not null,
date_of_birth date not null,
email varchar(100) unique not null
);

create table Courses(
course_id int primary key auto_increment,
course_name varchar(100) not null,
credits int not null
);

create table Enrollments(
enrollment_id int primary key auto_increment,
student_id int not null,
course_id int not null,
enrollment_date date not null,
foreign key(student_id) references Students(student_id),
foreign key(course_id) references Courses(course_id)
);