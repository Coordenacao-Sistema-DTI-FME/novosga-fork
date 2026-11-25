--
-- PostgreSQL database dump
--

\restrict WRz9bmpWnI8cGWJAW5QVuggOoBLvzooQZAGvx5uhzLfXxIJ24XUqGlCUmYLWSLa

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

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

--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.clientes (id, nome, documento, email, telefone, dt_nascimento, genero, observacao, end_pais, end_cep, end_estado, end_cidade, end_logradouro, end_numero, end_complemento) FROM stdin;
1	nome teste	21345454543	teste@homologacao.com	21931231231	\N	M	obs do clienteee	\N	\N	\N	\N	\N	\N	\N
2	tstet campo	38274839274	campo@homo.com	74857348573	\N	M	obs do cliente	\N	\N	\N	\N	\N	\N	\N
3	teste da homolog	12345678910	homolog@teste.com	21999999999	\N	M	obs cliente	\N	\N	\N	\N	\N	\N	\N
4	teste do campo aviso	31232313123	\N	2132314234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	teste campo	12312313223	\N	22675675675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	João	17355287737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	ped	23131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	joca	34243423212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	a	05976265707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	00	93944878167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	----	65046595672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	adadadadad	93753275158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	teste	00091541409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	dwadwadw	94840698198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	000000	33201691224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	ddddddddd	34811235312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	qwa	58988979176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	tste	72479156923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	Joao	42077898712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	insercao de nome	21312313231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	teste resolucao	26154867987	\N	\N	\N	\N	teste de obs pelo atendimento	\N	\N	\N	\N	\N	\N	\N
22	TESTE DE RESOLUCAO segundo	21371893718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	tste para campos de form mat	44545645454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: servicos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.servicos (id, macro_id, nome, descricao, ativo, peso, created_at, updated_at, deleted_at) FROM stdin;
3	\N	Matrícula Prioridade	none	t	2	2026-10-02 13:00:44	\N	\N
4	\N	Bolsa Família Prioridade	none	t	2	2026-10-02 13:00:53	\N	\N
1	3	Matricula	none	t	1	2026-09-29 16:54:24	2026-10-02 13:01:01	\N
2	4	Bolsa Família	none	t	1	2026-09-30 12:43:40	2026-10-02 13:01:08	\N
\.


--
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.unidades (id, nome, descricao, ativo, created_at, updated_at, deleted_at, impressao_cabecalho, impressao_rodape, impressao_exibir_data, impressao_exibir_prioridade, impressao_exibir_nome_unidade, impressao_exibir_nome_servico, impressao_exibir_mensagem_servico, timezone) FROM stdin;
1	Unidade	none	t	2026-09-29 16:51:31	\N	\N	NovoSGA	NovoSGA	t	t	t	t	t	UTC
\.


--
-- Data for Name: agendamentos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.agendamentos (id, cliente_id, unidade_id, servico_id, data, hora, data_confirmacao, oid, situacao) FROM stdin;
\.


--
-- Data for Name: prioridades; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.prioridades (id, nome, descricao, peso, ativo, created_at, updated_at, deleted_at, cor) FROM stdin;
2	Prioridade	none	1	t	2026-09-29 16:52:42	\N	\N	#FF0000
1	Padrao	one	0	t	2026-09-29 16:52:42	2026-10-06 14:52:40	\N	#012759
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.usuarios (id, login, nome, sobrenome, email, senha, ativo, ultimo_acesso, ip, session_id, algorithm, admin, salt, created_at, updated_at, deleted_at) FROM stdin;
2	Atendente	att	2	atendente@teste.com	$2y$12$0B99nzOY5Aholt6YCQBFCOkc5c/A9E.aiva2/rGvdFkInIPnZCh1m	t	\N	\N	\N	bcrypt	f	\N	2026-09-30 12:42:07	\N	\N
1	admin	admin	global	\N	$2y$12$WNT2qi7Znwd4/k/LIHtDSOHl3hNCGCCErh/A5fAGDl7Q14mVchTZ6	t	2026-10-22 18:18:45	172.18.0.1	623777889625a1c63b4e4f06d0723ceb	bcrypt	t	\N	2026-09-29 16:51:20	2026-10-22 18:18:45	\N
\.


