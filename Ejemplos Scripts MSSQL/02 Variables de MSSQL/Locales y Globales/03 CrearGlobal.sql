USE Aromaterapia
GO

-- Crear una tabla temporal global
SELECT 	OilName, LatinName
INTO	##TablaGlobal
FROM	Oils
GO
