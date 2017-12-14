SET search_path to casillas, geografico, partidos_politicos, representantes, public;
--1
CREATE OR REPLACE FUNCTION representantes.aprueba_representante(id_representante_in Integer,
                                                 id_estado_in Integer,
                                                 id_distrito_federal_in Integer,
                                                 id_partido_in Integer,
                                                 tipo_representante_in Char(1))
Returns BOOLEAN AS $$
--(razones)
  BEGIN SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF tipo_representante = 'C'
    THEN IF verifica_aprobacion_RACasilla(id_representante_in)
         THEN INSERT INTO representante_aprobados VALUES (id_representante_in,
                                                          id_estado_in,
                                                          id_distrito_federal_in,
                                                          id_partido_in);
              INSERT INTO log_representantes_aprobados VALUES (CURRENT_USER,
                                                               Now(),
                                                               id_representante_in,
                                                               id_estado_in,
                                                               id_distrito_federal_in,
                                                               id_partido_in
                                                               'I');
            COMMIT;
            RETURN TRUE;
          END IF;
    ELSE
      IF verifica_aprobacion_RGeneral(id_representante_in)
      THEN INSERT INTO representante_aprobados VALUES (id_representante_in,
                                                       id_estado_in,
                                                       id_distrito_federal_in,
                                                       id_partido_in);
            INSERT INTO log_representantes_aprobados VALUES (CURRENT_USER,
                                                             Now(),
                                                             id_representante_in,
                                                             id_estado_in,
                                                             id_distrito_federal_in,
                                                             id_partido_in
                                                             'I');
            COMMIT;
            RETURN TRUE;
      END IF;
    END IF;
    RETURN FALSE;
  END;
$$ LANGUAGE plpgsql;
--1

--2
CREATE OR REPLACE FUNCTION representantes.sustituye_representante (id_representante_viejo Integer,
                                                   id_representante_nuevo Integer,
                                                   id_estado_nuevo Integer,
                                                   id_distrito_federal_nuevo Integer,
                                                   id_partido_nuevo Integer,
                                                   seccion_nuevo Integer)
RETURNS Boolean AS $$
--(razones)
BEGIN SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
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
--2

--3
CREATE OR REPLACE FUNCTION representantes.inserta_representanteC (id_representante_in Integer,
                                                  id_estado_in Integer,
                                                  id_distrito_federal_in Integer,
                                                  id_partido_in Integer,
                                                  seccion_in Integer,
                                                  tipo_casilla_in Char(1),
                                                  nombre_in Varchar(50),
                                                  apellido_paterno_in Varchar(50),
                                                  apellido_materno_in Varchar(50),
                                                  direccion_domicilio_in Varchar(255),
                                                  correo_in Varchar(50),
                                                  tipo_cargo_in Char(1))
RETURNS BOOLEAN AS $$
--(razones)
BEGIN SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  IF id_representante_in IN (SELECT id_representante FROM representante_aprobados)
  THEN INSERT INTO representantes_ante_casilla VALUES(id_representante_in,
                                                      id_estado_in,
                                                      id_distrito_federal_in,
                                                      id_partido_in,
                                                      seccion_in,
                                                      tipo_casilla_in,
                                                      nombre_in,
                                                      apellido_paterno_in,
                                                      apellido_materno_in,
                                                      direccion_domicilio_in,
                                                      correo_in,
                                                      tipo_cargo_in);
    COMMIT;
    RETURN TRUE;
  END IF;
  RETURN FALSE;
END;
$$ LANGUAGE plpgsql;
--3

--4
CREATE OR REPLACE FUNCTION representantes.inserta_representanteg(id_representante_in Integer,
                                                  id_estado_in Integer,
                                                  id_distrito_federal_in Integer,
                                                  id_partido_in Integer,
                                                  nombre_in Varchar(50),
                                                  apellido_paterno_in Varchar(50),
                                                  apellido_materno_in Varchar(50),
                                                  direccion_domicilio_in Varchar(255),
                                                  correo_in Varchar(50),
                                                  clave_elector_in CHAR(13))
RETURNS BOOLEAN AS $$
--(razones)
BEGIN SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  IF id_representante_in IN (SELECT id_representante FROM representante_aprobados)
  THEN INSERT INTO representantes_ante_casilla VALUES(id_representante_in,
                                                      id_estado_in,
                                                      id_distrito_federal_in,
                                                      id_partido_in,
                                                      seccion_in,
                                                      tipo_casilla_in,
                                                      nombre_in,
                                                      apellido_paterno_in,
                                                      apellido_materno_in,
                                                      direccion_domicilio_in,
                                                      correo_in,
                                                      tipo_cargo_in);
    COMMIT;
    RETURN TRUE;
  END IF;
  RETURN FALSE;
END;
$$ LANGUAGE plpgsql;
--4
