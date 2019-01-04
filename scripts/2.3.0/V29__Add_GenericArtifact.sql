CREATE TABLE generic_artifact (
    id bigint NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    modified_by character varying(64) NOT NULL,
    description character varying(255),
    name character varying(128) NOT NULL,
    content bytea NOT NULL,
    content_length int NOT NULL
);

ALTER TABLE ONLY generic_artifact
    ADD CONSTRAINT generic_artifact_pkey PRIMARY KEY (id);

ALTER TABLE ONLY generic_artifact OWNER TO ${user};

CREATE SEQUENCE generic_artifact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE generic_artifact_id_seq OWNED BY generic_artifact.id;
ALTER SEQUENCE generic_artifact_id_seq OWNER TO ${user};

ALTER TABLE ONLY generic_artifact ALTER COLUMN id SET DEFAULT nextval('generic_artifact_id_seq'::regclass);

ALTER TABLE cable ADD artifact_id bigint;
ALTER TABLE endpoint ADD artifact_id bigint;
ALTER TABLE cabletypemanufacturer ADD artifact_id bigint;
ALTER TABLE connector ADD artifact_id bigint;

ALTER TABLE ONLY cable
    ADD CONSTRAINT fk_cable_generic_artifact FOREIGN KEY (artifact_id) REFERENCES generic_artifact(id);

ALTER TABLE ONLY endpoint
    ADD CONSTRAINT fk_endpoint_generic_artifact FOREIGN KEY (artifact_id) REFERENCES generic_artifact(id);

ALTER TABLE ONLY cabletypemanufacturer
    ADD CONSTRAINT fk_cabletypemanufacturer_generic_artifact FOREIGN KEY (artifact_id) REFERENCES generic_artifact(id);

ALTER TABLE ONLY connector
    ADD CONSTRAINT fk_connector_generic_artifact FOREIGN KEY (artifact_id) REFERENCES generic_artifact(id);
