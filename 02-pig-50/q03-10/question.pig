-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT);    
v = FOREACH u GENERATE $2;
y = ORDER v BY $0;
z = LIMIT y 5;
STORE z INTO 'output';
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000

