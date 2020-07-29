-- int(n° cifras)                   ENTERO
-- integer(n° cifras)               ENTERO
-- varchar(n° caracteres)           STRING/ ALFANUMERICO (maximo 255)
-- char(n° caracteres)              STRING/ ALFANUMERICO
-- float(n° cifras, n° decimales)   DECIMAL / COMA FLOTANTE
-- date, time, timestamp

-- TEXT         65535 caracteres
-- MEDIUMTEXT   16 millones
-- LONGTEXT     4 billones

--  ENTEROS MAS GRANDES:
-- MEDIUMINT
-- BIGINT

/* CREAR UNA TABLA */

create table usuarios(
    id          int(11) auto_increment not null,
    nombre      varchar(100) not null,
    apellidos   varchar(255) null,
    email       varchar(100) not null,
    pasword     varchar(255),
    CONSTRAINT pk_usuarios PRIMARY KEY(id)
);