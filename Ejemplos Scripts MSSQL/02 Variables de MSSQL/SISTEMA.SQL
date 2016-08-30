-- Muestra algunos valores de sistema
SELECT 	APP_NAME() AS [Aplicación],
	SYSTEM_USER AS [Usuario],
	ISDATE('20 Abril 1958') AS [Es una fecha],
	ISDATE('No es fecha') AS [No es una fecha]
GO
