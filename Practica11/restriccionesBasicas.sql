SET search_path to casillas, geografico, partidos_politicos, representantes, public;
--Restricciones y comentarios de Geografico
--estados
ALTER TABLE estados ADD CONSTRAINT
  PKEstados PRIMARY KEY (id_estado);
  --ON UPDATE cascade
  --ON DELETE casdade;
COMMENT ON TABLE estados IS 'Tabla con los estados de la Republica Mexicana';
  COMMENT ON COLUMN estados.id_estado IS 'Identificador de los estados.';
  COMMENT ON COLUMN estados.nombre IS 'Nombre de los respectivos estado.';
  COMMENT ON COLUMN estados.abreviatura IS 'Abreviatura del nombre de los estados.';
--estados

--municipios
ALTER TABLE municipios ADD CONSTRAINT
  PKMunicipios PRIMARY KEY (id_estado, id_municipio);
  --ON UPDATE cascade
  --ON DELETE casdade;
ALTER TABLE municipios ADD CONSTRAINT
  FKEstadosM FOREIGN KEY (id_estado)
            REFERENCES estados (id_estado)  match full;
COMMENT ON TABLE municipios IS 'Tabla con los municipios respectivos de cada estado.';
  COMMENT ON COLUMN municipios.id_estado IS 'Identificador del estado al cual pertenece el municipio.';
  COMMENT ON COLUMN municipios.id_municipio IS 'Identificador del municipio.';
  COMMENT ON COLUMN municipios.nombre_municipio IS 'Nombre del municipio.';
--municipios

--distritos_federales
ALTER TABLE distritos_federales ADD CONSTRAINT
  PKDistritosFederales PRIMARY KEY (id_estado, id_distrito_federal);
  --ON UPDATE cascade
  --ON DELETE casdade;
ALTER TABLE distritos_federales ADD CONSTRAINT
  FKEstadosDF FOREIGN KEY (id_estado)
            REFERENCES estados (id_estado)  match full;
COMMENT ON TABLE distritos_federales IS 'Tabla con los distritos federales.';
  COMMENT ON COLUMN distritos_federales.id_estado IS 'Identificador del estado del cual pertenece el distrito federal.';
  COMMENT ON COLUMN distritos_federales.id_distrito_federal IS 'Identificador del distrito federal.';
  COMMENT ON COLUMN distritos_federales.cabecera_distrital_federal IS 'Nombre del distrito federal.';
--distritos_federales

--distritos_locales
ALTER TABLE distritos_locales ADD CONSTRAINT
  PKDistritosLocales PRIMARY KEY (id_estado, id_distrito_local);
  --ON UPDATE cascade
  --ON DELETE casdade;
ALTER TABLE distritos_locales ADD CONSTRAINT
  FKEstadosDL FOREIGN KEY (id_estado)
            REFERENCES estados (id_estado)  match full;
COMMENT ON TABLE distritos_locales IS 'Tabla con los distritos locales.';
  COMMENT ON COLUMN distritos_locales.id_estado IS 'Identificador del estado del cual pertenece el distrito local.';
  COMMENT ON COLUMN distritos_locales.id_distrito_local IS 'Identificador del distrito local.';
  COMMENT ON COLUMN distritos_locales.cabecera_distrital_local IS 'Nombre del distrito local.';
--distritos_locales


--secciones
ALTER TABLE secciones ADD tipo char(1);
ALTER TABLE secciones ADD CONSTRAINT
  PKSecciones PRIMARY KEY (id_estado, id_distrito_federal, id_distrito_local, id_municipio, seccion);
ALTER TABLE secciones ADD CONSTRAINT
  FKEstadosS FOREIGN KEY (id_estado)
            REFERENCES estados (id_estado) match full;
ALTER TABLE secciones ADD CONSTRAINT
  FKDistritosFederalesS FOREIGN KEY (id_estado, id_distrito_federal)
                       REFERENCES distritos_federales (id_estado, id_distrito_federal) match full;
ALTER TABLE secciones ADD CONSTRAINT
 FKDistritosLoacalesS FOREIGN KEY (id_estado, id_distrito_local)
                      REFERENCES distritos_locales (id_estado, id_distrito_local)  match full;
ALTER TABLE secciones ADD CONSTRAINT
  FKMunicipiosS FOREIGN KEY (id_estado, id_municipio)
               REFERENCES municipios (id_estado, id_municipio)  match full;
COMMENT ON TABLE secciones IS 'Tabla con todas las secciones de cada DF, DL y Municipio.';
  COMMENT ON COLUMN secciones.id_estado IS 'Identificador del estado.';
  COMMENT ON COLUMN secciones.id_distrito_federal IS 'Identificador del ditrito federal asociado a un estado.';
  COMMENT ON COLUMN secciones.id_distrito_local IS 'Identificador del distrito local asociado a un estado.';
  COMMENT ON COLUMN secciones.id_municipio IS 'Identificador del municipio asociado a un estado.';
  COMMENT ON COLUMN secciones.seccion IS 'Numero de la seccion asociado a un estado, ditrito fedral, ditrito local y municipio.';
  COMMENT ON COLUMN secciones.tipo IS 'El tipo de la seccion.';
