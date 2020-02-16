-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put data.tsv
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY);
y = GROUP u BY $0;
z = FOREACH y GENERATE u, COUNT(u);
wordcount = FOREACH y GENERATE group, COUNT(u);
STORE wordcount INTO 'output';
fs -get output/ .
!hadoop fs -ls output/*
!hadoop fs -cat output/part-r-00000
!hadoop fs -rm output/*
!hadoop fs -rmdir  output