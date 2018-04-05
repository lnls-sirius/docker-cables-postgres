--
--cable_owners
--
CREATE TABLE cable_owners
(
  cable_id bigint NOT NULL,
  owners character varying(255),
  CONSTRAINT fk_dfaskouufsjmn030j3ufjwe03 FOREIGN KEY (cable_id)
      REFERENCES cable (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
--owner
ALTER TABLE cable_owners OWNER TO ${user};

--transfer existing owner data
INSERT INTO cable_owners (cable_id, owners)
SELECT id, owner
FROM cable;

---
---rename old owner column from cable
---
ALTER TABLE cable RENAME owner TO ownersstring;
