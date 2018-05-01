USE test_procedures;
GO 
CREATE PROCEDURE add_etiqueta 
	@nom VARCHAR(100),
	@etiqueta VARCHAR(1000)
AS BEGIN
	DECLARE @id_persona INT;
	DECLARE @id_etiqueta INT;

	SET @id_persona  = (SELECT id FROM persona  WHERE nombre = @nom);
	SET @id_etiqueta = (SELECT id FROM etiqueta WHERE nombre = @etiqueta);

	-- Si no existe la persona, la creo
	IF @id_persona IS NULL
		INSERT INTO persona(nombre) VALUES(@nom);
		SET @id_persona = (SELECT id FROM persona WHERE nombre = @nom);

	-- Si no existe la etiqueta, la creo
	IF @id_etiqueta IS NULL
		INSERT INTO etiqueta(nombre) VALUES(@etiqueta);
		SET @id_etiqueta = (SELECT id FROM etiqueta WHERE nombre = @etiqueta);

	INSERT INTO persona_etiqueta(fk_persona, fk_etiqueta) VALUES(@id_persona,@id_etiqueta);

	SELECT * FROM getPersonas;
	SELECT * FROM persona;
	SELECT * FROM etiqueta;
	SELECT * FROM persona_etiqueta;
END

EXEC add_etiqueta 'profe pato','ñoño' ;
EXEC add_etiqueta 'profe boris','brigido' ;
EXEC add_etiqueta 'profe estay','despistado' ;

/* Eliminar el procedimiento */
DROP PROCEDURE add_etiqueta;
/* Eliminar el procedimiento */
