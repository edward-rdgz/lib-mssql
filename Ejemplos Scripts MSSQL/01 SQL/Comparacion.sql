USE Aromaterapia
GO

/* Lista todos los aceites cuyo nombre com�n comienza con la 
   misma letra que su nombre latino */

SELECT OilName, LatinName
FROM Oils
WHERE LEFT(OilName, 1) = LEFT(LatinName, 1)
