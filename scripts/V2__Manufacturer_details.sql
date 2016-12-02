ALTER TABLE cabletype ADD manufacturer_id bigint;


--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE manufacturer (
    id bigint NOT NULL,
    address character varying(255),
    country character varying(255),
    created timestamp without time zone,
    email character varying(255),
    modified timestamp without time zone,
    name character varying(255),
    phonenumber character varying(255),
    status character varying(255)
);


--
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manufacturer ALTER COLUMN id SET DEFAULT nextval('manufacturer_id_seq'::regclass);

--
-- Name: manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


ALTER TABLE ONLY cabletype
    ADD CONSTRAINT fk_r079j78rx6cvmklhmt31jt75i FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id);

ALTER TABLE manufacturer
  OWNER TO cabledb;
  
ALTER SEQUENCE manufacturer_id_seq
  OWNER TO cabledb;
