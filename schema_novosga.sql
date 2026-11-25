--
-- PostgreSQL database dump
--

\restrict SAou3jdhLrbzLF4N8YSrKCoh8oagWhW51ahToP2WU7QG3Rl3gqsEug1KwtZGCGI

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agendamentos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.agendamentos (
    id integer NOT NULL,
    cliente_id integer,
    unidade_id integer,
    servico_id integer,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    data_confirmacao timestamp without time zone,
    oid character varying(255) DEFAULT NULL::character varying,
    situacao character varying(20) NOT NULL
);


ALTER TABLE public.agendamentos OWNER TO app;

--
-- Name: agendamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.agendamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.agendamentos_id_seq OWNER TO app;

--
-- Name: agendamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.agendamentos_id_seq OWNED BY public.agendamentos.id;


--
-- Name: atendimentos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.atendimentos (
    id integer NOT NULL,
    cliente_id integer,
    unidade_id integer,
    servico_id integer,
    prioridade_id integer,
    usuario_id integer,
    usuario_tri_id integer,
    atendimento_id integer,
    num_local smallint,
    dt_age timestamp without time zone,
    dt_cheg timestamp without time zone NOT NULL,
    dt_cha timestamp without time zone,
    dt_ini timestamp without time zone,
    dt_fim timestamp without time zone,
    tempo_espera integer,
    tempo_permanencia integer,
    tempo_atendimento integer,
    tempo_deslocamento integer,
    status character varying(25) NOT NULL,
    resolucao character varying(25),
    observacao text,
    senha_sigla character varying(3) NOT NULL,
    senha_numero integer NOT NULL,
    local_id integer
);


ALTER TABLE public.atendimentos OWNER TO app;

--
-- Name: atendimentos_codificados; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.atendimentos_codificados (
    servico_id integer NOT NULL,
    atendimento_id integer NOT NULL,
    valor_peso smallint NOT NULL
);


ALTER TABLE public.atendimentos_codificados OWNER TO app;

--
-- Name: atendimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.atendimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atendimentos_id_seq OWNER TO app;

--
-- Name: atendimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.atendimentos_id_seq OWNED BY public.atendimentos.id;


--
-- Name: atendimentos_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.atendimentos_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    atendimento_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.atendimentos_metadata OWNER TO app;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(60) NOT NULL,
    documento character varying(30) NOT NULL,
    email character varying(80),
    telefone character varying(25) DEFAULT NULL::character varying,
    dt_nascimento date,
    genero character varying(1) DEFAULT NULL::character varying,
    observacao text,
    end_pais character varying(2) DEFAULT NULL::character varying,
    end_cep character varying(25) DEFAULT NULL::character varying,
    end_estado character varying(3) DEFAULT NULL::character varying,
    end_cidade character varying(30) DEFAULT NULL::character varying,
    end_logradouro character varying(60) DEFAULT NULL::character varying,
    end_numero character varying(10) DEFAULT NULL::character varying,
    end_complemento character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.clientes OWNER TO app;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO app;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: clientes_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.clientes_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    cliente_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.clientes_metadata OWNER TO app;

--
-- Name: contador; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.contador (
    unidade_id integer NOT NULL,
    servico_id integer NOT NULL,
    numero integer
);


ALTER TABLE public.contador OWNER TO app;

