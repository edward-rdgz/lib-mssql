USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	KEYSET 
	FOR SELECT OilName FROM Oils
DECLARE @elNombre char(20)
OPEN cursorSimple 

-- Recupera la primera fila en la variable
FETCH FIRST FROM cursorSimple 
	INTO @elNombre

-- Muestra los resultados
PRINT RTRIM(@elNombre) + ' es el primer nombre'

-- Recupera la quinta fila
FETCH ABSOLUTE 5 FROM cursorSimple 
	INTO @elNombre

-- Muestra los resultados
PRINT RTRIM(@elNombre) + ' es el quinto nombre'

CLOSE cursorSimple 
DEALLOCATE cursorSimple 
