use xtreme_es;

-- 1. Mostrar cuantos clientes est�n registrados en la base de datos.
select count([ID del cliente]) as [Clientes Registrados] 
from Cliente;

-- 2. Listar los campos "Id del Cliente", "Nombre", "Apellidos" y "Direcci�n 1" de los primeros cinco clientes con mayor cantidad de ventas del a�o anterior.
select top 5 [ID del cliente], [Nombre del cliente], [Apellido del contacto], [Direcci�n 1]
from Cliente 
order by [Ventas del a�o pasado] desc;

-- 3. Mostrar las primeras tres regiones con mayor cantidad de clientes.
select top 3 [Regi�n]
from Cliente 
group by [Regi�n] 
order by count([ID del cliente]) desc;

-- 4. Mostrar las primeras tres regiones con mayor cantidad de ventas del a�o anterior.
select top 3 [Regi�n]
from Cliente 
group by [Regi�n]
order by sum([Ventas del a�o pasado]) desc;

-- 5. Mostrar el pa�s con menor cantidad de ventas del a�o anterior.
select top 1 [Pa�s]
from cliente 
group by [Pa�s]
order by sum([Ventas del a�o pasado]);

-- 6. Listar los campos "Id del Cliente", "Nombre", "Apellidos" y "Direcci�n 1" de los clientes que no tengan "Direcci�n 2".
select [ID del cliente], [Nombre del cliente], [Apellido del contacto], [Direcci�n 1]
from Cliente 
where [Direcci�n 2] is null;

-- 7. Mostrar el id del cliente y el monto del cr�dito que tenga autorizado cuando el monto sea mayor a -1000.
select [ID del cliente], Monto
from Cliente cl
left join Cr�dito cr 
on cl.[ID del cr�dito del cliente] = cr.[ID del cr�dito del cliente] 
where [N� de autorizaci�n crediticia] is not null and Monto > -1000;

-- 8. Mostrar el id del cliente y el nombre del cliente, para aquellos clientes que tengan al menos un pedido con un monto superior a 1000.
select cl.[ID del cliente], [Nombre del cliente], count(*)
from Cliente cl
left join Pedidos pe
on cl.[ID del cliente] = pe.[ID del cliente]
where [Monto del pedido] > 1000 
group by cl.[ID del cliente], [Nombre del cliente]
having count(*) >= 1;

-- 9. Mostrar el nombre del empleado y el nombre del supervisor al que responde.
select emp.Nombre , sup.Nombre
 from Empleado emp
left join (select [ID del empleado] as [ID de supervisor], Nombre, Apellido from Empleado) sup
on emp.[ID de supervisor] =  sup.[ID de supervisor]
order by emp.[ID del empleado];

-- 10. Mostrar que empleados no tienen direcciones asociadas.
select e.[ID del empleado] --, e.Nombre, [Direcci�n 1], [Direcci�n 2], [Direcci�n del contacto 1 (emergencia)], [Direcci�n del contacto 2 (emergencia)]
from Empleado e
left join [Direcciones del empleado] d
on e.[ID del empleado] = d.[ID del empleado]
where [Direcci�n 1] is null;

-- 11. Mostrar que empleados, en sus direcciones asociadas, no tienen asignada una Regi�n.
select e.[ID del empleado]
from Empleado e
left join [Direcciones del empleado] d
on e.[ID del empleado] = d.[ID del empleado]
where [Regi�n] is null;

-- 12. Mostrar cuantos tipos de productos hay registrados en la base de datos.
select [Nombre del tipo de producto] 
from [Tipo de producto];

-- 13. Mostrar cuantos tipos de producto hay en uso en la tabla de productos.
select concat(count([Product Type ID]), ' ', [Nombre del tipo de producto]) as Cantidad
from Producto
left join [Tipo de producto]
on [ID del tipo de producto] = [Product Type ID]
group by [Product Type ID], [Nombre del tipo de producto];

-- 14. Mostrar los productos que no hayan tenido movimiento de ventas en el �ltimo mes (donde �ltimo mes ser� el �ltimo mes donde hubo pedidos en la base de datos).

select [nombre del tipo de producto] from [Tipo de producto]

select * from Pedidos
where  month([Fecha del pedido]) = 12

select distinct dp.[id del producto]
from Pedidos p 
inner join [Detalles del pedido] dp
on p.[ID del pedido] = dp..[id del pedido]
where year([fecha del pedido]) in (select [A�o] from [ultimoA�oMes])
and month([fecha del pedido]) in (select [Mes] from [ultimoA�oMes])

--order by month([Fecha del pedido]) desc

select * from pedidos

select t.[Nombre del tipo de producto], c.[Fecha del pedido] 
from Compras c
right join Producto p 
on c.[ID del producto] = p.[ID del producto]
right  join [Tipo de producto] t 
on p.[ID del producto] = t.[Product Type ID]
where c.[Fecha del pedido] is null
order by c.[Fecha del pedido] desc

