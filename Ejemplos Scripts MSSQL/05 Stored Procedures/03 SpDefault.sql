USE Aromaterapia
GO

/* Comprueba si ya existe el procedimiento y lo elimina  
   si existe */
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'SPDefault' AND type = 'P')
   DROP PROCEDURE SPDefault
GO

-- Crea el procedimiento con un parámetro por default...
CREATE PROCEDURE SPDefault
@OilName char(50)= 'Fennel'
AS
SELECT OilName, LatinName FROM Oils
WHERE OilName = @OilName

