USE Aromaterapia
GO

SELECT	MAX(OilName) AS [Valor M�ximo], 
	MIN(OilName) AS [Valor M�nimo], 
	COUNT(*) AS [N�mero de Filas]
FROM Oils
GO