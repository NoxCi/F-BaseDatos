set search_path to casillas, geografico, partidos_politicos, representantes, public;
--Resticciones y comentarios de Casillas
--casillas
create domain BCSE as char check(value in ('B','C','S','E'));
create domain SN as char check(value in ('S','N'));
alter table casillas drop tipo_casilla;
alter table casillas add tipo_casilla BCSE;
alter table casillas drop aprobada;
alter table casillas add aprobada SN;
alter table casillas add constraint
  PKCasillas primary key (id_estado, id_distrito_federal, seccion, tipo_casilla);
alter table casillas add constraint
  FKDistritosFederales foreign key (id_estado, id_distrito_federal)
                       references distritos_federales (id_estado, id_distrito_federal);
comment on table casillas is 'Tabla que contiene a las casillas por secciones.';
 comment on column casillas.id_estado is 'Identificador del estado a la que pertenece la casilla.';
 comment on column casillas.id_distrito_federal is 'Identificador del distrito federal a la que pertenenece la casilla.';
 comment on column casillas.seccion is 'La seccion a la cual pertenece la casilla.';
 comment on column casillas.tipo_casilla is 'Hace referencia al tipo que puede ser una casilla y solo puede ser B, C, S, E.';
 comment on column casillas.aprobada is 'Hace referencia a si la casilla esta aprobada o no, teniendo como dominio S o N.';
--casillas

--Restricciones y comentarios de Geografico
--estados
alter table estados add constraint
  PKEstados primary key (id_estado);
comment on table estados is 'Tabla con los estados de la Republica Mexicana';
  comment on table id_estado is 'Identificador de los estados.';
  comment on table nombre is 'Nombre de los respectivos estado.';
  comment on table abreviatura is 'Abreviatura del nombre de los estados.';
--estados

--municipios
alter table municipios add constraint
  PKMunicipios primary key (id_estado, id_municipio);
alter table municipios add constraint
  FKEstadosM foreign key (id_estado)
            references estados (id_estado);
comment on table municipios is 'Tabla con los municipios respectivos de cada estado.';
  comment on column municipios.id_estado is 'Identificador del estado al cual pertenece el municipio.';
  comment on column municipios.id_municipio is 'Identificador del municipio.';
  comment on column municipios.nombre_municipio is 'Nombre del municipio.';
--municipios

--distritos_federales
alter table distritos_federales add constraint
  PKDistritosFederales primary key (id_estado, id_distrito_federal);
alter table distritos_federales add constraint
  FKEstadosDF foreign key (id_estado)
            references estados (id_estado);
comment on table distritos_federales is 'Tabla con los distritos federales.';
  comment on column distritos_federales.id_estado is 'Identificador del estado del cual pertenece el distrito federal.';
  comment on column distritos_federales.id_distrito_federal is 'Identificador del distrito federal.';
  comment on column distritos_federales.cabecera_distrital_federal is 'Nombre del distrito federal.';
--distritos_federales

--distritos_locales
alter table distritos_locales add constraint
  PKDistritosLocales primary key (id_estado, id_distrito_federal);
alter table distritos_locales add constraint
  FKEstadosDL foreign key (id_estado)
            references estados (id_estado);
comment on table distritos_locales is 'Tabla con los distritos locales.';
  comment on column distritos_locales.id_estado is 'Identificador del estado del cual pertenece el distrito local.';
  comment on column distritos_locales.id_distrito_local is 'Identificador del distrito local.';
  comment on column distritos_locales.cabecera_distrital_local is 'Nombre del distrito local.';
--distritos_locales


--secciones
alter table secciones add constraint
  PKSecciones primary key (id_estado, id_distrito_federal, id_distrito_local, id_municipio, seccion);
alter table secciones add constraint
  FKEstadosS foreign key (id_estado)
            references estados (id_estado);
alter table secciones add constraint
  FKDistritosFederales foreign key (id_estado, id_distrito_federal)
                       references distritos_federales (id_estado, id_distrito_federal);
alter table secciones add constraint
 FKDistritosLoacales foreign key (id_estado, id_distrito_local)
                      references distritos_locales (id_estado, id_distrito_local);
alter table secciones add constraint
  FKMunicipios foreign key (id_estado, id_municipios)
               references municipios (id_estado, id_municipio);
comment on table secciones is 'Tabla con todas las secciones de cada DF, DL y Municipio.';
  comment on column secciones.id_estado is 'Identificador del estado.';
  comment on column secciones.id_distrito_federal is 'Identificador del ditrito federal asociado a un estado.';
  comment on column secciones.id_distrito_local is 'Identificador del distrito local asociado a un estado.';
  comment on column secciones.id_municipio is 'Identificador del municipio asociado a un estado.';
  comment on column secciones.seccion is 'Numero de la seccion asociado a un estado, ditrito fedral, ditrito local y municipio.';
  comment on column secciones.tipo is 'El tipo de la seccion.';
--secciones
