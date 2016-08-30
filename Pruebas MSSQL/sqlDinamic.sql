-- sirve para hacer una consulta dinámica
declare @sql nvarchar(max)
declare @tabla nvarchar(10)
set @tabla = 'Empleado Go select * from pedidos';
if exists( -- con esto evita inyeccion de sql en la consulta
	select *
	from sys.tables
	where name = @tabla
)
begin
	-- N indica que la variable es el tipo unicode
	set @sql = N'
	select * 
	from ' + @tabla
	-- esto hace posible la ejecucion de la consulta
	print @sql
	exec sp_executesql @sql
end
else
	print 'Error: La tabla no existe o está mal escrita.'

-- verifica la existencia del procedimiento almacenado
if exists (
	select * 
	from sys.procedures
	where name = 'MiSP'
)
-- verifica la existencia del procedimiento almacenado
if object_id(N'dbo.MiSP', N'P') is not null
	drop procedure [dbo].[MiSP]
go
-- crear un proceso almacenado
create procedure [dbo].[MiSP]
as
begin
	print 'Hola mundo'
end