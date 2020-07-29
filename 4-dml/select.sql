-- MOSTRAR TODOS LOS REGISTROS / FILAS DE UNA TABLA
SELECT email, nombre, apellidos FROM usuarios;

-- MOSTAR TODOS LOS CAMPOS
SELECT * FROM  usuarios;

-- OPERADORES ARITMETICOS
SELECT email, (4+7) AS 'operacion' FROM usuarios;
SELECT email, (4-7) AS 'operacion' FROM usuarios;
SELECT email, (4*7) AS 'operacion' FROM usuarios;
SELECT email, (4/7) AS 'operacion' FROM usuarios;

SELECT id,email, (id/7) AS 'operacion' FROM usuarios;

-- FUNCIONES MATEMATICAS
SELECT ABS(4+7) AS 'operacion' FROM usuarios;
SELECT CEIL(7.78) AS 'operacion' FROM usuarios;
SELECT PI() AS 'operacion' FROM usuarios;
SELECT RAND() AS 'operacion' FROM usuarios;
SELECT ROUND(7.934, 2) AS 'operacion' FROM usuarios;
SELECT SQRT(4) AS 'operacion' FROM usuarios;

-- FUNCIONES CADENAS DE TEXTO
-- mayusculas
SELECT UPPER(nombre) AS 'Mayusculas' FROM usuarios;
-- minusculas
SELECT LOWER(nombre) AS 'Minusculas' FROM usuarios;
-- concatenar
SELECT CONCAT(nombre, ' ', apellidos) AS 'Nombre y Apellidos' FROM usuarios;
SELECT UPPER(CONCAT(nombre, apellidos)) AS 'Nombre y Apellidos en Mayusculas' FROM usuarios;
-- contar caracteres
SELECT LENGTH(nombre) AS 'No. caracteres en Nombre' FROM usuarios;
SELECT LENGTH(CONCAT(nombre, ' ', apellidos)) AS 'No. caracteres en Nombre y apellido' FROM usuarios;
-- borrar espacios
SELECT CONCAT('     ',nombre, ' ', apellidos, '     ') AS 'Nombre y Apellidos' FROM usuarios;
SELECT TRIM(CONCAT('     ',nombre, ' ', apellidos, '     ')) AS 'Nombre y Apellidos' FROM usuarios;

-- FUNCIONES PARA FECHA
SELECT nombre, fecha FROM usuarios;
-- mostrar la fecha actual
SELECT nombre, fecha, CURDATE() AS 'fecha actual'  FROM usuarios;
-- mostrar la diferencia de dias 
SELECT nombre, fecha, DATEDIFF(CURDATE(), fecha) AS 'diferencia en dias'  FROM usuarios;
-- mostrar el nombre del dis
SELECT nombre, DAYNAME(fecha) AS 'Nombre del Dia' FROM usuarios;
-- dia del mes
SELECT nombre, DAYOFMONTH(fecha) AS 'Numero del dia en el mes' FROM usuarios;
-- dia de la semana
SELECT nombre, DAYOFWEEK(fecha) AS 'Numero del dia en la samana' FROM usuarios;
-- dia del año
SELECT nombre, DAYOFYEAR(fecha) AS 'Numero del dia en el año' FROM usuarios;
-- mes del año
SELECT nombre, MONTH(fecha) AS 'Numero del mes del año' FROM usuarios;
-- formater eñ formato de la fecha
SELECT nombre, DATE_FORMAT(fecha, '%d-%m-%Y') AS 'Fecha Actual' FROM usuarios;

-- FUNCIONES PARA TIEMPO
-- tiempo actual
SELECT nombre, CURTIME() AS 'Fecha Actual' FROM usuarios;
-- tiempo actual (fecha completa con el tiempo)
SELECT nombre, SISDATE() FROM usuarios;

-- VER QUE CAMPOS ESTAN NULL
SELECT apellidos, ISNULL(apellidos) AS 'apellidos' FROM usuarios;

-- SI UN CAMPO ESTA VACION ESCRIBIR UN MENSAJE EN EL CAMPO
SELECT IFNULL(apellidos, 'este campo esta vacio') AS 'apellidos' FROM usuarios;

-- VER SI LOS CAMPOS SON IGUALES
SELECT apellidos, STRCMP('HOLA', 'HOLA') AS 'Iguales(0) Diferentes(1)' FROM usuarios;

-- MOSTRAR SOLO UN VALOR DE VALORES REPETIDOS
SELECT USER() FROM usuarios;
SELECT DISTINCT USER() FROM usuarios;