--
-- Data for Name: atendimentos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.atendimentos (id, cliente_id, unidade_id, servico_id, prioridade_id, usuario_id, usuario_tri_id, atendimento_id, num_local, dt_age, dt_cheg, dt_cha, dt_ini, dt_fim, tempo_espera, tempo_permanencia, tempo_atendimento, tempo_deslocamento, status, resolucao, observacao, senha_sigla, senha_numero, local_id) FROM stdin;
75	6	1	1	1	1	1	\N	2	\N	2026-10-14 16:47:12	2026-10-14 16:48:30	2026-10-14 16:48:34	2026-10-14 16:48:43	78	91	9	4	encerrado	pendente	PENDENTE	M	1	1
77	6	1	2	1	1	1	\N	2	\N	2026-10-14 16:47:19	2026-10-14 16:48:44	2026-10-14 16:48:48	2026-10-14 16:48:57	85	98	9	4	encerrado	\N	ENCAMINHADO	BF	2	1
79	22	1	2	1	1	1	\N	2	\N	2026-10-14 16:50:49	2026-10-14 17:35:36	2026-10-14 17:35:40	2026-10-14 17:36:25	2687	2736	45	4	encerrado	nao_resolvido	nao resolvido	BF	3	1
81	23	1	2	1	1	1	\N	2	\N	2026-10-23 13:23:59	2026-10-23 17:33:17	2026-10-23 17:33:23	\N	14958	\N	\N	6	iniciado	\N	\N	BF	4	1
76	6	1	3	2	1	1	\N	2	\N	2026-10-14 16:47:16	2026-10-14 16:47:27	2026-10-14 16:47:31	2026-10-14 16:48:10	11	54	39	4	encerrado	resolvido	RESOLVIDO 100%	MP	1	1
74	6	1	2	1	1	1	\N	2	\N	2026-10-14 16:47:08	2026-10-14 16:48:11	2026-10-14 16:48:15	2026-10-14 16:48:29	63	81	14	4	encerrado	\N	RESOLVIDO PARCIALMENTE	BF	1	1
78	6	1	1	1	1	1	\N	2	\N	2026-10-14 16:47:22	2026-10-14 16:48:58	2026-10-14 16:49:02	2026-10-14 16:49:11	96	109	9	4	encerrado	\N	NAO RESOLVIDO	M	2	1
80	6	1	1	1	1	1	\N	2	\N	2026-10-14 16:50:53	2026-10-14 16:50:57	2026-10-14 16:51:01	2026-10-14 17:32:13	4	2480	2472	4	encerrado	resolvido_parcialmente	parcialmente	M	3	1
\.


--
-- Data for Name: atendimentos_codificados; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.atendimentos_codificados (servico_id, atendimento_id, valor_peso) FROM stdin;
1	76	1
2	74	1
1	75	1
2	77	1
1	78	1
1	80	1
2	79	1
\.


--
-- Data for Name: atendimentos_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.atendimentos_metadata (namespace, name, atendimento_id, value) FROM stdin;
\.


--
-- Data for Name: clientes_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.clientes_metadata (namespace, name, cliente_id, value) FROM stdin;
\.


--
-- Data for Name: contador; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.contador (unidade_id, servico_id, numero) FROM stdin;
1	4	1
1	3	2
1	1	4
1	2	5
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.departamentos (id, nome, descricao, ativo, created_at, updated_at) FROM stdin;
1	Departamento homo	none	t	2026-09-29 16:54:12	\N
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version1	2026-09-29 16:50:54	4053
DoctrineMigrations\\Version2	2026-09-29 16:50:58	101
DoctrineMigrations\\Version20210326134543	2026-09-29 16:50:58	99
DoctrineMigrations\\Version20240723214655	2026-09-29 16:50:58	125
DoctrineMigrations\\Version20241223212116	2026-09-29 16:50:58	10
DoctrineMigrations\\Version20260213170231	2026-09-29 16:50:58	1
DoctrineMigrations\\Version20260408103746	2026-09-29 16:50:58	46
DoctrineMigrations\\Version20260424000000	2026-09-29 16:50:58	75
\.


