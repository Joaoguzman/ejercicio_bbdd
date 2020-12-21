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
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria bigint NOT NULL,
    nombre character varying(30)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente bigint NOT NULL,
    nombre character varying(30),
    apellido character varying(30),
    telefono character varying(11),
    email character varying(50),
    fecha_pago_suscripcion date
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- Name: detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle (
    id_detalle bigint NOT NULL,
    id_transaccion integer,
    id_producto integer,
    cantidad numeric,
    total numeric
);


ALTER TABLE public.detalle OWNER TO postgres;

--
-- Name: detalle_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_id_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_id_detalle_seq OWNER TO postgres;

--
-- Name: detalle_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_id_detalle_seq OWNED BY public.detalle.id_detalle;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_productos bigint NOT NULL,
    id_categoria integer,
    nombre character varying(30),
    precio numeric,
    stock numeric
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_productos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_productos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_productos_seq OWNER TO postgres;

--
-- Name: productos_id_productos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_productos_seq OWNED BY public.productos.id_productos;


--
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaccion (
    id_transaccion bigint NOT NULL,
    id_cliente integer,
    fecha date
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaccion_id_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaccion_id_transaccion_seq OWNER TO postgres;

--
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaccion_id_transaccion_seq OWNED BY public.transaccion.id_transaccion;


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- Name: detalle id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_id_detalle_seq'::regclass);


--
-- Name: productos id_productos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_productos SET DEFAULT nextval('public.productos_id_productos_seq'::regclass);


--
-- Name: transaccion id_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion ALTER COLUMN id_transaccion SET DEFAULT nextval('public.transaccion_id_transaccion_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, nombre) FROM stdin;
1	producto
2	pase
3	plan de suscripcion
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nombre, apellido, telefono, email, fecha_pago_suscripcion) FROM stdin;
26	Wendy	Sargent	0894148648	auctor.non.feugiat@nequepellentesquemassa.org	2020-06-03
27	Dexter	Rush	0820322547	et.arcu.imperdiet@eratvel.org	2020-01-07
28	Jacob	Bell	0515332267	diam.dictum@odio.edu	2020-02-10
29	Raymond	Ingram	0489852144	est.tempor.bibendum@Nuncmauris.edu	2020-05-11
30	Chaim	Burke	0632071152	amet.consectetuer.adipiscing@ultricesmausipsum.ca	2020-08-01
31	Cade	Lane	0883849240	feugiat@vestibulum.co.uk	2020-09-05
32	Dillon	Nielsen	0832035463	eget.odio@sitametconsectetuer.net	2020-12-04
33	Gannon	Kent	0833347963	ligula.eu.enim@feugiattellus.org	2020-11-03
34	Delilah	Sexton	0499817245	vitae@lobortis.net	2020-04-12
35	Emi	Witt	0976049406	sem.consequat@infaucibusorci.edu	2020-10-08
36	Libby	Holloway	0645880957	pede@tempus.net	2020-06-05
37	Amber	Decker	0799677197	id@Cras.co.uk	2020-12-06
38	Lewis	French	0551416892	augue.Sed@sedsemegestas.co.uk	2020-03-10
39	Melissa	Blackburn	0352161176	arcu.Vestibulum.ante@tristiquepharetra.co.uk	2020-08-09
40	Rudyard	Cross	0618459788	vel.pede@dapibus.net	2020-03-09
41	Hollee	Berg	0727981736	fringilla.ornare@aliquetmolestietellus.ca	2020-05-05
42	Byron	Mosley	0752145861	velit.Quisque.varius@magnaPraesent.org	2020-12-06
43	Irma	Mcknight	0806670509	et.arcu@sitametlorem.org	2020-07-03
44	Jaime	Sanchez	0415265423	elit.pede@sagittissemper.ca	2020-07-03
45	Conan	Callahan	0477320416	luctus.felis.purus@in.co.uk	2020-06-03
46	Heidi	Norris	0594385973	montes@ametlorem.co.uk	2020-01-10
47	Carla	Holden	0676739510	velit@idnuncinterdum.ca	2020-01-03
48	Aaron	Gillespie	0189524801	Suspendisse@orci.net	2020-11-08
49	Shaeleigh	Long	0784206046	tempus.non@Donecluctus.co.uk	2020-04-01
50	Hall	Holden	0421912440	lorem.auctor.quis@dolor.edu	2020-07-03
51	Cedric	Edwards	053722652	amet@auctor.ca	2020-06-06
52	Caryn	Byers	0822331661	eget@vitae.edu	2020-02-01
53	Andrew	Rose	0727177083	luctus.et@nuncsedpede.org	2020-04-11
54	Edward	Pugh	0922572805	Donec.porttitor.tellus@quisdiamluctus.com	2020-03-02
55	Hamish	Phelps	0836874043	eros.nec.tellus@Fusce.org	2020-01-02
56	Laith	Crosby	0815488337	sed.facilisis.vitae@ornarelectusante.ca	2020-07-09
57	Kitra	Lambert	0605540886	est.arcu@feugiattelluslorem.com	2020-12-04
\.


--
-- Data for Name: detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle (id_detalle, id_transaccion, id_producto, cantidad, total) FROM stdin;
1	1	13	1	2500
2	1	7	1	1500
3	2	10	1	600
4	4	16	1	25000
5	4	15	1	3000
6	4	10	1	600
7	5	16	1	25000
8	5	5	1	500
9	6	15	1	3000
10	6	7	1	1500
11	6	11	1	1200
12	7	14	1	5000
13	8	19	1	150000
14	10	12	1	7000
15	10	13	1	2500
16	10	12	1	7000
17	11	15	1	3000
18	11	15	1	3000
19	12	13	1	2500
20	12	4	1	1500
21	13	15	1	3000
22	13	14	1	5000
23	13	10	1	600
24	15	5	1	500
25	15	9	1	1500
26	16	18	1	90000
27	16	10	1	600
28	17	5	1	500
29	18	7	1	1500
30	18	19	1	150000
31	18	8	1	300
32	20	19	1	150000
33	21	11	1	1200
34	21	14	1	5000
35	21	7	1	1500
36	22	4	1	1500
37	23	19	1	150000
38	24	18	1	90000
39	24	19	1	150000
40	24	4	1	1500
41	27	12	1	7000
42	27	15	1	3000
43	30	11	1	1200
44	30	4	1	1500
45	31	4	1	1500
46	31	9	1	1500
47	32	6	1	500
48	32	10	1	600
49	33	8	1	300
50	33	17	1	70000
51	34	19	1	150000
52	34	5	1	500
53	34	17	1	70000
54	35	12	1	7000
55	35	6	1	500
56	35	8	1	300
57	36	17	1	70000
58	37	9	1	1500
59	37	12	1	7000
60	40	11	1	1200
61	41	16	1	25000
62	41	18	1	90000
63	42	9	1	1500
64	42	12	1	7000
65	43	4	1	1500
66	43	8	1	300
67	44	16	1	25000
68	44	16	1	25000
69	45	13	1	2500
70	46	17	1	70000
71	46	12	1	7000
72	46	8	1	300
73	47	7	1	1500
74	47	9	1	1500
75	47	14	1	5000
76	48	7	1	1500
77	49	15	1	3000
78	50	11	1	1200
79	51	9	1	1500
80	52	13	1	2500
81	52	11	1	1200
82	53	16	1	25000
83	53	5	1	500
84	54	8	1	300
85	55	19	1	150000
86	56	18	1	90000
87	56	3	1	5000
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_productos, id_categoria, nombre, precio, stock) FROM stdin;
2	1	Toalla de Mano	2500	100
3	1	Toalla de Cuerpo	5000	100
4	1	Gorro de piscina	1500	100
5	1	Shampoo 10ml	500	100
6	1	Jabon 50gr	500	100
7	1	Barra de Proteina 45gr	1500	100
8	1	Chocolate 35gr	300	100
9	1	Batido proteico	1500	100
10	1	Agua mineral 500cc	600	100
11	1	Bebida isotonica	1200	100
12	2	Acceso Total	7000	100
13	2	Acceso a Maquinas	2500	100
14	2	Acceso piscina	5000	100
15	2	Clases Dirigidas	3000	100
16	3	Plan Mensual	25000	100
17	3	Plan Trimestal	70000	100
18	3	Plan Cuatrimestral	90000	100
19	3	Plan Semestral	150000	100
20	3	Plan Anual	250000	100
\.


