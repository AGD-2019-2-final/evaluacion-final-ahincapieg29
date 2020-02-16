-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
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
r= FOREACH u GENERATE $1, $2;
z= FOREACH r GENERATE $0,FLATTEN($1);
y= FOREACH z GENERATE $0,$1;
m= FOREACH y GENERATE FLATTEN($0),$1;
a = ORDER m BY $0, $1;
b = GROUP a BY ($0, $1);
wordcount = FOREACH b GENERATE group, COUNT(a);
STORE wordcount INTO 'output'USING PigStorage('\t');
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000


