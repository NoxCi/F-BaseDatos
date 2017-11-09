set search_path to geografico,casillas, representantes, public;
--Primer consul
select nombre, id_estado, cabecera_distrital_federal, cabecera_distrital_local, nombre_municipio, seccion, tipo_casilla
  from (((select distinct * from casillas)
          except
       (select distinct id_estado, id_distrito_federal, seccion, tipo_casilla, aprobada
         from casillas natural join asistencias
                       natural join representantes_preliminares
                       natural join representantes_aprobados where aprobada = 'S')) as a
       natural join secciones) as b natural join estados
                                    natural join municipios
                                    natural join distritos_locales
                                    natural join distritos_federales; --1
--Segunda consulta
select nombre,
       id_estado,
       cabecera_distrital_federal,
       cabecera_distrital_local,
       nombre_municipio,
       seccion,
       tipo_casilla,
       representantesG,
       sumIG,
       sumFG,
       sumCG,
       representantesC,
       sumIG,
       sumFC,
       sumCC,
       total
from
  (select id_estado,
          id_distrito_federal,
          seccion,
          tipo_casilla,
          sum(rG) representantesG,
          sum(IG) sumIG,
          sum(FG) sumFG,
          sum(CG) sumCG,
          sum(rC) representantesC,
          sum(IG) sumIC,
          sum(FC) sumFC,
          sum(CC) sumCC,
          total
  from
    (select id_estado,
            id_distrito_federal,
            seccion,
            tipo_casilla,
           (case when tipo_representante = 'G' then 1 else 0 end) rG,
           (case when tipo_representante = 'G' and tipo_presencia = 'I' then 1 else 0 end) IG,
           (case when tipo_representante = 'G' and tipo_presencia = 'F' then 1 else 0 end) FG,
           (case when tipo_representante = 'G' and tipo_presencia = 'C' then 1 else 0 end) CG,
           (case when tipo_representante = 'C' then 1 else 0 end) rC,
           (case when tipo_representante = 'C' and tipo_presencia = 'I' then 1 else 0 end) IC,
           (case when tipo_representante = 'C' and tipo_presencia = 'F' then 1 else 0 end) FC,
           (case when tipo_representante = 'C' and tipo_presencia = 'C' then 1 else 0 end) CC,
           total
      from (select distinct ra.id_estado,
                           ra.id_distrito_federal,
                           seccion,
                           tipo_casilla,
                           tipo_representante,
                           tipo_presencia,
                           total
            from casillas natural join asistencias
                          natural join representantes_preliminares rp
                          join representantes_aprobados ra on rp.id_estado = ra.id_estado
                                                          and rp.id_distrito_federal = ra.id_distrito_federal
                                                          and rp.tipo_asociacion = ra.tipo_asociacion
                                                          and rp.id_partido_candidato = ra.id_partido_candidato,
                          (select count(*) total from asistencias) as t
            where aprobada = 'S') as a) as b
  group by id_estado,
           id_distrito_federal,
           seccion,
           tipo_casilla,
           total) as c natural join secciones
                       natural join estados
                       natural join municipios
                       natural join distritos_locales
                       natural join distritos_federales --2, tarda en ejecutarse

--Tercera consulta
select nombre, (numM*100)/(numM + numH) m, (numH*100)/(numM + numH) h
  from
  (select e.nombre, count(sexo) numM
   from representantes_preliminares rp join estados e on rp.id_estado = e.id_estado
   where sexo = 'M'
   group by e.nombre) as M

   natural join

  (select e.nombre, count(sexo) numH
   from representantes_preliminares rp join estados e on rp.id_estado = e.id_estado
   where sexo = 'H'
   group by e.nombre) as H;--3

--Cuarta consulta
select nombre, sum(c1) as °0a22°, sum(c2) as °23a39a°, sum(c3) as °40a59°, sum(c4) as °59a99°, sum(H) as hombres, sum(M) as mujeres
  from
  (select id_representante, id_estado,
           (case when edad >  0 and edad <= 22 then 1 else 0 end) as c1,
           (case when edad > 22 and edad <= 39 then 1 else 0 end) as c2,
           (case when edad > 39 and edad <= 59 then 1 else 0 end) as c3,
           (case when edad > 59 and edad <= 99 then 1 else 0 end) as c4,
           (case when sexo = 'H' then 1 else 0 end) as H,
           (case when sexo = 'M' then 1 else 0 end) as M
   from
   (select id_representante, id_estado, sexo, ((current_date - to_date(fecha, 'yy/mm/dd'))/365) as edad
     from
     (select id_representante, id_estado, sexo, (substring(clave_elector, 7, 2) || '/' || substring(clave_elector, 9, 2) || '/' || substring(clave_elector, 11, 2)) as fecha
       from
       (select id_representante, id_estado, clave_elector, sexo from representantes_aprobados natural join representantes_preliminares) as a) as b) as c) as d natural join estados
  group by nombre; --4, al parecer SQL(o PostgresSQL) no puede manejar fechas 'grandes' y no saca la edad real de todos los representantes en particular no pasa de 50 años
