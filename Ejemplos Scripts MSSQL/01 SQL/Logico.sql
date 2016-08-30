USE Aromaterapia
GO

-- Select para dos condiciones
SELECT	OilName, LatinName
FROM	Oils
WHERE	LEFT(OilName, 1) = 'B' AND LEFT(LatinName, 1) = 'O'


