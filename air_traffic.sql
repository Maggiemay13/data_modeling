-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE locations
(
  id SERIAL PRIMARY KEY, 
  city_name TEXT NOT NULL, 
  country_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_location INTEGER REFERENCES locations,
  to_location INTEGER REFERENCES locations
);


INSERT INTO locations 
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Seattle', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');
  


INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_location, to_location)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 4),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 11),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 15),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 13, 14),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 15, 16),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);