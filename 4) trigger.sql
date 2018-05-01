USE test_procedures;
GO 

CREATE TABLE persona_backup(
	id INT IDENTITY(1,1),
	id_persona INT,
	nombre VARCHAR(100),
	fecha DATETIME,
	PRIMARY KEY(id)
);


	
CREATE TRIGGER trg_del_persona ON persona
AFTER DELETE AS

	INSERT INTO 
	persona_backup(id_persona, nombre, fecha) 
	SELECT id, nombre, GETDATE() FROM deleted;
	
	
DROP TRIGGER trg_del_persona;
	

SELECT * from persona;
DELETE FROM persona;
SELECT * from persona_backup;
