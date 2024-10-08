create database Hospital;
USE Hospital;

CREATE TABLE doctors (
 doctor_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 specialization VARCHAR(100) NOT NULL,
 Phone VARCHAR(15) NOT NULL
 );
 
 CREATE TABLE patients(
 patient_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 contact_number VARCHAR(15) NOT NULL
);

CREATE TABLE appointment(
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
doctor_id INT,
patient_id INT,
FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id),
FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
appointment_date DATE NOT NULL,
status VARCHAR(20)
)