--Creacion de BD
Create database dbregistro
go

use dbregistro
go

--crear tabla Ciudades
create table ciudades(
   id int primary key identity(1, 1)
   , nombre nvarchar(60) not null
   , estado bit default 1
 )

   go

   --crear tabla Persona
   create table personas(
   id int primary key identity (1, 1)
   , nombre nvarchar(40) not null
   , apellidos nvarchar(40) not null
   , ciudad_id int foreign key references
       ciudades(id) not null
	   , activo bit default 1
 )

	   go


	/*Consultas de Insertar*/
	insert into ciudades(nombre) values('Masaya')
	, ('Granada')
	, ('Jinotepe')
	, ('Managua')
	, ('Leon')
go

insert into personas (nombre,apellidos,ciudad_id)
      values('Belen', 'Acuña', 4)
	  , ('Erick', 'Martinez', 4)
	  , ('Sergio', 'Rivas', 1)
	  , ('Elmer', 'Martinez', 3)
	  , ('Cesar', 'Gallardo', 5)
go

/*CRUD*/
/*Visualizar datos*/
select * from ciudades
go

select * from personas
go

select personas.id as Codigo, personas.nombre+''+personas.apellidos
as 'Nombre completo',
ciudades.nombre as Ciudad from personas inner join ciudades
on personas.ciudad_id
= ciudades.id


/*variable*/

declare @nombre nvarchar(40)
set @nombre = '%r%'

select * from personas where nombre like @nombre