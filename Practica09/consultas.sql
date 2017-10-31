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
           pertenece natural join artista) as j,
           cancion
    where j.codcan = cancion.cod
    order by nombre; --3
