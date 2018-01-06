SET SEARCH_PATH TO Representantes, Partidos_politicos;

CREATE OR REPLACE FUNCTION InsertaRepresentantesPreliminares(cantidad Int) RETURNS Text AS $$
  DECLARE
    nombres Text[];
    apellidos Text[];
    idMax Int;
    cont Int;
  BEGIN
    nombres[0]= 'Jose';nombres[1]= 'Cesar';nombres[2]= 'Maria';nombres[3]= 'Silvia';
    nombres[4]= 'Urbano';nombres[5]= 'Elios';nombres[6]= 'Elisa';nombres[7]= 'Juan';

    apellidos[0]= 'Tellez';apellidos[1]= 'Balderas';apellidos[2]= 'Serna';apellidos[3]= 'Avila';
    apellidos[4]= 'Varela';apellidos[5]= 'Chavez';apellidos[6]= 'Solis';apellidos[7]= 'Mendoza';
    apellidos[8]= 'Lopez';apellidos[9]= 'Suarez';apellidos[10]= 'Jaure';apellidos[11]= 'Orta';
    apellidos[12]= 'Paz';apellidos[13]= 'Castillo';apellidos[14]= 'Araveli';

    IF (SELECT COUNT(*) FROM Representante_preliminar) = 0
    THEN idMax := 0;
    ELSE SELECT MAX(id_representante) INTO idMax FROM Representante_preliminar;
    END IF;
    cont:= 0;

    LOOP
      EXIT WHEN cont = cantidad;
      cont:= cont +1;
      idMax:= idMax +1;
      INSERT INTO Representante_preliminar VALUES (CAST(random()*2+1 AS Int),
                                                   CAST(random()*2+1 AS Int),
                                                   idMax,
                                                   nombres[random()*(array_length(nombres,1)-1)]
                                                   ||' '||
                                                   apellidos[random()*(array_length(apellidos,1)-1)],
                                                   now());
    END LOOP;

    RETURN 'Insercion completada';

  END;
$$ LANGUAGE plpgsql;

SELECT InsertaRepresentantesPreliminares(33);
