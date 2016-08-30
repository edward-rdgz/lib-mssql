USE Aromaterapia
GO

-- Crear el cursor
DECLARE cursorSimple CURSOR
	LOCAL
	FOR SELECT OilName FROM Oils

-- Crea el conjunto de cursor
OPEN cursorSimple 

-- Recupera una fila (la primera)
FETCH cursorSimple 

-- Cierra el conjunto de cursor
CLOSE cursorSimple 

-- Libera el cursor
DEALLOCATE cursorSimple 
