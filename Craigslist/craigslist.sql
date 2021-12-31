-- file is meant to be used as a quick way to initialize a database with the tables to represent the medical center ERD
CREATE DATABASE IF NOT EXISTS Craigslist;
USE Craigslist;

-- added this block of statements in case the file is modified and needs to be run again
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Posts;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Users (
  username char(30) NOT NULL,
  preferred_region int,
  email char(100) NOT NULL,
  password char(255) NOT NULL,
  PRIMARY KEY (username)
);

CREATE TABLE Region (
  id int NOT NULL,
  name char(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Category (
  id int NOT NULL,
  name char(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Posts (
  id int NOT NULL,
  user_id char(30) NOT NULL,
  category_id int NOT NULL,
  region_id int NOT NULL,
  title char(100) NOT NULL,
  text varchar(3000) NOT NULL,
  location char(255),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES Users(username),
  FOREIGN KEY (category_id) REFERENCES Category(id),
  FOREIGN KEY (region_id) REFERENCES Region(id)
);

