--
-- Name: LocationTag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE LocationTag (
    tag character varying(255),
    description character varying(65545)
);

ALTER TABLE LocationTag OWNER TO ${user};

ALTER TABLE ONLY LocationTag
    ADD CONSTRAINT LocationTag_pkey PRIMARY KEY (tag);

INSERT INTO LocationTag (tag, description) VALUES ('', 'ESS'), ('++ESS.A', 'Entire Lund site'), ('+ESS.F', 'Auxiliary Buildings South'),
 ('+ESS.F03', 'Logistic Center'), ('+ESS.H', 'Auxiliary Buildings North'), ('+ESS.H01', 'Central Utility Building (CUB)') , ('+ESS.H06', 'Distribution Substation (CUB)'),
('+ESS.H05', 'Primary Substation'),('+ESS.H10', 'Sprinkler Central Building'),('+ESS.G', 'Accelerator buildings'),('+ESS.G01', 'Tunnel'),
('+ESS.G04', 'Cryo Compression Building'),('+ESS.G02', 'Gallery Building'),('+ESS.C', 'Experimental Halls South'),('+ESS.B', 'Campus Area'),
('+ESS.E', 'Experimental Halls North'),('+ESS.E02', 'Beam Line Gallery'),('+ESS.E03', 'Lab 3A, Experimental Hall 3'),('+ESS.E04', 'Lab 3B, Experimental Hall 3'),
('+ESS.E01', 'Experimental Hall 3'),('+ESS.E05', 'Substation'),('+ESS.D', 'Target buildings'),('+ESS.D01', 'Experimental Hall 1'),
('+ESS.D02', 'Target Building'),('+ESS.D03', 'Experimental Hall 2'),('+ESS.D04', 'Lab 2, Experimental Hall 2'),('+ESS.D06', 'Substation'),
('+ESS.D05', 'Substation'),('+ESS.D08', 'Lab 1A, Experimental Hall 1'),('+ESS.D07', 'Lab 1B, Experimental Hall 1')
