create schema geografico_normalizado;

create table geografico_normalizado.R1(
	id_municipio_y_cabeceraDF integer primary key,
	nombre_municipio varchar(50),
	cabecera_distrital_federal varchar(50));
comment on table geografico_normalizado.R1 is 'Captura|Tabla que contiene a los atributos de R1.';
 comment on column geografico_normalizado.R1.id_municipio_y_cabeceraDF is '|Identificador del estado.';
  comment on column geografico_normalizado.R1.nombre_municipio is '|Hace referencia al nombre asociado al identificador del municipio';
  comment on column geografico_normalizado.R1.cabecera_distrital_federal is '|Hace referencia al nombre de la cabecera_distrital_federal asociado al identifacador del estado';
  

create table geografico_normalizado.R2(
	id_municipio_y_cabeceraDF integer references geografico_normalizado.R1(id_municipio_y_cabeceraDF),
	nombre_estado varchar(50),
	abreviatura varchar(10),
	cabecera_distrital_local varchar(50),
	seccion integer,
	tipo varchar(1),
	constraint pk primary key (id_municipio_y_cabeceraDF, seccion));
comment on table geografico_normalizado.R2 is 'Captura|Tabla que contiene a los atributos de R2.';
 comment on column geografico_normalizado.R2.id_municipio_y_cabeceraDF is '|Identificador del municipio y la cabecera distrital federal.';
  comment on column geografico_normalizado.R2.nombre_estado is '|Nombre del estado.';
  comment on column geografico_normalizado.R2.abreviatura is '|Abreviatura del estado.';
  comment on column geografico_normalizado.R2.cabecera_distrital_local is '|Nombre de la cabecera distrital local.';
  comment on column geografico_normalizado.R2.seccion is '|Numero de la seccion.';
  comment on column geografico_normalizado.R2.tipo is '|Tipo de seccion.';