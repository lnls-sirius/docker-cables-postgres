ALTER TABLE cabletype ADD datasheet_id bigint;
ALTER TABLE cable ADD qualityreport_id bigint;


--
-- Name: artifact; Type: TABLE; Schema: public; Owner: cabledb
--

CREATE TABLE artifact (
    id bigint NOT NULL,
    description character varying(255),
    modified_at timestamp without time zone,
    modified_by character varying(255),
    name character varying(255),
    uri text,
    rooturi text,
    modifiedat timestamp without time zone,
    modifiedby character varying(255)
);


--
-- Name: artifact_id_seq; Type: SEQUENCE; Schema: public; Owner: cabledb
--

CREATE SEQUENCE artifact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: artifact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cabledb
--

ALTER TABLE ONLY artifact ALTER COLUMN id SET DEFAULT nextval('artifact_id_seq'::regclass);

--
-- Name: artifact_pkey; Type: CONSTRAINT; Schema: public; Owner: cabledb
--

ALTER TABLE ONLY artifact
    ADD CONSTRAINT artifact_pkey PRIMARY KEY (id);

--
-- Name: fk_e5t5yfslr9ur0lgtgqbmln45e; Type: FK CONSTRAINT; Schema: public; Owner: cabledb
--

ALTER TABLE ONLY cabletype
    ADD CONSTRAINT fk_e5t5yfslr9ur0lgtgqbmln45e FOREIGN KEY (datasheet_id) REFERENCES artifact(id);


ALTER TABLE ONLY cable
    ADD CONSTRAINT fk_z2t1gfetj3tg6rtsgsharb00d FOREIGN KEY (qualityreport_id) REFERENCES artifact(id);
    
    
ALTER TABLE artifact OWNER TO cabledb;
    
ALTER SEQUENCE artifact_id_seq OWNED BY artifact.id;