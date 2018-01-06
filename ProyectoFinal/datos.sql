SET SEARCH_PATH TO Geografico, Casillas, Partidos_politicos, Representantes;

INSERT INTO Estado VALUES('1', 'Mexico', 'MEX');
INSERT INTO Estado VALUES('2', 'Zacatecas', 'ZAC');
INSERT INTO Estado VALUES('3', 'Yucatan', 'YUC');

INSERT INTO Municipio values('1', '1', 'Cosio');
INSERT INTO Municipio values('2', '2', 'Tepezala');
INSERT INTO Municipio values('3', '3', 'Comondu');

INSERT INTO Distrito_local values('1', '1', 'Palo Alto');
INSERT INTO Distrito_local values('2', '2', 'Calvillo');
INSERT INTO Distrito_local values('3', '3', 'Tenabo');

INSERT INTO Distrito_federal VALUES('1', '1', 'Mexicali');
INSERT INTO Distrito_federal VALUES('2', '2', 'Ensenada');
INSERT INTO Distrito_federal VALUES('3', '3', 'La Paz');

INSERT INTO Seccion VALUES('1', '1', '1', '1', 1);
INSERT INTO Seccion VALUES('2', '2', '2', '2', 2);
INSERT INTO Seccion VALUES('3', '3', '3', '3', 3);

INSERT INTO Casilla VALUES('1', '1', '1', '1', 1, '1', 'B', 'S');
INSERT INTO Casilla VALUES('1', '1', '1', '1', 1, '2', 'C', 'S');
INSERT INTO Casilla VALUES('1', '1', '1', '1', 1, '3', 'S', 'S');
INSERT INTO Casilla VALUES('2', '2', '2', '2', 2, '4', 'E', 'S');
INSERT INTO Casilla VALUES('2', '2', '2', '2', 2, '5', 'B', 'S');
INSERT INTO Casilla VALUES('2', '2', '2', '2', 2, '6', 'C', 'S');
INSERT INTO Casilla VALUES('3', '3', '3', '3', 3, '7', 'S', 'S');
INSERT INTO Casilla VALUES('3', '3', '3', '3', 3, '8', 'E', 'S');
INSERT INTO Casilla VALUES('3', '3', '3', '3', 3, '9', 'B', 'S');

INSERT INTO Partido VALUES ('1', '1', 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES ('1', '2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('1', '3', 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES ('1', '4', 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES ('1', '5', 'Movimiento Ciudadano', 'MC');
INSERT INTO Partido VALUES ('2', '1', 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES ('2', '2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('2', '3', 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES ('2', '4', 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES ('2', '5', 'Movimiento Ciudadano', 'MC');
INSERT INTO Partido VALUES ('3', '1', 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES ('3', '2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('3', '3', 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES ('3', '4', 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES ('3', '5', 'Movimiento Ciudadano', 'MC');



InsertaRepresentantesPreliminares(33);

ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');
ApruebaRepresentanteAnteCasilla('REP1', 'id_casilla');

ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');
ApruebaRepresentanteGeneral('REP1');

SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');
SupleRepresentante('id rep sustituido', 'id_partido', 'id_distrito_federal', 'Nombre');

CreaAsistencias();