--
-- Data for Name: historico_atendimentos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.historico_atendimentos (id, cliente_id, unidade_id, servico_id, prioridade_id, usuario_id, usuario_tri_id, atendimento_id, num_local, dt_age, dt_cheg, dt_cha, dt_ini, dt_fim, tempo_espera, tempo_permanencia, tempo_atendimento, tempo_deslocamento, status, resolucao, observacao, senha_sigla, senha_numero, local_id) FROM stdin;
15	\N	1	2	1	1	1	\N	2	\N	2026-10-01 18:12:56	2026-10-01 19:56:10	\N	2026-10-01 19:56:16	6194	6200	0	0	nao_compareceu	\N	\N	B	9	1
36	\N	1	3	2	1	1	\N	2	\N	2026-10-02 13:43:21	2026-10-02 16:52:34	\N	2026-10-02 18:53:23	11353	18602	0	0	nao_compareceu	\N	\N	MP	2	1
16	\N	1	1	1	1	1	\N	2	\N	2026-10-01 18:12:56	2026-10-01 19:56:19	\N	2026-10-01 19:56:23	6203	6207	0	0	nao_compareceu	\N	\N	MH	7	1
1	1	1	1	1	1	1	\N	1	\N	2026-09-29 16:55:04	2026-09-29 16:56:07	2026-09-29 16:56:22	2026-09-29 16:57:18	63	134	56	15	encerrado	\N	obs do atd 	MH	1	1
49	6	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:17:29	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	20	\N
22	\N	1	2	1	\N	1	\N	\N	\N	2026-10-02 13:43:15	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	12	\N
2	2	1	1	1	1	1	\N	1	\N	2026-09-29 16:55:25	2026-09-29 18:07:34	2026-09-29 18:07:38	2026-09-30 13:59:11	4329	75826	71493	4	encerrado	\N	obs do atendimento homo	MH	2	1
3	3	1	1	1	1	1	\N	1	\N	2026-09-30 12:34:02	2026-09-30 14:00:23	2026-09-30 14:00:27	2026-09-30 14:26:24	5181	6742	1557	4	encerrado	resolvido	obs do atendimento	MH	3	1
27	\N	1	1	1	\N	1	\N	\N	\N	2026-10-02 13:43:16	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	12	\N
4	\N	1	2	1	1	1	\N	1	\N	2026-09-30 14:27:35	2026-09-30 14:27:39	2026-09-30 14:27:44	2026-09-30 14:27:53	4	18	9	5	encerrado	\N	\N	B	1	1
5	4	1	2	1	1	1	\N	1	\N	2026-09-30 14:27:36	2026-09-30 14:47:58	2026-09-30 14:48:03	2026-09-30 14:54:16	1222	1600	373	5	encerrado	\N	\N	B	2	1
6	5	1	2	1	1	1	\N	1	\N	2026-09-30 16:41:48	2026-09-30 16:41:52	2026-09-30 16:41:56	2026-10-01 12:42:00	4	72012	72004	4	encerrado	\N	\N	B	3	1
7	\N	1	2	1	1	1	\N	1	\N	2026-09-30 16:41:48	2026-10-01 12:42:02	\N	2026-10-01 12:43:23	72014	72095	0	0	nao_compareceu	\N	\N	B	4	1
8	\N	1	2	1	1	1	\N	1	\N	2026-10-01 12:43:27	2026-10-01 12:43:34	\N	2026-10-01 12:43:39	7	12	0	0	nao_compareceu	\N	\N	B	5	1
11	\N	1	1	1	1	1	\N	1	\N	2026-10-01 12:43:28	2026-10-01 12:43:41	\N	2026-10-01 17:25:39	13	16931	0	0	nao_compareceu	\N	\N	MH	4	1
9	\N	1	2	1	1	1	\N	1	\N	2026-10-01 12:43:27	2026-10-01 17:25:40	\N	2026-10-01 17:36:55	16933	17608	0	0	nao_compareceu	\N	\N	B	6	1
10	\N	1	2	1	1	1	\N	1	\N	2026-10-01 12:43:27	2026-10-01 17:36:57	\N	2026-10-01 17:37:57	17610	17670	0	0	nao_compareceu	\N	\N	B	7	1
12	\N	1	1	1	1	1	\N	2	\N	2026-10-01 12:43:28	2026-10-01 17:38:00	\N	2026-10-01 18:13:05	17672	19777	0	0	nao_compareceu	\N	\N	MH	5	2
17	\N	1	1	1	1	1	\N	2	\N	2026-10-01 18:12:57	2026-10-01 19:56:24	\N	2026-10-02 13:43:32	6207	70235	0	0	nao_compareceu	\N	\N	MH	8	1
13	\N	1	1	1	1	1	\N	1	\N	2026-10-01 12:43:28	2026-10-01 18:13:07	\N	2026-10-01 18:15:36	19779	19928	0	0	nao_compareceu	\N	\N	MH	6	1
29	\N	1	1	1	1	1	\N	2	\N	2026-10-02 13:43:16	2026-10-02 18:53:27	\N	2026-10-02 18:53:34	18611	18618	0	0	nao_compareceu	\N	\N	M	14	1
14	\N	1	2	1	1	1	\N	2	\N	2026-10-01 18:12:56	2026-10-01 18:15:37	\N	2026-10-01 19:54:57	161	6121	0	0	nao_compareceu	\N	\N	B	8	1
31	\N	1	4	2	1	1	\N	2	\N	2026-10-02 13:43:19	2026-10-02 13:43:36	\N	2026-10-02 13:44:33	17	74	0	0	nao_compareceu	\N	\N	BFP	1	1
18	\N	1	2	2	1	1	\N	2	\N	2026-10-01 19:55:03	2026-10-01 19:55:07	\N	2026-10-01 19:55:24	4	21	0	0	nao_compareceu	\N	\N	B	10	1
50	7	1	1	1	\N	1	\N	\N	\N	2026-10-06 18:18:46	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	20	\N
19	\N	1	1	2	1	1	\N	2	\N	2026-10-01 19:55:04	2026-10-01 19:55:28	\N	2026-10-01 19:55:43	24	39	0	0	nao_compareceu	\N	\N	MH	9	1
32	\N	1	4	2	1	1	\N	2	\N	2026-10-02 13:43:20	2026-10-02 13:44:34	\N	2026-10-02 13:52:00	74	520	0	0	nao_compareceu	\N	\N	BFP	2	1
20	\N	1	1	2	1	1	\N	2	\N	2026-10-01 19:55:04	2026-10-01 19:55:43	\N	2026-10-01 19:55:50	39	46	0	0	nao_compareceu	\N	\N	MH	10	1
34	\N	1	4	2	1	1	\N	2	\N	2026-10-02 13:43:20	2026-10-02 18:53:39	\N	2026-10-06 14:49:06	18619	349546	0	0	nao_compareceu	\N	\N	BFP	4	1
24	\N	1	2	1	1	1	\N	2	\N	2026-10-02 13:43:15	2026-10-02 13:52:03	\N	2026-10-02 13:52:12	528	537	0	0	nao_compareceu	\N	\N	BF	14	1
40	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 14:49:16	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	16	\N
28	\N	1	1	1	1	1	\N	2	\N	2026-10-02 13:43:16	2026-10-02 13:52:14	\N	2026-10-02 13:52:51	538	575	0	0	nao_compareceu	\N	\N	M	13	1
37	\N	1	3	2	1	1	\N	2	\N	2026-10-02 13:43:22	2026-10-06 14:49:09	\N	2026-10-06 14:49:30	349547	349568	0	0	nao_compareceu	\N	\N	MP	3	1
39	\N	1	3	2	1	1	\N	2	\N	2026-10-02 13:43:22	2026-10-02 13:52:54	\N	2026-10-02 13:53:06	572	584	0	0	nao_compareceu	\N	\N	MP	5	1
41	\N	1	1	1	\N	1	\N	\N	\N	2026-10-06 14:49:49	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	16	\N
35	\N	1	3	2	1	1	\N	2	\N	2026-10-02 13:43:21	2026-10-02 13:53:10	\N	2026-10-02 13:55:24	589	723	0	0	nao_compareceu	\N	\N	MP	1	1
42	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 14:49:50	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	17	\N
33	\N	1	4	2	1	1	\N	2	\N	2026-10-02 13:43:20	2026-10-02 13:55:25	\N	2026-10-02 16:51:31	725	11291	0	0	nao_compareceu	\N	\N	BFP	3	1
43	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 14:50:36	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	18	\N
30	\N	1	1	1	1	1	\N	2	\N	2026-10-02 13:43:16	2026-10-02 16:51:32	\N	2026-10-02 16:52:20	11296	11344	0	0	nao_compareceu	\N	\N	M	15	1
44	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 14:50:36	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	19	\N
23	\N	1	2	1	1	1	\N	2	\N	2026-10-02 13:43:15	2026-10-02 16:52:22	\N	2026-10-02 16:52:32	11347	11357	0	0	nao_compareceu	\N	\N	BF	13	1
25	\N	1	2	1	1	1	\N	2	\N	2026-10-02 13:43:15	2026-10-06 14:57:45	\N	2026-10-06 18:22:44	350070	362369	0	0	nao_compareceu	\N	\N	BF	15	1
45	\N	1	1	1	\N	1	\N	\N	\N	2026-10-06 14:50:37	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	17	\N
46	\N	1	1	1	\N	1	\N	\N	\N	2026-10-06 14:50:37	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	18	\N
48	\N	1	1	1	\N	1	\N	\N	\N	2026-10-06 14:51:04	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	M	19	\N
38	\N	1	3	2	1	1	\N	2	\N	2026-10-02 13:43:22	2026-10-06 14:51:59	\N	2026-10-06 14:52:04	349717	349722	0	0	nao_compareceu	\N	\N	MP	4	1
55	9	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:36:01	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	23	\N
26	\N	1	1	1	1	1	\N	2	\N	2026-10-02 13:43:16	2026-10-06 14:52:07	\N	2026-10-06 14:57:41	349731	350065	0	0	nao_compareceu	\N	\N	M	11	1
56	10	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:38:29	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	24	\N
53	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:26:25	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	22	\N
54	\N	1	4	2	\N	1	\N	\N	\N	2026-10-06 18:26:27	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BFP	6	\N
51	\N	1	2	1	1	1	\N	2	\N	2026-10-06 18:22:36	2026-10-06 18:22:57	2026-10-06 18:23:04	2026-10-06 18:26:39	21	243	215	7	encerrado	\N	\N	BF	21	1
60	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:40:31	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	28	\N
57	11	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:39:32	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	25	\N
58	12	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:40:03	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	26	\N
59	12	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:40:09	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	27	\N
61	\N	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:40:46	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	29	\N
62	11	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:41:37	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	30	\N
63	\N	1	4	2	\N	1	\N	\N	\N	2026-10-06 18:41:40	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BFP	7	\N
64	13	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:46:22	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	31	\N
65	14	1	4	2	\N	1	\N	\N	\N	2026-10-06 18:46:43	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BFP	8	\N
66	15	1	2	1	\N	1	\N	\N	\N	2026-10-06 18:47:31	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	32	\N
67	15	1	2	1	\N	1	\N	\N	\N	2026-10-06 19:00:05	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	33	\N
68	16	1	2	1	\N	1	\N	\N	\N	2026-10-06 19:00:29	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	34	\N
69	17	1	2	1	\N	1	\N	\N	\N	2026-10-06 19:01:16	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	35	\N
21	21	1	2	1	1	1	\N	2	\N	2026-10-02 13:43:14	2026-10-14 13:54:33	2026-10-14 13:54:37	2026-10-14 16:34:56	1037479	1047102	9619	4	encerrado	\N	RESOLVIDO PARCIALMENTE	BF	11	1
71	12	1	4	2	\N	1	\N	\N	\N	2026-10-06 19:52:19	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BFP	9	\N
72	18	1	2	1	\N	1	\N	\N	\N	2026-10-06 19:52:29	\N	\N	\N	\N	\N	\N	\N	emitida	\N	\N	BF	37	\N
52	8	1	1	1	1	1	\N	2	\N	2026-10-06 18:26:23	2026-10-06 18:26:45	2026-10-06 18:26:50	2026-10-13 16:56:16	22	599393	599366	5	encerrado	\N	\N	M	21	1
70	20	1	2	1	1	1	\N	2	\N	2026-10-06 19:52:14	2026-10-13 16:56:30	2026-10-13 17:05:53	2026-10-14 13:48:24	594256	669370	74551	563	encerrado	\N	\N	BF	36	1
47	\N	1	4	2	1	1	\N	2	\N	2026-10-06 14:50:38	2026-10-14 13:50:07	\N	2026-10-14 13:50:11	687569	687573	0	0	nao_compareceu	\N	\N	BFP	5	1
73	19	1	1	1	1	1	\N	2	\N	2026-10-06 19:52:54	2026-10-14 13:50:22	2026-10-14 13:50:25	2026-10-14 13:50:39	669448	669465	14	3	encerrado	\N	teste parcial	M	22	1
\.


