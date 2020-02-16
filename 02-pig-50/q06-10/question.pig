-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY, clave:BAG{()}, col:MAP[]);
r= FOREACH u GENERATE $2;
x = FOREACH r GENERATE FLATTEN($0);
y = FOREACH x GENERATE $0 ;
z = ORDER y BY $0;
m = GROUP z BY $0;
wordcount = FOREACH m GENERATE group, COUNT(z);
STORE wordcount INTO 'output' USING PigStorage(',');
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000
