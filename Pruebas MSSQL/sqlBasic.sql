-- Aplica una consulta de datos totales
-- select * from Cliente


-- Aplicando un alias sobre las columnas
-- select [Nombre del cliente] As Nombre, [Apellido del contacto]  As Apellido from Cliente;


-- Aplicando una concatenacion simple sin funcion
-- select [Nombre del cliente] + ' ' + [Apellido del contacto] As [Nombre Completo] from Cliente;


--Alias para columnas es con AS para tablas solo se coloca el nombre a lado sin alias.


-- uso de select case

/*	select
	"Nombre del cliente" 
	,case 
	when C.[Título del contacto] = 'Mr.' then 'Señor'
	when C.[Título del contacto] = 'Miss' then 'Señorita'
	end as  Campo2_Calculado
		,C.[Nombre del cliente]+ ' '+ C.[Apellido del contacto] as [Campos3-4]
		,left(c.Ciudad, 5) as Campo5_Calculado
		,C.[Ciudad] as City
	from [xtreme_es].dbo.Cliente C; */


-- haciendo uso de where

/*	select
	"Nombre del cliente" 
	,case 
		when C.[Título del contacto] = 'Mr.' then 'Señor'
		when C.[Título del contacto] = 'Miss' then 'Señorita'
	end as Campo2_Calculado
		,C.[Nombre del cliente]+ ' '+ C.[Apellido del contacto] as [Campos3-4]
		,left(c.Ciudad, 5) as Campo5_Calculado
		,C.[Ciudad] as City
	from [xtreme_es].dbo.Cliente C
	where 
	case 
		when C.[Título del contacto] = 'Mr.' then 'Señor'
		when C.[Título del contacto] = 'Miss' then 'Señorita'
	end is null
	or
	right(c.Ciudad,1) = 'a' */


-- aplicando diferentes operadores

/*select 
	"Nombre del cliente" 
	,case 
		when C.[Título del contacto] = 'Mr.' then 'Señor'
		when C.[Título del contacto] = 'Miss' then 'Señorita'
	end as Campo2_Calculado
		,C.[Nombre del cliente]+ ' '+ C.[Apellido del contacto] as [Campos3-4]
		,left(c.Ciudad, 5) as Campo5_Calculado
		,C.[Ciudad] as City
	from [xtreme_es].dbo.Cliente C
	where 
	C.[Título del contacto] = 'Mr.'
	or
	(right(c.Ciudad,1) = 'a'
	and
	C.[Título del contacto] = 'Miss')*/


-- top funciona solo con select y especificado el tamaño
-- set rowncount para traer un limite de filas

/*set rowcount 3

select top 5
	"Nombre del cliente" 
	,case 
		when C.[Título del contacto] = 'Mr.' then 'Señor'
		when C.[Título del contacto] = 'Miss' then 'Señorita'
	end as Campo2_Calculado
		,C.[Nombre del cliente]+ ' '+ C.[Apellido del contacto] as [Campos3-4]
		,left(c.Ciudad, 5) as Campo5_Calculado
		,C.[Ciudad] as City
	from [xtreme_es].dbo.Cliente C
	where 
	C.[Título del contacto] = 'Mr.'
	or
	(right(c.Ciudad,1) = 'a'
	and
	C.[Título del contacto] = 'Miss')*/



	-- distinct trae los registros unicos
	--select distinct [Título del contacto]  from Cliente;



	-- aplicando order by primera columna, despues sobre la segunda

	/*select
	"Nombre del cliente" 
	,case 
		when C.[Título del contacto] = 'Mr.' then 'Señor'
		when C.[Título del contacto] = 'Miss' then 'Señorita'
	end as Campo2_Calculado
		,C.[Nombre del cliente]+ ' '+ C.[Apellido del contacto] as [Campos3-4]
		,left(c.Ciudad, 5) as Campo5_Calculado
		,C.[Ciudad] as City
	from [xtreme_es].dbo.Cliente C
	where 
		c.Ciudad in ('Dublin', 'Berlin')
	order by c.Ciudad, c.[Nombre del cliente]*/