--
-- Data for Name: historico_atendimentos_codificados; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.historico_atendimentos_codificados (servico_id, atendimento_id, valor_peso) FROM stdin;
1	1	1
1	2	1
1	3	1
2	4	1
2	5	1
2	6	1
2	51	1
2	21	1
1	52	1
2	70	1
1	73	1
\.


--
-- Data for Name: historico_atendimentos_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.historico_atendimentos_metadata (namespace, name, atendimento_id, value) FROM stdin;
\.


--
-- Data for Name: locais; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.locais (id, nome, created_at, updated_at) FROM stdin;
2	GUICHÊ 2	2026-09-30 12:42:38	\N
1	Guiche	2026-09-29 16:52:45	2026-10-01 18:11:44
\.


--
-- Data for Name: perfis; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.perfis (id, nome, descricao, modulos, created_at, updated_at) FROM stdin;
1	Atendente 1	noone	novosga.attendance	2026-09-30 12:41:40	\N
\.


--
-- Data for Name: lotacoes; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.lotacoes (id, usuario_id, unidade_id, perfil_id) FROM stdin;
1	2	1	1
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.metadata (namespace, name, value) FROM stdin;
novosga.settings	appearance	{"logoNavbar":"\\/uploads\\/logo-navbar.png?_=1792073126","logoLogin":"","theme":"default","navbarColor":"bg-primary","customCSS":"","customJS":""}
\.


