-- Crea una tabla que tenga tres campos de texto y un campo autosecuenciado.
create table tabla (
id int identity(1,1) not null,
campo1 char(10) null,
campo2 char(10) null,
campo3 char(10) null
);

-- Inserta tres registros con la letra A en todos los campo.
insert into tabla (campo1, campo2, campo3) 
values 
('A','A','A'), ('A','A','A'), ('A','A','A');

-- Actualiza el registro 2 con la letra B en todos los campos.
update tabla 
set campo1 = 'B', campo2 = 'B', campo3 = 'B'
where id = 2;

-- Borra el registro 3.
delete from tabla where id = 3;
