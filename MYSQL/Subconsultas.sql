drop database if exists practicasSQL;

create database practicasSQL;

use practicasSQL;

create table Departamentos
(
	cod_dept smallint unsigned,
	nom_dept varchar(25),
	planta  tinyint unsigned, 
	edificio varchar(20),
	ciudad varchar (25),
	constraint pk_cod_dept primary key (cod_dept)
);

create table Proyectos(
	cod_proy	smallint unsigned,
	nom_proy	varchar(25),
	presupuesto	integer(15) unsigned,
	constraint pk_cod_proy	primary key (cod_proy)
);

create table Empleados(
	cod_emp smallint unsigned,
	nom_emp varchar(50),
	sueldo mediumint unsigned, 
	cod_dept smallint unsigned,
	cod_proy smallint unsigned,
	constraint pk_cod_emp primary key (cod_emp),
	constraint fk_cod_dept foreign key (cod_dept) references Departamentos(cod_dept),
	constraint fk_cod_proy foreign key (cod_proy) references Proyectos(cod_proy)
);


insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (1, 'CONTABILIDAD', 2, 'La Castellana', 'MADRID');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (2, 'ADMINISTRACION', 3, 'Torres Mafre', 'BARCELONA');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (3, 'RECURSOS HUMANOS', 1, 'Diagonal Mar', 'BARCELONA');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (4, 'DIRECCION GENERAL', 1, 'La Castellana', 'MADRID');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (5, 'MARKETING', 8, 'Diagonal Mar', 'BARCELONA');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (6, 'VENTAS', 3, 'Torres Mafre', 'BARCELONA');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (7, 'VENTAS', 5, 'La Castellana', 'MADRID');

insert into departamentos(cod_dept, nom_dept, planta, edificio, ciudad)
values (8, 'INFORMATICA', 11, 'La Castellana', 'BARCELONA');

insert into proyectos(cod_proy, nom_proy, presupuesto)
values (1, 'Daisy', 240000);

insert into proyectos(cod_proy, nom_proy, presupuesto)
values (2, 'CLAM', 63000);

insert into proyectos(cod_proy, nom_proy, presupuesto)
values (3, 'Vocal Processor', 600000);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (1, 'Maria', 21000, 1, 1);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (2, 'Josep', 18000, 1, 1);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (3, 'Ramon', 48000, 4, 2);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (4, 'Marta', 48000, 5, 3);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (5, 'Miquel', 27000, 6, 2);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (6, 'Josep', 24000, 7, NULL);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (7, 'Laura', 60000, 4, 2);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (8, 'Toni', 15000, NULL, NULL);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (9, 'Josep', 18000, 3, NULL);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (10, 'Eugenia', 30000, 8, 1);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (11, 'Esteve', 33000, 8, 1);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (12, 'Robert', 16000, 8, 2);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (13, 'Manel', 18000, 8, 2);

insert into empleados(cod_emp, nom_emp, sueldo, cod_dept, cod_proy)
values (14, 'Ester', 19000, 8, 3);

-- 1
SELECT * FROM empleados WHERE sueldo < (SELECT AVG(sueldo) FROM empleados WHERE cod_dept = 8) ORDER BY sueldo DESC;

-- 2 
SELECT * FROM empleados 
WHERE sueldo > (SELECT MAX(sueldo) FROM empleados 
WHERE cod_dept = ANY (SELECT cod_dept FROM departamentos 
WHERE nom_dept = "VENTAS"));

-- 3
SELECT cod_emp, nom_emp FROM empleados 
WHERE sueldo = ANY (SELECT sueldo FROM empleados 
WHERE cod_dept = ANY (SELECT cod_dept FROM departamentos 
WHERE nom_dept = "RECURSOS HUMANOS"));

-- 4

SELECT nom_emp, sueldo FROM empleados 
WHERE sueldo < ANY (SELECT sueldo FROM empleados 
WHERE cod_dept = ANY (SELECT cod_dept FROM departamentos 
WHERE nom_dept = "DIRECCION GENERAL"));

SELECT nom_emp, sueldo FROM empleados 
WHERE sueldo < ANY (SELECT sueldo FROM empleados e
JOIN departamentos d ON e.cod_dept = d.cod_dept 
WHERE d.nom_dept = "DIRECCION GENERAL");