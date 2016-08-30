-- Demuestra las funciones de fecha y hora
SELECT	DATEADD(Year, 1, GETDATE()) AS [Suma Fecha],
	DATEDIFF(Week, '2008-04-20', GETDATE()) AS [Resta Fecha],
	DATENAME(Month, GETDATE()) AS [Nombre Fecha],
	DATEPART(Quarter, GETDATE()) AS [Parte Fecha],
	DAY(GETDATE()) AS [Dia],
	MONTH(GETDATE()) AS [Mes],
	YEAR(GETDATE()) AS [Año]

	