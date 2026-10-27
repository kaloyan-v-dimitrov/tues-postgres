--
-- PostgreSQL database dump
--

\restrict nBjTwGnlrQQU5ZWvX2Frjl6MjroxcBBz9R9d48Tjwx4xBdMvmMfYYraD4uGZjyP

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channels (
    id bigint NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.channels OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.channels ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    user_id bigint NOT NULL,
    body text NOT NULL,
    sent_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT messages_body_check CHECK ((length(body) > 0))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username text NOT NULL,
    country character(2) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channels (id, name, created_at) FROM stdin;
1	general	2026-09-01 05:00:00+00
2	homework	2026-09-01 05:05:00+00
3	games	2026-09-01 05:10:00+00
4	empty	2026-09-04 07:00:00+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, channel_id, user_id, body, sent_at) FROM stdin;
1	1	1	Hello everyone!	2026-09-05 06:00:00+00
2	1	2	Hi Maria	2026-09-05 06:01:00+00
3	1	3	Konnichiwa	2026-09-05 06:02:00+00
4	1	1	Anyone done the SQL homework?	2026-09-05 06:05:00+00
5	1	2	Not yet	2026-09-05 06:06:00+00
6	1	3	Right	2026-09-05 06:06:30+00
7	1	1	Due next week I think	2026-09-05 06:07:00+00
8	1	2	Right	2026-09-05 06:08:00+00
9	1	3	What time is it for you?	2026-09-05 06:10:00+00
10	1	1	Morning here	2026-09-05 06:11:00+00
11	1	2	Almost lunch	2026-09-05 06:12:00+00
12	1	3	Evening for me	2026-09-05 06:13:00+00
13	1	1	Nice	2026-09-05 06:15:00+00
14	1	2	Brb	2026-09-05 06:16:00+00
15	1	3	Same second as the previous message	2026-09-05 06:16:00+00
16	1	1	Back	2026-09-05 07:00:00+00
17	1	2	Me too	2026-09-05 07:01:00+00
18	1	3	Hello again	2026-09-05 07:02:00+00
19	1	1	Did you see the news?	2026-09-05 07:05:00+00
20	1	2	Which one?	2026-09-05 07:06:00+00
21	1	3	No idea	2026-09-05 07:07:00+00
22	1	1	Never mind	2026-09-05 07:08:00+00
23	1	2	Lol	2026-09-05 07:09:00+00
24	1	3	Haha	2026-09-05 07:10:00+00
25	1	1	Going to study now	2026-09-05 07:15:00+00
26	1	2	Good luck	2026-09-05 07:16:00+00
27	1	3	Bye	2026-09-05 07:17:00+00
28	2	1	Question 1 is about joins, right?	2026-09-06 12:00:00+00
29	2	2	No, that is question 2	2026-09-06 12:02:00+00
30	3	3	Anyone up for a match?	2026-09-06 18:00:00+00
31	3	2	Give me 10 minutes	2026-09-06 18:03:00+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, country, created_at) FROM stdin;
1	maria	BG	2026-09-01 05:00:00+00
2	johan	DE	2026-09-01 07:30:00+00
3	keiko	JP	2026-09-02 11:15:00+00
4	lurker	US	2026-09-03 16:00:00+00
\.


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channels_id_seq', 4, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 31, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: channels channels_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_name_key UNIQUE (name);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: messages_channel_sent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_channel_sent_idx ON public.messages USING btree (channel_id, sent_at DESC);


--
-- Name: messages_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_user_idx ON public.messages USING btree (user_id);


--
-- Name: messages messages_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id);


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict nBjTwGnlrQQU5ZWvX2Frjl6MjroxcBBz9R9d48Tjwx4xBdMvmMfYYraD4uGZjyP

