USE Aromaterapia
GO

SELECT 	USER AS [Nombre Usuario],
	USER_ID() AS [ID],
	HAS_DBACCESS('master') AS [Acceso a Master]
GO