/*
select top 1 Year([fecha del pedido]) as [A�o], MONTH([fecha del pedido]) as [Mes]
from [Pedidos]
order by [fecha del pedido] desc*/


-- 15. Mostrar el cliente con las ventas m�nimas y el cliente con las ventas m�ximas, de las ventas del a�o anterior.
select * from (
	select top 1 [Nombre del cliente] as nombre, min([Ventas del a�o pasado]) as ventas
	from Cliente
	group by [Nombre del cliente]
	order by min([Ventas del a�o pasado])
) As T
union 
select * from (
	select top 1 [Nombre del cliente] as nombre , max([Ventas del a�o pasado]) as ventas
	from Cliente
	group by [Nombre del cliente]
	order by max([Ventas del a�o pasado]) desc
) As T2
-- forma 1: trae el maximo y minimo de un solo cliente.

select [Nombre del cliente], [Ventas del a�o pasado] from cliente
where [Ventas del a�o pasado] in (select min([Ventas del a�o pasado]) from cliente)
union 
 select [Nombre del cliente], [Ventas del a�o pasado] from cliente
where [Ventas del a�o pasado] in (select max([Ventas del a�o pasado]) from cliente)
-- forma 2: trae el maximo y minimo de dos clientes.

-- 16. Mostrar el promedio de ventas de todos los clientes, del a�o anterior.
select avg([ventas del a�o pasado])
from cliente;

-- 17. Muestra cuantos d�as faltan para que acabe el a�o.
select concat(datediff(day, getdate(), concat(year(getdate()), '12', '31')), ' d�as') [D�as Restantes];

-- 18. Muestra la hora actual.
select convert(varchar(8), getdate(), 108) HoraServidor;

-- 19. En un solo script, realiza las siguientes operaciones:
-- Crea una tabla que tenga tres campos de texto y un campo autosecuenciado.
-- Inserta tres registros con la letra A en todos los campo.
-- Actualiza el registro 2 con la letra B en todos los campos.
-- Borra el registro 3.

-- 20. Mostrar los primeros 5 pedidos, mostrando el subtotal (Monto del Pedido), IVA y Total.
select top 5 
[ID del pedido],
[Monto del pedido] as Subtotal, 
([Monto del pedido] * 0.16) as IVA, 
([Monto del pedido] * 1.16)  as Total 
from Pedidos;

-- 21. Mostrar el nombre del empleado y el nombre del cliente que hayan hecho el pedido m�s alto, en funci�n de la cantidad de productos que solicitaron.
select top 1  e.[Nombre] as [Nombre del empleado], c.[Nombre del cliente], sum(cantidad) as cantidad  from empleado e
left join Pedidos p
on e.[ID del empleado] = p.[ID del empleado]
left join cliente c
on p.[ID del cliente] = c.[ID del cliente]
left join [Detalles del pedido] d
on p.[ID del pedido] = d.[ID del pedido]
group by e.[Nombre], c.[Nombre del cliente]
order by cantidad desc

-- 22. Crea una vista que muestre los tres productos m�s vendidos, incluir la informaci�n b�sica de cada producto (id, nombre, color).
/*create view [Productos m�s vendidos] as
select top 3 p.[ID del producto], [Nombre del producto], Color
from Producto p
left join [Detalles del pedido] d
on p.[ID del producto] = d.[ID del producto]
group by p.[ID del producto], [Nombre del producto], Color
order by sum(Cantidad) desc;*/
select * 
from [Productos m�s vendidos];

-- 23. Mostrar una lista de los empleados y contactos de cliente que dentro de su nombre tengan la palabra "ba".
-- Realizar esta consulta con "LIKE" y con "CHARINDEX" (Dos soluciones).
select Nombre 
from Empleado 
where Nombre  like '%ba%'
union
select [Nombre del contacto] 
from Cliente
where [Nombre del contacto] like '%ba%'
-- solucion 1

select Nombre 
from Empleado 
where charindex('ba', Nombre) > 0
union
select [Nombre del contacto] 
from Cliente 
where charindex('ba', [Nombre del contacto]) > 0
-- solucion 2

-------------------------------------------------- Ejercicio 2 ---------------------------------------------------

-- 1. De la tabla de empleados, mostrar el nombre completo del primer empleado, y que aparezca de manera aleatoria.
select top 1 concat(Nombre, ' ', Apellido) as [Nombre Completo] 
from Empleado
order by newid();

-- 2. De la tabla de empleados, ordenar la lista de empleados por la 2a. Letra del nombre.
select concat(Nombre, ' ', Apellido) as [Nombre Completo] 
from Empleado
order by substring(Nombre, 2, 1);