--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.departamentos (
    id integer NOT NULL,
    nome character varying(64) NOT NULL,
    descricao character varying(250) NOT NULL,
    ativo boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.departamentos OWNER TO app;

--
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_seq OWNER TO app;

--
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO app;

--
-- Name: historico_atendimentos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.historico_atendimentos (
    id integer NOT NULL,
    cliente_id integer,
    unidade_id integer,
    servico_id integer,
    prioridade_id integer,
    usuario_id integer,
    usuario_tri_id integer,
    atendimento_id integer,
    num_local smallint,
    dt_age timestamp without time zone,
    dt_cheg timestamp without time zone NOT NULL,
    dt_cha timestamp without time zone,
    dt_ini timestamp without time zone,
    dt_fim timestamp without time zone,
    tempo_espera integer,
    tempo_permanencia integer,
    tempo_atendimento integer,
    tempo_deslocamento integer,
    status character varying(25) NOT NULL,
    resolucao character varying(25),
    observacao text,
    senha_sigla character varying(3) NOT NULL,
    senha_numero integer NOT NULL,
    local_id integer
);


ALTER TABLE public.historico_atendimentos OWNER TO app;

--
-- Name: historico_atendimentos_codificados; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.historico_atendimentos_codificados (
    servico_id integer NOT NULL,
    atendimento_id integer NOT NULL,
    valor_peso smallint NOT NULL
);


ALTER TABLE public.historico_atendimentos_codificados OWNER TO app;

--
-- Name: historico_atendimentos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.historico_atendimentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_atendimentos_id_seq OWNER TO app;

--
-- Name: historico_atendimentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.historico_atendimentos_id_seq OWNED BY public.historico_atendimentos.id;


--
-- Name: historico_atendimentos_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.historico_atendimentos_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    atendimento_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.historico_atendimentos_metadata OWNER TO app;

--
-- Name: locais; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.locais (
    id integer NOT NULL,
    nome character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.locais OWNER TO app;

--
-- Name: locais_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.locais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locais_id_seq OWNER TO app;

--
-- Name: locais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.locais_id_seq OWNED BY public.locais.id;


--
-- Name: lotacoes; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.lotacoes (
    id integer NOT NULL,
    usuario_id integer,
    unidade_id integer,
    perfil_id integer
);


ALTER TABLE public.lotacoes OWNER TO app;

--
-- Name: lotacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.lotacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lotacoes_id_seq OWNER TO app;

--
-- Name: lotacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.lotacoes_id_seq OWNED BY public.lotacoes.id;


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.metadata OWNER TO app;

--
-- Name: oauth2_access_token; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.oauth2_access_token (
    identifier character(80) NOT NULL,
    client character varying(32) NOT NULL,
    expiry timestamp(0) without time zone NOT NULL,
    user_identifier character varying(128) DEFAULT NULL::character varying,
    scopes text,
    revoked boolean NOT NULL
);


ALTER TABLE public.oauth2_access_token OWNER TO app;

--
-- Name: COLUMN oauth2_access_token.expiry; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_access_token.expiry IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN oauth2_access_token.scopes; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_access_token.scopes IS '(DC2Type:oauth2_scope)';


--
-- Name: oauth2_authorization_code; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.oauth2_authorization_code (
    identifier character(80) NOT NULL,
    client character varying(32) NOT NULL,
    expiry timestamp(0) without time zone NOT NULL,
    user_identifier character varying(128) DEFAULT NULL::character varying,
    scopes text,
    revoked boolean NOT NULL
);


ALTER TABLE public.oauth2_authorization_code OWNER TO app;

--
-- Name: COLUMN oauth2_authorization_code.expiry; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_authorization_code.expiry IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN oauth2_authorization_code.scopes; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_authorization_code.scopes IS '(DC2Type:oauth2_scope)';


--
-- Name: oauth2_client; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.oauth2_client (
    identifier character varying(32) NOT NULL,
    name character varying(128) NOT NULL,
    secret character varying(128) DEFAULT NULL::character varying,
    redirect_uris text,
    grants text,
    scopes text,
    active boolean NOT NULL,
    allow_plain_text_pkce boolean DEFAULT false NOT NULL
);


ALTER TABLE public.oauth2_client OWNER TO app;

--
-- Name: COLUMN oauth2_client.redirect_uris; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_client.redirect_uris IS '(DC2Type:oauth2_redirect_uri)';


--
-- Name: COLUMN oauth2_client.grants; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_client.grants IS '(DC2Type:oauth2_grant)';


--
-- Name: COLUMN oauth2_client.scopes; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_client.scopes IS '(DC2Type:oauth2_scope)';


--
-- Name: oauth2_refresh_token; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.oauth2_refresh_token (
    identifier character(80) NOT NULL,
    access_token character(80) DEFAULT NULL::bpchar,
    expiry timestamp(0) without time zone NOT NULL,
    revoked boolean NOT NULL
);


ALTER TABLE public.oauth2_refresh_token OWNER TO app;

--
-- Name: COLUMN oauth2_refresh_token.expiry; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.oauth2_refresh_token.expiry IS '(DC2Type:datetime_immutable)';


--
-- Name: paineis; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.paineis (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    public_id character varying(36) NOT NULL,
    unidade_id integer NOT NULL
);


ALTER TABLE public.paineis OWNER TO app;

--
-- Name: paineis_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

ALTER TABLE public.paineis ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.paineis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paineis_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.paineis_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    painel_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.paineis_metadata OWNER TO app;

--
-- Name: painel_senha; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.painel_senha (
    id integer NOT NULL,
    servico_id integer,
    unidade_id integer,
    num_senha integer NOT NULL,
    sig_senha character varying(3) NOT NULL,
    msg_senha character varying(255) NOT NULL,
    local character varying(20) NOT NULL,
    num_local smallint NOT NULL,
    peso smallint NOT NULL,
    prioridade character varying(100),
    nome_cliente character varying(100),
    documento_cliente character varying(30),
    cor_prioridade character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.painel_senha OWNER TO app;

--
-- Name: painel_senha_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.painel_senha_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.painel_senha_id_seq OWNER TO app;

--
-- Name: painel_senha_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.painel_senha_id_seq OWNED BY public.painel_senha.id;


--
-- Name: painel_servicos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.painel_servicos (
    id integer NOT NULL,
    painel_id integer NOT NULL,
    servico_id integer NOT NULL
);


ALTER TABLE public.painel_servicos OWNER TO app;

--
-- Name: painel_servicos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

ALTER TABLE public.painel_servicos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.painel_servicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: perfis; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.perfis (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(150) NOT NULL,
    modulos text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.perfis OWNER TO app;

--
-- Name: COLUMN perfis.modulos; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.perfis.modulos IS '(DC2Type:simple_array)';


--
-- Name: perfis_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.perfis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfis_id_seq OWNER TO app;

--
-- Name: perfis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.perfis_id_seq OWNED BY public.perfis.id;


--
-- Name: prioridades; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.prioridades (
    id integer NOT NULL,
    nome character varying(64) NOT NULL,
    descricao character varying(100) NOT NULL,
    peso smallint NOT NULL,
    ativo boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    cor character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.prioridades OWNER TO app;

--
-- Name: prioridades_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.prioridades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prioridades_id_seq OWNER TO app;

--
-- Name: prioridades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.prioridades_id_seq OWNED BY public.prioridades.id;


--
-- Name: servicos; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.servicos (
    id integer NOT NULL,
    macro_id integer,
    nome character varying(50) NOT NULL,
    descricao character varying(250) NOT NULL,
    ativo boolean NOT NULL,
    peso smallint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.servicos OWNER TO app;

--
-- Name: servicos_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.servicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicos_id_seq OWNER TO app;

--
-- Name: servicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.servicos_id_seq OWNED BY public.servicos.id;


--
-- Name: servicos_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.servicos_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    servico_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.servicos_metadata OWNER TO app;

--
-- Name: servicos_unidades; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.servicos_unidades (
    servico_id integer NOT NULL,
    unidade_id integer NOT NULL,
    local_id integer,
    departamento_id integer,
    sigla character varying(3) NOT NULL,
    ativo boolean NOT NULL,
    peso smallint NOT NULL,
    numero_inicial integer NOT NULL,
    numero_final integer,
    incremento integer NOT NULL,
    mensagem character varying(255),
    tipo smallint,
    maximo integer
);


ALTER TABLE public.servicos_unidades OWNER TO app;

--
-- Name: servicos_usuarios; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.servicos_usuarios (
    servico_id integer NOT NULL,
    unidade_id integer NOT NULL,
    usuario_id integer NOT NULL,
    peso smallint NOT NULL
);


ALTER TABLE public.servicos_usuarios OWNER TO app;

--
-- Name: unidades; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.unidades (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(250) NOT NULL,
    ativo boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    impressao_cabecalho character varying(150) NOT NULL,
    impressao_rodape character varying(150) NOT NULL,
    impressao_exibir_data boolean NOT NULL,
    impressao_exibir_prioridade boolean NOT NULL,
    impressao_exibir_nome_unidade boolean NOT NULL,
    impressao_exibir_nome_servico boolean NOT NULL,
    impressao_exibir_mensagem_servico boolean NOT NULL,
    timezone character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.unidades OWNER TO app;

--
-- Name: unidades_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.unidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unidades_id_seq OWNER TO app;

--
-- Name: unidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.unidades_id_seq OWNED BY public.unidades.id;


--
-- Name: unidades_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.unidades_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    unidade_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.unidades_metadata OWNER TO app;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    login character varying(30) NOT NULL,
    nome character varying(20) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    email character varying(150),
    senha character varying(128) NOT NULL,
    ativo boolean NOT NULL,
    ultimo_acesso timestamp without time zone,
    ip character varying(15) DEFAULT NULL::character varying,
    session_id character varying(50) DEFAULT NULL::character varying,
    algorithm character varying(10) NOT NULL,
    admin boolean NOT NULL,
    salt character varying(60) DEFAULT NULL::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO app;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO app;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: usuarios_metadata; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.usuarios_metadata (
    namespace character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    usuario_id integer NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.usuarios_metadata OWNER TO app;

--
-- Name: view_atendimentos; Type: VIEW; Schema: public; Owner: app
--

CREATE VIEW public.view_atendimentos AS
 SELECT atendimentos.id,
    atendimentos.num_local,
    atendimentos.dt_age,
    atendimentos.dt_cheg,
    atendimentos.dt_cha,
    atendimentos.dt_ini,
    atendimentos.dt_fim,
    atendimentos.tempo_espera,
    atendimentos.tempo_permanencia,
    atendimentos.tempo_atendimento,
    atendimentos.tempo_deslocamento,
    atendimentos.status,
    atendimentos.resolucao,
    atendimentos.observacao,
    atendimentos.senha_sigla,
    atendimentos.senha_numero,
    atendimentos.cliente_id,
    atendimentos.unidade_id,
    atendimentos.servico_id,
    atendimentos.prioridade_id,
    atendimentos.usuario_id,
    atendimentos.usuario_tri_id,
    atendimentos.atendimento_id,
    atendimentos.local_id
   FROM public.atendimentos
UNION ALL
 SELECT historico_atendimentos.id,
    historico_atendimentos.num_local,
    historico_atendimentos.dt_age,
    historico_atendimentos.dt_cheg,
    historico_atendimentos.dt_cha,
    historico_atendimentos.dt_ini,
    historico_atendimentos.dt_fim,
    historico_atendimentos.tempo_espera,
    historico_atendimentos.tempo_permanencia,
    historico_atendimentos.tempo_atendimento,
    historico_atendimentos.tempo_deslocamento,
    historico_atendimentos.status,
    historico_atendimentos.resolucao,
    historico_atendimentos.observacao,
    historico_atendimentos.senha_sigla,
    historico_atendimentos.senha_numero,
    historico_atendimentos.cliente_id,
    historico_atendimentos.unidade_id,
    historico_atendimentos.servico_id,
    historico_atendimentos.prioridade_id,
    historico_atendimentos.usuario_id,
    historico_atendimentos.usuario_tri_id,
    historico_atendimentos.atendimento_id,
    historico_atendimentos.local_id
   FROM public.historico_atendimentos;


ALTER VIEW public.view_atendimentos OWNER TO app;

--
-- Name: view_atendimentos_codificados; Type: VIEW; Schema: public; Owner: app
--

CREATE VIEW public.view_atendimentos_codificados AS
 SELECT atendimentos_codificados.valor_peso,
    atendimentos_codificados.servico_id,
    atendimentos_codificados.atendimento_id
   FROM public.atendimentos_codificados
UNION ALL
 SELECT historico_atendimentos_codificados.valor_peso,
    historico_atendimentos_codificados.servico_id,
    historico_atendimentos_codificados.atendimento_id
   FROM public.historico_atendimentos_codificados;


ALTER VIEW public.view_atendimentos_codificados OWNER TO app;

--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.webhooks (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    url character varying(255) NOT NULL,
    headers json NOT NULL,
    events json NOT NULL,
    enabled boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.webhooks OWNER TO app;

--
-- Name: webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webhooks_id_seq OWNER TO app;

--
-- Name: webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.webhooks_id_seq OWNED BY public.webhooks.id;


--
-- Name: agendamentos id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.agendamentos ALTER COLUMN id SET DEFAULT nextval('public.agendamentos_id_seq'::regclass);


--
-- Name: atendimentos id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos ALTER COLUMN id SET DEFAULT nextval('public.atendimentos_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- Name: historico_atendimentos id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos ALTER COLUMN id SET DEFAULT nextval('public.historico_atendimentos_id_seq'::regclass);


--
-- Name: locais id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.locais ALTER COLUMN id SET DEFAULT nextval('public.locais_id_seq'::regclass);


--
-- Name: lotacoes id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes ALTER COLUMN id SET DEFAULT nextval('public.lotacoes_id_seq'::regclass);


--
-- Name: painel_senha id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_senha ALTER COLUMN id SET DEFAULT nextval('public.painel_senha_id_seq'::regclass);


--
-- Name: perfis id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.perfis ALTER COLUMN id SET DEFAULT nextval('public.perfis_id_seq'::regclass);


--
-- Name: prioridades id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.prioridades ALTER COLUMN id SET DEFAULT nextval('public.prioridades_id_seq'::regclass);


--
-- Name: servicos id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos ALTER COLUMN id SET DEFAULT nextval('public.servicos_id_seq'::regclass);


--
-- Name: unidades id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.unidades ALTER COLUMN id SET DEFAULT nextval('public.unidades_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: webhooks id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_id_seq'::regclass);


--
-- Name: agendamentos agendamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.agendamentos
    ADD CONSTRAINT agendamentos_pkey PRIMARY KEY (id);


--
-- Name: atendimentos_codificados atendimentos_codificados_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos_codificados
    ADD CONSTRAINT atendimentos_codificados_pkey PRIMARY KEY (servico_id, atendimento_id);


--
-- Name: atendimentos_metadata atendimentos_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos_metadata
    ADD CONSTRAINT atendimentos_metadata_pkey PRIMARY KEY (namespace, name, atendimento_id);


--
-- Name: atendimentos atendimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_pkey PRIMARY KEY (id);


--
-- Name: clientes_metadata clientes_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.clientes_metadata
    ADD CONSTRAINT clientes_metadata_pkey PRIMARY KEY (namespace, name, cliente_id);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: contador contador_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.contador
    ADD CONSTRAINT contador_pkey PRIMARY KEY (unidade_id, servico_id);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: historico_atendimentos_codificados historico_atendimentos_codificados_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos_codificados
    ADD CONSTRAINT historico_atendimentos_codificados_pkey PRIMARY KEY (servico_id, atendimento_id);


--
-- Name: historico_atendimentos_metadata historico_atendimentos_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos_metadata
    ADD CONSTRAINT historico_atendimentos_metadata_pkey PRIMARY KEY (namespace, name, atendimento_id);


--
-- Name: historico_atendimentos historico_atendimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT historico_atendimentos_pkey PRIMARY KEY (id);


--
-- Name: locais locais_nome_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.locais
    ADD CONSTRAINT locais_nome_key UNIQUE (nome);


--
-- Name: locais locais_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.locais
    ADD CONSTRAINT locais_pkey PRIMARY KEY (id);


--
-- Name: lotacoes lotacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes
    ADD CONSTRAINT lotacoes_pkey PRIMARY KEY (id);


--
-- Name: lotacoes lotacoes_usuario_id_unidade_id_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes
    ADD CONSTRAINT lotacoes_usuario_id_unidade_id_key UNIQUE (usuario_id, unidade_id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (namespace, name);


--
-- Name: oauth2_access_token oauth2_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_access_token
    ADD CONSTRAINT oauth2_access_token_pkey PRIMARY KEY (identifier);


--
-- Name: oauth2_authorization_code oauth2_authorization_code_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_authorization_code
    ADD CONSTRAINT oauth2_authorization_code_pkey PRIMARY KEY (identifier);


--
-- Name: oauth2_client oauth2_client_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_client
    ADD CONSTRAINT oauth2_client_pkey PRIMARY KEY (identifier);


--
-- Name: oauth2_refresh_token oauth2_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_refresh_token
    ADD CONSTRAINT oauth2_refresh_token_pkey PRIMARY KEY (identifier);


--
-- Name: paineis_metadata paineis_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.paineis_metadata
    ADD CONSTRAINT paineis_metadata_pkey PRIMARY KEY (namespace, name, painel_id);


--
-- Name: paineis paineis_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.paineis
    ADD CONSTRAINT paineis_pkey PRIMARY KEY (id);


--
-- Name: painel_senha painel_senha_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_senha
    ADD CONSTRAINT painel_senha_pkey PRIMARY KEY (id);


--
-- Name: painel_servicos painel_servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_servicos
    ADD CONSTRAINT painel_servicos_pkey PRIMARY KEY (id);


--
-- Name: perfis perfis_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.perfis
    ADD CONSTRAINT perfis_pkey PRIMARY KEY (id);


--
-- Name: prioridades prioridades_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.prioridades
    ADD CONSTRAINT prioridades_pkey PRIMARY KEY (id);


--
-- Name: servicos_metadata servicos_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_metadata
    ADD CONSTRAINT servicos_metadata_pkey PRIMARY KEY (namespace, name, servico_id);


--
-- Name: servicos servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_pkey PRIMARY KEY (id);


--
-- Name: servicos_unidades servicos_unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_unidades
    ADD CONSTRAINT servicos_unidades_pkey PRIMARY KEY (servico_id, unidade_id);


--
-- Name: servicos_usuarios servicos_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_usuarios
    ADD CONSTRAINT servicos_usuarios_pkey PRIMARY KEY (servico_id, unidade_id, usuario_id);


--
-- Name: unidades_metadata unidades_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.unidades_metadata
    ADD CONSTRAINT unidades_metadata_pkey PRIMARY KEY (namespace, name, unidade_id);


--
-- Name: unidades unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_login_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_login_key UNIQUE (login);


--
-- Name: usuarios_metadata usuarios_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios_metadata
    ADD CONSTRAINT usuarios_metadata_pkey PRIMARY KEY (namespace, name, usuario_id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: agendamento_oid_index; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX agendamento_oid_index ON public.agendamentos USING btree (oid);


--
-- Name: idx_454d9673c7440455; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_454d9673c7440455 ON public.oauth2_access_token USING btree (client);


--
-- Name: idx_465b1eadedf4b99b; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_465b1eadedf4b99b ON public.paineis USING btree (unidade_id);


--
-- Name: idx_4dd90732b6a2dd68; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_4dd90732b6a2dd68 ON public.oauth2_refresh_token USING btree (access_token);


--
-- Name: idx_509fef5fc7440455; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_509fef5fc7440455 ON public.oauth2_authorization_code USING btree (client);


--
-- Name: idx_c253d2a282e14982; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_c253d2a282e14982 ON public.painel_servicos USING btree (servico_id);


--
-- Name: idx_c253d2a29f19bce6; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_c253d2a29f19bce6 ON public.painel_servicos USING btree (painel_id);


--
-- Name: idx_paineis_metadata_painel_id; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_paineis_metadata_painel_id ON public.paineis_metadata USING btree (painel_id);


--
-- Name: clientes_metadata clientes_metadata_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.clientes_metadata
    ADD CONSTRAINT clientes_metadata_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: lotacoes fk_10e72c2f57291544; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes
    ADD CONSTRAINT fk_10e72c2f57291544 FOREIGN KEY (perfil_id) REFERENCES public.perfis(id);


--
-- Name: lotacoes fk_10e72c2fdb38439e; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes
    ADD CONSTRAINT fk_10e72c2fdb38439e FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: lotacoes fk_10e72c2fedf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.lotacoes
    ADD CONSTRAINT fk_10e72c2fedf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: historico_atendimentos_codificados fk_111248c276323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos_codificados
    ADD CONSTRAINT fk_111248c276323123 FOREIGN KEY (atendimento_id) REFERENCES public.historico_atendimentos(id);


--
-- Name: historico_atendimentos_codificados fk_111248c282e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos_codificados
    ADD CONSTRAINT fk_111248c282e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: historico_atendimentos_metadata fk_169630a576323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos_metadata
    ADD CONSTRAINT fk_169630a576323123 FOREIGN KEY (atendimento_id) REFERENCES public.historico_atendimentos(id);


--
-- Name: atendimentos fk_29e906e7226efc79; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e7226efc79 FOREIGN KEY (prioridade_id) REFERENCES public.prioridades(id);


--
-- Name: atendimentos fk_29e906e776323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e776323123 FOREIGN KEY (atendimento_id) REFERENCES public.atendimentos(id);


--
-- Name: atendimentos fk_29e906e782e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e782e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: atendimentos fk_29e906e7875f1a79; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e7875f1a79 FOREIGN KEY (usuario_tri_id) REFERENCES public.usuarios(id);


--
-- Name: atendimentos fk_29e906e7db38439e; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e7db38439e FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: atendimentos fk_29e906e7de734e51; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e7de734e51 FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: atendimentos fk_29e906e7edf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT fk_29e906e7edf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: agendamentos fk_2d12ea4a82e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.agendamentos
    ADD CONSTRAINT fk_2d12ea4a82e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: agendamentos fk_2d12ea4ade734e51; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.agendamentos
    ADD CONSTRAINT fk_2d12ea4ade734e51 FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: agendamentos fk_2d12ea4aedf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.agendamentos
    ADD CONSTRAINT fk_2d12ea4aedf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: painel_senha fk_390182e682e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_senha
    ADD CONSTRAINT fk_390182e682e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: painel_senha fk_390182e6edf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_senha
    ADD CONSTRAINT fk_390182e6edf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: oauth2_access_token fk_454d9673c7440455; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_access_token
    ADD CONSTRAINT fk_454d9673c7440455 FOREIGN KEY (client) REFERENCES public.oauth2_client(identifier) ON DELETE CASCADE;


--
-- Name: paineis fk_465b1eadedf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.paineis
    ADD CONSTRAINT fk_465b1eadedf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id) ON DELETE CASCADE;


--
-- Name: oauth2_refresh_token fk_4dd90732b6a2dd68; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_refresh_token
    ADD CONSTRAINT fk_4dd90732b6a2dd68 FOREIGN KEY (access_token) REFERENCES public.oauth2_access_token(identifier) ON DELETE SET NULL;


--
-- Name: atendimentos_metadata fk_4f7723eb76323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos_metadata
    ADD CONSTRAINT fk_4f7723eb76323123 FOREIGN KEY (atendimento_id) REFERENCES public.atendimentos(id);


--
-- Name: oauth2_authorization_code fk_509fef5fc7440455; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oauth2_authorization_code
    ADD CONSTRAINT fk_509fef5fc7440455 FOREIGN KEY (client) REFERENCES public.oauth2_client(identifier) ON DELETE CASCADE;


--
-- Name: servicos fk_89dd09e3f43a187e; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT fk_89dd09e3f43a187e FOREIGN KEY (macro_id) REFERENCES public.servicos(id);


--
-- Name: servicos_metadata fk_8e8bf0e482e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_metadata
    ADD CONSTRAINT fk_8e8bf0e482e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: painel_servicos fk_c253d2a282e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_servicos
    ADD CONSTRAINT fk_c253d2a282e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id) ON DELETE CASCADE;


--
-- Name: painel_servicos fk_c253d2a29f19bce6; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.painel_servicos
    ADD CONSTRAINT fk_c253d2a29f19bce6 FOREIGN KEY (painel_id) REFERENCES public.paineis(id) ON DELETE CASCADE;


--
-- Name: servicos_unidades fk_c50f70345a91c08d; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_unidades
    ADD CONSTRAINT fk_c50f70345a91c08d FOREIGN KEY (departamento_id) REFERENCES public.departamentos(id);


--
-- Name: servicos_unidades fk_c50f70345d5a2101; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_unidades
    ADD CONSTRAINT fk_c50f70345d5a2101 FOREIGN KEY (local_id) REFERENCES public.locais(id);


--
-- Name: servicos_unidades fk_c50f703482e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_unidades
    ADD CONSTRAINT fk_c50f703482e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: servicos_unidades fk_c50f7034edf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_unidades
    ADD CONSTRAINT fk_c50f7034edf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: historico_atendimentos fk_cbbdf95f226efc79; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95f226efc79 FOREIGN KEY (prioridade_id) REFERENCES public.prioridades(id);


--
-- Name: historico_atendimentos fk_cbbdf95f76323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95f76323123 FOREIGN KEY (atendimento_id) REFERENCES public.historico_atendimentos(id);


--
-- Name: historico_atendimentos fk_cbbdf95f82e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95f82e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: historico_atendimentos fk_cbbdf95f875f1a79; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95f875f1a79 FOREIGN KEY (usuario_tri_id) REFERENCES public.usuarios(id);


--
-- Name: historico_atendimentos fk_cbbdf95fdb38439e; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95fdb38439e FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: historico_atendimentos fk_cbbdf95fde734e51; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95fde734e51 FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: historico_atendimentos fk_cbbdf95fedf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.historico_atendimentos
    ADD CONSTRAINT fk_cbbdf95fedf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: servicos_usuarios fk_cf69430282e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_usuarios
    ADD CONSTRAINT fk_cf69430282e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: servicos_usuarios fk_cf694302db38439e; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_usuarios
    ADD CONSTRAINT fk_cf694302db38439e FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: servicos_usuarios fk_cf694302edf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.servicos_usuarios
    ADD CONSTRAINT fk_cf694302edf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: atendimentos_codificados fk_ddf47b2d76323123; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos_codificados
    ADD CONSTRAINT fk_ddf47b2d76323123 FOREIGN KEY (atendimento_id) REFERENCES public.atendimentos(id);


--
-- Name: atendimentos_codificados fk_ddf47b2d82e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.atendimentos_codificados
    ADD CONSTRAINT fk_ddf47b2d82e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: contador fk_e83ef8fa82e14982; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.contador
    ADD CONSTRAINT fk_e83ef8fa82e14982 FOREIGN KEY (servico_id) REFERENCES public.servicos(id);


--
-- Name: contador fk_e83ef8faedf4b99b; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.contador
    ADD CONSTRAINT fk_e83ef8faedf4b99b FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: paineis_metadata fk_paineis_metadata_painel_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.paineis_metadata
    ADD CONSTRAINT fk_paineis_metadata_painel_id FOREIGN KEY (painel_id) REFERENCES public.paineis(id) ON DELETE CASCADE;


--
-- Name: unidades_metadata unidades_metadata_unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.unidades_metadata
    ADD CONSTRAINT unidades_metadata_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES public.unidades(id);


--
-- Name: usuarios_metadata usuarios_metadata_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuarios_metadata
    ADD CONSTRAINT usuarios_metadata_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

\unrestrict SAou3jdhLrbzLF4N8YSrKCoh8oagWhW51ahToP2WU7QG3Rl3gqsEug1KwtZGCGI

