USE test_procedures;
GO 

CREATE TABLE persona_backup(
	id INT,
	nombre VARCHAR(100),
	PRIMARY KEY(id)
);

SELECT * from persona_backup;

CREATE TRIGGER respaldo_persona ON persona
FOR INSERT
AS
	DECLARE @id INT;
	DECLARE @nombre VARCHAR(100);
	
	SELECT @id = i.id FROM inserted i;
	SELECT @nombre = i.nombre FROM inserted i;
	
	INSERT INTO persona_backup VALUES(@id, @nombre);