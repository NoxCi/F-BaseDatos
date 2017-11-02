Hiram Ehecatl Lujano Pastrana
313095409
Respuestas
1.
  No, pues si se pretende usar funciones de agrupacion, sin usar gruop by
  este codigo no corre.
2.
  Si, con e siguente condgo
  set search_path to industria_musical, public;
  select 'insert into interprete values(' || fechacreacion || ',' || nombreint || ',' || pais || ')'
    from interprete;
