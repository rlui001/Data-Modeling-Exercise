-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
-- USE air_traffic;

CREATE TABLE Customer
(
  id SERIAL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL, 
  PRIMARY KEY(id)
);

-- decided to use integer for id instead of just country name for pkey because it is better for performance
CREATE TABLE Country
(
  id SERIAL,
  country_name TEXT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE City
(
  id SERIAL,
  country_id BIGINT UNSIGNED NOT NULL,
  city_name TEXT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (country_id) REFERENCES Country(id)
);

CREATE TABLE Airlines
(
  id SERIAL,
  airline_name TEXT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Flight
(
  id SERIAL,
  airline_id BIGINT UNSIGNED NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  seat TEXT NOT NULL,
  depart_city INT NOT NULL,
  destination_city INT NOT NULL CHECK (destination_city <> depart_city),
  PRIMARY KEY(id),
  FOREIGN KEY (airline_id) REFERENCES Airlines(id),
  FOREIGN KEY (depart_city) REFERENCES City(id),
  FOREIGN KEY (destination_city) REFERENCES City(id)
);

CREATE TABLE tickets
(
  id SERIAL,
  customer_id BIGINT UNSIGNED NOT NULL,
  flight_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (customer_id) REFERENCES Customer(id),
  FOREIGN KEY (flight_id) REFERENCES Flight(id)
);




-- -- Did not update section below to match new design
-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');