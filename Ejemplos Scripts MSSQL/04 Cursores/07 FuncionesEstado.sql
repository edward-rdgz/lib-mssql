USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	STATIC 
	FOR SELECT OilName FROM Oils

OPEN cursorSimple
-- Muestra el n�mero de filas
SELECT @@CURSOR_ROWS AS FilasCursor

-- Obtiene la �ltima fila
FETCH cursorSimple
-- Muestra los resultados de la �ltima lectura
SELECT @@FETCH_STATUS AS EstadoFetch

-- Comprueba el estado del cursor
SELECT CURSOR_STATUS('local', 'cursorSimple') AS EstadoCursor

CLOSE cursorSimple
DEALLOCATE cursorSimple
