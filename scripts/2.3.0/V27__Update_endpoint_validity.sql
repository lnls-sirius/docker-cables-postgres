ALTER TABLE endpoint ADD namestatus character varying(255);
UPDATE endpoint SET namestatus = 'ACTIVE' WHERE validity = 'VALID';
UPDATE endpoint SET namestatus = 'DELETED' WHERE validity = 'DANGLING';