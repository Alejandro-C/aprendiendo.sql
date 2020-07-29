-- CONSULTAS DE AGRUPAMINETO
SELECT COUNT(titulo) AS 'Numero de Entradas', categoria_id FROM entradas GROUP BY categoria_id;

-- CONSULTAS DE AGRUPAMINETO CON CONDICION
SELECT COUNT(titulo) AS 'Numero de Entradas', categoria_id FROM entradas GROUP BY categoria_id HAVING COUNT(titulo) <= 4;

-- AVG      sacar la media
-- COUNT    contar el numero de elementos
-- MAX      valor maxino del grupo
-- MIN      valor minimo del grupo
-- SUM      sumar  todo el contenio del grupo

SELECT AVG(id) AS 'Media de Entradas' FROM entradas;
SELECT MAX(id) AS 'ID Maximo' FROM entradas;
SELECT MIN(id) AS 'ID Minimo' FROM entradas;
SELECT SUM(id) AS 'Suma de ID' FROM entradas;