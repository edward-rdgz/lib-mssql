USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	KEYSET
	FOR SELECT OilName, Descripcion FROM Oils
	FOR UPDATE
OPEN cursorSimple

-- Lee la primera fila
FETCH cursorSimple

-- Cambia la descripción
UPDATE Oils SET Descripcion = 'Esto es una descripción'
	WHERE CURRENT OF cursorSimple

Select OilName, Descripcion FROM Oils
	WHERE OilName = 'Basil'

CLOSE cursorSimple
DEALLOCATE cursorSimple
