USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	KEYSET 
	FOR SELECT OilName FROM Oils
DECLARE @elNombre char(20)
OPEN cursorSimple 

-- Recupera la fila en variables
FETCH FIRST FROM cursorSimple 
	INTO @elNombre

-- Muestra los resultados
PRINT RTRIM(@elNombre) + ' es el primer nombre'

-- Recupera la siguiente fila
FETCH RELATIVE 1 FROM cursorSimple 
	INTO @elNombre

-- Muestra los resultados
PRINT RTRIM(@elNombre) + ' es el siguiente nombre'

CLOSE cursorSimple 
DEALLOCATE cursorSimple 
