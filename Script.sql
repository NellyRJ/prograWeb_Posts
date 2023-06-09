create database bdblogforaneo;

USE bdblogforaneo;
CREATE TABLE USUARIO
(

IDUSUARIO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO_PATERNO VARCHAR(50) NOT NULL,
APELLIDO_MATERNO VARCHAR(50) NOT NULL,
FECHA_NACIMIENTO DATE,
 USERNAME VARCHAR(50) NOT NULL,
 CONTRASENA VARCHAR(50) NOT NULL,
 CORREO VARCHAR(70) NOT NULL,
 IMAGEN VARCHAR(200) NOT NULL,
 FECHA_CREACION DATE
 
);



INSERT INTO USUARIO
VALUES (1, 'Regina', 'Rodriguez', 'Campo Garrido', 
'2003-10-11', 'reginarcg', 'Prueba_1', 'regina_rcg@outlook.com',
'imagenDemonoChino.png', CURDATE());

CREATE TABLE CAT_ESTATUS(
IDESTATUS INT PRIMARY KEY,
ACTIVO BOOL,
ELIMINADO BOOL,
BOQUEADO BOOL
);

insert into CAT_ESTATUS values(1, '1', '0', '0');
insert into CAT_ESTATUS values(2, '0', '1', '0');
insert into CAT_ESTATUS values(3, '0', '0', '1');
select*from CAT_ESTATUS;

CREATE TABLE PUBLICACION(
IDPUBLICACION INT PRIMARY KEY NOT NULL,
IMAGEN VARCHAR(50),
DESCRIPCION VARCHAR(500),
FECHA_DESCRIPCION DATE
);
CREATE TABLE PUBLICACIO_CATEGORIA(
IDCAT_PUB INT PRIMARY KEY NOT NULL

);

CREATE TABLE CAT_CATEGORIAS(
IDCATEGORIA INT PRIMARY KEY NOT NULL,
TIPS BOOL,
DIVERSION BOOL,
HOSPEDAJE BOOL,
COMIDA BOOL,
CHISME BOOL
);

ALTER TABLE USUARIO
    ADD COLUMN ID_ESTATUS INT,
    ADD CONSTRAINT `FK_USUARIO_ID_ESTATUS` 
    FOREIGN KEY (ID_ESTATUS)
        REFERENCES CAT_ESTATUS(IDESTATUS);

ALTER TABLE PUBLICACION
    ADD COLUMN ID_USUARIO INT,
    ADD CONSTRAINT `FK_PUBLICACION_ID_USUARIO` 
    FOREIGN KEY (ID_USUARIO)
        REFERENCES USUARIO(IDUSUARIO);

ALTER TABLE PUBLICACION
    ADD COLUMN ID_PUB_STATUS INT,
    ADD CONSTRAINT `FK_PUBLICACION_ID_STATUS` 
    FOREIGN KEY (ID_PUB_STATUS)
        REFERENCES CAT_ESTATUS(IDESTATUS);
        
ALTER TABLE PUBLICACIO_CATEGORIA
    ADD COLUMN ID_PUBLICACION INT,
    ADD CONSTRAINT `FK_PUBLICACION_CATEGORIA_ID_PUBLICACION` 
    FOREIGN KEY (ID_PUBLICACION)
        REFERENCES PUBLICACION(IDPUBLICACION);
        
        
ALTER TABLE PUBLICACIO_CATEGORIA
    ADD COLUMN ID_CATEGORIA INT,
    ADD CONSTRAINT `FK_PUBLICACION_CATEGORIA_ID_CATEGORIA` 
    FOREIGN KEY (ID_CATEGORIA)
        REFERENCES CAT_CATEGORIAS(IDCATEGORIA);

select* from USUARIO;
