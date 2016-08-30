USE Aromaterapia
GO

-- Utilizar una variable local como contador
DECLARE @contador int
SET @contador = 1

WHILE @contador < 11 
BEGIN
	PRINT @contador
	SET @contador = @contador + 1
END
