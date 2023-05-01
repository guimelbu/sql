DROP DATABASE IF EXISTS Escuela_FKs;

CREATE database Escuela_FKs;

USE Escuela_FKs;

CREATE TABLE Profe(
	ID_Profe VARCHAR(6), 
	Nombre VARCHAR(30), 
	Apellido VARCHAR(30), 
	NumHoras INT,
	PRIMARY KEY (ID_Profe)
);

CREATE TABLE Modulo(
	ID_Modulo VARCHAR(6), 
	Nombre VARCHAR(30), 
	Profe VARCHAR(6), 
	TotalHoras INT,
	PRIMARY KEY (ID_Modulo),
	FOREIGN KEY (Profe) REFERENCES Profe(ID_Profe)
);

CREATE TABLE UF(
	Nombre VARCHAR(50),
	NumUF INT,
	Modulo VARCHAR(6), 
	Horas INT, 
	PRIMARY KEY (Nombre),
	FOREIGN KEY (Modulo) REFERENCES Modulo(ID_Modulo)
);

CREATE TABLE Alumno(
	ID_Alumno VARCHAR(7),
	Nombre VARCHAR(30),
	Edad INT,
	Poblacion VARCHAR(20),
	PRIMARY KEY (ID_Alumno)	
);

CREATE TABLE AlumnosBcn(
	ID_Alumno VARCHAR(7),
	Nombre VARCHAR(30),
	Edad INT,
	PRIMARY KEY (ID_Alumno)	
);

CREATE TABLE AlumnoModulo(
	Id INT NOT NULL AUTO_INCREMENT,
	Alumno VARCHAR(7),
	Modulo VARCHAR(6),
	Convocatoria INT,
	PRIMARY KEY(Id),
	FOREIGN KEY (Alumno) REFERENCES Alumno(ID_Alumno),
	FOREIGN KEY (Modulo) REFERENCES Modulo(ID_Modulo)
);



INSERT INTO Profe VALUES ( 'PF_001' , 'Consuelo', 'Segura', 30);
INSERT INTO Profe VALUES ( 'PF_002' , 'Alba', 'Martínez', 24);
INSERT INTO Profe VALUES ( 'PF_003' , 'JL', 'García', 30);

INSERT INTO Modulo VALUES ( 'MP_01' , 'ISO', 'PF_003', 198);
INSERT INTO Modulo VALUES ( 'MP_05' , 'Entornos de desarrollo', 'PF_002', 66);
INSERT INTO Modulo VALUES ( 'MP_03' , 'Programación', 'PF_002', 297);
INSERT INTO Modulo VALUES ( 'MP_04' , 'Lenguaje de marcas', 'PF_003', 99);
INSERT INTO Modulo VALUES ( 'MP_06' , 'Acceso a datos', 'PF_001', 132);

INSERT INTO UF VALUES ( 'Programació Estructurada' , 1, 'MP_03', 85);
INSERT INTO UF VALUES ( 'Sistemes de gestió d''informació empresarial' , 3, 'MP_04', 27);
INSERT INTO UF VALUES ( 'Fonaments de gestió de fitxers' , 3, 'MP_03', 30);
INSERT INTO UF VALUES ( 'Gestió de la informació i de recursos en una xarxa' , 2, 'MP_01', 80);
INSERT INTO UF VALUES ( 'Persistencia en fitxers' , 1, 'MP_06', 24);
INSERT INTO UF VALUES ( 'Components d''acces a dades' , 4, 'MP_06', 24);
INSERT INTO UF VALUES ( 'Desenvolupament de programari' , 1, 'MP_05', 20);
INSERT INTO UF VALUES ( 'Disseny modular' , 2, 'MP_03', 50);
INSERT INTO UF VALUES ( 'Optimització de programari' , 2, 'MP_03', 20);
INSERT INTO UF VALUES ( 'Introducció al disseny orientat a objectes' , 3, 'MP_05', 20);
INSERT INTO UF VALUES ( 'Programació amb XML' , 1, 'MP_04', 45);
INSERT INTO UF VALUES ( 'Install, configure and explode computer system' , 1, 'MP_01', 60);
INSERT INTO UF VALUES ( 'Àmbits d''aplicació del XML' , 2, 'MP_04', 27);

