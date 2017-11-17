set search_path to industria_musical, public;
select *
  from interprete i join disco d on i.pais = d.origen_disquera;
select *
  from interprete natural join disco;
select * 
  from interprete cross join disco;
