create database HospitalRec;
use HospitalRec;

create table Doctors(
doctor_id int primary key,
doctor_name varchar(100),
specialization varchar(100) 
);

create table Patients(
patient_id int primary key,
patient_name varchar(100),
phone varchar(15)
);

create table Appointments(
appointment_id int primary key,
doctor_id int,
patient_id int,
appointment_date date,
foreign key(doctor_id) references Doctors(doctor_id),
foreign key(patient_id) references Patients(patient_id)
);

insert into Doctors( doctor_id, doctor_name,specialization) values
(1, ' Dr. COT Mustafa', ' Cardiology'),
(2, ' Dr. Reshma Ajith', ' Neurology'),
(3, ' Dr. Ajith', 'Pediatrics'),
(4, ' Dr. Tajudheen', ' Cardiology'),
(5, ' Dr. Remya', ' Orthopedics');

insert into Patients( patient_id, patient_name, phone) values
(1, 'Amal ','8754561092'),
(2, 'Shravan ','732409234'),
(3, 'Sarang ','8912983232'),
(4, 'Nithya ','61283123123');

insert into Appointments( appointment_id, doctor_id, patient_id, appointment_date) values
(1, 1, 1, '2023-10-15'),
(2, 1, 2, '2023-10-20'),
(3, 2, 3, '2023-10-25'),
(4, 4, 1, '2023-10-30'),
(5, 5, 4, '2023-11-01');

select Patients.patient_name, Doctors.doctor_name
from Appointments
inner join Patients on Appointments.patient_id = Patients.patient_id
inner join Doctors on Appointments.doctor_id = Doctors.doctor_id;

select Doctors.doctor_name, Appointments.appointment_date
from Doctors
left join Appointments on Doctors.doctor_id = Appointments.doctor_id;

select Appointments.appointment_id, Patients.patient_name, Doctors.doctor_name, Appointments.appointment_date
from Appointments
inner join Doctors on Appointments.doctor_id = Doctors.doctor_id
inner join Patients on Appointments.patient_id = Patients.patient_id
WHERE Doctors.specialization = ' Cardiology';
