-- OPERADORES DE COMPARACION
-- igual        =
-- distinto     !=
-- menor        < 
-- mayor        >
-- menor        igual <=
-- mayor        igual >=
-- entre        beetwen A and B
-- en           in 
-- es nulo      is null
-- no nulo      is not null
-- como         like
-- no es como   not like

-- CONSULTA CON UNA CONDICION
SELECT * FROM usuarios WHERE email = 'admin@admin.com';

-- sacar el nombre y apellidos de los usuarios que se registraron en 2019
SELECT nombre, apellidos FROM usuarios WHERE YEAR(fecha) = 2019;
-- sacar el nombre y apellidos de los usuarios que no se registraron en 2019
SELECT nombre, apellidos FROM usuarios WHERE YEAR(fecha) != 2019 OR ISNULL(fecha);

-- OPERADORES  LOGICOS
-- o    or
-- y    and
-- no   not

-- COMODINES PARA LIKE
-- cualquier cantidad de caracteres:    %
-- un caracter desconocido:             _

-- sacar los registros cullo apellidos contega la latra 'a' ademas que la contraseña de '54321'
SELECT email FROM usuarios WHERE apellidos LIKE '%a%' AND password = 12345;

-- sacar los registros cuyo año sea par 
SELECT * FROM usuarios WHERE (YEAR(fecha)%2 = 0);
-- sacar los registros cuyo año sea impar 
SELECT * FROM usuarios WHERE (YEAR(fecha)%2 != 0);

-- sacar los registros cuyo nombre tenga mas de 5 caracteres, que se hallan registrado antes de 2020 y mostrar el nombre en mayusculas
SELECT UPPER(nombre) AS 'nombre', apellidos FROM usuarios WHERE (LENGTH(nombre) > 5) AND YEAR(fecha) < 2020; 

-- ordenar los Datos segun el id de mayo a menor
SELECT * FROM usuarios ORDER BY id DESC;
-- ordenar los datos segun la fecha de menor a mayor
SELECT * FROM usuarios ORDER BY fecha DESC;
-- limitar la cantidad de registros (registros de posicion 3 a 6)
SELECT * FROM usuarios LIMIT 3,6;
-- sacar 4 registros
SELECT * FROM usuarios LIMIT 4;