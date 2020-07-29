-- INSERTAR NUEVOS REGISTROS

INSERT INTO usuarios 
VALUES  (null, 'ever', 'carvajal', 'ever@ever.com', '11111', '2001-03-19'),
        (null, 'alejandro', 'jamioy', 'alejo@alejo.com', '22222', '2000-06-30'),
        (null, 'lina', 'maniguaje', 'lina@lina.com', '33333', '1997-07-13'),
        (null, 'janny', 'lopez', 'janny@janny.com', '44444', '2002-01-16'),
        (null, 'danery', 'ortega', 'danery@danery.com', '55555', '2003-04-19');

-- INSERTAR FILAS SOLO CON ALGUNAS COLUMNAS

INSERT INTO usuarios(email,password) VALUES('admin@admin.con', '97531');