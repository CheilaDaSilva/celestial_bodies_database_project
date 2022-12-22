-- DROP DATABASE universe

CREATE DATABASE universe

USE universe

/* create tables */

CREATE TABLE galaxy (
    galaxy_id integer NOT NULL identity(1,1),
    name character varying(100) NOT NULL,
    galaxy_shape character varying(40),
    galaxy_group character varying(50),
    constellation character varying(50),
    diameter_in_light_years integer,
    milky_way_satellite tinyint
);


CREATE TABLE moon (
    moon_id integer NOT NULL identity(1,1),
    name character varying(100) NOT NULL,
    planet_id integer,
    orbital_period numeric(8,3),
    mean_radius_in_km integer,
    note text
);


CREATE TABLE planet (
    planet_id integer NOT NULL identity(1,1),
    name character varying(100) NOT NULL,
    number_of_satellites integer,
    planet_type_id integer,
    has_life tinyint,
    orbital_period numeric(10,3),
    mean_radius_in_km integer,
    star_id integer
);


CREATE TABLE planet_type (
    planet_type_id integer NOT NULL identity(1,1),
    name character varying(50) NOT NULL,
    description text
);


CREATE TABLE star (
    star_id integer NOT NULL identity(1,1),
    name character varying(100) NOT NULL,
    galaxy_id integer,
    constellation character varying(50),
    absolute_magnitude numeric(10,2),
    age_in_billion_years numeric(5,2),
    distance_from_earth_in_light_years integer,
    distance_from_sun_in_light_years integer
);


/* insert data into galaxy */

INSERT INTO galaxy(name, galaxy_shape, galaxy_group, constellation, diameter_in_light_years, milky_way_satellite) 
VALUES 
('Milky Way', 'spiral', 'Local Group', 'Sagittarius', 87400, 0)
,('Andromeda', 'spiral', 'Local Group', 'Andromeda', 152000, 0)
,('Triangulum', 'spiral', 'Local Group', 'Triangulum', 60000, 0)
,('Large Magellatic Cloud', 'magellatic spiral', 'Local Group', 'Dorado', 32200, 1)
,('NGC 3109', 'magellatic spiral', 'Antlia-Sextans Group', 'Hydra', NULL, 0)
,('Sextans A (UGCA 205)', 'irregular', 'Antlia-Sextans Group', 'Sextans', NULL, 0)
,('Leo P', 'irregular', 'Antlia-Sextans Group', 'Leo', NULL, 0)
,('Sculptor Dwarf', 'dwarf spheroidal', NULL, 'Sculptor', NULL, 1)
,('Draco Dwarf', 'dwar spheroidal', NULL, 'Draco', NULL, 1)
,('M32', 'elliptical', NULL, 'Andromeda', NULL, 0)
,('Pisces Dwarf', 'irregular', NULL, 'Pisces', NULL, 0)
,('NGC 147', 'dwarf elliptical', NULL, 'Cassiopeia', NULL, 0)
,('Hercules', 'dwarf spheroidal', NULL, 'Hercules', NULL, 1)
,('SagDSG', 'dwarf spheroidal', NULL, 'Sagittarius', NULL, 1)

/* view galaxy table */

select * from galaxy


/* insert data into moon table */

INSERT INTO moon(name, planet_id, orbital_period, mean_radius_in_km, note)
VALUES ('Moon', 3, 27.321, 1737, NULL)
,('Phobos', 6, 0.319, 11, NULL)
,('Deimos', 6, 1.263, 6, NULL)
,('Io', 10, 1.769, 1821, NULL)
,('Europa', 10, 3.551, 1560, NULL)
,('Ganymed', 10, 7.155, 2634, NULL)
,('Callisto', 10, 16.690, 2410, NULL)
,('Titan', 11, 15.945, 2575, NULL)
,('Enceladus', 11, 1.370, 252, NULL)
,('Lapetus', 11, 79.321, 734, NULL)
,('Rhea', 11, 4.518, 764, NULL)
,('Keptler-1625b I', 7, NULL, NULL, 'unofficial exomoon')
,('Triton', 9, 5.877, 1354, NULL)
,('Proteus', 9, 1.122, 210, NULL)
,('Nereid', 9, 360.110, 175, NULL)
,('Thalassa', 9, 0.311, 41, NULL)
,('Titania', 8, 8.706, 788, NULL)
,('Ariel', 8, 2.520, 579, NULL)
,('Oberon', 8, 13.463, 761, NULL)
,('Miranda', 8, 1.413, 236, NULL);

