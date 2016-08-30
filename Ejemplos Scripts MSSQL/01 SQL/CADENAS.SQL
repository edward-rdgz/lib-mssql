USE Aromaterapia
GO

SELECT	OilName,
	UPPER(OilName) AS [Mayúsculas],
	LOWER(OilName) AS [Minúsculas],
	SUBSTRING(OilName, 3, 3) AS [Subcadena]
FROM	Oils
GO