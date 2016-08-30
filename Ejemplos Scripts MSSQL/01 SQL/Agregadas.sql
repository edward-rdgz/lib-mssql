USE Aromaterapia
GO

SELECT	MAX(OilName) AS [Valor Máximo], 
	MIN(OilName) AS [Valor Mínimo], 
	COUNT(*) AS [Número de Filas]
FROM Oils
GO