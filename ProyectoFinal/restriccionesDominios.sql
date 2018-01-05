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
CREATE DOMAIN TipoCasilla AS Char(1) CHECK(value IN ('B','C','S','E'));
CREATE DOMAIN DoAprobada AS Char(1) CHECK(value IN ('S','N'));

ALTER TABLE Casilla ALTER id_casilla TYPE IdCasilla;
ALTER TABLE Casilla ALTER tipo_casilla TYPE TipoCasilla;
ALTER TABLE Casilla ALTER aprobada TYPE DoAprobada;

--Dominios del esquema Partidos_politicos
SET SEARCH_PATH TO Partidos_politicos;

CREATE DOMAIN IdPartido AS Text CHECK(value LIKE 'PAR\d+');

ALTER TABLE Partido ALTER id_partido TYPE IdPartido;

--Dominios del esquema Representantes
SET SEARCH_PATH TO Representantes;

CREATE DOMAIN IdRepresentante AS Text CHECK(value LIKE 'REP\d+');
CREATE DOMAIN DoOperacion AS Char(1) CHECK(value IN ('U','I','D'));
CREATE DOMAIN TipoPresencia AS Char(1) CHECK(value IN ('I','F','C'));
CREATE DOMAIN RegistroPresencia AS Char(1) CHECK(value IN ('F', 'N'));
CREATE DOMAIN ClaveElector AS Char(13) CHECK(value LIKE '[a-z]*6[0-9]*6{H,M}')

ALTER TABLE Representante_preliminar ALTER id_representante TYPE IdRepresentante;
ALTER TABLE log_representantes_aprobados ALTER operacion TYPE DoOperacion;
ALTER TABLE Asistencia ALTER tipo_presencia TYPE TipoPresencia;
ALTER TABLE Asistencia ALTER registro_presencia TYPE RegistroPresencia;