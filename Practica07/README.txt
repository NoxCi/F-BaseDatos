Hiram Ehectal Lujano Pastrana
313095409
Respuestas a preguntas.
1. Si podria actualizarse si, la llave primaria no se use como llave foranea en otro lado.
   Ademas la nueva llave tambien se debe asegurar que se unica. Por ejemplo tomando ejemplo
   que seccion es secuencial de 1 a 1, y el maximo es 527, y seccion no se usa de foranea en otro lado, se puede ejecutar el codigo siguente

   update geografico_normalizado.secciones set seccion = seccion + 1000 where seccion <= 25 returning seccion;

2. Si es posible como lo demuestra el ejecutar el siguiente query

	update geografico_normalizado.secciones set (tipo,id_distrito_local) = ('M', 4)
  		where seccion > 13 and seccion <= 25 returning seccion, tipo, id_distrito_local;

   Y pues no deberia de tener problemas mientras la nueva llave exista.