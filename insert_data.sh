#! /bin/bash

# Program to automatically insert data at once rathen than typing it one by one

PSQL="psql --username=freecodecamp --dbname=universe -t --no-align -c"

CREATE_DATA="$(
  $PSQL "
  CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    type VARCHAR(15) DEFAULT 'Spiral', 
    num_of_aliens NUMERIC DEFAULT 0 NOT NULL
  ); 

  CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT NOT NULL,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    type VARCHAR(15), 
    num_of_planets INT DEFAULT 0
  );

  CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT NOT NULL,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    type VARCHAR(15)
  );

  CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    is_spherical BOOLEAN DEFAULT TRUE NOT NULL
  );

  CREATE TABLE planet_info (
    planet_info_id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL UNIQUE,
    planet_id INT NOT NULL,
    has_life BOOLEAN DEFAULT FALSE NOT NULL,
    is_dwarf BOOLEAN DEFAULT FALSE NOT NULL,
    num_of_moons INT
  );

  ALTER TABLE star
  ADD FOREIGN KEY(galaxy_id) 
  REFERENCES galaxy(galaxy_id);

  ALTER TABLE planet
  ADD FOREIGN KEY(star_id) 
  REFERENCES star(star_id);

  ALTER TABLE planet_info
  ADD FOREIGN KEY(planet_id) 
  REFERENCES planet(planet_id);

  ALTER TABLE moon
  ADD FOREIGN KEY(planet_id) 
  REFERENCES planet(planet_id);
")"

if [[ $CREATE_DATA ]]
then
  echo "Successfully created the database"
fi

# Add and update more rows whenever you want

INSERT_DATA="$(
  $PSQL "
    INSERT INTO galaxy (name, description)
    VALUES
      ('Milky-way', 'Our home galaxy'),
      ('Andromeda', 'Galaxy that will kill us'),
      ('Triangulum', '3rd largest galaxy'),
      ('Galaxy 4', 'Add galaxy here'),
      ('Galaxy 5', 'Add galaxy here'),
      ('Galaxy 6', 'Add galaxy here');

    INSERT INTO star (galaxy_id, name, description, type, num_of_planets)
    VALUES 
      (1, 'Sun', 'Our star', '', 8),
      (1, 'Polaris', 'North star', '', 0),
      (1, 'Betelgeuse', 'Dying star', '', 0),
      (1, 'Sirius', 'White nice star', '', 0),
      (1, 'Proxima Centauri', 'Nearest star to Earth', '', 0),
      (1, 'Alpha Centauri', 'Idk', '', 0);

    INSERT INTO planet (star_id, name, description, type)
    VALUES
      (1, 'Mercury', 'Nearest planet to sun', 'Terrestrial'),
      (1, 'Venus', 'Hottest planet', 'Terrestrial'),
      (1, 'Earth', 'Our home', 'Terrestrial'),
      (1, 'Mars', 'Red planet', 'Terrestrial'),
      (1, 'Jupiter', 'Largest planet in the solar system', 'Gas Giant'),
      (1, 'Saturn', 'Planet with rings', 'Gas Giant'),
      (1, 'Uranus', 'Funny planet', 'Ice Giant'),
      (1, 'Neptune', 'Cold/Blue planet', 'Ice Giant'),
      (1, 'Pluto', 'Demoted planet', 'Dwarf'),
      (1, 'Makemake', 'Dwarf Planet', 'Dwarf'),
      (1, 'Haumea', 'Octal-shaped dwarf planet', 'Dwarf'),
      (1, 'Eris', 'Farthest planet (Oort Cloud)', 'Dwarf');

    INSERT INTO planet_info (planet_id, name, has_life, is_dwarf, num_of_moons)
    VALUES
      (3, 'Earth Info', TRUE, FALSE, 1),
      (9, 'Pluto Info', FALSE, TRUE, 5),
      (5, 'Jupiter Info', FALSE, FALSE, 95);

    INSERT INTO moon (planet_id, name, description, is_spherical)
    VALUES 
      (3, 'Earth moon', 'Our moon', TRUE),
      (5, 'Europa', '', TRUE),
      (5, 'Io', '', TRUE),
      (5, 'Ganymede', '', TRUE),
      (5, 'Callisto', '', TRUE),
      (5, 'Cyllene', '', TRUE),
      (4, 'Phobos', '', FALSE),
      (5, 'Deimos', '', FALSE),
      (6, 'Mimas', '', TRUE),
      (6, 'Enceladus', '', TRUE),
      (6, 'Tethys', '', TRUE),
      (6, 'Dione', '', TRUE),
      (6, 'Rhea', '', TRUE),
      (6, 'Titan', '', TRUE),
      (6, 'Iapetus', '', TRUE),
      (6, 'Phoebe', '', FALSE),
      (6, 'Epimetheus', '', FALSE),
      (7, 'Ariel', '', TRUE),
      (7, 'Umbriel', '', TRUE),
      (7, 'Titania', '', TRUE),
      (7, 'Oberon', '', TRUE),
      (7, 'Miranda', '', TRUE);
")"