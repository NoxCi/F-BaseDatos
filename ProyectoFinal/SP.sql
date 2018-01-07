SET SEARCH_PATH TO Representantes, Partidos_politicos, Geografico;

CREATE OR REPLACE FUNCTION InsertaRepresentantesPreliminares(cantidad Int) RETURNS Text AS $$
  DECLARE
    nombres Text[];
    apellidos Text[];
    sexos Char(1)[];
    idMax Int;
    cont Int;
  BEGIN
    nombres[0]= 'Jose';nombres[1]= 'Cesar';nombres[2]= 'Maria';nombres[3]= 'Silvia';
    nombres[4]= 'Urbano';nombres[5]= 'Elios';nombres[6]= 'Elisa';nombres[7]= 'Juan';

    apellidos[0]= 'Tellez';apellidos[1]= 'Balderas';apellidos[2]= 'Serna';apellidos[3]= 'Avila';
    apellidos[4]= 'Varela';apellidos[5]= 'Chavez';apellidos[6]= 'Solis';apellidos[7]= 'Mendoza';
    apellidos[8]= 'Lopez';apellidos[9]= 'Suarez';apellidos[10]= 'Jaure';apellidos[11]= 'Orta';
    apellidos[12]= 'Paz';apellidos[13]= 'Castillo';apellidos[14]= 'Araveli';

    sexos[0]='H';sexos[1]='M';

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
                                                   apellidos[random()*(array_length(apellidos,1)-1)]
                                                   ||' '||
                                                   apellidos[random()*(array_length(apellidos,1)-1)],
                                                   CAST(
                                                   CAST(random()*28 + 1970 AS Int)
                                                   ||'-'||
                                                   CAST(random()*11+1 AS Int)
                                                   ||'-'||
                                                   CAST(random()*27+1 AS Int) AS Date),
                                                   sexos[random()*1],
                                                   Now());
    END LOOP;

    RETURN 'Insercion completada';

  END;
$$ LANGUAGE plpgsql;

--Falta agregar una validacion para ver si se puede aprobar al representante.
CREATE OR REPLACE FUNCTION ApruebaRepresentanteAnteCasilla(idRepresentante Int,
                                                           idCasilla Int,
                                                           direccion Text,
                                                           tipoCargo Char(1),
                                                           estadoDom Int,
                                                           municipioDom Int,
                                                           distritoLDom Int,
                                                           distritoFDom Int,
                                                           seccionDom Int)
                                                           RETURNS Text As $$
DECLARE
  idEstado Int;
  idDistritoFederal Int;
  idPartido Int;
BEGIN
  IF VerificaDisponibilidadCasilla(idCasilla, tipoCargo)
  THEN SELECT id_estado INTO idEstado
       FROM Representante_preliminar NATURAL JOIN Distrito_federal
       WHERE  idRepresentante = id_representante
       GROUP BY id_estado, fecha_y_hora_registro
       HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);

       SELECT id_distrito_federal INTO idDistritoFederal
       FROM Representante_preliminar
       WHERE  idRepresentante = id_representante
       GROUP BY id_distrito_federal, fecha_y_hora_registro
       HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);

       SELECT id_partido INTO idPartido
       FROM Representante_preliminar
       WHERE  idRepresentante = id_representante
       GROUP BY id_partido, fecha_y_hora_registro
       HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);


       INSERT INTO Representante_aprobado VALUES (idEstado, idDistritoFederal, idRepresentante, idPartido, Now(), CURRENT_USER);
       INSERT INTO Representante_ante_casilla VALUES (idEstado, idDistritoFederal, idRepresentante, idCasilla, direccion, tipoCargo);
       INSERT INTO Domicilia_represemtante_ac VALUES (estadoDom, municipioDom, distritoLDom, distritoFDom, seccionDom, idRepresentante);
       RETURN 'Insercion exitosa';
   END IF;
   RETURN 'No se pudo aprobar al representante';

END;
$$ LANGUAGE plpgsql;

