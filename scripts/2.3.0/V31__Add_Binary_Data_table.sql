CREATE TABLE binary_data (
    id bigint NOT NULL,
    content bytea NOT NULL,
    content_length int NOT NULL
);

ALTER TABLE ONLY binary_data OWNER TO ${user};

CREATE SEQUENCE binary_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE binary_data_id_seq OWNED BY binary_data.id;
ALTER SEQUENCE binary_data_id_seq OWNER TO ${user};

ALTER TABLE ONLY binary_data ALTER COLUMN id SET DEFAULT nextval('binary_data_id_seq'::regclass);

ALTER TABLE binary_data ADD CONSTRAINT binary_data_pk PRIMARY KEY (id);


ALTER TABLE generic_artifact ADD COLUMN binary_data_id bigint;
ALTER TABLE generic_artifact ALTER COLUMN content DROP NOT NULL;
ALTER TABLE generic_artifact ALTER COLUMN content_length DROP NOT NULL;

ALTER TABLE ONLY generic_artifact
    ADD CONSTRAINT fk_binary_data FOREIGN KEY (binary_data_id) REFERENCES binary_data(id);

