USE Aromaterapia
GO

SELECT OilName, 
CASE PlantPartID
	WHEN 1 THEN 'Nueces'
	WHEN 2 THEN 'Fruta'
	WHEN 3 THEN 'Nueces'
	WHEN 7 THEN 'Fruta'
	WHEN 8 THEN 'Nueces'
	WHEN 14 THEN 'Nueces'
	WHEN 12 THEN 'Fruta'
	WHEN 15 THEN 'Fruta'
	ELSE 'Otros'
END AS CategoriaPlantas
FROM Oils
ORDER BY CategoriaPlantas
