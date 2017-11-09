--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cable; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cable (
    id bigint NOT NULL,
    cableclass character varying(255),
    created timestamp without time zone,
    installationby timestamp without time zone,
    modified timestamp without time zone,
    owner character varying(255),
    routing character varying(255),
    seqnumber integer,
    status character varying(255),
    subsystem character varying(255),
    system character varying(255),
    terminationby timestamp without time zone,
    validity character varying(255),
    cabletype_id bigint,
    endpointa_id bigint,
    endpointb_id bigint,
    length real
);

ALTER TABLE cable OWNER TO ${user};

--
-- Name: cable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cable_id_seq OWNED BY cable.id;
ALTER SEQUENCE cable_id_seq OWNER TO ${user};

--
-- Name: cabletype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cabletype (
    id bigint NOT NULL,
    active boolean NOT NULL,
    description character varying(65545),
    comments character varying(255),
    flammability character varying(255),
    insulation character varying(255),
    jacket character varying(255),
    name character varying(255),
    installationtype character varying(255),
    service character varying(255),
    tid real,
    weight real,
    diameter real,
    voltage real
);

ALTER TABLE cabletype OWNER TO ${user};


--
-- Name: cabletype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cabletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cabletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cabletype_id_seq OWNED BY cabletype.id;
ALTER SEQUENCE cabletype_id_seq OWNER TO ${user};


--
-- Name: displayview; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE displayview (
    id bigint NOT NULL,
    created timestamp without time zone,
    description character varying(255),
    entitytype character varying(255),
    executed timestamp without time zone,
    owner character varying(255)
);


ALTER TABLE displayview OWNER TO ${user};


--
-- Name: displayview_displayviewcolumn; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE displayview_displayviewcolumn (
    displayview_id bigint NOT NULL,
    columns_id bigint NOT NULL
);

ALTER TABLE displayview_displayviewcolumn OWNER TO ${user};
--
-- Name: displayview_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE displayview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: displayview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE displayview_id_seq OWNED BY displayview.id;
ALTER SEQUENCE displayview_id_seq OWNER TO ${user};

  
--
-- Name: displayviewcolumn; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE displayviewcolumn (
    id bigint NOT NULL,
    columnname character varying(255),
    "position" integer,
    displayview bigint
);

ALTER TABLE displayviewcolumn OWNER TO ${user};

--
-- Name: displayviewcolumn_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE displayviewcolumn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: displayviewcolumn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE displayviewcolumn_id_seq OWNED BY displayviewcolumn.id;
ALTER SEQUENCE displayviewcolumn_id_seq OWNER TO ${user};

--
-- Name: endpoint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE endpoint (
    id bigint NOT NULL,
    building character varying(255),
    device character varying(255),
    drawing character varying(255),
    label character varying(255),
    rack character varying(255),
    type character varying(255),
    validity character varying(255)
);

ALTER TABLE endpoint OWNER TO ${user};

--
-- Name: endpoint_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE endpoint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: endpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE endpoint_id_seq OWNED BY endpoint.id;
ALTER SEQUENCE endpoint_id_seq OWNER TO ${user};

--
-- Name: history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE history (
    id bigint NOT NULL,
    entityid bigint,
    entitytype character varying(255),
    entry character varying(65535),
    operation character varying(255),
    "timestamp" timestamp without time zone,
    userid character varying(255),
    entityname character varying(255)
);

ALTER TABLE history OWNER TO ${user};

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;
ALTER SEQUENCE history_id_seq OWNER TO ${user};

--
-- Name: query; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE query (
    id bigint NOT NULL,
    created timestamp without time zone,
    description character varying(255),
    executed timestamp without time zone,
    owner character varying(255),
    entitytype character varying(255)
);

ALTER TABLE query OWNER TO ${user};


--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE query_id_seq OWNED BY query.id;
ALTER SEQUENCE query_id_seq OWNER TO ${user};

--
-- Name: query_querycondition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE query_querycondition (
    query_id bigint NOT NULL,
    conditions_id bigint NOT NULL
);


ALTER TABLE query_querycondition OWNER TO ${user};
  
--
-- Name: querycondition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE querycondition (
    id bigint NOT NULL,
    booleanoperator character varying(255),
    comparisonoperator character varying(255),
    field character varying(255),
    parenthesisclose character varying(255),
    parenthesisopen character varying(255),
    "position" integer,
    value character varying(255),
    query bigint
);


