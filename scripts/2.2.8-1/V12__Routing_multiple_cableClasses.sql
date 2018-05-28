--
--routing_cablecasses
--
CREATE TABLE routing_cableclasses
(
  routing_id bigint NOT NULL,
  cableclasses character varying(255),
  CONSTRAINT fk_rs6b8vayh0wk5l94wyso74fr7 FOREIGN KEY (routing_id)
      REFERENCES routing (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
--owner
ALTER TABLE routing_cableclasses OWNER TO ${user};

--transfer existing routing class data
INSERT INTO routing_cableclasses (routing_id, cableclasses)
SELECT id, routingclass
FROM routing;

---
---delete old routing class column from routing
---
ALTER TABLE routing DROP routingclass;
