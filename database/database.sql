--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: films; Type: TABLE; Schema: public; Owner: app-b
--

CREATE TABLE films (
    code character(5) NOT NULL,
    title character varying(40) NOT NULL,
    did integer NOT NULL,
    date_prod date,
    kind character varying(10),
    len interval hour to minute
);


ALTER TABLE films OWNER TO "app-b";

--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: app-b
--

COPY films (code, title, did, date_prod, kind, len) FROM stdin;
UA502	Bananas	105	1971-07-13	Comedy	01:22:00
\.


--
-- Name: films firstkey; Type: CONSTRAINT; Schema: public; Owner: app-b
--

ALTER TABLE ONLY films
    ADD CONSTRAINT firstkey PRIMARY KEY (code);


--
-- PostgreSQL database dump complete
--

