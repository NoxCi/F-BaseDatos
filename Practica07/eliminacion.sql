delete from geografico_normalizado.secciones where id_estado in
  (select id_estado from geografico_normalizado.estados where not id_estado = 1);
delete from geografico_normalizado.distritos_federales where not id_estado = 1;
delete from geografico_normalizado.distritos_locales where not id_estado = 1;
delete from geografico_normalizado.municipios where not id_estado = 1;
delete from geografico_normalizado.estados where not id_estado = 1;
