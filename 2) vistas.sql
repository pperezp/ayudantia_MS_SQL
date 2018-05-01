USE test_procedures;
GO

CREATE VIEW getPersonas AS 
	SELECT 
		p.nombre AS 'Persona',
		e.nombre AS 'Etiqueta'
	FROM
		persona p
	INNER JOIN persona_etiqueta pe 
		ON p.id = pe.fk_persona
	INNER JOIN etiqueta e 
		ON pe.fk_etiqueta = e.id;


GO


/* Eliminar vista */
DROP VIEW getPersonas;
/* Eliminar vista */