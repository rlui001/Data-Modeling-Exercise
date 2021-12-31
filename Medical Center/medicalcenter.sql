-- file is meant to be used as a quick way to initialize a database with the tables to represent the medical center ERD
CREATE DATABASE IF NOT EXISTS MedicalCenter;
USE MedicalCenter;

-- added this block of statements in case the file is modified and needs to be run again
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Disease;
DROP TABLE IF EXISTS Insurance;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Diagnosis;
DROP TABLE IF EXISTS Visits;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Doctor (
  id int NOT NULL,
  name char(100) NOT NULL,
  specialty char(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Disease (
  id int NOT NULL,
  name char(100) NOT NULL,
  category char(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Insurance (
  id int NOT NULL,
  company char(255) NOT NULL,
  phone_number varchar(10),
  PRIMARY KEY (id)
);

CREATE TABLE Patient (
  id int NOT NULL,
  insurance_id int,
  name char(100) NOT NULL,
  address varchar(300) NOT NULL,
  date_of_birth date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (insurance_id) REFERENCES Insurance(id)
);

CREATE TABLE Diagnosis (
  id int NOT NULL,
  visit_id int NOT NULL,
  disease_id int,
  notes varchar(1000),
  PRIMARY KEY (id),
  FOREIGN KEY (visit_id) REFERENCES Visits(id),
  FOREIGN KEY (disease_id) REFERENCES Disease(id)
);

CREATE TABLE Visits (
  id int NOT NULL,
  patient_id int NOT NULL,
  doctor_id int NOT NULL,
  visit_date date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES Patient(id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

