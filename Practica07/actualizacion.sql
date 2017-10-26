update geografico_normalizado.secciones set tipo = 'M'
  where seccion <= 13 returning seccion, tipo;

update geografico_normalizado.secciones set (tipo,id_distrito_local) = ('M', 4)
  where seccion > 13 and seccion <= 25 returning seccion, tipo, id_distrito_local;
