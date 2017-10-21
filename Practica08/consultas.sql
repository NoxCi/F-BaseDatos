set search_path to industria_musical, public;
select nombreint from interprete
  where not pais = 'México'; --1
select titulo from cancion
  where duracion > '05:00'; --2
select distinct funcion from pertenece; --3
select nombre, lugarorigen from club
  where numfans > 500; --4
select nombre, lugarorigen, c.nombreint from club as c, interprete as i
  where pais = 'México' and c.nombreint = i.nombreint; --5
select distinct d.album from cancion as c, esta as e, disco as d
  where c.duracion > '05:00' and c.cod = e.codcan and e.numref = d.numref; --6
select d.album from cancion as c, esta as e, disco as d
  where c.titulo = d.album and c.cod = e.codcan and e.numref = d.numref; --7
select d.disquera, d.direccion from disquera as d, disco as di
  where di.album like 'T%' and d.disquera = di.disquera; --8
select distinct d.album from disco as d, interprete as i
  where CAST ( i.fechacreacion AS VARCHAR(10) ) like '1996%'; --9
select disquera from disquera
except
select distinct d.disquera from disquera as d, disco as di, interprete as i
  where i.pais = 'México' and d.disquera = di.disquera and di.nombreint = i.nombreint; --10
select c.titulo from cancion as c, esta as e, disco as d
  where d.nombreint = 'U2' and d.numref = e.numref and e.codCan = c.cod; --11
select '(' || voz.nombre || ','|| guitarra.nombre || ')' from
  (select nombre, pais from artista as a, pertenece as p, interprete as i
    where a.curp = p.curp and funcion = 'Voz' and p.nombreint = i.nombreint) as voz,
  (select nombre, pais from artista as a, pertenece as p, interprete as i
    where a.curp = p.curp and funcion = 'Guitarra' and p.nombreint = i.nombreint) as guitarra
  where voz.pais = 'España' and guitarra.pais = 'España'; --12
select c.nombre, c.numfans from club as c, (select MAX(numfans) from club) as nMax
	where c.numfans = nMax.max; --13
select c.titulo, c.duracion from cancion as c, (select MAX(duracion) from cancion) as dMax
	where c.duracion = dMax.max; --14
select d.genero from disco as d, interprete as i, club as c, (select MAX(numfans) from club) as m
  where c.numfans = m.max and c.nombreint = i.nombreint and  i.nombreint = d.nombreint;--15
select nombreint, count(album) from disco group by nombreint; -- 16
select di.disquera, di.direccion, count(e.codCan) from disquera as di, disco as d, esta as e
  where di.disquera = d.disquera and d.numref = e.numref group by di.disquera, di.direccion; --17
