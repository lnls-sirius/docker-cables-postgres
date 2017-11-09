ALTER TABLE cable ADD autocalculatedlength character varying(255);
UPDATE cable SET autocalculatedlength = false;