--
-- Data for Name: oauth2_client; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.oauth2_client (identifier, name, secret, redirect_uris, grants, scopes, active, allow_plain_text_pkce) FROM stdin;
\.


--
-- Data for Name: oauth2_access_token; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.oauth2_access_token (identifier, client, expiry, user_identifier, scopes, revoked) FROM stdin;
\.


--
-- Data for Name: oauth2_authorization_code; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.oauth2_authorization_code (identifier, client, expiry, user_identifier, scopes, revoked) FROM stdin;
\.


--
-- Data for Name: oauth2_refresh_token; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.oauth2_refresh_token (identifier, access_token, expiry, revoked) FROM stdin;
\.


--
-- Data for Name: paineis; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.paineis (id, nome, public_id, unidade_id) FROM stdin;
1	painel homo	01a0f77d-02b6-782c-bdef-2efc0a133083	1
\.


--
-- Data for Name: paineis_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.paineis_metadata (namespace, name, painel_id, value) FROM stdin;
novosga.panel	settings	1	{"logo":"","corFundoDestaque":"","corFundoRodape":"","corFundoHistorico":"","corFundoRelogio":""}
\.


--
-- Data for Name: painel_senha; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.painel_senha (id, servico_id, unidade_id, num_senha, sig_senha, msg_senha, local, num_local, peso, prioridade, nome_cliente, documento_cliente, cor_prioridade) FROM stdin;
101	3	1	1	MP		Guiche	2	1	Prioridade	João	17355287737	#FF0000
102	2	1	1	BF		Guiche	2	0	Padrao	João	17355287737	#012759
103	1	1	1	M		Guiche	2	0	Padrao	João	17355287737	#012759
104	2	1	2	BF		Guiche	2	0	Padrao	João	17355287737	#012759
105	1	1	2	M		Guiche	2	0	Padrao	João	17355287737	#012759
106	1	1	3	M		Guiche	2	0	Padrao	João	17355287737	#012759
107	2	1	3	BF		Guiche	2	0	Padrao	\N	\N	#012759
108	2	1	4	BF		Guiche	2	0	Padrao	\N	\N	#012759
\.


