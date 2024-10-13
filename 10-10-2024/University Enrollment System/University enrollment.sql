create database University;
use University;

create table Professors(
professor_id int primary key,
professor_name varchar(50) not null
);

create table Courses(
course_id int primary key,
professor_id int ,
course_name varchar(50) not null,
foreign key(professor_id) references Professors(professor_id)
);

create table Students(
student_id int primary key,
student_name varchar(50) not null
);

create table Enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
foreign key(student_id) references Students(student_id),
 foreign key(course_id) references Courses(course_id)
);

insert into Professors (professor_id, professor_name) values
(1, 'Mr. Swaminath'),
(2, 'Mr.Razak'),
(3, 'Ms.Reetha');

insert into Courses ( course_id, course_name, professor_id) values
(1, 'Computer Science', 1),
(2, ' Civil', 2),
(3, ' Mechanic', 3);

insert into Students ( student_id, student_name) values
(1, 'Govardhan'),
(2, 'Aflak'),
(3, 'Ritvik'),
(4, 'Sandeep');

insert into Enrollments( enrollment_id, Student_id, course_id) values
(1,1,1),
(2,2,1),
(3,3,3),
(4,4,2),
(5,2,2);

select Students.student_name, Courses.course_name
from Enrollments
inner join Students on Enrollments.student_id = Students.student_id
inner join Courses on Enrollments.course_id = Courses.course_id;

select Courses.course_name, Students.student_name
from Courses
left join Enrollments on Courses.course_id = Enrollments.course_id
left join Students on Enrollments.student_id = Students.student_id;

select Courses.course_name, count(Enrollments.student_id) as student_count
from Courses
left join Enrollments on Courses.course_id = Enrollments.course_id
group by Courses.course_name;