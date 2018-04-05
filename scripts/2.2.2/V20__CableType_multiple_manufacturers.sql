--
-- Name: cabletypemanufacturer; Type: TABLE; Schema: public; Owner: cabledb
--

CREATE TABLE cabletypemanufacturer (
    id bigint NOT NULL,
    position integer NOT NULL,
    cabletype_id bigint,
    datasheet_id bigint,
    manufacturer_id bigint
);


ALTER TABLE cabletypemanufacturer OWNER TO ${user};

--
-- Name: cabletypemanufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: cabledb
--

CREATE SEQUENCE cabletypemanufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cabletypemanufacturer_id_seq OWNER TO ${user};

--
-- Name: cabletypemanufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cabledb
--

ALTER SEQUENCE cabletypemanufacturer_id_seq OWNED BY cabletypemanufacturer.id;

ALTER TABLE ONLY cabletypemanufacturer ALTER COLUMN id SET DEFAULT nextval('cabletypemanufacturer_id_seq'::regclass);


ALTER TABLE ONLY cabletypemanufacturer
    ADD CONSTRAINT cabletypemanufacturer_pkey PRIMARY KEY (id);

ALTER TABLE ONLY cabletypemanufacturer
    ADD CONSTRAINT cabletypemanufacturer__cabletype_fkey FOREIGN KEY (cabletype_id) REFERENCES cabletype (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
  
ALTER TABLE ONLY cabletypemanufacturer
    ADD CONSTRAINT cabletypemanufacturer_manufacturer_fkey FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;      
      
ALTER TABLE ONLY cabletypemanufacturer
    ADD CONSTRAINT cabletypemanufacturer_datasheet_fkey FOREIGN KEY (datasheet_id) REFERENCES artifact (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

--transfer existing manufacturer data
INSERT INTO cabletypemanufacturer (position, cabletype_id, datasheet_id, manufacturer_id)
SELECT 0, id, datasheet_id , manufacturer_id
FROM cabletype
WHERE manufacturer_id IS NOT NULL;

ALTER TABLE cabletype DROP COLUMN datasheet_id;
ALTER TABLE cabletype DROP COLUMN manufacturer_id;