--
-- Data for Name: painel_servicos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.painel_servicos (id, painel_id, servico_id) FROM stdin;
1	1	1
2	1	2
3	1	4
4	1	3
\.


--
-- Data for Name: servicos_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.servicos_metadata (namespace, name, servico_id, value) FROM stdin;
\.


--
-- Data for Name: servicos_unidades; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.servicos_unidades (servico_id, unidade_id, local_id, departamento_id, sigla, ativo, peso, numero_inicial, numero_final, incremento, mensagem, tipo, maximo) FROM stdin;
2	1	\N	1	BF	t	1	1	\N	1	\N	2	\N
4	1	\N	1	BFP	t	1	1	\N	1	\N	3	\N
1	1	\N	1	M	t	1	1	\N	1	\N	2	\N
3	1	\N	1	MP	t	1	1	\N	1	\N	3	\N
\.


--
-- Data for Name: servicos_usuarios; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.servicos_usuarios (servico_id, unidade_id, usuario_id, peso) FROM stdin;
1	1	2	1
2	1	2	1
4	1	1	1
3	1	1	1
1	1	1	2
2	1	1	2
\.


--
-- Data for Name: unidades_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.unidades_metadata (namespace, name, unidade_id, value) FROM stdin;
\.


--
-- Data for Name: usuarios_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.usuarios_metadata (namespace, name, usuario_id, value) FROM stdin;
global	atendimento.tipo	1	"todos"
global	atendimento.tipo	2	"todos"
global	atendimento.num_local	2	2
global	atendimento.local	1	1
global	atendimento.local	2	1
global	atendimento.num_local	1	2
novosga.settings	behavior	1	{"callTicketByService":true,"callTicketOutOfOrder":true,"changeTicketType":true}
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.webhooks (id, name, url, headers, events, enabled, created_at, updated_at) FROM stdin;
\.


--
-- Name: agendamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.agendamentos_id_seq', 1, false);


--
-- Name: atendimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.atendimentos_id_seq', 81, true);


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.clientes_id_seq', 23, true);


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 1, true);


--
-- Name: historico_atendimentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.historico_atendimentos_id_seq', 1, false);


--
-- Name: locais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.locais_id_seq', 2, true);


--
-- Name: lotacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.lotacoes_id_seq', 1, true);


--
-- Name: paineis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.paineis_id_seq', 1, true);


--
-- Name: painel_senha_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.painel_senha_id_seq', 108, true);


--
-- Name: painel_servicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.painel_servicos_id_seq', 4, true);


--
-- Name: perfis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.perfis_id_seq', 1, true);


--
-- Name: prioridades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.prioridades_id_seq', 2, true);


--
-- Name: servicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.servicos_id_seq', 4, true);


--
-- Name: unidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.unidades_id_seq', 1, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);


--
-- Name: webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.webhooks_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict WRz9bmpWnI8cGWJAW5QVuggOoBLvzooQZAGvx5uhzLfXxIJ24XUqGlCUmYLWSLa

