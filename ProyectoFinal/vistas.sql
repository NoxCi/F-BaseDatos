SET SEARCH_PATH TO Representantes, Geografico, Casillas, Partidos_politicos;

CREATE OR REPLACE VIEW edadRepresentantesAprobados AS
SELECT id_representante, age(fecha_nac)
FROM Representante_preliminar NATURAL JOIN Representante_aprobado;

CREATE OR REPLACE VIEW cantidadMujeresPorEstado AS
SELECT id_estado, COUNT(sexo)
FROM Representante_preliminar NATURAL JOIN Representante_aprobado
WHERE sexo = 'M'
GROUP BY id_estado;

CREATE OR REPLACE VIEW cantidadHombresPorEstado AS
SELECT id_estado, COUNT(sexo)
FROM Representante_preliminar NATURAL JOIN Representante_aprobado
WHERE sexo = 'H'
GROUP BY id_estado;

CREATE OR REPLACE VIEW aistenciasRepresentantesACPorEstado AS
SELECT id_estado, COUNT(*)
FROM Asistencia NATURAL JOIN Representante_ante_casilla
GROUP BY id_estado;

CREATE OR REPLACE VIEW aistenciasRepresentantesACEsperadasPorEstado AS
SELECT id_estado, COUNT(id_representante)*3 AS total_asis_esperadas
FROM Asistencia NATURAL JOIN Representante_ante_casilla
GROUP BY id_estado;
