-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS data;

CREATE TABLE data (letra       STRING,
                   Fecha       STRING,
                   Num         INT)


ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE data;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
(SELECT DISTINCT Num 
    FROM data
ORDER BY
    Num LIMIT 5);

