USE Aromaterapia
GO

DECLARE cursorSimple CURSOR
	LOCAL
	FAST_FORWARD
	FOR SELECT OilName FROM Oils
DECLARE @elNombre char(20)
DECLARE @contador int
OPEN cursorSimple

-- Muestra 6 filas
SET @contador = 1
WHILE @contador <= 6
BEGIN
	FETCH cursorSimple
		INTO @elNombre
	PRINT RTRIM(@elNombre) + ' es nombre ' + LTRIM(STR(@contador))
	SET @contador = @contador + 1
END

CLOSE cursorSimple
DEALLOCATE cursorSimple
