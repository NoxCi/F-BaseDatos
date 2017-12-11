SET search_path to casillas, geografico, partidos_politicos, representantes, public;

CREATE OR REPLACE FUNCTION aprueba_representante(id_representante Integer,
                                                 id_estado Integer,
                                                 id_distrito_federal Integer,
                                                 id_partido Integer,
                                                 tipo_representante Char(1))
Returns TEXT AS $$
--La transaccion usada aqui es la por defecto, y lo eleji
  BEGIN SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    IF tipo_representante = 'C'
    THEN IF verifica_aprobacion_RACasilla(id_representante)
         THEN INSERT INTO representante_aprobados VALUES (id_representante,
                                                          id_estado,
                                                          id_distrito_federal,
                                                          id_partido);
              INSERT INTO log_representantes_aprobados VALUES (CURRENT_USER,
                                                               Now(),
                                                               id_representante,
                                                               id_estado,
                                                               id_distrito_federal,
                                                               id_partido
                                                               'I');
            COMMIT;
            RETURN "Se aprobo satisfactoriamente al representante";
          END IF;
    ELSE
      IF verifica_aprobacion_RGeneral(id_representante)
      THEN INSERT INTO representante_aprobados VALUES (id_representante,
                                                       id_estado,
                                                       id_distrito_federal,
                                                       id_partido);
            INSERT INTO log_representantes_aprobados VALUES (CURRENT_USER,
                                                             Now(),
                                                             id_representante,
                                                             id_estado,
                                                             id_distrito_federal,
                                                             id_partido
                                                             'I');
            COMMIT;
            RETURN "Se aprobo satisactoriamente al representante";
      END IF;
    END IF;
    RETURN "No se pudo aprobar al representante";
  END;
$$ LANGUAGE plpgsql;
