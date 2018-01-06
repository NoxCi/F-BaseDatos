SET SEARCH_PATH TO Geografico, Casillas, Partidos_politicos, Representantes;

INSERT INTO Estado VALUES('EST1', 'Mexico', 'MEX');
INSERT INTO Estado VALUES('EST2', 'Zacatecas', 'ZAC');
INSERT INTO Estado VALUES('EST3', 'Yucatan', 'YUC');

INSERT INTO Municipio values('EST1', 'MUN1', 'Cosio');
INSERT INTO Municipio values('EST2', 'MUN2', 'Tepezala');
INSERT INTO Municipio values('EST3', 'MUN3', 'Comondu');

INSERT INTO Distrito_local values('EST1', 'DIL1', 'Palo Alto');
INSERT INTO Distrito_local values('EST2', 'DIL2', 'Calvillo');
INSERT INTO Distrito_local values('EST3', 'DIL3', 'Tenabo');

INSERT INTO Distrito_federal VALUES('EST1', 'DIF1', 'Mexicali');
INSERT INTO Distrito_federal VALUES('EST2', 'DIF2', 'Ensenada');
INSERT INTO Distrito_federal VALUES('EST3', 'DIF3', 'La Paz');

INSERT INTO Seccion VALUES('EST1', 'MUN1', 'DIL1', 'DIF1', 1);
INSERT INTO Seccion VALUES('EST2', 'MUN2', 'DIL2', 'DIF2', 2);
INSERT INTO Seccion VALUES('EST3', 'MUN3', 'DIL3', 'DIF3', 3);

INSERT INTO Casilla VALUES('EST1', 'MUN1', 'DIL1', 'DIF1', 1, 'CAS1', 'B', 'S');
INSERT INTO Casilla VALUES('EST1', 'MUN1', 'DIL1', 'DIF1', 1, 'CAS2', 'C', 'S');
INSERT INTO Casilla VALUES('EST1', 'MUN1', 'DIL1', 'DIF1', 1, 'CAS3', 'S', 'S');
INSERT INTO Casilla VALUES('EST2', 'MUN2', 'DIL2', 'DIF2', 2, 'CAS4', 'E', 'S');
INSERT INTO Casilla VALUES('EST2', 'MUN2', 'DIL2', 'DIF2', 2, 'CAS5', 'B', 'S');
INSERT INTO Casilla VALUES('EST2', 'MUN2', 'DIL2', 'DIF2', 2, 'CAS6', 'C', 'S');
INSERT INTO Casilla VALUES('EST3', 'MUN3', 'DIL3', 'DIF3', 3, 'CAS7', 'S', 'S');
INSERT INTO Casilla VALUES('EST3', 'MUN3', 'DIL3', 'DIF3', 3, 'CAS8', 'E', 'S');
INSERT INTO Casilla VALUES('EST3', 'MUN3', 'DIL3', 'DIF3', 3, 'CAS9', 'B', 'S');

INSERT INTO Partido VALUES ('DIF1', 'PAR1', 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES ('DIF1', 'PAR2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('DIF1', 'PAR3', 'Partido de la Revolucion Democratica', 'PRD');
INSERT INTO Partido VALUES ('DIF2', 'PAR1', 'Partido Accion Nacional', 'PAN');
INSERT INTO Partido VALUES ('DIF2', 'PAR2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('DIF2', 'PAR4', 'Partido del Trabajo', 'PT');
INSERT INTO Partido VALUES ('DIF3', 'PAR5', 'Movimiento Ciudadano', 'MC');
INSERT INTO Partido VALUES ('DIF3', 'PAR2', 'Partido Revolucionario Institucional', 'PRI');
INSERT INTO Partido VALUES ('DIF3', 'PAR3', 'Partido de la Revolucion Democratica', 'PRD');

InsertaRepresentantesPreliminares(33);

ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');
ApruebaRepresentanteAnteCasilla('REP1', 'CAS1');

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

SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');
SupleRepresentante('id rep sustituido', 'PAR1', 'DIF1', 'Nombre');

CreaAsistencias();
