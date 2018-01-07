CREATE SCHEMA Geografico;
CREATE SCHEMA Casillas;
CREATE SCHEMA Partidos_politicos;
CREATE SCHEMA Representantes;

--Esquema Geografico
SET SEARCH_PATH TO Geografico;

CREATE TABLE Estado(
  id_estado Int PRIMARY KEY,
  nombre_estado Text NOT NULL,
  abreviatura Text NOT NULL
);

CREATE TABLE Municipio(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Int NOT NULL,
  nombre_municipio Text NOT NULL,
  PRIMARY KEY(id_municipio)
);

CREATE TABLE Distrito_local(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_distrito_local Int NOT NULL,
  nombre_distrito_local Text NOT NULL,
  PRIMARY KEY(id_distrito_local)
);

CREATE TABLE Distrito_federal(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_distrito_federal Int NOT NULL,
  nombre_distrito_federal Text NOT NULL,
  PRIMARY KEY(id_distrito_federal)
);

CREATE TABLE Seccion(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Int NOT NULL,
  id_distrito_local Int NOT NULL,
  id_distrito_federal Int NOT NULL,
  seccion Int NOT NULL,
  PRIMARY KEY(id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion),
  FOREIGN KEY(id_municipio) REFERENCES Municipio(id_municipio),
  FOREIGN KEY(id_distrito_local) REFERENCES Distrito_local(id_distrito_local),
  FOREIGN KEY(id_distrito_federal) REFERENCES Distrito_federal(id_distrito_federal)
);

--Esquema Casillas
SET SEARCH_PATH TO Casillas, Geografico;

CREATE TABLE Casilla(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Int NOT NULL,
  id_distrito_local Int NOT NULL,
  id_distrito_federal Int NOT NULL,
  seccion Int NOT NULL,
  id_casilla Int NOT NULL,
  tipo_casilla Char(1) NOT NULL,
  aprobada Char(1) NOT NULL,
  PRIMARY KEY (id_casilla),
  FOREIGN KEY(id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
    REFERENCES Seccion (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
);

--Esquema Partidos_politicos
SET SEARCH_PATH TO Partidos_politicos, Geografico;

CREATE TABLE Partido(
  id_distrito_federal Int NOT NULL,
  id_partido Int NOT NULL,
  nombre_partido Text NOT NULL,
  siglas VarChar(9) NOT NULL,
  PRIMARY KEY (id_partido, id_distrito_federal),
  FOREIGN KEY(id_distrito_federal) REFERENCES Distrito_federal(id_distrito_federal)
);

--Esquema Representantes
SET SEARCH_PATH TO Representantes, Geografico, Casillas, Partidos_politicos;

CREATE TABLE Representante_preliminar(
id_distrito_federal Int Not NULL,
id_partido Int NOT NULL,
id_representante Int NOT NULL,
nombre_representante Text NOT NULL,
fecha_nac Date NOT NULL,
sexo Char(1) NOT NULL,
fecha_y_hora_registro TimeStamp NOT NULL,
PRIMARY KEY (id_distrito_federal, id_partido, id_representante),
FOREIGN KEY (id_distrito_federal, id_partido) REFERENCES Partido(id_distrito_federal, id_partido)
);

CREATE TABLE Representante_aprobado(
id_estado Int REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Int REFERENCES Distrito_federal(id_distrito_federal) NOT NULL,
id_representante Int NOT NULL,
id_partido_que_registro Int NOT NULL,
fecha_y_hora_aprobacion TimeStamp NOT NULL,
usuario_que_aprobo Text NOT NULL,
PRIMARY KEY (id_representante, id_estado, id_distrito_federal),
FOREIGN KEY(id_distrito_federal, id_partido_que_registro, id_representante)
  REFERENCES Representante_preliminar(id_distrito_federal, id_partido, id_representante)
);

CREATE TABLE Representante_general(
id_estado Int REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Int NOT NULL,
id_representante Int NOT NULL,
direccion_representante_g Text NOT NULL,
clave_elector Char(13) NOT NULL,
PRIMARY KEY (id_representante),
FOREIGN KEY (id_estado, id_distrito_federal, id_representante)
  REFERENCES Representante_aprobado(id_estado, id_distrito_federal, id_representante)
);

CREATE TABLE Representante_ante_casilla(
id_estado Int REFERENCES Estado(id_estado) NOT NULL,
id_distrito_federal Int NOT NULL,
id_representante Int NOT NULL,
id_casilla Int REFERENCES Casilla(id_casilla) NOT NULL,
direccion_representante_g Text NOT NULL,
tipo_cargo Char(1) NOT NULL,
PRIMARY KEY (id_representante),
FOREIGN KEY (id_estado, id_distrito_federal, id_representante)
  REFERENCES Representante_aprobado(id_estado, id_distrito_federal, id_representante)
);

CREATE TABLE Asistencia(
  id_representante Int NOT NULL,
  fecha_y_hora_presencia TimeStamp NOT NULL,
  tipo_presencia Char(1) NOT NULL,
  registro_presencia Char(1) NOT NULL,
  PRIMARY KEY(id_representante, fecha_y_hora_presencia),
  FOREIGN KEY(id_representante) REFERENCES Representante_general(id_representante),
  FOREIGN KEY(id_representante) REFERENCES Representante_ante_casilla(id_representante)
);

CREATE TABLE Domicilia_represemtante_ac(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Int NOT NULL,
  id_distrito_local Int NOT NULL,
  id_distrito_federal Int NOT NULL,
  seccion Int NOT NULL,
  id_representante Int REFERENCES Representante_ante_casilla(id_representante) NOT NULL,
  FOREIGN KEY (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
    REFERENCES Seccion (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
);

CREATE TABLE Domicilia_represemtante_g(
  id_estado Int REFERENCES Estado(id_estado) NOT NULL,
  id_municipio Int NOT NULL,
  id_distrito_local Int NOT NULL,
  id_distrito_federal Int NOT NULL,
  seccion Int NOT NULL,
  id_representante Int REFERENCES Representante_general(id_representante) NOT NULL,
  FOREIGN KEY (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
    REFERENCES Seccion (id_estado, id_municipio, id_distrito_local, id_distrito_federal, seccion)
);

CREATE TABLE representantes_sustituciones(
  id_representante_sustituido Int REFERENCES Representante_ante_casilla(id_representante) NOT NULL,
  id_representante_suplente Int NOT NULL,
  fecha_y_hora TimeStamp NOT NULL
);

CREATE TABLE log_representantes_aprobados(
  usuario Text NOT NULL,
  fecha_y_hora TimeStamp NOT NULL,
  operacion Char(1)
);
