delete from geografico_normailzado.estados where not id_estado = 1;
delete from geografico_normailzado.distritos_federales where not id_estado = 1;
delete from geografico_normailzado.distritos_locales where not id_estado = 1;
delete * from geografico_normailzado.municipios where not id_estado = 1;
delete * from geografico_normailzado.secciones where not id_estado = 1;