--
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaccion (id_transaccion, id_cliente, fecha) FROM stdin;
1	46	2020-01-01
2	29	2020-01-01
3	34	2020-01-03
4	50	2020-01-03
5	31	2020-01-03
6	57	2020-01-03
7	37	2020-01-04
8	56	2020-01-04
9	32	2020-01-04
10	47	2020-01-04
11	47	2020-01-04
12	36	2020-01-04
13	52	2020-01-04
14	43	2020-01-05
15	51	2020-01-05
16	34	2020-01-05
17	30	2020-01-05
18	39	2020-01-05
19	27	2020-01-05
20	48	2020-01-05
21	30	2020-01-06
22	37	2020-01-06
23	27	2020-01-06
24	49	2020-01-06
25	33	2020-01-06
26	49	2020-01-07
27	43	2020-01-07
28	52	2020-01-07
29	26	2020-01-07
30	34	2020-01-08
31	56	2020-01-08
32	28	2020-01-08
33	48	2020-01-09
34	31	2020-01-09
35	43	2020-01-10
36	48	2020-01-10
37	56	2020-01-10
38	54	2020-01-11
39	36	2020-01-11
40	44	2020-02-01
41	47	2020-02-01
42	47	2020-02-01
43	54	2020-02-01
44	30	2020-02-01
45	56	2020-02-01
46	57	2020-02-01
47	53	2020-02-01
48	41	2020-02-01
49	31	2020-02-02
50	56	2020-02-02
51	36	2020-02-02
52	53	2020-02-02
53	26	2020-02-02
54	55	2020-02-03
55	41	2020-02-03
56	27	2020-02-03
\.


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 3, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 57, true);


--
-- Name: detalle_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_id_detalle_seq', 87, true);


--
-- Name: productos_id_productos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_productos_seq', 20, true);


--
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaccion_id_transaccion_seq', 1, false);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: detalle detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT detalle_pkey PRIMARY KEY (id_detalle);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_productos);


--
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id_transaccion);


--
-- Name: productos fk_id_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- Name: transaccion fk_id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- Name: detalle fk_id_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT fk_id_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_productos);


--
-- Name: detalle fk_id_transaccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT fk_id_transaccion FOREIGN KEY (id_transaccion) REFERENCES public.transaccion(id_transaccion);


--
-- PostgreSQL database dump complete
--

