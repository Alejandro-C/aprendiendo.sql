-- CONSULTAS MULTITABLAS
-- son consultas que sirven para consultar varias tablas en una sola sentencia;

-- mostrar las entradas con el nombre del autor y el nombre de la categoria

SELECT entr.id, entr.titulo, usua.nombre AS 'Autor', cate.nombre AS 'Categoria'
FROM entradas entr, usuarios usua, categorias cate
WHERE entr.usuario_id = usua.id AND entr.categoria_id = cate.id;

-- mostrar el nombre de las categorias y al lado cuantas entradas tiene

SELECT cate.nombre, COUNT(entr.id) AS 'Numero de Entradas'
FROM entradas entr, categorias cate
WHERE entr.categoria_id = cate.id
GROUP BY entr.categoria_id;

-- mostrar el email de los usuarios y al lado cuantas entradas tienen

SELECT usua.email, COUNT(titulo) AS 'Numero de Entradas'
FROM entradas entr, usuarios usua
WHERE entr.usuario_id = usua.id
GROUP BY entr.usuario_id;

-- INNER JOIN

-- mostrar las entradas con el nombre del autor y el nombre de la categoria

SELECT entr.id, entr.titulo, usua.nombre, cate.nombre
FROM entradas entr
INNER JOIN usuarios usua ON entr.usuario_id = usua.id
INNER JOIN categorias cate ON entr.categoria_id = cate.id;