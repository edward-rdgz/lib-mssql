USE Aromaterapia
GO

/*
  Crear una variable local para almacenar la primera letra 
  del primer OilName
*/
DECLARE @primeraLetra char(1)
SELECT @primeraLetra = LEFT(Min(OilName),1) FROM Oils

/* Muestra la primea letra
*/
SELECT @primeraLetra

/* 
  Utilizar IF...ELSE para determinar si la primera letra
  es una 'A' o no
*/

IF @primeraLetra = 'A'
   PRINT 'Sí, una A'
ELSE
   PRINT 'No, no es una una'
