DROP DATABASE IF EXISTS Museo;

CREATE DATABASE Museo;

USE Museo;

CREATE TABLE Autores(
	ID_Autor VARCHAR(5) PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellidos VARCHAR(50),
    Pais VARCHAR(30) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Fecha_Defuncion DATE
);

CREATE TABLE Exposiciones(
	Id_Expo VARCHAR(7) PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Tematica VARCHAR(50) NOT NULL,
    Superficie FLOAT NOT NULL,
    CHECK(Superficie > 0 AND Superficie <= 999.9)
);

CREATE TABLE Obras(
	Id_Obra INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Autor VARCHAR(5),
    Exposicion VARCHAR(7),
    FOREIGN KEY (Autor) REFERENCES Autores(ID_Autor),
    FOREIGN KEY (Exposicion) REFERENCES Exposiciones(Id_Expo)
);

CREATE TABLE Clientes(
	Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Dni VARCHAR(9) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL,
    Telefono INT NOT NULL UNIQUE
);

CREATE TABLE Subastas(
	Id_Subasta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Ganador INT,
    Obra INT,
    Precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Ganador) REFERENCES Clientes(Id_Cliente),
    FOREIGN KEY (Obra) REFERENCES Obras(Id_Obra)
);

INSERT INTO Autores VALUES ('AT_01', 'Pablo', 'Picasso', 'Francia', '1881-10-25', '1973-04-08');
INSERT INTO Autores VALUES ('AT_02', 'Miguel', 'Ángel', 'Italia', '1475-03-06', '1564-02-18');
INSERT INTO Autores(Id_Autor, Nombre, Pais, Fecha_Nacimiento) VALUES ('AT_03', 'Bansky', 'Reino Unido', '1974-07-28');

INSERT INTO Exposiciones VALUES ('EXPO_01', 'Gran Exposición', 'Paisaje', 500);
INSERT INTO Exposiciones VALUES ('EXPO_02', 'Pequeña Exposición', 'Retrato', 350);

INSERT INTO Obras(Nombre, Descripcion, Autor, Exposicion) VALUES ('Luna', 'Pintura al óleo de autor anónimo', DEFAULT, DEFAULT);
INSERT INTO Obras(Nombre, Descripcion, Autor, Exposicion) VALUES ('La creación de Adán', 'La creación de Adán es una pintura al fresco que forma parte del techo de la Capilla Sixtina.', 'AT_02', 'EXPO_01');
INSERT INTO Obras(Nombre, Descripcion, Autor, Exposicion) VALUES ('Guernica', 'Guernica es una pintura mural al óleo elaborada en el año 1937 por el pintor, escultor y poeta español Pablo Ruiz Picasso.', 'AT_01', 'EXPO_02');
INSERT INTO Obras(Nombre, Descripcion, Autor, Exposicion) VALUES ('Girl with balloon', 'Creado con la técnica de esténcil, muestra a una niña que pierde un balón en forma de corazón y al lado escribió la frase: "There is always hope" (siempre hay esperanza).', 'AT_03', DEFAULT);
INSERT INTO Obras(Nombre, Descripcion, Autor, Exposicion) VALUES ('Retrato de Dora Maar', 'Dora Maar fue la modelo principal del artista y el tema de algunos de sus retratos más emblemáticos.', 'AT_01', DEFAULT);

INSERT INTO Clientes(Nombre, Apellidos, Dni, Email, Telefono) VALUES ('Álvaro', 'Martinez Torres', '40689785T', 'alvaromartinez@gmail.com', 665897005);
INSERT INTO Clientes(Nombre, Apellidos, Dni, Email, Telefono) VALUES ('Alex', 'Lopez', '48632004P', 'alexlopez@gmail.com', 630051248);
INSERT INTO Clientes(Nombre, Apellidos, Dni, Email, Telefono) VALUES ('Verónica', 'Vasquez Garcia', '49613557H', 'veronicavasquez@gmail.com', 600215487);

INSERT INTO Subastas(Fecha, Hora, Ganador, Obra, Precio) VALUES ('2022-06-25', '12:21:55', 1, 2, 1000);
INSERT INTO Subastas(Fecha, Hora, Ganador, Obra, Precio) VALUES ('2022-09-23', '13:45:02', 2, 3, 5000);
INSERT INTO Subastas(Fecha, Hora, Ganador, Obra, Precio) VALUES ('2022-12-01', '12:01:00', 3, 4, 6000);

