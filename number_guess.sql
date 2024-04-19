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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 100000
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES ('user_1713561485318', 2, 341);
INSERT INTO public.game VALUES ('user_1713562458429', 2, 171);
INSERT INTO public.game VALUES ('user_1713561485319', 5, 5);
INSERT INTO public.game VALUES ('user_1713562458430', 5, 48);
INSERT INTO public.game VALUES ('user_1713561497234', 2, 270);
INSERT INTO public.game VALUES ('user_1713561497235', 5, 87);
INSERT INTO public.game VALUES ('Luis', 2, 6);
INSERT INTO public.game VALUES ('op', 2, 9);
INSERT INTO public.game VALUES ('Luis_500000000000', 1, 10);
INSERT INTO public.game VALUES ('user_1713561895454', 2, 624);
INSERT INTO public.game VALUES ('user_1713561895455', 5, 389);
INSERT INTO public.game VALUES ('user_1713562392831', 2, 559);
INSERT INTO public.game VALUES ('user_1713562392832', 5, 100);


--
-- Name: game game_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

