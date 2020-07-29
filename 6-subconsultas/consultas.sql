-- SUBCONSULTAS
-- consultas que se ejecutan drentro de otras

-- usuarios que tienen un registro en 'entradas'
SELECT * FROM usuarios WHERE id IN (SELECT usuario_id FROM entradas);

-- usuarios que no tienen un registro en 'entradas'
SELECT * FROM usuarios WHERE id NOT IN (SELECT usuario_id FROM entradas);

-- usuarios que tengan entrada que en su titulo hable de GTA
SELECT nombre, apellidos FROM usuarios WHERE id 
    IN (SELECT usuarios_id FROM entradas WHERE titulo LIKE '%GTA%');

-- sacar todas las entradas de las categorias accion utilizando su nombre
SELECT titulo FROM entradas WHERE categoria_id
    IN (SELECT id FROM categorias   WHERE nombre = 'Accion');

-- mostrar las categorias con mas de tres entredas
SELECT nombre FROM categorias WHERE id 
    IN (SELECT categoria_id FROM entradas GROUP BY categoria_id HAVING COUNT(categoria_id) >= 3);

-- mostrar los usuarios que que crearon su entrada un martes
SELECT * FROM usuarios WHERE id IN
    (SELECT usuario_id FROM entradas WHERE DAYOFWEEK(fecha) = 3);

-- mostrar el nombre de el usuario que tenga mas entradas
SELECT CONCAT(nombre, ' ', apellidos) AS 'Usuario con mas entradas' FROM usuarios WHERE id = 
    (SELECT COUNT(id) FROM entradas GROUP BY usuario_id ORDER BY COUNT(id) DESC LIMIT 1);

-- mostrar la categorias sin entradas
SELECT * FROM categorias WHERE id NOT IN
    (SELECT categoria_id FROM entradas);