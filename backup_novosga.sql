--
-- PostgreSQL database dump
--

\restrict KIOGXAZAQSfVyiBRQUfD8YoLhRxpSc1Bx8UlxZ6LJPcWHgX29phtKPirSCtXIDn

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
-- Data for Name: agendamentos; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.agendamentos (id, cliente_id, unidade_id, servico_id, data, hora, data_confirmacao, oid, situacao) FROM stdin;
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
-- Data for Name: oauth2_client; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.oauth2_client (identifier, name, secret, redirect_uris, grants, scopes, active, allow_plain_text_pkce) FROM stdin;
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
-- Data for Name: perfis; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.perfis (id, nome, descricao, modulos, created_at, updated_at) FROM stdin;
1	Atendente 1	noone	novosga.attendance	2026-09-30 12:41:40	\N
\.


--
-- Data for Name: prioridades; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.prioridades (id, nome, descricao, peso, ativo, created_at, updated_at, deleted_at, cor) FROM stdin;
2	Prioridade	none	1	t	2026-09-29 16:52:42	\N	\N	#FF0000
1	Padrao	one	0	t	2026-09-29 16:52:42	2026-10-06 14:52:40	\N	#012759
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
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.unidades (id, nome, descricao, ativo, created_at, updated_at, deleted_at, impressao_cabecalho, impressao_rodape, impressao_exibir_data, impressao_exibir_prioridade, impressao_exibir_nome_unidade, impressao_exibir_nome_servico, impressao_exibir_mensagem_servico, timezone) FROM stdin;
1	Unidade	none	t	2026-09-29 16:51:31	\N	\N	NovoSGA	NovoSGA	t	t	t	t	t	UTC
\.


--
-- Data for Name: unidades_metadata; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.unidades_metadata (namespace, name, unidade_id, value) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.usuarios (id, login, nome, sobrenome, email, senha, ativo, ultimo_acesso, ip, session_id, algorithm, admin, salt, created_at, updated_at, deleted_at) FROM stdin;
2	Atendente	att	2	atendente@teste.com	$2y$12$0B99nzOY5Aholt6YCQBFCOkc5c/A9E.aiva2/rGvdFkInIPnZCh1m	t	\N	\N	\N	bcrypt	f	\N	2026-09-30 12:42:07	\N	\N
1	admin	admin	global	\N	$2y$12$WNT2qi7Znwd4/k/LIHtDSOHl3hNCGCCErh/A5fAGDl7Q14mVchTZ6	t	2026-10-22 18:18:45	172.18.0.1	623777889625a1c63b4e4f06d0723ceb	bcrypt	t	\N	2026-09-29 16:51:20	2026-10-22 18:18:45	\N
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

\unrestrict KIOGXAZAQSfVyiBRQUfD8YoLhRxpSc1Bx8UlxZ6LJPcWHgX29phtKPirSCtXIDn

