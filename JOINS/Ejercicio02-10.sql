create table libro
(cod_libro number primary key,
 titulo    varchar2(40),
 fecha     date,
 cod_autor number);

create table estudiante
(cod_est  number primary key,
 nombre   varchar2(50),
 telefono number);

create table prestamo
(cod_prestamo number primary key,
 cod_libro    number,
 cod_est      number,
 fecha_prest  date,
 fecha_devol  date);

create table autor
(cod_autor    number primary key,
 nombre_autor varchar2(40),
 pais         varchar2(40));


alter table prestamo
add(constraint fk_libro foreign key (cod_libro) references libro (cod_libro));

alter table prestamo
add(constraint fk_estudiante foreign key (cod_prestamo) references prestamo (cod_prestamo));

alter table libro
add(constraint fk_autor foreign key (cod_autor) references autor (cod_autor));

insert into autor values(1,'JUAN','CHILE');
insert into autor values(2,'LUIS','MEXICO');
insert into autor values(3,'DIEGO','ARGENTINA');
insert into autor values(4,'GINA','ESPAÑA');
insert into autor values(5,'FERNANDO','ESPAÑA');
insert into autor values(6,'ELIANE','VENEZUELA');

insert into libro values(1,'CALCULO I',SYSDATE - 900,1);
insert into libro values(2,'CALCULO II',SYSDATE - 1200,1);
insert into libro values(3,'INTRODUCCION CALCULO',SYSDATE - 1900,1);
insert into libro values(4,'CALCULO APLICADO',SYSDATE - 600,1);
insert into libro values(5,'ALGEBRA I',SYSDATE - 900,2);
insert into libro values(6,'ALGEBRA II',SYSDATE - 1200,2);
insert into libro values(7,'MATEMATICA I',SYSDATE - 1900,2);
insert into libro values(8,'MATEMATICA APLICADA',SYSDATE - 600,2);
insert into libro values(9,'FISICA I',SYSDATE - 900,3);
insert into libro values(10,'FISICA II',SYSDATE - 1200,3);
insert into libro values(11,'FISICA CUANTICA',SYSDATE - 1900,3);
insert into libro values(12,'FISICA APLICADA',SYSDATE - 600,3);
insert into libro values(13,'SICOLOGIA I',SYSDATE - 900,4);
insert into libro values(14,'SICOLOGIA II',SYSDATE - 1200,4);
insert into libro values(15,'TALLER DE SICOLOGIA',SYSDATE - 1900,4);
insert into libro values(16,'SELECCION DE PERSONAL',SYSDATE - 600,4);
insert into libro values(17,'BIOLOGIA I',SYSDATE - 900,5);
insert into libro values(18,'BIOLOGIA II',SYSDATE - 1200,5);
insert into libro values(19,'BIOLOGIA QUIMICA',SYSDATE - 1900,5);
insert into libro values(20,'ELEMENTOS QUIMICOS',SYSDATE - 600,5);
insert into libro values(21,'FISICA CUANTICA APLICADA',SYSDATE - 1900,3);
insert into libro values(22,'ECONOMIA APLICADA',SYSDATE - 800,6);

insert into estudiante values(1,'PEDRO',4561213);
insert into estudiante values(2,'FABIOLA',4361303);
insert into estudiante values(3,'MARIBEL',6571813);
insert into estudiante values(4,'BRANDON',8541243);
insert into estudiante values(5,'CORIN',2562212);
insert into estudiante values(6,'MARCOS',8591913);
insert into estudiante values(7,'JOANNA',8568218);
insert into estudiante values(8,'SERGIO',4531313);

