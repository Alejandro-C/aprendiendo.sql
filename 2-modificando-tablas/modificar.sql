-- RENOMBRAR UNA TABLA
ALTER TABLE usuarios RENAME TO usuarios_renom;

-- CAMBIAR EL NOMBRE DE UNA COLUMNA
ALTER TABLE usuarios_renom CHANGE apellidos apellido varchar(100) null;

-- MODIFICAR UNA COLUMNA SIN CAMBIAR NOMBRE
ALTER TABLE usuarios_renom MODIFY apellido varchar(40) not null;

-- AÑADIR UNA NUEVA COLUMNA
ALTER TABLE usuarios_renom ADD website varchar(100) null; 

-- AÑADIR RESTRICCION A COLUMNA
ALTER TABLE usuarios_renom ADD CONTRAINT uq_email UNIQUE(email);

-- BORRAR UNA COLUMNA
ALTER TABLE usuarios_renom DROP website;