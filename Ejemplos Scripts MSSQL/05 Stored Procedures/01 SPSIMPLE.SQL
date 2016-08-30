USE Aromaterapia
GO

/* Comprueba si existe ya el procedimiento almacenado y si existe
   lo borra */
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'SPSimple' AND type = 'P')
   DROP PROCEDURE SPSimple
GO

-- Crea el procedimiento
CREATE PROCEDURE SPSimple
AS
SELECT OilName, LatinName FROM Oils
