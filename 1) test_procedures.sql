CREATE DATABASE test_procedures;
GO
USE test_procedures;

CREATE TABLE persona(
	id INT IDENTITY(1,1),
	nombre VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE etiqueta(
	id INT IDENTITY(1,1),
	nombre VARCHAR(100),
	PRIMARY KEY(id)
); 

CREATE TABLE persona_etiqueta(
	id INT IDENTITY(1,1),
	fk_persona INT,
	fk_etiqueta INT,
	PRIMARY KEY(id),
	FOREIGN KEY(fk_persona) REFERENCES persona(id),
	FOREIGN KEY(fk_etiqueta) REFERENCES etiqueta(id)
);

INSERT INTO persona(nombre) VALUES('Profe Pato');

INSERT INTO etiqueta(nombre) VALUES('mujer');
INSERT INTO etiqueta(nombre) VALUES('hombre');
INSERT INTO etiqueta(nombre) VALUES('profe');
INSERT INTO etiqueta(nombre) VALUES('desarrollador');
INSERT INTO etiqueta(nombre) VALUES('normal');
INSERT INTO etiqueta(nombre) VALUES('enfermo');
INSERT INTO etiqueta(nombre) VALUES('gamer');


/* Profe pato es: profe, hombre y desarrollador*/
INSERT INTO persona_etiqueta(fk_persona, fk_etiqueta) VALUES('1','3');
INSERT INTO persona_etiqueta(fk_persona, fk_etiqueta) VALUES('1','2');
INSERT INTO persona_etiqueta(fk_persona, fk_etiqueta) VALUES('1','4');
/* Profe pato es: profe, hombre y desarrollador*/



SELECT * FROM persona;
SELECT * FROM etiqueta;
SELECT * FROM persona_etiqueta;



/* Eliminar la base de datos */
USE master;
DROP DATABASE test_procedures;
/* Eliminar la base de datos */