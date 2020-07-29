-- 1. Diseñar y crear la base de datos de un concecionario
CREATE DATABASE IF NOT EXISTS consecionario;
USE consecionario;

CREATE TABLE coches (
        id      INT(10) auto_increment NOT NULL,
        modelo  VARCHAR(100) NOT NULL,
        marca   VARCHAR(50),
        precio  INT(100) NOT NULL,
        stock   INT(100) NOT NULL,
        CONSTRAINT pk_coches PRIMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE grupos (
        id      INT(10) auto_increment NOT NULL,
        nombre  VARCHAR(100) NOT NULL,
        ciudad  VARCHAR(100),
        CONSTRAINT pk_grupos PRIMARY KEY(id)
)ENGINE=InnoDB; 

CREATE TABLE vendedores (
    id          INT(10) auto_increment NOT NULL,
    grupo_id    INT(10) NOT NULL,
    jefe        INT(10),
    nombre      VARCHAR(100),
    apellidos   VARCHAR(100),
    cargo       VARCHAR(50),
    fecha_alta  DATE,
    sueldo      FLOAT(20, 2),
    comision    FLOAT(10, 2),
    CONSTRAINT pk_vendedores PRIMARY KEY(id),
    CONSTRAINT fk_vendedor_grupo FOREIGN KEY(grupo_id) REFERENCES grupos(id),
    CONSTRAINT fk_vendedor_jefe FOREIGN KEY(jefe) REFERENCES vendedores(id)
)ENGINE=InnoDB; 

CREATE TABLE clientes (
    id          INT(10) auto_increment NOT NULL,
    vendedor_id INT(10),
    nombre      VARCHAR(150) NOT NULL,
    ciudad      VARCHAR(100),
    gastado     FLOAT(50, 2),
    fecha       DATE,
    CONSTRAINT pk_clientes PRIMARY KEY(id),
    CONSTRAINT fk_cliente_vendedor FOREIGN KEY(vendedor_id) REFERENCES vendedores(id)
)ENGINE=InnoDB;

CREATE TABLE encargos (
    id          INT(10) auto_increment NOT NULL,
    cliente_id  INT(10) NOT NULL,
    coche_id    INT(10) NOT NULL,
    cantidad    INT(100),
    fecha       DATE,
    CONSTRAINT pk_encargos PRIMARY KEY(id),
    CONSTRAINT fk_encargo_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_encargo_coche FOREIGN KEY (coche_id) REFERENCES coches(id)
)ENGINE=InnoDB;

--  Rellenar la base de datos con informacion

--  COCHES
INSERT INTO coches 
    VALUES  (NULL, 'Renault Clio', 'Renault', 12000, 13),
            (NULL, 'Seat Panda', 'Seat', 10000, 10),
            (NULL, 'Mercedes Ranchera', 'Mercedes Benz', 32000, 24),
            (NULL, 'Porche Cayene', 'Porche', 65000, 5),
            (NULL, 'Lambo Aventador', 'Lamborgini', 170000, 2),
            (NULL, 'Ferrari Spider', 'Ferrari', 12000, 13);

--  GRUPOS
INSERT INTO grupos
    VALUES  (NULL, 'vendedores A', 'Madrid'),
            (NULL, 'vendedores B', 'Madrid'),
            (NULL, 'Directores macanicos', 'Madrid'),
            (NULL, 'vendedores A', 'Barcelona'),
            (NULL, 'vendedores B', 'Barcelona'),
            (NULL, 'vendedores C', 'Valencia'),
            (NULL, 'vendedores A', 'Bilbao'),
            (NULL, 'vendedores B', 'Pamplona'),
            (NULL, 'vendedores C', 'Santiago de Compostela');

--  VENDEDORES
INSERT INTO vendedores
    VALUES  (NULL, 1, NULL, 'David', 'Lopez', 'Responsable de tienda', CURDATE(), 30000, 4),
            (NULL, 1, 1, 'Fran', 'Martinez', 'Ayudante en tienda', CURDATE(), 23000, 2),
            (NULL, 2, NULL, 'Nelson', 'Sánchez', 'Responsable de tienda', CURDATE(), 38000, 5),
            (NULL, 2, 3, 'Jesus', 'Lopez', 'Ayudante en tienda', CURDATE(), 12000, 6),
            (NULL, 3, NULL, 'Victor', 'Lopez', 'Mecanico jefe', CURDATE(), 50000, 2),
            (NULL, 4, NULL, 'Antonio', 'Lopez', 'Vendedor de recambios', CURDATE(), 13000, 8),
            (NULL, 5, NULL, 'Salvador', 'Lopez', 'Vendedor experto', CURDATE(), 60000, 2),
            (NULL, 6, NULL, 'Joaquin', 'Lopez', 'Ejecutivo de cuentas', CURDATE(), 80000, 1),
            (NULL, 6, 8, 'Luis', 'Lopez', 'Ayudante en tienda', CURDATE(), 10000, 10);

--  CLIENTES
INSERT INTO clientes
    VALUES  (NULL, 1, 'Construcciones Diaz Inc', 'Alcobendas', 24000, CURDATE()),
            (NULL, 1, 'Fruteria Antonia Inc', 'Fuenlabrada', 40000, CURDATE()),
            (NULL, 1, 'Imprenta Martínez Inc', 'Barcelona', 32000, CURDATE()),
            (NULL, 1, 'Jesus Colchones Inc', 'El Prat', 96000, CURDATE()),
            (NULL, 1, 'Bar Pepe Inc', 'Valencia', 170000, CURDATE()),
            (NULL, 1, 'Tienda Pc Inc', 'Murcia', 245000, CURDATE());

--  ENCARGOS
INSERT INTO encargos
    VALUES  (NULL, 1, 1, 2, CURDATE()),
            (NULL, 2, 2, 4, CURDATE()),
            (NULL, 3, 3, 1, CURDATE()),
            (NULL, 4, 3, 3, CURDATE()),
            (NULL, 5, 5, 1, CURDATE()),
            (NULL, 6, 6, 1, CURDATE());

-- 2. Modificar la comision de los vendedores y ponerla al 0.5% cuando ganan mas de 50000
UPDATE vendedores SET comision = 0.5 WHERE sueldo >= 50000;

-- 3. Incrementar el precio de los coches en un 5%
UPDATE coches SET precio = (precio * 0.05) + precio;

-- 4. Sacar todos los vendedores cuya fecha de alta sea posterior al 1 de julio 2020
SELECT * FROM vendedores WHERE fecha_alta >= '2020/07/01';

-- 5. Mostrar todos los vendedores con su nombre y el numero de dias que llevan en el consecionario
SELECT nombre, DATEDIFF(CURDATE(), fecha_alta) AS 'Dias' FROM vendedores;

-- 6. Visualizar el nombre y los apellidos en una misma columna y su fecha de registro y que dia de la semana en la que se registraron
SELECT CONCAT(nombre, ' ', apellidos) AS 'Nombre y Apellidos', fecha_alta, DAYNAME(fecha_alta) AS 'Dia' FROM vendedores;

-- 7. Mostrar el nombre y el salario de los vendedores con cargo de 'ayudante de tienda'
SELECT nombre, sueldo FROM vendedores WHERE cargo = 'Ayudante en tienda';

-- 8. Mostrar todos los coches en cuya marca este la letra 'a' y cuyo modelo empiece por 'f'
SELECT * FROM coches WHERE (marca LIKE('%a%')) && (modelo LIKE('f%'));

-- 9. Mostrar todos los vendedores del grupo numero 2, ordenados por salario de mayor a menor
SELECT * FROM vendedores WHERE grupo_id = 2 ORDER BY sueldo DESC;

-- 10. Visualizar los apellidos de los vendedores, su fecha y su numero de grupo ordenado por fecha decendente, mostrar los 4 ultimos
SELECT apellidos, fecha_alta, id FROM vendedores ORDER BY fecha_alta LIMIT 4;

-- 11. Visualizar todos los cargos y el numero que hay en cada cargo
SELECT cargo, COUNT(id) FROM vendedores GROUP BY cargo ORDER BY COUNT(id) DESC;

-- 12. Consegir la masa salarial del consecionario (anual)
SELECT SUM(sueldo) AS 'masa salarial'  FROM vendedores;

-- 13. Sacar la media de sueldos entre todos los vendedores po grupo
SELECT AVG(sueldo), grupo_id FROM vendedores GROUP BY grupo_id;
--      otra forma mas 
SELECT AVG(v.sueldo) AS 'Media salarial', g.nombre, g.ciudad FROM vendedores v
INNER JOIN grupos g ON g.id = v.grupo_id
GROUP BY grupo_id;

-- 14. Visualizar las unidades totales vendidas de cada coche a cada cliente, mostrando el nombre del producto, numero de cliente y la suma de las unidades
SELECT co.modelo AS 'Coche', cl.nombre AS 'Cliente', SUM(e.cantidad) AS 'Unidades' FROM encargos e
INNER JOIN coches co ON co.id = e.coche_id
INNER JOIN clientes cl ON cl.id = e.cliente_id
GROUP BY e.coche_id, e.cliente_id;

-- 15. Mostrar los cliente que mas encargos han hecho y mostrar cuantos hicieron
SELECT cliente_id, COUNT(id) FROM encargos GROUP BY cliente_id  ORDER BY 2 DESC LIMIT 2;
--      otra forma mas 
SELECT c.nombre, COUNT(c.id) AS 'Cantidad' FROM encargos e
INNER JOIN clientes c ON c.id = e.cliente_id
GROUP BY cliente_id ORDER BY 2 DESC LIMIT 2;

-- 16. Obener el listado de clientes atendidos por el vendedor 'David Lopez'
SELECT * FROM clientes WHERE vendedor_id  IN (
    SELECT id FROM vendedores WHERE nombre = 'David' AND apellidos = 'Lopez'
);

-- 17. Obtener el listado con los encargos por el cliente 'Fruteria Antonia Inc'
SELECT * FROM encargos WHERE cliente_id IN (
    SELECT id FROM clientes WHERE nombre = 'Fruteria Antonia Inc'
);
--      otra forma mas 
SELECT enca.id, clie.nombre, coch.modelo, enca.cantidad, enca.fecha FROM encargos enca
INNER JOIN clientes clie ON clie.id = enca.cliente_id
INNER JOIN coches coch ON coch.id = enca.coche_id
WHERE enca.cliente_id IN (
    SELECT id FROM clientes WHERE nombre = 'Fruteria Antonia Inc'
);

-- 18. Listar los clientes que han hecho algun encargo del coche 'Mecedes Ranchera'
SELECT * FROM clientes WHERE id IN (
    SELECT cliente_id FROM encargos WHERE coche_id IN (
        SELECT id FROM coches WHERE modelo LIKE '%Mercedes Ranchera%'
    )
);

-- 19. Obtener los vendedores con 2 o mas clientes
SELECT * FROM vendedores WHERE id IN (
    SELECT vendedor_id FROM clientes GROUP BY  vendedor_id HAVING COUNT(id) >= 2
);

-- 20. Seleccionar el grupo en el que trabaja el vendedor con el mayor salario y mostrar el nombre del grupo
SELECT * FROM grupos WHERE id IN (
    SELECT grupo_id FROM vendedores WHERE sueldo = (
        SELECT MAX(sueldo) FROM vendedores
    )
);

-- 21. Obtener los nombres y ciudades de los clientes con encaros de 3 unidades en adelante
SELECT nombre, ciudad FROM clientes WHERE id IN (
    SELECT cliente_id FROM encargos WHERE cantidad >= 3
);

-- 22. Mostrar listado de clientes (numero de clientes y el nombre) mostrar tambien el numero de vendedor y su nombre
SELECT c.id, c.nombre, CONCAT(v.nombre, ' ', v.apellidos) AS 'Vendedor' FROM clientes c, vendedores v
WHERE c.vendedor_id = v.id;

-- 23. Listar todos los encargos realizados con la marca del coche y el nombre del cliente
SELECT e.id, co.marca, c.nombre FROM encargos e
INNER JOIN coches co ON co.id = e.coche_id
INNER JOIN clientes c ON c.id = e.cliente_id;

-- 24. Listar los encargos con el nombre del coche, el nombre del cliente y el nombre de la ciudad, pero unicamente cuando sean de 'Barcelona'
SELECT e.id, co.modelo, c.nombre, c.ciudad FROM encargos e
INNER JOIN coches co ON co.id = e.coche_id
INNER JOIN clientes c ON c.id = e.cliente_id
WHERE c.ciudad = 'Barcelona';

-- 25. Obtener una lista de los nombres de los clientes con el importe de sus encargos acumulado
SELECT cl.nombre, SUM(precio * cantidad) AS 'Importe' FROM clientes cl
INNER JOIN encargos en ON en.cliente_id = cl.id
INNER JOIN coches co ON co.id = en.coche_id
GROUP BY cl.nombre ORDER BY 2 ASC;

-- 26. Sacar los vendedores que tienen jefe y sacar en nombre del jefe
SELECT CONCAT(v1.nombre, ' ', v1.apellidos) AS 'Vendedor', CONCAT(v2.nombre, ' ', v2.apellidos) AS 'Jefe' 
FROM vendedores v1
INNER JOIN vendedores v2 ON v1.jefe = v2.id;

-- 27. Visualizar lso nombres de los clientes y la cantidad de encargos realizados incluuendo los no realizaron encargos
SELECT c.nombre, COunt(e.id) FROM clientes c
LEFT JOIN encargos e ON c.id = e.cliente_id
GROUP BY 1;

-- 28. Mostrar todos los vendedores y el numero de clientes. Se debe mostrar tengan o no clientes
SELECT v.nombre, v.apellidos, COUNT(c.id) FROM vendedores v
LEFT JOIN clientes c ON c.vendedor_id = v.id
GROUP BY v.id;

-- 29. Crear un vista llamada 'vendedoresA' que incluirá todos los vendedores del grupo que se llame 'vendedores A'
CREATE VIEW vendedoresA AS 
SELECT * FROM vendedores WHERE grupo_id IN (
    SELECT id FROM grupos WHERE nombre = 'Vendedores A'
);

-- 30. Mostrar los datos del vendedor con mas antiguedad en el consecionario
SELECT * FROM vendedores ORDER BY fecha_alta ASC LIMIT 1;

-- 30 Plus. Obtener el coche con mas unidades vendidas
SELECT * FROM coches WHERE id IN (
    SELECT coche_id FROM encargos WHERE cantidad IN (
        SELECT MAX(cantidad) FROM encargos
    )
);