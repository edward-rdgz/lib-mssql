USE Aromaterapia
GO

/* Comprueba si existe el procedimiento y si 
   es así lo borra */
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'SPInput' AND type = 'P')
   DROP PROCEDURE SPInput
GO

-- Crea el procedimiento
CREATE PROCEDURE SPInput
@OilName char(50)
AS
SELECT OilName, LatinName FROM Oils
WHERE OilName = @OilName
GO

-- Ejecuto el SP y le mando el parámetro de entrada...
Exec spinput 'Basil'
Go
