USE Aromaterapia
GO

-- Crear la variable local
DECLARE @FirstOilName char(50),
	@Description char(50)

-- Utilizar SELECT con una constante
SELECT	@Description = 'El primer aceite alfabéticamente'

-- Utilizar SELECT con un SELECT implícito
SELECT @FirstOilName = Min(OilName) FROM Oils

-- Mostrar los valores
SELECT	@FirstOilName as 'Nombre', 
	@Description as 'Descripcion'

