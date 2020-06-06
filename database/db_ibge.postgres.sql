--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: db_ibge; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_ibge WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE db_ibge OWNER TO postgres;

--\connect db_ibge

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
-- Name: ibge; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ibge;


ALTER SCHEMA ibge OWNER TO postgres;

--
-- Name: staging; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA staging;


ALTER SCHEMA staging OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mesorregioes; Type: TABLE; Schema: ibge; Owner: postgres
--

CREATE TABLE ibge.mesorregioes (
    id_mesorregiao integer NOT NULL,
    nome_mesorregiao character varying(255)
);


ALTER TABLE ibge.mesorregioes OWNER TO postgres;

--
-- Name: microrregioes; Type: TABLE; Schema: ibge; Owner: postgres
--

CREATE TABLE ibge.microrregioes (
    id_microrregiao integer NOT NULL,
    nome_microrregiao character varying(255)
);


ALTER TABLE ibge.microrregioes OWNER TO postgres;

--
-- Name: municipios; Type: TABLE; Schema: ibge; Owner: postgres
--

CREATE TABLE ibge.municipios (
    id numeric NOT NULL,
    nome character varying(255),
    id_microrregiao integer,
    id_mesorregiao integer,
    id_uf integer,
    id_regiao integer
);


ALTER TABLE ibge.municipios OWNER TO postgres;

--
-- Name: regioes; Type: TABLE; Schema: ibge; Owner: postgres
--

CREATE TABLE ibge.regioes (
    id_regiao integer NOT NULL,
    nome_regiao character varying(255),
    sigla_regiao character varying(255)
);


ALTER TABLE ibge.regioes OWNER TO postgres;

--
-- Name: uf; Type: TABLE; Schema: ibge; Owner: postgres
--

CREATE TABLE ibge.uf (
    id_uf integer NOT NULL,
    nome_uf character varying(255),
    sigla_uf character varying(255)
);


ALTER TABLE ibge.uf OWNER TO postgres;

--
-- Name: cnae_subclasses; Type: TABLE; Schema: staging; Owner: postgres
--

CREATE TABLE staging.cnae_subclasses (
    id character varying(10),
    descricao character varying(1000),
    classe_id character varying(10),
    classe_descricao character varying(1000),
    grupo_id character varying(10),
    grupo_descricao character varying(1000),
    divisao_id character varying(10),
    divisao_descricao character varying(1000),
    secao_id character varying(10),
    secao_descricao character varying(1000),
    atividades character varying(1000)
);


ALTER TABLE staging.cnae_subclasses OWNER TO postgres;

--
-- Name: municipios; Type: TABLE; Schema: staging; Owner: postgres
--

CREATE TABLE staging.municipios (
    id numeric NOT NULL,
    nome character varying(255),
    id_microrregiao integer,
    nome_microrregiao character varying(255),
    id_mesorregiao integer,
    nome_mesorregiao character varying(255),
    id_uf integer,
    nome_uf character varying(255),
    sigla_uf character varying(255),
    id_regiao integer,
    nome_regiao character varying(255),
    sigla_regiao character varying(255)
);


ALTER TABLE staging.municipios OWNER TO postgres;

--
-- Name: mesorregioes mesorregioes_pkey; Type: CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.mesorregioes
    ADD CONSTRAINT mesorregioes_pkey PRIMARY KEY (id_mesorregiao);


--
-- Name: microrregioes microrregioes_pkey; Type: CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.microrregioes
    ADD CONSTRAINT microrregioes_pkey PRIMARY KEY (id_microrregiao);


--
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- Name: regioes regioes_pkey; Type: CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.regioes
    ADD CONSTRAINT regioes_pkey PRIMARY KEY (id_regiao);


--
-- Name: uf uf_pkey; Type: CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.uf
    ADD CONSTRAINT uf_pkey PRIMARY KEY (id_uf);


--
-- Name: municipios fk_mu_me; Type: FK CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.municipios
    ADD CONSTRAINT fk_mu_me FOREIGN KEY (id_mesorregiao) REFERENCES ibge.mesorregioes(id_mesorregiao);


--
-- Name: municipios fk_mu_mi; Type: FK CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.municipios
    ADD CONSTRAINT fk_mu_mi FOREIGN KEY (id_microrregiao) REFERENCES ibge.microrregioes(id_microrregiao);


--
-- Name: municipios fk_mu_re; Type: FK CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.municipios
    ADD CONSTRAINT fk_mu_re FOREIGN KEY (id_regiao) REFERENCES ibge.regioes(id_regiao);


--
-- Name: municipios fk_mu_uf; Type: FK CONSTRAINT; Schema: ibge; Owner: postgres
--

ALTER TABLE ONLY ibge.municipios
    ADD CONSTRAINT fk_mu_uf FOREIGN KEY (id_uf) REFERENCES ibge.uf(id_uf);


--
-- PostgreSQL database dump complete
--

