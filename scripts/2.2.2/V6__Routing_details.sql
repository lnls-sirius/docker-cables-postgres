--
-- Name: routing; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE routing (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    owner character varying(255),
    active character varying(255)
);
--owner
ALTER TABLE routing  OWNER TO ${user};
--primary key
ALTER TABLE ONLY routing
    ADD CONSTRAINT routing_pkey PRIMARY KEY (id);
--sequence
CREATE SEQUENCE routing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    
-- set sequence
ALTER TABLE ONLY routing ALTER COLUMN id SET DEFAULT nextval('routing_id_seq'::regclass);
--sequence owner
ALTER SEQUENCE routing_id_seq  OWNER TO ${user};


--
--Routing row
--
CREATE TABLE routingrow (
    id bigint NOT NULL,
    "position" integer,
    cable bigint,
    routing bigint
);
--owner
ALTER TABLE routingrow OWNER TO ${user};
--primary key
ALTER TABLE ONLY routingrow
    ADD CONSTRAINT routingrow_pkey PRIMARY KEY (id);
--sequnece
CREATE SEQUENCE routingrow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--set sequence
ALTER TABLE ONLY routingrow ALTER COLUMN id SET DEFAULT nextval('routingrow_id_seq'::regclass);
--sequence owner
ALTER SEQUENCE routingrow_id_seq  OWNER TO ${user};


--
--cable-routingrow
--
CREATE TABLE cable_routingrow (
    cable_id bigint NOT NULL,
    routingrows_id bigint NOT NULL
);
--owner
ALTER TABLE cable_routingrow OWNER TO ${user};
--primarykey
ALTER TABLE ONLY cable_routingrow
    ADD CONSTRAINT uk_fxfvd2s6mbhp1gav7gdfgghsr3h UNIQUE (routingrows_id);
--foregin keys
ALTER TABLE ONLY cable_routingrow
    ADD CONSTRAINT fk_fxfvddefrghz43grrl22bsroh FOREIGN KEY (routingrows_id) REFERENCES routingrow(id);
ALTER TABLE ONLY cable_routingrow
    ADD CONSTRAINT fk_kaka4435gsfrtgskry8km5acq FOREIGN KEY (cable_id) REFERENCES cable(id);

    
---
---DELETE old routing column from cables
---
ALTER TABLE cable DROP routing;