ALTER TABLE querycondition OWNER TO ${user};

--
-- Name: querycondition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE querycondition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: querycondition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE querycondition_id_seq OWNED BY querycondition.id;
ALTER SEQUENCE querycondition_id_seq OWNER TO ${user};

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cable ALTER COLUMN id SET DEFAULT nextval('cable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cabletype ALTER COLUMN id SET DEFAULT nextval('cabletype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY displayview ALTER COLUMN id SET DEFAULT nextval('displayview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY displayviewcolumn ALTER COLUMN id SET DEFAULT nextval('displayviewcolumn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY endpoint ALTER COLUMN id SET DEFAULT nextval('endpoint_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY query ALTER COLUMN id SET DEFAULT nextval('query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY querycondition ALTER COLUMN id SET DEFAULT nextval('querycondition_id_seq'::regclass);


--
-- Name: cable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cable
    ADD CONSTRAINT cable_pkey PRIMARY KEY (id);


--
-- Name: cabletype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cabletype
    ADD CONSTRAINT cabletype_pkey PRIMARY KEY (id);


--
-- Name: displayview_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY displayview
    ADD CONSTRAINT displayview_pkey PRIMARY KEY (id);


--
-- Name: displayviewcolumn_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY displayviewcolumn
    ADD CONSTRAINT displayviewcolumn_pkey PRIMARY KEY (id);


--
-- Name: endpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY endpoint
    ADD CONSTRAINT endpoint_pkey PRIMARY KEY (id);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: query_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: querycondition_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY querycondition
    ADD CONSTRAINT querycondition_pkey PRIMARY KEY (id);


--
-- Name: uk_fxfvd2s6mbhp1gav7l22bsroh; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY displayview_displayviewcolumn
    ADD CONSTRAINT uk_fxfvd2s6mbhp1gav7l22bsroh UNIQUE (columns_id);


--
-- Name: uk_lay8xo3i37yd6rph7c2kbw3kd; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY query_querycondition
    ADD CONSTRAINT uk_lay8xo3i37yd6rph7c2kbw3kd UNIQUE (conditions_id);


--
-- Name: fk_4e5wsfbmdm8hdaifhtrucon45; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cable
    ADD CONSTRAINT fk_4e5wsfbmdm8hdaifhtrucon45 FOREIGN KEY (endpointb_id) REFERENCES endpoint(id);


--
-- Name: fk_4od3w30oade3x21p9emvxfbwa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cable
    ADD CONSTRAINT fk_4od3w30oade3x21p9emvxfbwa FOREIGN KEY (endpointa_id) REFERENCES endpoint(id);


--
-- Name: fk_51txnixcivulqx0q1rbdfqboo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cable
    ADD CONSTRAINT fk_51txnixcivulqx0q1rbdfqboo FOREIGN KEY (cabletype_id) REFERENCES cabletype(id);


--
-- Name: fk_column_displayview; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY displayviewcolumn
    ADD CONSTRAINT fk_column_displayview FOREIGN KEY (displayview) REFERENCES displayview(id);


--
-- Name: fk_condition_query; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY querycondition
    ADD CONSTRAINT fk_condition_query FOREIGN KEY (query) REFERENCES query(id);


--
-- Name: fk_dyqpqgm1v70d7nq077b3enlf3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY query_querycondition
    ADD CONSTRAINT fk_dyqpqgm1v70d7nq077b3enlf3 FOREIGN KEY (query_id) REFERENCES query(id);


--
-- Name: fk_fxfvd2s6mbhp1gav7l22bsroh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY displayview_displayviewcolumn
    ADD CONSTRAINT fk_fxfvd2s6mbhp1gav7l22bsroh FOREIGN KEY (columns_id) REFERENCES displayviewcolumn(id);


--
-- Name: fk_kaka4eyd48g1yu2kry8km5acq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY displayview_displayviewcolumn
    ADD CONSTRAINT fk_kaka4eyd48g1yu2kry8km5acq FOREIGN KEY (displayview_id) REFERENCES displayview(id);


--
-- Name: fk_lay8xo3i37yd6rph7c2kbw3kd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY query_querycondition
    ADD CONSTRAINT fk_lay8xo3i37yd6rph7c2kbw3kd FOREIGN KEY (conditions_id) REFERENCES querycondition(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO ${user};


--
-- PostgreSQL database dump complete
--
