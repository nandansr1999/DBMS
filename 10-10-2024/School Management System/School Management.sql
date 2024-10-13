create database SchoolMgmnt;
use SchoolMgmnt;

create table Teachers (
    teacher_id int primary key,
    teacher_name varchar(100),
    subjects varchar(50)
);

create table Classes (
    class_id int primary key,
    class_name varchar(100),
    teacher_id int,
    foreign key (teacher_id) references Teachers(teacher_id)
);

create table Students (
    student_id int primary key,
    student_name varchar(100),
    class_id int,
    foreign key (class_id) references Classes(class_id)
);

insert into Teachers (teacher_id, teacher_name, subjects) values
(1, 'Mr. Raseesh', 'Mathematics'),
(2, 'Ms. Sona', 'English'),
(3, 'Ms. Sheena', 'Science');

insert into Classes (class_id, class_name, teacher_id) values
(1, 'Math 101', 1),
(2, 'English 101', 2),
(3, 'Science 101', 3),
(4, 'Math 201', 1);  

insert into Students (student_id, student_name, class_id) values
(1, 'Kamal', 1),
(2, 'Jithin', 1),
(3, 'Kavya', 2),
(4, 'Samyuktha', 4);

select Students.student_name, Teachers.teacher_name
from Students
inner join Classes on Students.class_id = Classes.class_id
inner join Teachers on Classes.teacher_id = Teachers.teacher_id;

select Classes.class_name, Students.student_name
from Classes
left join Students on Classes.class_id = Students.class_id;

select Students.student_name, Classes.class_name
from Students
inner join Classes on Students.class_id = Classes.class_id
inner join Teachers on Classes.teacher_id = Teachers.teacher_id
where Teachers.subjects = 'Mathematics';
