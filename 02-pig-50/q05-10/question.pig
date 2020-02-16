-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY, clave:BAG{()});
r= FOREACH u GENERATE $1;
x = FOREACH r GENERATE FLATTEN($0);
y = ORDER x BY $0;
m = GROUP y BY $0;
wordcount = FOREACH m GENERATE group, COUNT(y);
STORE wordcount INTO 'output';
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000
