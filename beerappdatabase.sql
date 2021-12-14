-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.piva definition

-- Drop table

-- DROP TABLE public.piva;

CREATE TABLE public.piva (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	tagline varchar NOT NULL,
	first_brewed varchar NOT NULL,
	description varchar NOT NULL,
	abv float4 NOT NULL,
	CONSTRAINT piva_pk PRIMARY KEY (id)
);


-- public.kupci definition

-- Drop table

-- DROP TABLE public.kupci;

CREATE TABLE public.kupci (
	id serial4 NOT NULL,
	vrsta varchar NOT NULL,
	adresa varchar NOT NULL,
	vlasnik varchar NULL,
	CONSTRAINT kupci_pk PRIMARY KEY (id)
);


-- public.dostavna_vozila definition

-- Drop table

-- DROP TABLE public.dostavna_vozila;

CREATE TABLE public.dostavna_vozila (
	id serial4 NOT NULL,
	oznaka varchar NULL,
	CONSTRAINT dostavna_vozila_pk PRIMARY KEY (id)
);


-- public.vozaci definition

-- Drop table

-- DROP TABLE public.vozaci;

CREATE TABLE public.vozaci (
	id serial4 NOT NULL,
	oznaka varchar NULL,
	ime_prezime varchar NULL,
	CONSTRAINT vozaci_pk PRIMARY KEY (id)
);


-- public.dnevni_rasporedi definition

-- Drop table

-- DROP TABLE public.dnevni_rasporedi;

CREATE TABLE public.dnevni_rasporedi (
	id serial4 NOT NULL,
	raspored_pocetak time NOT NULL,
	raspored_zavrsetak time NOT NULL,
	vozac_id int4 NOT NULL,
	vozilo_id int4 NOT NULL,
	CONSTRAINT dnevni_rasporedi_pk PRIMARY KEY (id),
	CONSTRAINT dnevni_rasporedi_fk FOREIGN KEY (vozac_id) REFERENCES public.vozaci(id),
	CONSTRAINT dnevni_rasporedi_fk2 FOREIGN KEY (vozilo_id) REFERENCES public.dostavna_vozila(id)
);


-- public.narucuje definition

-- Drop table

-- DROP TABLE public.narucuje;

CREATE TABLE public.narucuje (
	kupac_id int4 NOT NULL,
	pivo_id int4 NOT NULL,
	vozilo_id int4 NOT NULL,
	kolicina float4 NOT NULL,
	CONSTRAINT narucuje_pk PRIMARY KEY (kupac_id, pivo_id),
	CONSTRAINT narucuje_fk1 FOREIGN KEY (vozilo_id) REFERENCES public.dostavna_vozila(id),
	CONSTRAINT narucuje_fk2 FOREIGN KEY (kupac_id) REFERENCES public.kupci(id),
	CONSTRAINT narucuje_fk3 FOREIGN KEY (pivo_id) REFERENCES public.piva(id)
);
