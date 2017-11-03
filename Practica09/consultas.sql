set search_path to industria_musical, public;
select n01.disquera, n01.direccion
  from (select disquera, direccion, nombreint, count(album) from disquera natural join disco group by disquera, direccion, nombreint) as n01,
       (select disquera, nombreint, count(album) from disco group by nombreint, disquera) as n02
  where n01.count = n02.count and n01.nombreint = n02.nombreint; --1
select nombreint, count(curp)
  from interprete natural join pertenece
  group by nombreint
    having count(curp) > 2; --2
select distinct nombre, album, titulo
	from  (esta natural join
           disco natural join
           interprete natural join
           pertenece natural join
           artista) as j,
           cancion
    where j.codcan = cancion.cod
    order by nombre; --3
select nombrec, titulo
  from
    compositor
      natural join
    (select curpc ,titulo, count(titulo) from cancion, esta where cancion.cod = esta.codcan group by titulo, curpc) as tc
  group by nombrec, count, titulo
  having count = MAX(count); --4
select nombreint, nombre, funcion
  from interprete natural join pertenece natural join artista; --5
select nombre, funcion
  from club natural join interprete natural join pertenece
  where funcion = 'Bajo'
  group by nombre, funcion
  having count(funcion) > 0; --6
select funcion, count(funcion)
  from pertenece
  group by funcion; --7
select cast(fechacreacion as varchar(4)), count(fechacreacion)
  from interprete
  group by fechacreacion
  order by fechacreacion --8
select nombreint, cast(cast(now() as varchar(4)) as integer) - cast(cast(fechacreacion as varchar(4)) as integer) as años
  from interprete; --9
select album, count(codcan), MAX(duracion)
  from disco natural join esta, cancion
  where cod = codcan
  group by album; --10
