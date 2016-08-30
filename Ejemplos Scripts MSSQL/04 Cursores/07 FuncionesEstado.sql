USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	STATIC 
	FOR SELECT OilName FROM Oils

OPEN cursorSimple
-- Muestra el número de filas
SELECT @@CURSOR_ROWS AS FilasCursor

-- Obtiene la última fila
FETCH cursorSimple
-- Muestra los resultados de la última lectura
SELECT @@FETCH_STATUS AS EstadoFetch

-- Comprueba el estado del cursor
SELECT CURSOR_STATUS('local', 'cursorSimple') AS EstadoCursor

CLOSE cursorSimple
DEALLOCATE cursorSimple
