USE Aromaterapia
GO

SELECT TOP 10 OilName, LatinName,
CASE 
	WHEN LEFT(OilName,1) = 'B' THEN 'Nombre B'
	WHEN LEFT(LatinName, 1) = 'C' THEN 'Nombre Latino C'
	ELSE 'Ninguno de los dos'
END AS PruebaResultados
FROM Oils
ORDER BY OilName

