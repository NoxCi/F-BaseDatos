Hiram Ehecatl Lujano Pastrana
313095409

Una vista es básicamente una tabla echa a partir de otra. Estas pueden se
Virtuales o Materializadas.
Las Virtuales no se guardan en la base de datos, si no que se ejecuta el
Query con el que se definio. Estas se definen con el siguiente comando

CREATE VIEW schema.view_name AS SELECT atr1, atr2,..., atrk FROM table_name;

Las Materializadas si se guardan en la base de datos, i.e, son persistentes.
Se definen con el siguiente comando

CREATE MATERIALIZED VIEW schema.view_name AS SELECT atr1, atr2 FROM schema.table_name;

Pero su informarción no se actualiza automáticamente. Por lo que esta debe 'Refrescarse'
son el comando

REFRESH MATERIALIZED VIEW nombreView;

Usaria vistas Virtuales si necesitara usar una misma consulta, en varios Querys.
Y vistas Materializadas si quisiera hacer un BackUp de una tabla o de ciertos atributos.
