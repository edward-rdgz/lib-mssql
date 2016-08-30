USE Aromaterapia
GO

/* Comprueba si ya existe el procedimiento y lo elimina  
   si existe */
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'SPOutput' AND type = 'P')
   DROP PROCEDURE SPOutput
GO

-- Crea el procedimiento
CREATE PROCEDURE SPOutput
@VarSalida char(6) OUTPUT
AS
SET @VarSalida = 'Salida'

/*
-- Prueba de como se manda llamar a un SP con variables de salida...
Declare @MiVar char(6)
Set @MiVar='Valor1'
print @MiVar
exec SPOutput @MiVar output
print @MiVar
*/


