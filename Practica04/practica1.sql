--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-06 18:04:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 16396)
-- Name: Casillas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Casillas";


ALTER SCHEMA "Casillas" OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16395)
-- Name: Geografico; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Geografico";


ALTER SCHEMA "Geografico" OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 16397)
-- Name: Partidos Politicos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Partidos Politicos";


ALTER SCHEMA "Partidos Politicos" OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 16398)
-- Name: Representantes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Representantes";


ALTER SCHEMA "Representantes" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "Casillas", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 16431)
-- Name: casillas; Type: TABLE; Schema: Casillas; Owner: postgres
--

CREATE TABLE casillas (
    seccion integer NOT NULL,
    "tipo casilla" "char"[] NOT NULL,
    aprobada "char"[] NOT NULL
);


ALTER TABLE casillas OWNER TO postgres;

SET search_path = "Geografico", pg_catalog;

--
-- TOC entry 189 (class 1259 OID 16407)
-- Name: Distritos; Type: TABLE; Schema: Geografico; Owner: postgres
--

CREATE TABLE "Distritos" (
    "id distriito" "char"[] NOT NULL,
    nombre "char"[]
);


ALTER TABLE "Distritos" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16399)
-- Name: Estados; Type: TABLE; Schema: Geografico; Owner: postgres
--

CREATE TABLE "Estados" (
    "id estado" "char"[] NOT NULL,
    nombre "char"[]
);


ALTER TABLE "Estados" OWNER TO postgres;

SET search_path = "Partidos Politicos", pg_catalog;

--
-- TOC entry 190 (class 1259 OID 16423)
-- Name: Partidos; Type: TABLE; Schema: Partidos Politicos; Owner: postgres
--

CREATE TABLE "Partidos" (
    "id partido" integer NOT NULL,
    siglas "char"[],
    nombre "char"[]
);


ALTER TABLE "Partidos" OWNER TO postgres;

SET search_path = "Representantes", pg_catalog;

--
-- TOC entry 194 (class 1259 OID 16445)
-- Name: Asistencias; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Asistencias" (
);


ALTER TABLE "Asistencias" OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16442)
-- Name: Log_representantes_aprobados; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Log_representantes_aprobados" (
);


ALTER TABLE "Log_representantes_aprobados" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16451)
-- Name: Representantes_aprobados; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Representantes_aprobados" (
);


ALTER TABLE "Representantes_aprobados" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16439)
-- Name: Representantes_datos; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Representantes_datos" (
);


ALTER TABLE "Representantes_datos" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16448)
-- Name: Representantes_preliminares; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Representantes_preliminares" (
);


ALTER TABLE "Representantes_preliminares" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16454)
-- Name: Representantes_sustituciones; Type: TABLE; Schema: Representantes; Owner: postgres
--

CREATE TABLE "Representantes_sustituciones" (
);


ALTER TABLE "Representantes_sustituciones" OWNER TO postgres;

SET search_path = "Casillas", pg_catalog;

--
-- TOC entry 2170 (class 0 OID 16431)
-- Dependencies: 191
-- Data for Name: casillas; Type: TABLE DATA; Schema: Casillas; Owner: postgres
--

COPY casillas (seccion, "tipo casilla", aprobada) FROM stdin;
\.


SET search_path = "Geografico", pg_catalog;

--
-- TOC entry 2168 (class 0 OID 16407)
-- Dependencies: 189
-- Data for Name: Distritos; Type: TABLE DATA; Schema: Geografico; Owner: postgres
--

COPY "Distritos" ("id distriito", nombre) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 16399)
-- Dependencies: 188
-- Data for Name: Estados; Type: TABLE DATA; Schema: Geografico; Owner: postgres
--

COPY "Estados" ("id estado", nombre) FROM stdin;
\.


SET search_path = "Partidos Politicos", pg_catalog;

--
-- TOC entry 2169 (class 0 OID 16423)
-- Dependencies: 190
-- Data for Name: Partidos; Type: TABLE DATA; Schema: Partidos Politicos; Owner: postgres
--

COPY "Partidos" ("id partido", siglas, nombre) FROM stdin;
\.


SET search_path = "Representantes", pg_catalog;

--
-- TOC entry 2173 (class 0 OID 16445)
-- Dependencies: 194
-- Data for Name: Asistencias; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Asistencias"  FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 16442)
-- Dependencies: 193
-- Data for Name: Log_representantes_aprobados; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Log_representantes_aprobados"  FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 16451)
-- Dependencies: 196
-- Data for Name: Representantes_aprobados; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Representantes_aprobados"  FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 16439)
-- Dependencies: 192
-- Data for Name: Representantes_datos; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Representantes_datos"  FROM stdin;
\.


--
-- TOC entry 2174 (class 0 OID 16448)
-- Dependencies: 195
-- Data for Name: Representantes_preliminares; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Representantes_preliminares"  FROM stdin;
\.


--
-- TOC entry 2176 (class 0 OID 16454)
-- Dependencies: 197
-- Data for Name: Representantes_sustituciones; Type: TABLE DATA; Schema: Representantes; Owner: postgres
--

COPY "Representantes_sustituciones"  FROM stdin;
\.


SET search_path = "Casillas", pg_catalog;

--
-- TOC entry 2049 (class 2606 OID 16438)
-- Name: casillas casillas_pkey; Type: CONSTRAINT; Schema: Casillas; Owner: postgres
--

ALTER TABLE ONLY casillas
    ADD CONSTRAINT casillas_pkey PRIMARY KEY (seccion, "tipo casilla", aprobada);


SET search_path = "Geografico", pg_catalog;

--
-- TOC entry 2045 (class 2606 OID 16414)
-- Name: Distritos Distritos_pkey; Type: CONSTRAINT; Schema: Geografico; Owner: postgres
--

ALTER TABLE ONLY "Distritos"
    ADD CONSTRAINT "Distritos_pkey" PRIMARY KEY ("id distriito");


--
-- TOC entry 2043 (class 2606 OID 16406)
-- Name: Estados Estados_pkey; Type: CONSTRAINT; Schema: Geografico; Owner: postgres
--

ALTER TABLE ONLY "Estados"
    ADD CONSTRAINT "Estados_pkey" PRIMARY KEY ("id estado");


SET search_path = "Partidos Politicos", pg_catalog;

--
-- TOC entry 2047 (class 2606 OID 16430)
-- Name: Partidos Partidos_pkey; Type: CONSTRAINT; Schema: Partidos Politicos; Owner: postgres
--

ALTER TABLE ONLY "Partidos"
    ADD CONSTRAINT "Partidos_pkey" PRIMARY KEY ("id partido");


-- Completed on 2017-09-06 18:04:52

--
-- PostgreSQL database dump complete
--

