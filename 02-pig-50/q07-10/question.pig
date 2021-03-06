-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv

--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY, clave:BAG{()}, col:MAP[]);
r= FOREACH u GENERATE $0, SIZE($1),  SIZE($2);
z = ORDER r BY $0,$1,$2;
STORE z INTO 'output' USING PigStorage(',');
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000
