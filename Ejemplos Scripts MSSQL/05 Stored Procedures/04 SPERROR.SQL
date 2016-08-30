USE Aromaterapia
GO

/* Comprueba si ya existe el procedimiento y lo elimina  
   si existe */
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'SPError' AND type = 'P')
   DROP PROCEDURE SPError
GO

-- Crea el procedimiento
CREATE PROCEDURE SPError
AS
-- Crea una variable para almacenar el código de error
DECLARE @codigoRetorno int
SELECT OilName, LatinName FROM Oils

-- Atrapa cualquier error
SET @codigoRetorno = @@ERROR

RETURN(@codigoRetorno)
