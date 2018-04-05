-- change auto calculated length column values from boolean true/false
-- to enum YES/NO
UPDATE cable SET autocalculatedlength = 'NO' WHERE autocalculatedlength = 'false';
UPDATE cable SET autocalculatedlength = 'YES' WHERE autocalculatedlength = 'true';
