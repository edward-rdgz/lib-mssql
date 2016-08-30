USE Aromaterapia
GO

-- Utilizar una variable local como contador
DECLARE @contador int
SET @contador = 1

WHILE @contador < 25 
BEGIN
	PRINT @contador
	SET @contador = @contador + 1
	IF @contador > 10 BREAK
END
