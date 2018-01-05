--Dominios del esquema Geografico
SET SEARCH_PATH TO Geografico;

CREATE DOMAIN IdEstado AS Text CHECK(value LIKE 'EST\d+');
CREATE DOMAIN IdMunicipio AS Text CHECK(value LIKE 'MUN\d+');
CREATE DOMAIN IdDistritoLocal AS Text CHECK(value LIKE 'DIL\d+');
CREATE DOMAIN IdDistritoFederal AS Text CHECK(value LIKE 'DIF\d+');

ALTER TABLE Estado ALTER id_estado TYPE IdEstado;
ALTER TABLE Municipio ALTER id_municipio TYPE IdMunicipio;
ALTER TABLE Distrito_local ALTER id_distrito_local TYPE IdDistritoLocal;
ALTER TABLE Distrito_federal ALTER id_distrito_federal TYPE IdDistritoFederal;

--Dominios del esquema Casillas
SET SEARCH_PATH TO Casillas;

CREATE DOMAIN IdCasilla AS Text CHECK(value LIKE 'CAS\d+');

ALTER TABLE Casilla ALTER id_casilla TYPE IdCasilla;

--Dominios del esquema Partidos_politicos
SET SEARCH_PATH TO Partidos_politicos;

CREATE DOMAIN IdPartido AS Text CHECK(value LIKE 'PAR\d+');

ALTER TABLE Partido ALTER id_partido TYPE IdPartido;

--Dominios del esquema Representantes
SET SEARCH_PATH TO Representantes;

CREATE DOMAIN IdRepresentante AS Text CHECK(value LIKE 'REP\d+');

ALTER TABLE Representante_preliminar ALTER id_representante TYPE IdRepresentante;
