USE Aromaterapia
GO

-- Crear la variable the local 
DECLARE @OilName char(50),
	@MiNumero int

-- Cambiar el valor
SET	@OilName = 'German Chamomile'
Set @MiNumero = 123

-- Mostrar el valor de la variable
Print @OilName
Print @MiNumero