/*
Verifica si se puede asignar otro representante ante casilla de un cargo dado a la casilla.
*/
CREATE OR REPLACE FUNCTION VerificaDisponibilidadCasilla(idCasilla int, tipoCargo Char(1)) RETURNS Boolean AS $$
BEGIN
  IF ('P') IN (SELECT tipo_cargo FROM Representante_ante_casilla WHERE idCasilla = id_casilla)
     AND
     ('S') IN (SELECT tipo_cargo FROM Representante_ante_casilla WHERE idCasilla = id_casilla)
  THEN RETURN False;
  END IF;
  RETURN True;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ApruebaRepresentanteGeneral(idRepresentante Int,
                                                       direccion Text,
                                                       estadoDom Int,
                                                       municipioDom Int,
                                                       distritoLDom Int,
                                                       distritoFDom Int,
                                                       seccionDom Int)
                                                       RETURNS Text AS $$
  DECLARE
    idEstado Int;
    idDistritoFederal Int;
    idPartido Int;
    nombre Text;
    fechaNac Date;
    mes Text;
    dia Text;
    sexoV Char(1);
    claveElector Char(13);
  BEGIN
    IF VerificaDisponibilidadDistrito(idDistritoFederal)
    THEN SELECT id_estado INTO idEstado
         FROM Representante_preliminar NATURAL JOIN Distrito_federal
         WHERE  idRepresentante = id_representante
         GROUP BY id_estado, fecha_y_hora_registro
         HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);

         SELECT id_distrito_federal INTO idDistritoFederal
         FROM Representante_preliminar
         WHERE  idRepresentante = id_representante
         GROUP BY id_distrito_federal, fecha_y_hora_registro
         HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);

         SELECT id_partido INTO idPartido
         FROM Representante_preliminar
         WHERE  idRepresentante = id_representante
         GROUP BY id_partido, fecha_y_hora_registro
         HAVING fecha_y_hora_registro = MAX(fecha_y_hora_registro);

         SELECT nombre_representante INTO nombre
         FROM Representante_preliminar
         WHERE  idRepresentante = id_representante;

         SELECT fecha_nac INTO fechaNac
         FROM Representante_preliminar
         WHERE  idRepresentante = id_representante;

         SELECT sexo INTO sexoV
         FROM Representante_preliminar
         WHERE  idRepresentante = id_representante;

         mes := CAST(date_part('month', fechaNac) AS Text);
         IF Char_length(mes) = 1
         THEN mes:= 0 || mes;
         END IF;

         dia := CAST(date_part('day', fechaNac) AS Text);
         IF Char_length(dia) = 1
         THEN dia:= 0 || dia;
         END IF;

         claveElector :=   Upper(Substring(nombre FROM '[A-Z].'))
                        || Upper(Substring(Split_part(nombre, ' ', 2) FROM '[A-Z].'))
                        || Upper(Substring(Split_part(nombre, ' ', 3) FROM '[A-Z].'))
                        || Substring(CAST(date_part('year', fechaNac) AS Text) FROM 2 for 2)
                        || mes
                        || dia
                        || sexoV;

       INSERT INTO Representante_aprobado VALUES (idEstado, idDistritoFederal, idRepresentante, idPartido, Now(), CURRENT_USER);
       INSERT INTO Representante_general VALUES (idEstado, idDistritoFederal, idRepresentante, direccion, claveElector);
       INSERT INTO Domicilia_represemtante_g VALUES (estadoDom, municipioDom, distritoLDom, distritoFDom, seccionDom, idRepresentante);
       RETURN 'Aprobacion exitosa';
    END IF;
    RETURN 'No se pudo aprobar al representante';
  END;
$$ LANGUAGE plpgsql;

/*
Verifica si se puede asignar otro representante general al distrito.
*/
CREATE OR REPLACE FUNCTION VerificaDisponibilidadDistrito (idDistritoFederal Integer) RETURNS Boolean AS $$
  BEGIN
    IF 10 <= (SELECT COUNT(id_representante)
              FROM Representante_general NATURAL JOIN Distrito_federal
              WHERE idDistritoFederal = id_distrito_federal)
    THEN RETURN False;
    END IF;
    RETURN True;
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION CreaAsistencias() RETURNS Text AS $$
  BEGIN
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION CreaSustitucion(idRepresentanteSustituido Int) RETURNS Text AS $$
  BEGIN
  END;
$$ LANGUAGE plpgsql;

--Se debe verificacion para ver si el suplente puede hacerlo
CREATE OR REPLACE FUNCTION SustituyeRepresentante(idRepresentanteSustituido Int,
                                                  idDistritoFederalSuplente Int,
                                                  idPartidoSuplente Int,
                                                  idCasillaSuplente Int,
                                                  nombreSustituyente Text,
                                                  fechaNac Text,
                                                  sexo Char(1)) RETURNS Text AS $$
  BEGIN
  END;
  $$ LANGUAGE plpgsql;
