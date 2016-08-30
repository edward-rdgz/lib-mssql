USE Aromaterapia
GO

-- Crear una variable local de tipo tabla
DECLARE	@tablaLocal TABLE (OilName char(50), 
		     	   LatinName char(50))

-- Utilizar INSERT INTO para crear filas
INSERT  INTO @tablaLocal
	SELECT OilName, LatinName 
	FROM Oils
       

-- Mostrar los resultados
SELECT	OilName, LatinName 
FROM	@tablaLocal
