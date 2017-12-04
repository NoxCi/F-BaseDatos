SET search_path to casillas, geografico, partidos_politicos, representantes, public;

/*
Verifica que para cada casilla haya a lo mas un propietario y un suplente.
*/
CREATE OR REPLACE FUNCTION verifica_aprobacion() RETURNS Boolean AS $$
  BEGIN
      IF 1 = ALL(SELECT count(tipo_cargo) FROM representantes_ante_casilla NATURAL JOIN casilla WHERE tipo_cargo = 'P'
              UNION
             SELECT COUNT(tipo_cargo) FROM representantes_ante_casilla NATURAL JOIN casilla WHERE tipo_cargo = 'S')

      THEN RETURN True;
      END IF;
      RETURN False;
  END;
$$ LANGUAGE plpgsql;

/*
Verificamos si al intentar aprobar un representante ante casilla, este no tiene ya asginada ninguna casilla.
Esto me parece equivalente a verificar que cada casilla a lo mas un propietario y un suplente.
*/
CREATE OR REPLACE FUNCTION verifica_aprobacion_RACasilla (id_representante Integer) RETURNS Boolean AS $$
  BEGIN
    IF id_representante IN (SELECT id_representante FROM casillas NATURAL JOIN representantes_ante_casilla)
    THEN RETURN False;
    END IF;
    RETURN True;
  END;
$$ LANGUAGE plpgsql;

/*
Verifica que al intentar aprobar un representante general, en su distrito no haya mas de 10 representantes generales.
*/
CREATE OR REPLACE FUNCTION verifica_aprobacion_RGeneral (id_distrito_federal Integer) RETURNS Boolean AS $$
  BEGIN
    IF 10 >= (SELECT COUNT(id_representante) + 1
              FROM representantes_generales NATURAL JOIN distritos_federales
              WHERE distritos_federales.id_distrito_federal = id_distrito_federal)
    THEN RETURN True;
    END IF;
    RETURN False;
  END;
$$ LANGUAGE plpgsql;

/*
Maneja la sustitucion de un representante
*/
CREATE OR REPLACE FUNCTION sustituye_representante(id_representante_viejo Integer,
                                                   id_representante_nuevo Integer,
                                                   id_estado_nuevo Integer,
                                                   id_distrito_federal_nuevo Integer,
                                                   id_partido_nuevo Integer,
                                                   seccion_nuevo Integer) RETURNS Boolean AS $$
BEGIN
  IF id_representante_viejo NOT IN (SELECT id_representante FROM representantes_ante_casilla)
  THEN RETURN False;
  END IF;

  IF NOT id_estado_nuevo = (SELECT id_estado FROM representantes_ante_casilla rac WHERE rac.id_representante = id_representante_viejo) OR
     NOT id_distrito_federal_nuevo = (SELECT id_distrito_federal FROM representantes_ante_casilla rac WHERE rac.id_representante = id_representante_viejo) OR
     NOT id_partido_nuevo = (SELECT id_partido FROM representantes_ante_casilla rac WHERE rac.id_representante = id_representante_viejo) OR
     NOT seccion_nuevo = (SELECT seccion FROM representantes_ante_casilla rac WHERE rac.id_representante = id_representante_viejo)
  THEN RETURN False;
  END IF;

  DELETE FROM representantes_ante_casilla rac WHERE id_representante_viejo = rac.id_representante;
  INSERT INTO representantes_preliminares VALUES (id_representante_nuevo, id_estado_nuevo, id_distrito_federal_nuevo, id_partido_nuevo, 'C', now());
  INSERT INTO representantes_sustituciones VALUES (id_representante_viejo, id_representante_nuevo, now());

END;
$$ LANGUAGE plpgsql;
