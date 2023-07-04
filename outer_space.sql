-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(50)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits_around,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets,
  name VARCHAR(50)
);


  INSERT INTO orbits_around
    (name)
  VALUES
  ('The Sun'), 
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy)
VALUES
  ('Earth', 1.00, 1, 'Milky Way'),
  ('Mars', 1.88, 1, 'Milky Way'),
  ('Venus', 0.62, 1, 'Milky Way'),
  ('Neptune', 164.8, 1, 'Milky Way' ),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way');


INSERT INTO moons
  (planets_id, name)
VALUES
  (1, 'The Moon'),
  (2, 'Phobos'),
  (2, 'Deimos'),
  (4, 'Naiad'),
  (4, 'Thalassa'),
  (4, 'Despina'),
  (4, 'Galatea'),
  (4, 'Larissa'),
  (4, 'S/2004 N 1'),
  (4, 'Proteus'),
  (4, 'Triton'),
  (4, 'Nereid'),
  (4, 'Halimede'),
  (4, 'Sao'),
  (4, 'Laomedeia'),
  (4, 'Psamathe'),
  (4, 'Neso');


CREATE INDEX idx_planets_name ON "planets" (name);
CREATE INDEX idx_planets_orbits_around ON "planets" (orbits_around);
CREATE INDEX idx_planets_galaxy ON "planets" (galaxy);