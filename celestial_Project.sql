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
    galaxy_name character varying(50) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    is_active boolean NOT NULL,
    description text,
    name character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL,
    planet_id integer NOT NULL,
    is_tidally_locked boolean NOT NULL,
    name character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(50) NOT NULL,
    planet_type character varying(20) NOT NULL,
    diameter integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    star_id integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(50) NOT NULL,
    star_type character varying(20) NOT NULL,
    luminosity double precision NOT NULL,
    galaxy_id integer NOT NULL,
    is_visible boolean NOT NULL,
    name character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 26.80, true, 'Our home galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.50, true, 'The closest major galaxy to the Milky Way', NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 31.10, true, 'A famous interacting galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 29.30, true, 'A unique galaxy with a prominent dust lane', NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 11.80, true, 'The closest radio galaxy to Earth', NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 0.16, true, 'A satellite galaxy of the Milky Way', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 0.38, 1, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 0.01, 2, true, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 0.02, 2, true, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 3642, 0.42, 3, true, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 0.67, 3, true, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 1.07, 3, true, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 1.88, 3, true, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 1.22, 4, true, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 0.24, 4, true, NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 0.19, 4, true, NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 1530, 0.53, 4, true, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', 730, 3.56, 4, true, NULL);
INSERT INTO public.moon VALUES (13, 'Dione', 1122, 0.38, 4, true, NULL);
INSERT INTO public.moon VALUES (14, 'Tethys', 1050, 0.29, 4, true, NULL);
INSERT INTO public.moon VALUES (15, 'Hyperion', 170, 1.48, 4, false, NULL);
INSERT INTO public.moon VALUES (16, 'Miranda', 472, 0.13, 5, true, NULL);
INSERT INTO public.moon VALUES (17, 'Ariel', 1160, 0.19, 5, true, NULL);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1190, 0.27, 5, true, NULL);
INSERT INTO public.moon VALUES (19, 'Titania', 1578, 0.44, 5, true, NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', 1523, 0.58, 5, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 12742, 5.97, 1, true, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 6779, 0.64, 1, true, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 142984, 1898.00, 1, true, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 120536, 568.00, 1, true, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice Giant', 51118, 86.80, 1, true, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 49528, 102.00, 1, true, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', 'Terrestrial', 12104, 4.87, 1, true, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 4879, 0.33, 1, true, NULL);
INSERT INTO public.planet VALUES (9, 'Titan', 'Dwarf Planet', 5150, 1.35, 1, true, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf Planet', 1430, 0.01, 1, true, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-16b', 'Super-Earth', 9700, 5.50, 2, true, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'Super-Earth', 11200, 1.50, 3, true, NULL);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Milky Way Solar System', 'The solar system that includes the planet Earth and the Sun');
INSERT INTO public.solar_system VALUES (2, 'Andromeda Solar System', 'The solar system located in the Andromeda Galaxy');
INSERT INTO public.solar_system VALUES (3, 'Whirlpool Solar System', 'The solar system located in the Whirlpool Galaxy');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 25.4, 1, true, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 14000, 1, true, NULL);
INSERT INTO public.star VALUES (3, 'Vega', 'Main Sequence', 40, 1, true, NULL);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', 120000, 1, true, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 0.17, 1, true, NULL);
INSERT INTO public.star VALUES (6, 'Aldebaran', 'Red Giant', 150, 1, true, NULL);
INSERT INTO public.star VALUES (7, 'Antares', 'Red Supergiant', 9000, 2, true, NULL);
INSERT INTO public.star VALUES (8, 'Spica', 'Main Sequence', 2200, 2, true, NULL);
INSERT INTO public.star VALUES (9, 'Arcturus', 'Red Giant', 170, 1, true, NULL);
INSERT INTO public.star VALUES (10, 'Pollux', 'Giant', 30, 1, true, NULL);
INSERT INTO public.star VALUES (11, 'Deneb', 'Blue Supergiant', 196000, 1, true, NULL);
INSERT INTO public.star VALUES (12, 'Altair', 'Main Sequence', 10.8, 1, true, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