/* view moon table */

SELECT * FROM moon


/* insert data into planet */

INSERT INTO planet(name, number_of_satellites, planet_type_id, has_life, orbital_period, mean_radius_in_km, star_id)
VALUES ('Epsilon Andromedae b', 0, 3, 0, 4.617, NULL, 6)
,('Epsilon Andromedae d', NULL, 3, 0, 1290.200, NULL, 6)
,('Earth', 1, 1, 1, 365.256, 6327, 1)
,('Mercury', 0, 1, 0, 87.969, 2439, 1)
,('Venus', 0, 1, 0, 224.701, 6051, 1)
,('Mars', 2, 1, 0, 686.980, 3389, 1)
,('Kepler-1625b', NULL, 3, 0, 287.379, NULL, 7)
,('Uranus', 27, 2, 0, 30688.500, 25562, 1)
,('Neptune', 14, 2, 0, 60195.000, 24622, 1)
,('Jupiter', 80, 3, 0, 4332.500, 69911, 1)
,('Saturn', 83, 3, 0, 10759.220, 54232, 1)
,('Gliese 163c', 0, 4, 0, 25.631, NULL, 8)

/* view planet table */

SELECT * FROM planet

/* insert data into planet type table */

INSERT INTO planet_type(name, description)
VALUES ('Terrestrial', 'Planet composed primarly of silicate rocks or metals.')
,('Ice Giant', 'Giant planet composed mainly of elements heavier than hydrogen and helium, such as oxygen, carbon, nitrogen and sulfur.')
,('Gas Giant', 'Giant planet mainly composed of hydrogen and helium. Also called failed stars because they contain the same basic elements as a star.')
,('Habitable Exoplanet', 'Potentially habitable, hypothetical type of planet that has liquid water and may support life')

/* view planet type table */

SELECT * FROM planet_type

/* insert data into star */

INSERT INTO star(name, galaxy_id, constellation, absolute_magnitude, age_in_billion_years, distance_from_earth_in_light_years, distance_from_sun_in_light_years)
VALUES 
('Sun', 1, NULL, 4.83, 4.60, NULL, NULL)
,('Antares', 1, 'Scorpius', -5.28, 11.01, 550, NULL)
,('Epsilon Sagittari', 1, 'Sagittarius', -1.41, 0.23, 143, NULL)
,('RW Cephei', 1, 'Cephei', -8.00, 18.70, 3500, NULL)
,('Alpheratz', 2, 'Andromeda', 2.00, 60.00, NULL, 97)
,('Upsilon Andromedae', 2, 'Andromeda', 3.44, 3.00, 44, NULL)
,('Kepler-1625', 1, 'Cygnus', NULL, 8.70, 8000, NULL)
,('Gliese 163', 4, 'Dorado', 10.91, 5.00, NULL, 49)


/* view star table */

SELECT * FROM star


/* add unique constraints to name columns */

ALTER TABLE galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);

ALTER TABLE moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);

ALTER TABLE planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);

ALTER TABLE planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);

ALTER TABLE star
    ADD CONSTRAINT star_name_key UNIQUE (name);


/* add primary key constraints to tables */

ALTER TABLE galaxy ADD PRIMARY KEY(galaxy_id)

ALTER TABLE moon ADD PRIMARY KEY(moon_id)

ALTER TABLE planet ADD PRIMARY KEY(planet_id)

ALTER TABLE planet_type ADD PRIMARY KEY(planet_type_id)

ALTER TABLE star ADD PRIMARY KEY(star_id)


/* add foreign key constraints */

ALTER TABLE moon 
	ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

ALTER TABLE planet
    ADD FOREIGN KEY (planet_type_id) REFERENCES planet_type(planet_type_id);

ALTER TABLE planet
    ADD FOREIGN KEY (star_id) REFERENCES star(star_id);

ALTER TABLE star
    ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);


/* 
join all tables - Looking at how each object relates to another
galaxy -> start -> planet -> planet_type 
*/

SELECT 
galaxy.name as galaxy
, star.name as star
, planet.name as planet
, planet_type.name as planet_type
FROM galaxy	
	FULL OUTER JOIN star ON galaxy.galaxy_id = star.galaxy_id
	FULL OUTER JOIN planet ON star.star_id = planet.star_id
	FULL OUTER JOIN planet_type ON planet.planet_type_id = planet_type.planet_type_id

