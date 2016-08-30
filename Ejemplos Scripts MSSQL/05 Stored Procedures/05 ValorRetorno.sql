USE Aromaterapia
GO

DECLARE @retorno int
EXECUTE @retorno = sp_helpdb 'Aromaterapia'
PRINT 'El sp devuelve:  ' + convert(char(2),@retorno)
