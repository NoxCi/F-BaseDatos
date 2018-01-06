
--Dominios del esquema Casillas
SET SEARCH_PATH TO Casillas;

CREATE DOMAIN TipoCasilla AS Char(1) CHECK(value IN ('B','C','S','E'));
CREATE DOMAIN DoAprobada AS Char(1) CHECK(value IN ('S','N'));

ALTER TABLE Casilla ALTER tipo_casilla TYPE TipoCasilla;
ALTER TABLE Casilla ALTER aprobada TYPE DoAprobada;

--Dominios del esquema Representantes
SET SEARCH_PATH TO Representantes;

CREATE DOMAIN DoOperacion AS Char(1) CHECK(value IN ('U','I','D'));
CREATE DOMAIN TipoPresencia AS Char(1) CHECK(value IN ('I','F','C'));
CREATE DOMAIN RegistroPresencia AS Char(1) CHECK(value IN ('F', 'N'));
CREATE DOMAIN ClaveElector AS Char(13) CHECK(value SIMILAR TO '[a-z]{6}%[0-9]{6}%(H|M){1}');

ALTER TABLE log_representantes_aprobados ALTER operacion TYPE DoOperacion;
ALTER TABLE Asistencia ALTER tipo_presencia TYPE TipoPresencia;
ALTER TABLE Asistencia ALTER registro_presencia TYPE RegistroPresencia;
