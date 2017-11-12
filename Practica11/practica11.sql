CREATE SCHEMA Geografico;
CREATE SCHEMA Casillas;
CREATE SCHEMA Partidos_politicos;
CREATE SCHEMA Representantes;

 create table Geografico.Estados (
id_estado integer , 
nombre varchar(50), 
abreviatura varchar(10)) ;
 
--DROP TABLE Geografico.Distritos_federales;   	
create table Geografico.Distritos_federales (
id_estado Integer   , 
id_distrito_federal Integer , 
cabecera_distrital_federal varchar(50));
 
--DROP TABLE Geografico.Distritos_locales;   	
create table Geografico.Distritos_locales (
id_estado Integer   , 
id_distrito_local Integer , 
cabecera_distrital_local varchar(50) ); 

--DROP TABLE Geografico.Municipios;   	
create table Geografico.Municipios (
id_estado Integer   , 
id_municipio Integer , 
nombre_municipio varchar(50) );
  
--DROP TABLE Geografico.Secciones;   	
create table Geografico.Secciones (
id_estado Integer  , 
id_distrito_federal Integer , 
id_distrito_local Integer , 
id_municipio Integer   ,
seccion Integer );
 

--DROP TABLE Casillas.Casillas;
create table Casillas.Casillas (
 id_estado Integer ,
 id_distrito_federal Integer  , 
 seccion integer, 
 tipo_casilla char, 
 aprobada char);

--DROP TABLE Partidos_politicos.Partidos;
 create table Partidos_politicos.Partidos(
 id_estado Integer , 
 id_distrito_federal Integer  , 
 id_partido Integer, 
 nombre varchar(50),  
 siglas varchar(30) ); 