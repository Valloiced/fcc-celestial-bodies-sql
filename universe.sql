--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    description text,
    type character varying(15) DEFAULT 'Spiral'::character varying,
    num_of_aliens numeric DEFAULT 0 NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean DEFAULT true NOT NULL
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(15)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    name character varying(15) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    is_dwarf boolean DEFAULT false NOT NULL,
    num_of_moons integer
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_planet_info_id_seq OWNED BY public.planet_info.planet_info_id;


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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(15),
    num_of_planets integer DEFAULT 0
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
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_planet_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky-way', 'Our home galaxy', 'Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxy that will kill us', 'Spiral', 0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', '3rd largest galaxy', 'Spiral', 0);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 'Add galaxy here', 'Spiral', 0);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 'Add galaxy here', 'Spiral', 0);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 'Add galaxy here', 'Spiral', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Earth moon', 'Our moon', true);
INSERT INTO public.moon VALUES (2, 5, 'Europa', '', true);
INSERT INTO public.moon VALUES (3, 5, 'Io', '', true);
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', '', true);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', '', true);
INSERT INTO public.moon VALUES (6, 5, 'Cyllene', '', true);
INSERT INTO public.moon VALUES (7, 4, 'Phobos', '', false);
INSERT INTO public.moon VALUES (8, 5, 'Deimos', '', false);
INSERT INTO public.moon VALUES (9, 6, 'Mimas', '', true);
INSERT INTO public.moon VALUES (10, 6, 'Enceladus', '', true);
INSERT INTO public.moon VALUES (11, 6, 'Tethys', '', true);
INSERT INTO public.moon VALUES (12, 6, 'Dione', '', true);
INSERT INTO public.moon VALUES (13, 6, 'Rhea', '', true);
INSERT INTO public.moon VALUES (14, 6, 'Titan', '', true);
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', '', true);
INSERT INTO public.moon VALUES (16, 6, 'Phoebe', '', false);
INSERT INTO public.moon VALUES (17, 6, 'Epimetheus', '', false);
INSERT INTO public.moon VALUES (18, 7, 'Ariel', '', true);
INSERT INTO public.moon VALUES (19, 7, 'Umbriel', '', true);
INSERT INTO public.moon VALUES (20, 7, 'Titania', '', true);
INSERT INTO public.moon VALUES (21, 7, 'Oberon', '', true);
INSERT INTO public.moon VALUES (22, 7, 'Miranda', '', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Nearest planet to sun', 'Terrestrial');
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Hottest planet', 'Terrestrial');
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Our home', 'Terrestrial');
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Red planet', 'Terrestrial');
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Largest planet in the solar system', 'Gas Giant');
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Planet with rings', 'Gas Giant');
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Funny planet', 'Ice Giant');
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Cold/Blue planet', 'Ice Giant');
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 'Demoted planet', 'Dwarf');
INSERT INTO public.planet VALUES (10, 1, 'Makemake', 'Dwarf Planet', 'Dwarf');
INSERT INTO public.planet VALUES (11, 1, 'Haumea', 'Octal-shaped dwarf planet', 'Dwarf');
INSERT INTO public.planet VALUES (12, 1, 'Eris', 'Farthest planet (Oort Cloud)', 'Dwarf');


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, 'Earth Info', 3, true, false, 1);
INSERT INTO public.planet_info VALUES (2, 'Pluto Info', 9, false, true, 5);
INSERT INTO public.planet_info VALUES (3, 'Jupiter Info', 5, false, false, 95);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Our star', '', 8);
INSERT INTO public.star VALUES (2, 1, 'Polaris', 'North star', '', 0);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'Dying star', '', 0);
INSERT INTO public.star VALUES (4, 1, 'Sirius', 'White nice star', '', 0);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 'Nearest star to Earth', '', 0);
INSERT INTO public.star VALUES (6, 1, 'Alpha Centauri', 'Idk', '', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_planet_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_info planet_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_name_key UNIQUE (name);


--
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

