--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: categoria_pase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_pase (
    id bigint NOT NULL,
    nombre_categoria character varying(20),
    precio character varying(6)
);


ALTER TABLE public.categoria_pase OWNER TO postgres;

--
-- Name: categoria_pase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_pase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_pase_id_seq OWNER TO postgres;

--
-- Name: categoria_pase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_pase_id_seq OWNED BY public.categoria_pase.id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nombre character varying(15),
    apellidos character varying(25),
    telefono character varying(11),
    email character varying(30),
    fecha character varying(15)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: productos_comercializados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_comercializados (
    id bigint NOT NULL,
    nombre character varying(15),
    precio character varying(6)
);


ALTER TABLE public.productos_comercializados OWNER TO postgres;

--
-- Name: productos_comercializados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_comercializados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_comercializados_id_seq OWNER TO postgres;

--
-- Name: productos_comercializados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_comercializados_id_seq OWNED BY public.productos_comercializados.id;


--
-- Name: suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suscripcion (
    id bigint NOT NULL,
    nombre_suscripcion character varying(20),
    precio character varying(6)
);


ALTER TABLE public.suscripcion OWNER TO postgres;

--
-- Name: suscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suscripcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suscripcion_id_seq OWNER TO postgres;

--
-- Name: suscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suscripcion_id_seq OWNED BY public.suscripcion.id;


--
-- Name: categoria_pase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_pase ALTER COLUMN id SET DEFAULT nextval('public.categoria_pase_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: productos_comercializados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_comercializados ALTER COLUMN id SET DEFAULT nextval('public.productos_comercializados_id_seq'::regclass);


--
-- Name: suscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion ALTER COLUMN id SET DEFAULT nextval('public.suscripcion_id_seq'::regclass);


--
-- Data for Name: categoria_pase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria_pase (id, nombre_categoria, precio) FROM stdin;
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre, apellidos, telefono, email, fecha) FROM stdin;
\.


--
-- Data for Name: productos_comercializados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_comercializados (id, nombre, precio) FROM stdin;
\.


--
-- Data for Name: suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suscripcion (id, nombre_suscripcion, precio) FROM stdin;
\.


--
-- Name: categoria_pase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_pase_id_seq', 1, false);


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);


--
-- Name: productos_comercializados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_comercializados_id_seq', 1, false);


--
-- Name: suscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suscripcion_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

