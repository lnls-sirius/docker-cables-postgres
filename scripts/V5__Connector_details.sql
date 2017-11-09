ALTER TABLE endpoint ADD connector_id bigint;
ALTER TABLE endpoint DROP type;

--
-- Name: connecotr; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE connector (
    id bigint NOT NULL,
    description character varying(255),
    created timestamp without time zone,
    connectortype character varying(255),
    modified timestamp without time zone,
    name character varying(255) not NULL,
    drawing character varying(255),
    active boolean not NULL
    );


--
-- Name: connecotr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE connector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY connector ALTER COLUMN id SET DEFAULT nextval('connector_id_seq'::regclass);

--
-- Name: connector_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY connector
    ADD CONSTRAINT connector_pkey PRIMARY KEY (id);


ALTER TABLE ONLY endpoint 
    ADD CONSTRAINT fk_g246e21ge4icztmsug63rv35z FOREIGN KEY (connector_id) REFERENCES connector(id);

ALTER TABLE connector
  OWNER TO ${user};
  
ALTER SEQUENCE connector_id_seq
  OWNER TO ${user};
