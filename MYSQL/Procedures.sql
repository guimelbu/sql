DROP DATABASE IF EXISTS productos;

CREATE DATABASE productos;

USE productos;


CREATE TABLE proveedores (
   Id_proveedor int PRIMARY KEY,
   Nombre_empresa varchar(30) NOT NULL,
   Nombre_contacto varchar(40) DEFAULT NULL,
   Calle varchar(40) NOT NULL,
   Numero varchar(7) DEFAULT NULL,
   Piso tinyint DEFAULT NULL,
   Telefono varchar(9) NOT NULL,
   MailContacte varchar(30) DEFAULT NULL,
   Ciudad varchar(30) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
INSERT INTO proveedores VALUES (1,'Vicens','Marta Just','Plaça Urquinaona','10',NULL,'933020224','info@vicens.com','Barcelona'),
(2,'Suchard','Eric Selva','Balmes','22',2,'935555555',NULL,'Barcelona'),
(3,'Bic','Sergio Ibar','Av Pineda','30-32',NULL,'936665544',NULL,'Castelldefels'),
(4,'Lindt','Maria López','San Ramón','150',8,'935800000','info@lindt.com','Cerdanyola'),
(5,'Ferrero','Ernest Fornés','Torreta','100',3,'938966666','info@ferrero.com','Sant Pere de Ribes'), 
(6,'Mi Lola','Maria Magdalena','Calle Falsa','123',0,'93123123','milola@milola.com','Mataró');


CREATE TABLE productos (
   Id_producto int PRIMARY KEY,
   Descripcion varchar(30) NOT NULL,
   Precio decimal(5,2) NOT NULL,
   Fecha_caducidad date DEFAULT NULL,
   Id_proveedor int DEFAULT NULL,
   CONSTRAINT FK_productos_to_proveedor FOREIGN KEY (Id_proveedor) REFERENCES proveedores (Id_proveedor) ON UPDATE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 
 INSERT INTO productos VALUES (1,'Bombons Ferrero 6u',6.22,'2020-09-21',5),
 (2,'Mini-Bombon',1.5,'2018-12-12',5),
 (3,'Turrón de mojito',7.5,'2019-05-19',null),
 (4,'Turrón de jijona',10.2,'2020-04-01',2),
 (5,'Pack 20 bolis azules',20,null,3),
 (6,'Bombon rojo',0.25,'2020-12-31',4),
 (7,'Neules pack',2,'2020-06-03',1),
 (8,'Piruletas',0.25,'2020-07-04',2),
 (9,'Xocolatina',0.6,'2020-08-05',5),
 (10,'Bizcocho',5.6,'2019-09-06',null),
 (11,'Xocolatina',0.6,'2020-10-22',4);
 
 
 
 -- PROCEDURES
 -- 1
 
DELIMITER //
CREATE PROCEDURE ObtenerTodosLosProductos()
   BEGIN
   SELECT * FROM productos;
   END //
DELIMITER ;

 
DELIMITER //
CREATE PROCEDURE ObtenerRegistrosBarcelona()
   BEGIN
   SELECT COUNT(*) FROM proveedores WHERE ciudad='Barcelona';
   END //
DELIMITER ;

CALL ObtenerTodosLosProductos();

CALL ObtenerRegistrosBarcelona();

-- 2
DELIMITER //
CREATE PROCEDURE ObtenerRegistrosBarcelona2(IN palabra VARCHAR(30))
   BEGIN
   SELECT COUNT(*) FROM proveedores WHERE ciudad = palabra;
   END //
DELIMITER ;

CALL ObtenerRegistrosBarcelona2('Barcelona');

-- 3
DELIMITER //
CREATE PROCEDURE ObtenerRegistrosBarcelona3(IN palabra VARCHAR(30), OUT total INTEGER)
   BEGIN
   SELECT COUNT(*) INTO total FROM proveedores WHERE ciudad = palabra;
   END //
DELIMITER ;

CALL ObtenerRegistrosBarcelona3('Barcelona', @total);

SELECT @total;

-- 4

SET @total = @total*10;
SELECT @total;