INSERT INTO Alumno VALUES ( 'ALU_001' , 'Jordi', 22, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_002' , 'Georgina', 23, 'Badalona');
INSERT INTO Alumno VALUES ( 'ALU_003' , 'Elena', 28, 'St Just');
INSERT INTO Alumno VALUES ( 'ALU_004' , 'Sergi', 30, 'Hospitalet');
INSERT INTO Alumno VALUES ( 'ALU_005' , 'Laia', 24, 'Badalona');
INSERT INTO Alumno VALUES ( 'ALU_006' , 'Maria', 26, 'Masnou');
INSERT INTO Alumno VALUES ( 'ALU_007' , 'Xavier', 19, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_008' , 'Albert', 21, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_009' , 'Toni', 25, 'Hospitalet');
INSERT INTO Alumno VALUES ( 'ALU_010' , 'Ramon', 18, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_011' , 'Didac', 24, 'Hospitalet');
INSERT INTO Alumno VALUES ( 'ALU_012' , 'Marc', 26, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_013' , 'Eduard', 28, 'Barcelona');
INSERT INTO Alumno VALUES ( 'ALU_014' , 'Genís', 33, 'Masnou');
INSERT INTO Alumno VALUES ( 'ALU_015' , 'Carles', 31, 'Barcelona');

INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_001' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_001' , 'MP_03', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_001' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_002' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_002' , 'MP_03', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_002' , 'MP_06', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_002' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_003' , 'MP_01', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_003' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_003' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_004' , 'MP_01', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_004' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_004' , 'MP_05', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_004' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_005' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_005' , 'MP_04', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_005' , 'MP_05', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_005' , 'MP_06', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_006' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_006' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_006' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_006' , 'MP_05', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_007' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_007' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_007' , 'MP_05', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_007' , 'MP_06', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_009' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_009' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_009' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_009' , 'MP_05', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_010' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_010' , 'MP_05', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_010' , 'MP_06', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_011' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_011' , 'MP_05', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_011' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_014' , 'MP_01', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_014' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_014' , 'MP_04', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_014' , 'MP_05', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_015' , 'MP_03', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_015' , 'MP_04', 1);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_015' , 'MP_05', 2);
INSERT INTO AlumnoModulo (Alumno,Modulo, Convocatoria)VALUES ( 'ALU_015' , 'MP_06', 1);

SELECT * FROM Profe;
SELECT * FROM Alumno;
SELECT * FROM AlumnoModulo;
SELECT * FROM Modulo;
SELECT * FROM UF;
SELECT * FROM AlumnosBcn;
SET foreign_key_checks = 1;

-- 1
INSERT INTO Alumno VALUES ( 'ALU_016' , 'Rosa', 28, 'Barcelona'),( 'ALU_017' , 'Vanesa', 20, 'Barcelona'),
( 'ALU_018' , 'Norma', 23, 'Barcelona');

-- 2
INSERT INTO UF VALUES ( 'POO' , 6, 'MP_03', 23);

-- 3
SET SQL_SAFE_UPDATES = 0;
UPDATE Alumno SET Edad = Edad + 2 WHERE Poblacion= 'Hospitalet';
SET SQL_SAFE_UPDATES = 1;

-- 4
UPDATE UF JOIN Modulo ON UF.Modulo = Modulo.ID_Modulo
SET UF.Horas = UF.Horas*0.9
WHERE Modulo.Nombre = 'ISO' OR Modulo.Nombre = 'Lenguaje de marcas';

-- 5
DELETE FROM UF WHERE Modulo = "MP_06";

-- 6
INSERT INTO AlumnosBcn SELECT ID_Alumno, Nombre, Edad FROM Alumno WHERE Poblacion = "Barcelona";

-- 7
UPDATE Profe SET ID_Profe = "PF_007" WHERE Nombre = "Consuelo";
UPDATE Modulo SET Profe = "PF_007" WHERE Profe = "PF_007";

-- 8
UPDATE Alumno SET Poblacion = "Star City" WHERE Poblacion = "Badalona";

-- 9
UPDATE UF SET NumUF = NumUF - 1 WHERE Nombre LIKE '%s' AND Horas < 50;

-- 10
DELETE FROM Alumno WHERE ID_Alumno = "ALU_010";
DELETE FROM AlumnoModulo WHERE Alumno = "ALU_010";

-- 11
UPDATE AlumnoModulo am 
JOIN Alumno a ON a.ID_Alumno = am.Alumno 
SET am.Convocatoria = am.Convocatoria - 1 WHERE a.Nombre = 'Sergi' AND ( am.Modulo = 'MP_01' OR am.Modulo = 'MP_05');

-- 12
UPDATE Modulo SET ID_Modulo = 'MP_42' WHERE ID_Modulo = 'MP_03';
UPDATE UF SET Modulo = 'MP_42' WHERE Modulo = 'MP_03';
UPDATE AlumnoModulo SET Modulo = 'MP_42' WHERE Modulo = 'MP_03';

-- 13
UPDATE AlumnoModulo am 
JOIN Alumno a ON a.ID_Alumno = am.Alumno
JOIN Modulo m ON am.Modulo = m.ID_Modulo
SET am.Convocatoria = am.Convocatoria + 1 WHERE a.Poblacion = 'Masnou' AND m.Nombre = 'Programación';

-- 14
INSERT INTO Alumno VALUES('ALU_019' , 'Pol', 25, 'Barcelona');
INSERT INTO AlumnoModulo (Alumno,Modulo)VALUES ( 'ALU_019' , 'MP_01'), ( 'ALU_019' , 'MP_04');

-- 15
INSERT INTO Profe VALUES ( 'MP_07' , 'FOL', 'PF_003', 66);
INSERT INTO UF VALUES ( 'Incorporació al treball' , 1, 'MP_07', 33);
INSERT INTO UF VALUES ( 'Prevenció de riscos laborals' , 2, 'MP_07', 33);

-- 16 
UPDATE AlumnoModulo SET Modulo = 'MP_07' WHERE Modulo = 'MP_05';
