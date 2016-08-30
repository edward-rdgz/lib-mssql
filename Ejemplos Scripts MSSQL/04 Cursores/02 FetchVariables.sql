USE Aromaterapia
GO

-- Crea el cursor y algunas variables
DECLARE cursorSimple CURSOR
	LOCAL
	FOR SELECT OilName, LatinName FROM Oils
DECLARE @elNombre char(20), @elNombreLatin char(50)

-- Crea el conjunto de cursor
OPEN cursorSimple

-- Recupera los valores en variables
FETCH cursorSimple
	INTO @elNombre, @elNombreLatin

-- Muestra los resultados 
PRINT RTRIM(@elNombre) + ' es el nombre'
PRINT RTRIM(@elNombreLatin) + ' es el nombre latín'

-- Cierra el conjunto de resultados
CLOSE cursorSimple

-- Libera el cursor
DEALLOCATE cursorSimple
