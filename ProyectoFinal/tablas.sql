CREATE SCHEMA Geografico;
CREATE SCHEMA Casillas;
CREATE SCHEMA Partidos_politicos;
CREATE SCHEMA Representantes;

--Esquema Geografico
SET SEARCH_PATH TO Geografico;

CREATE TABLE Estado(
  id_estado Text PRIMARY KEY,
  nombre_estado Text NOT NULL,
  abreviatura Text NOT NULL
);

CREATE TABLE Municipio(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Text NOT NULL,
  nombre_municipio Text NOT NULL,
  PRIMARY KEY(id_municipio)
);

CREATE TABLE Distrito_local(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_distrito_local Text NOT NULL,
  nombre_distrito_local Text NOT NULL,
  PRIMARY KEY(id_distrito_local)
);

CREATE TABLE Distrito_federal(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_distrito_federal Text NOT NULL,
  nombre_distrito_federal Text NOT NULL,
  PRIMARY KEY(id_distrito_federal)
);

CREATE TABLE Seccion(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Text NOT NULL,
  id_distrito_local Text NOT NULL,
  id_distrito_federal Text NOT NULL,
  seccion Int NOT NULL,
  tipo_seccion Char(1) NOT NULL,
  PRIMARY KEY(id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion),
  FOREIGN KEY(id_municipio) REFERENCES Municipio(id_municipio),
  FOREIGN KEY(id_distrito_local) REFERENCES Distrito_local(id_distrito_local),
  FOREIGN KEY(id_distrito_federal) REFERENCES Distrito_federal(id_distrito_federal)
);

--Esquema Casillas
SET SEARCH_PATH TO Casillas, Geografico;

CREATE TABLE Casilla(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Text NOT NULL,
  id_distrito_local Text NOT NULL,
  id_distrito_federal Text NOT NULL,
  seccion Int NOT NULL,
  id_casilla Text NOT NULL,
  tipo_casilla Char(1) NOT NULL,
  aprobada Char(1) NOT NULL,
  PRIMARY KEY (id_casilla),
  FOREIGN KEY(id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
    REFERENCES Seccion (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
);

--Esquema Partidos_politicos
SET SEARCH_PATH TO Partidos_politicos, Geografico;

CREATE TABLE Partido(
  id_distrito_federal Text NOT NULL,
  id_partido Text NOT NULL,
  nombre_partido Text NOT NULL,
  siglas VarChar(9) NOT NULL,
  PRIMARY KEY (id_partido),
  FOREIGN KEY(id_distrito_federal) REFERENCES Distrito_federal(id_distrito_federal)
);

--Esquema Representantes
SET SEARCH_PATH TO Representantes, Geografico, Casillas, Partidos_politicos;

CREATE TABLE Representante_preliminar(
id_partido_que_registro Text NOT NULL,
id_representante Text NOT NULL,
nombre_representante Text NOT NULL,
fecha_y_hora_registro TimeStamp NOT NULL,
PRIMARY KEY (id_partido_que_registro, id_representante),
FOREIGN KEY (id_partido_que_registro) REFERENCES Partido(id_partido)
);

CREATE TABLE Representante_aprobado(
id_estado Text REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Text REFERENCES Distrito_federal(id_distrito_federal) NOT NULL,
id_representante Text NOT NULL,
id_partido_que_registro Text NOT NULL,
fecha_y_hora_aprobacion TimeStamp NOT NULL,
usuario_que_aprobo Text NOT NULL,
PRIMARY KEY (id_representante, id_estado, id_distrito_federal),
FOREIGN KEY(id_partido_que_registro, id_representante)
  REFERENCES Representante_preliminar(id_partido_que_registro, id_representante)
);

CREATE TABLE Representante_general(
id_estado Text REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Text NOT NULL,
id_representante Text NOT NULL,
direccion_representante_g Text NOT NULL,
clave_elector Char(13) NOT NULL,
PRIMARY KEY (id_representante),
FOREIGN KEY (id_estado, id_distrito_federal, id_representante)
  REFERENCES Representante_aprobado(id_estado, id_distrito_federal, id_representante)
);

CREATE TABLE Representante_ante_casilla(
id_estado Text REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Text NOT NULL,
id_representante Text NOT NULL,
direccion_representante_g Text NOT NULL,
clave_elector Char(13) NOT NULL,
PRIMARY KEY (id_representante),
FOREIGN KEY (id_estado, id_distrito_federal, id_representante)
  REFERENCES Representante_aprobado(id_estado, id_distrito_federal, id_representante)
);

CREATE TABLE Domicilia(
  id_estado Text REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Text NOT NULL,
  id_distrito_local Text NOT NULL,
  id_distrito_federal Text NOT NULL,
  seccion Int NOT NULL,
  id_representante Text NOT NULL,
  FOREIGN KEY (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
    REFERENCES Seccion (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion),
  FOREIGN KEY(id_representante) REFERENCES Representante_general(id_representante),
  FOREIGN KEY(id_representante) REFERENCES Representante_ante_casilla(id_representante)
);

CREATE TABLE Casilla_que_representa(
  id_casilla Text REFERENCES Casilla(id_casilla) NOT NULL,
  id_representante Text REFERENCES Representante_ante_casilla(id_representante) NOT NULL
);

CREATE TABLE representantes_sustituciones(
  id_representante_sustituido Text REFERENCES Representante_ante_casilla(id_representante) NOT NULL,
  id_representante_suplente Text REFERENCES Representante_ante_casilla(id_representante) NOT NULL,
  fecha_y_hora TimeStamp NOT NULL
);

CREATE TABLE log_representantes_aprobados(
  usuario Text NOT NULL,
  fecha_y_hora TimeStamp NOT NULL,
  operacion Char(1)
);
