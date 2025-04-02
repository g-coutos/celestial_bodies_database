--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text,
    size double precision,
    distance_from_earth double precision,
    number_of_stars double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer NOT NULL,
    moon_type text,
    mass double precision,
    diameter double precision,
    orbital_period double precision
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    planet_type text,
    mass numeric(10,0),
    diameter numeric(10,0),
    orbital_period numeric(10,0),
    has_moons boolean,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    planet_id integer NOT NULL,
    scientific_name text,
    legs integer,
    name character varying(50),
    life_expectancy integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.species ALTER COLUMN species_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    star_type text,
    mass numeric(5,2),
    temperature numeric(10,0),
    luminosity numeric(10,0),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Via Láctea', 'Espiral', 100000, 0, 100000000000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triângulo', 'Espiral', 60000, 2730000, 40000000000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Sombrero', 'Espiral', 50000, 29000000, 800000000000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Olho Negro', 'Espiral', 52000, 17000000, 100000000000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Bode', 'Espiral', 90000, 12000000, 1000000000000);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andrômeda', 'Espiral', 220000, 2500000, 1000000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Lua', 1, 'Rochosa', 0.0123, 3475, 27.3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Fobos', 2, 'Rochosa', 2e-14, 22, 0.32);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 2, 'Rochosa', 2e-15, 12, 1.26);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Kepler-186b-I', 4, 'Gelada', 0.002, 1000, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, '55 Cancri b-I', 8, 'Rochosa', 0.003, 1100, 2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'PSR B1620-26 b-I', 9, 'Gelada', 0.004, 1200, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'MOA-2007-BLG-192Lb-I', 11, 'Rochosa', 0.0001, 500, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, '42-S/2016 S 2', 1, 'Rochosa', 1e-20, 10, 0.5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Kepler-186f-I', 3, 'Rochosa', 0.0002, 600, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'HD 100777 c-I', 6, 'Gelada', 0.0003, 700, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'PSR B1620-26 c-I', 10, 'Rochosa', 0.0004, 800, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'MOA-2007-BLG-192Lc-I', 12, 'Gelada', 0.0005, 900, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, '43-S/2016 S 3', 1, 'Rochosa', 2e-20, 11, 0.6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Kepler-186f-II', 3, 'Rochosa', 0.0003, 700, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'HD 100777 c-II', 6, 'Gelada', 0.0004, 800, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'PSR B1620-26 c-II', 10, 'Rochosa', 0.0005, 900, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'MOA-2007-BLG-192Lc-II', 12, 'Gelada', 0.0006, 1000, 9);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, '44-S/2016 S 4', 1, 'Rochosa', 3e-20, 12, 0.7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Kepler-186f-III', 3, 'Rochosa', 0.0004, 800, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'HD 100777 c-III', 6, 'Gelada', 0.0005, 900, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Terra', 'Rochoso', 1, 12742, 365, true, true, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Marte', 'Rochoso', 0, 6779, 687, true, false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Kepler-186f', 'Rochoso', 1, 14000, 130, false, false, 2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Kepler-186b', 'Gasoso', 8, 40000, 22, true, false, 2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'HD 100777 b', 'Gasoso', 1, 142984, 383, false, false, 3);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'HD 100777 c', 'Gasoso', 6, 139822, 2200, false, false, 3);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, '55 Cancri e', 'Rochoso', 9, 12742, 1, false, false, 4);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, '55 Cancri b', 'Gasoso', 1, 142984, 15, true, false, 4);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'PSR B1620-26 b', 'Gasoso', 3, 142984, 36525, true, false, 5);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'PSR B1620-26 c', 'Gasoso', 1, 139822, 109575, false, false, 5);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'MOA-2007-BLG-192Lb', 'Rochoso', 0, 6371, 3000, true, false, 6);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'MOA-2007-BLG-192Lc', 'Gasoso', 0, 69911, 10000, false, false, 6);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Homo sapiens', 2, 'Human', 80);
INSERT INTO public.species OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Canis marteus', 4, 'Martian Wolf', 50);
INSERT INTO public.species OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Arbor gigas', 0, 'Giant Tree', 1000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sol', 'G2V', 1.00, 5778, 1, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Alpha Andromedae', 'B8V', 3.50, 13000, 200, 2);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Alpha Trianguli', 'F6IV', 1.50, 6500, 10, 3);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Alpha Comae Berenices', 'F5V', 1.30, 6400, 5, 4);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'M64-UCD1', 'G-Type', 0.00, 4000, 0, 5);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 82 X-1', 'Desconhecido', 20.00, 20000, 100000, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_planet_id_key UNIQUE (moon_id, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_star_id_key UNIQUE (planet_id, star_id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: species species_species_id_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_species_id_planet_id_key UNIQUE (species_id, planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_galaxy_id_key UNIQUE (star_id, galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

