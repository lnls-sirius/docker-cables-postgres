--foregin keys
ALTER TABLE ONLY routingrow
    ADD CONSTRAINT fk_fxegddef34heg3grrl22bsroh FOREIGN KEY (routing) REFERENCES routing(id);
ALTER TABLE ONLY routingrow
    ADD CONSTRAINT fk_kdwa4432fasrtg32ry8km5ada FOREIGN KEY (cable) REFERENCES cable(id);