--secciones

--Resticciones y comentarios de Casillas
--casillas
CREATE DOMAIN BCSE AS char CHECK(value IN ('B','C','S','E'));
CREATE DOMAIN SN AS char CHECK(value IN ('S','N'));
ALTER TABLE casillas DROP tipo_casilla;
ALTER TABLE casillas ADD tipo_casilla BCSE;
ALTER TABLE casillas DROP aprobada;
ALTER TABLE casillas ADD aprobada SN;
ALTER TABLE casillas ADD id_distrito_local integer;
ALTER TABLE casillas ADD id_municipio integer;
ALTER TABLE casillas ADD CONSTRAINT
  PKCasillas PRIMARY KEY (id_estado, id_distrito_federal, seccion, tipo_casilla);
ALTER TABLE casillas ADD CONSTRAINT
 FKEstadosC FOREIGN KEY (id_estado)
            REFERENCES estados (id_estado) match full;
ALTER TABLE casillas ADD CONSTRAINT
  FKDistritosFederalesC FOREIGN KEY (id_estado, id_distrito_federal)
                       REFERENCES distritos_federales (id_estado, id_distrito_federal)  match full;
ALTER TABLE casillas ADD CONSTRAINT
  FKSeccionsC FOREIGN KEY (id_estado, id_distrito_federal, id_distrito_local, id_municipio, seccion)
                     REFERENCES secciones (id_estado, id_distrito_federal, id_distrito_local, id_municipio, seccion) match full;
COMMENT ON TABLE casillas IS 'Tabla que contiene a las casillas por secciones.';
 COMMENT ON COLUMN casillas.id_estado IS 'Identificador del estado a la que pertenece la casilla.';
 COMMENT ON COLUMN casillas.id_distrito_federal IS 'Identificador del distrito federal a la que pertenenece la casilla.';
 COMMENT ON COLUMN casillas.seccion IS 'La seccion a la cual pertenece la casilla.';
 COMMENT ON COLUMN casillas.tipo_casilla IS 'Hace referencia al tipo que puede ser una casilla y solo puede ser B, C, S, E.';
 COMMENT ON COLUMN casillas.aprobada IS 'Hace referencia a si la casilla esta aprobada o no, teniendo como dominio S o N.';
--casillas

--Restricciones y comentarios de Partidos_Politicos
--partidos
ALTER TABLE partidos ADD CONSTRAINT
  PKPartidos PRIMARY KEY (id_estado, id_distrito_federal, id_partido);
ALTER TABLE partidos ADD CONSTRAINT
  FKEstadosP FOREIGN KEY (id_estado)
             REFERENCES estados (id_estado) match full;
ALTER TABLE partidos ADD CONSTRAINT
  FKDistritosFederales FOREIGN KEY (id_estado, id_distrito_federal)
                       REFERENCES distritos_federales (id_estado, id_distrito_federal) match full;
COMMENT ON TABLE partidos IS 'Tabla con todos los partidos politicos.';
  COMMENT ON COLUMN partidos.id_estado IS 'Identificador del estado al cual pertenece el partido politico.';
  COMMENT ON COLUMN partidos.id_distrito_federal IS 'Identificador del distrito federal al cual pertenece el partido politico.';
  COMMENT ON COLUMN partidos.id_partido IS 'Identificador del partido politico.';
  COMMENT ON COLUMN partidos.nombre IS 'Nombre del partido politico.';
  COMMENT ON COLUMN partidos.siglas IS 'Siglas del partido politico.';
--partidos

--Esquema de Representantes
--representantes_preliminares
CREATE TABLE representantes.representantes_preliminares(
  id_representante Integer,
  id_estado Integer,
  id_distrito_federal Integer,
  id_partido Integer,
  nombre Varchar(50),
  apellido_paterno Varchar(50),
  apellido_materno Varchar(50),
  tipo_representante Char(1) CHECK (tipo_representante in ('G','C')),
  aprobado Char(1) CHECK (aprobado IN ('S', 'N')) DEFAULT 'N', --revision pendiente
  tiempo_resgistro TimeStamp,
    CONSTRAINT PKRepresentanteP PRIMARY KEY (id_representante, id_estado, id_distrito_federal, id_partido),
    CONSTRAINT FKPartidoRP FOREIGN KEY (id_estado, id_distrito_federal, id_partido)
                           REFERENCES partidos (id_estado, id_distrito_federal, id_partido)

);
--representantes_preliminares

--representantes_generales
--representantes_generales

--representantes_ante_casilla
--representantes_ante_casilla

--representantes_aprobados
CREATE TABLE representantes.representantes_aprobados(
  id_representante Integer,
  id_estado Integer,
  id_distrito_federal Integer,
  id_partido Integer,
  --id_usuario Integer,                  --se deben poner en otra tabla
  --fecha_y_hora_de_aprobacion TimeStamp,
  CONSTRAINT PKRepresentanteA PRIMARY KEY (id_representante);
  CONSTRAINT FKRepresentantePA FOREIGN KEY (id_representante, id_estado, id_distrito_federal, id_partido)
                         REFERENCES representantes_preliminares (id_representante, id_estado, id_distrito_federal, id_partido)
);
--representantes_aprobados