insert into prestamo values(1 ,2 ,4,sysdate - 110,sysdate - 95);
insert into prestamo values(2 ,4 ,2,sysdate - 94,sysdate - 90);
insert into prestamo values(3 ,1 ,8,sysdate - 108,sysdate - 95);
insert into prestamo values(4 ,1 ,8,sysdate - 91,sysdate - 90);
insert into prestamo values(5 ,3 ,3,sysdate - 75,sysdate - 60);
insert into prestamo values(6 ,6 ,7,sysdate - 195,sysdate - 160);
insert into prestamo values(7 ,15,6,sysdate - 45,sysdate - 30);
insert into prestamo values(8 ,20,5,sysdate - 75,sysdate - 60);
insert into prestamo values(9 ,2 ,2,sysdate - 95,sysdate - 90);
insert into prestamo values(10,2 ,8,sysdate - 100,sysdate - 95);
insert into prestamo values(11,3 ,6,sysdate - 65,sysdate - 40);
insert into prestamo values(12,4 ,3,sysdate - 85,sysdate - 80);
insert into prestamo values(13,5 ,7,sysdate - 195,sysdate - 160);
insert into prestamo values(14,7 ,6,sysdate - 45,sysdate - 30);
insert into prestamo values(15,20,5,sysdate - 77,sysdate - 60);
insert into prestamo values(16,20,4,sysdate - 110,sysdate - 95);
insert into prestamo values(17,4 ,2,sysdate - 195,sysdate - 90);
insert into prestamo values(18,1 ,8,sysdate - 110,sysdate - 95);
insert into prestamo values(19,8 ,8,sysdate - 195,sysdate - 90);
insert into prestamo values(20,3 ,3,sysdate - 185,sysdate - 80);
insert into prestamo values(21,6 ,7,sysdate - 145,sysdate - 60);
insert into prestamo values(22,15,6,sysdate - 85,sysdate - 30);
insert into prestamo values(23,1, 6,sysdate - 85,sysdate - 30);

select * from libro;
select * from autor;
select * from prestamo;
select * from estudiante;

--1) Mostrar el nombre del libro junto con el nombre del autor.
select a.nombre_autor, l.titulo
from autor a inner join libro l
on (a.cod_autor = l.cod_autor);


--2) Mostrar el nombre de los estudiantes junto al titulo del libro que le ha sido prestado.
select e.nombre, l.titulo
from estudiante e inner join prestamo p
on (e.cod_est = p.cod_est) 
inner join libro l
on (p.cod_libro = l.cod_libro);

--3) Mostrar el nombre de los estudiantes que no han solicitado prestamo de algun libro.
select e.nombre
from estudiante e left join prestamo p
on (e.cod_est = p.cod_est)
where cod_prestamo is null;

--4) Mostrar el titulo del libro y el nombre del autor, que no han tenido prestamo.
select l.titulo, a.nombre_autor
from autor a inner join libro l
on (a.cod_autor = l.cod_autor) 
left join prestamo p
on (l.cod_libro = p.cod_libro)
where cod_prestamo is null;

--5) Mostrar todos los títulos de los libros (con o sin préstamo) y los nombres de los estudiantes a los cuales se le ha prestado.
select e.nombre, l.titulo
from estudiante e inner join prestamo p
on (e.cod_est = p.cod_est) 
right join libro l
on (p.cod_libro = l.cod_libro);

--6) Mostrar el nombre del autor y el título del libro para los libros que han sido prestados después de una fecha específica
select l.titulo, a.nombre_autor
from autor a right join libro l
on (a.cod_autor = l.cod_autor) 
left join prestamo p
on (l.cod_libro = p.cod_libro)
where p.fecha_prest > '30/06/23';

--7)Mostrar el nombre del autor y el título del libro para los libros que han sido prestados por estudiantes cuyo nombre comienza con la letra 'M'.
select l.titulo, a.nombre_autor, e.nombre
from autor a inner join libro l
on (a.cod_autor = l.cod_autor)
left join prestamo p
on (l.cod_libro = p.cod_libro) 
left join estudiante e
on (p.cod_est = e.cod_est)
where e.nombre like 'M%';

--8)Mostrar el nombre de los estudiantes y el título del libro para los libros que han sido prestados por estudiantes cuyo número de teléfono tiene el prefijo '85'.
select l.titulo, e.nombre, e.telefono
from libro l left join prestamo p
on (l.cod_libro = p.cod_libro) 
left join estudiante e
on (p.cod_est = e.cod_est)
where e.telefono like '85%';

--9)Mostrar el nombre del autor y el título del libro para los libros que han sido prestados por estudiantes cuyo número de teléfono no tiene el prefijo '85select l.titulo, e.nombre, e.telefono
select l.titulo, e.nombre, e.telefono
from libro l left join prestamo p
on (l.cod_libro = p.cod_libro) 
left join estudiante e
on (p.cod_est = e.cod_est)
where e.telefono not like '85%';




