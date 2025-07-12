--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: chat_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_members (
    id integer NOT NULL,
    chat_id integer,
    user_id integer,
    joined_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.chat_members OWNER TO postgres;

--
-- Name: chat_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_members_id_seq OWNER TO postgres;

--
-- Name: chat_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_members_id_seq OWNED BY public.chat_members.id;


--
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id bigint NOT NULL,
    name text,
    is_group boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chats_id_seq OWNER TO postgres;

--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    chat_id integer,
    sender_id integer,
    content text NOT NULL,
    sent_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nickname character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: chat_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_members ALTER COLUMN id SET DEFAULT nextval('public.chat_members_id_seq'::regclass);


--
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: chat_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_members (id, chat_id, user_id, joined_at) FROM stdin;
1	1	6	2025-07-09 10:38:01.945004
2	1	3	2025-06-22 10:38:01.945013
3	1	7	2025-06-27 10:38:01.945017
4	2	1	2025-06-16 10:38:01.94503
5	2	5	2025-06-20 10:38:01.945034
6	3	5	2025-07-02 10:38:01.945055
7	3	6	2025-07-11 10:38:01.945059
8	3	2	2025-07-09 10:38:01.945063
9	4	8	2025-06-15 10:38:01.945074
10	4	2	2025-06-19 10:38:01.945077
11	4	4	2025-06-23 10:38:01.945079
12	4	1	2025-07-08 10:38:01.945081
13	5	5	2025-06-18 10:38:01.945087
14	5	1	2025-07-08 10:38:01.94509
15	6	5	2025-07-09 10:38:01.945101
16	6	4	2025-06-26 10:38:01.945105
17	6	3	2025-06-13 10:38:01.945112
18	6	8	2025-06-18 10:38:01.945116
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, name, is_group, created_at) FROM stdin;
1	general	t	2025-06-06 10:38:01.944056
2	dev-chat	t	2025-06-28 10:38:01.944067
3	team-alpha	t	2025-06-01 10:38:01.94407
4	random	t	2025-07-06 10:38:01.944071
5	amin-bob	f	2025-05-23 10:38:01.944073
6	charlie-dina	f	2025-06-13 10:38:01.944075
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, chat_id, sender_id, content, sent_at) FROM stdin;
1	6	8	SQL — сила	2025-07-09 22:38:01.945833
2	2	3	Увидимся позже	2025-07-08 13:38:01.945844
3	5	2	Это важно	2025-07-05 13:38:01.94585
4	5	1	SQL — сила	2025-07-09 09:38:01.945854
5	6	6	SQL — сила	2025-07-04 11:38:01.945858
6	4	7	Привет	2025-07-06 07:38:01.945863
7	5	7	Погнали в проект	2025-07-05 12:38:01.945867
8	4	7	🔥	2025-07-08 12:38:01.945872
9	1	6	😂	2025-07-08 16:38:01.945877
10	4	7	Это важно	2025-07-05 15:38:01.945881
11	4	6	Что делаешь?	2025-07-10 03:38:01.945886
12	2	1	Увидимся позже	2025-07-10 01:38:01.94589
13	5	6	🔥	2025-07-10 19:38:01.945893
14	2	6	Что делаешь?	2025-07-04 11:38:01.945899
15	6	8	😂	2025-07-08 02:38:01.945906
16	4	2	Что делаешь?	2025-07-10 18:38:01.945912
17	2	3	Это важно	2025-07-04 14:38:01.945919
18	2	4	Что делаешь?	2025-07-04 18:38:01.945926
19	6	1	Увидимся позже	2025-07-09 14:38:01.945937
20	4	8	Как дела?	2025-07-06 19:38:01.945941
21	1	5	😂	2025-07-05 01:38:01.945948
22	4	8	Как дела?	2025-07-11 22:38:01.945955
23	3	1	Как дела?	2025-07-11 02:38:01.945962
24	6	6	Погнали в проект	2025-07-05 18:38:01.945969
25	4	5	🔥	2025-07-05 06:38:01.945976
26	5	7	😂	2025-07-08 08:38:01.945983
27	3	5	Это важно	2025-07-06 09:38:01.945992
28	5	3	😂	2025-07-11 06:38:01.945996
29	1	5	SQL — сила	2025-07-11 04:38:01.945999
30	5	7	Как дела?	2025-07-04 23:38:01.946003
31	6	3	Привет	2025-07-06 22:38:01.946007
32	1	5	😂	2025-07-05 23:38:01.946012
33	2	2	SQL — сила	2025-07-07 19:38:01.946016
34	3	2	Погнали в проект	2025-07-11 12:38:01.94602
35	3	5	Погнали в проект	2025-07-06 22:38:01.946025
36	2	4	Увидимся позже	2025-07-05 17:38:01.946029
37	4	7	Погнали в проект	2025-07-09 04:38:01.946033
38	2	6	Это важно	2025-07-04 14:38:01.946037
39	4	1	Как дела?	2025-07-07 18:38:01.946041
40	2	2	🔥	2025-07-05 17:38:01.946045
41	6	5	Привет	2025-07-06 00:38:01.946049
42	6	2	🔥	2025-07-06 04:38:01.946053
43	4	6	Привет	2025-07-10 00:38:01.946057
44	6	6	🔥	2025-07-07 11:38:01.946061
45	3	7	Как дела?	2025-07-07 18:38:01.946065
46	1	2	😂	2025-07-07 13:38:01.946069
47	3	8	Что делаешь?	2025-07-11 13:38:01.946074
48	2	8	Привет	2025-07-07 05:38:01.94608
49	6	4	Привет	2025-07-09 08:38:01.946086
50	6	6	Это важно	2025-07-09 21:38:01.946094
51	6	4	Привет	2025-07-08 06:38:01.946101
52	6	5	SQL — сила	2025-07-11 22:38:01.946104
53	3	3	SQL — сила	2025-07-10 10:38:01.946109
54	3	1	Увидимся позже	2025-07-05 18:38:01.946113
55	5	6	Что делаешь?	2025-07-09 03:38:01.946117
56	1	1	😂	2025-07-04 06:38:01.946124
57	6	4	Как дела?	2025-07-04 15:38:01.94613
58	4	7	😂	2025-07-11 21:38:01.946136
59	1	6	😂	2025-07-11 00:38:01.946141
60	3	1	Привет	2025-07-10 18:38:01.946145
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nickname, created_at) FROM stdin;
1	amin	2025-05-18 10:38:01.94262
2	bob	2025-06-28 10:38:01.942637
3	charlie	2025-04-23 10:38:01.94264
4	dina	2025-07-08 10:38:01.942643
5	elena	2025-04-15 10:38:01.942645
6	farid	2025-04-20 10:38:01.942647
7	giga	2025-04-11 10:38:01.942649
8	hassan	2025-04-26 10:38:01.942652
\.


--
-- Name: chat_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_members_id_seq', 18, true);


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chats_id_seq', 6, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 60, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: chat_members chat_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_members
    ADD CONSTRAINT chat_members_pkey PRIMARY KEY (id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: chat_members chat_members_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_members
    ADD CONSTRAINT chat_members_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_members chat_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_members
    ADD CONSTRAINT chat_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

