USE Aromaterapia
GO

-- Muestra algunos metadatos sobre la base de datos
SELECT 	DB_NAME() AS [Nombre BD],
	DATABASEPROPERTY('Aromaterapia', 'Version') AS [Versi�n],
	DB_ID('Aromaterapia') AS [ID]
