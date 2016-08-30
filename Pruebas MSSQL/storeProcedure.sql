-- Hacer un script que muestre la tabla de multiplicar del 4 (del 4x1=4... al 4x10=40)
declare @counter int, @num int
set @counter = 0
set @num = 4
while (@counter < 10)
begin
	set @num = 4
    set @counter = @counter + 1
	set @num = @num * @counter
	print '4 x ' + cast(@counter AS varchar) + ' = '+ cast(@num AS varchar)
end

-- Mostrar en cada línea las letras de su nombre.
declare @name nvarchar(50), @count int
set @name = 'Edward'
set @count = 0;
while (@count < len(@name))
begin
	set @count = @count + 1;
	print substring(@name, @count, 1)
end

-- Crear una variable tabla que contenga el nombre y apellido de los contactos la tabla de Cliente (xtreme_es), 
-- solo los primeros cinco registros, ordenados por el Código Postal y que estén 15% debajo del "Código Postal Promedio" 
-- y que su Dirección 2 sea nulo, e imprimir los registros que contiene la variable tabla.
declare @myTable table (
	nombre varchar(25),
	apellido varchar(30)
);

select top 5 c.[Nombre del contacto], c.[Apellido del contacto] 
from cliente c
where isnumeric(c.[código postal]) = 1 and c.[Dirección 1] is not null

/*select (avg(cast(cp.[código postal] as int)) * 0.85)  as [Código Postal]
	from cliente cp
	where isnumeric(cp.[código postal]) = 1 and [Dirección 1] is null*/


while exists(select top 5 c.[Nombre del contacto], c.[Apellido del contacto]  from Cliente c)
begin
	declare @nombre varchar(60), @apellido varchar(80)
	set @nombre = (select top 1 [Nombre del contacto] from cliente)
	set @apellido = (select top 1 [Apellido del contacto] from cliente)
	insert into @myTable values (@nombre, @apellido);
	select * from @myTable
end

select * from @myTable;


----------------------------------------------------------------------------


create procedure InsertDosTablas
	@nombre nvarchar(max),
	@pedido int
as
begin

	begin tran

	insert into Cliente 
	( [Nombre del cliente]) 
	values 
	(@nombre)

	if @@ERROR <> 0
	begin
		-- imprime el error en la app del usuario
		raiserror(15600, -1, -1, 'Ocurrio un error al insertar el cliente.')
		rollback tran
		return
	end

	declare @idCliente int
	-- muestra el ultimo registro del tipo de dato identidad
	set @idCliente = @@IDENTITY

	insert into Pedidos 
	([ID del pedido], [ID del cliente], Enviado, [Pago recibido])
	 values 
	 (@pedido, @idCliente, 0, 0)

	if @@ERROR <> 0
	begin
		-- imprime el error solo en la consola del sql server
		print 'Ocurrio un error al insertar el pedido.'
		rollback tran
		return
	end

	commit tran

end
	-- exec [dbo].[InsertDosTablas] @nombre= 'Mario', @pedido = 12313121