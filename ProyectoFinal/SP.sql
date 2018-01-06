SET SEARCH_PATH TO Representantes;

CREATE OR REPLACE FUNCTION InsertaRepresentantesPreliminares(cantidad Int) RETURNS Text AS $$
  DECLARE
    nombres Text[];
    apellidos Text[15];
    _id Text;
    idMax Int;
  BEGIN
    nombres[0]= 'Jose';nombres[1]= 'Cesar';nombres[2]= 'Maria';nombres[3]= 'Silvia';
    nombres[4]= 'Urbano';nombres[5]= 'Elios';nombres[6]= 'Elisa';nombres[7]= 'Juan';

    apellidos[0]= 'Tellez';apellidos[1]= 'Balderas';apellidos[2]= 'Serna';apellidos[3]= 'Avila';
    apellidos[4]= 'Varela';apellidos[5]= 'Chavez';apellidos[6]= 'Solis';apellidos[7]= 'Mendoza';
    apellidos[8]= 'Lopez';apellidos[9]= 'Suarez';apellidos[10]= 'Jaure';apellidos[11]= 'Orta';
    apellidos[12]= 'Paz';apellidos[13]= 'Castillo';apellidos[14]= 'Araveli';

    IF (SELECT COUNT(*) FROM Representante_preliminar) = 0
    THEN idMAx := 0;
    ELSE SELECT MAX(id_representante) INTO _id FROM Representante_preliminar;
         idMax := Cast(Substring(_id From '[0-9]') AS Int);
    END IF;
    RETURN 'Hola';

  END;
$$ LANGUAGE plpgsql;
