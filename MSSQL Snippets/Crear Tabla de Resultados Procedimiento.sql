SELECT *
INTO #MyTempTable
FROM OPENROWSET(
	'SQLNCLI',
	'Server=WINDOWS;Database=Test;Uid=sa;Pwd=123;',
	--'EXEC calc.ConsultaSP @TipoReporte = 1'
	'Select Top 10 * From dbo.Clientes'
	)
GO


SELECT * 
FROM #MyTempTable

--DROP TABLE #MyTempTable
