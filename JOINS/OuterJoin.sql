create table alumno
(rut_alumno varchar2(10),
 nombres_alumno varchar2(40),
 apellidos_alumno varchar2(40),
 direccion varchar2(40),
 telefono number,
 constraint pk_alumno primary key (rut_alumno));

create table asignatura
(cod_asignatura number,
 nombre_asignatura varchar2(40),
 cod_facultad number,
 horas_teoria number,
 horas_laboratorio number,
 constraint pk_asignatura primary key (cod_asignatura));

create table facultad
(cod_facultad number,
 nombre_facultad varchar2(40),
 telefono number,
 constraint pk_facultad primary key (cod_facultad));

create table alumno_asignatura
(cod_asignatura number,
 rut_alumno varchar2(10),
 periodo number,
 semestre varchar2(20),
 nota_final number,
 constraint pk_alum_asig primary key (cod_asignatura,rut_alumno,periodo,semestre),
 constraint fk_rut_alumno foreign key (rut_alumno) references alumno(rut_alumno),
 constraint fk_cod_asignatura foreign key (cod_asignatura) references asignatura(cod_asignatura));


insert into alumno values('1-1','jose','soto','direccion 1',111111);
insert into alumno values('1-2','juan','solis','direccion 2',222222);
insert into alumno values('1-3','julio','sanhueza','direccion 3',333333);
insert into alumno values('1-4','luis','sanchez','direccion 4',444444);
insert into alumno values('1-5','jose','soto','direccion 5',55555);
insert into alumno values('1-6','juana','serrano','direccion 6',66666);
insert into alumno values('1-7','angel','gonzalez','direccion 7',777777);
insert into alumno values('1-8','marcela','parra','direccion 8',888888);
insert into alumno values('1-9','gina','quintero','direccion 9',1929394);
insert into alumno values('2-1','andrea','espinoza','direccion 19',5969798);
insert into alumno values('2-2','maria','olivero','direccion 29',9959697);
insert into alumno values('2-3','gabriel','quiroz','direccion 39',394959);
insert into alumno values('3-1','leon','aguayo','direccion 139',314919);


insert into asignatura values(1,'matematica',1,80,60);
insert into asignatura values(2,'fisica',1,80,60);
insert into asignatura values(3,'codigo penal',2,140,0);
insert into asignatura values(4,'derecho comercial',2,140,0);
insert into asignatura values(5,'teologia',3,140,0);
insert into asignatura values(6,'filosofia',3,140,0);
insert into asignatura values(7,'ingles',2,50,50);

insert into facultad values(1,'ciencias',133131);
insert into facultad values(2,'letras',133434);
insert into facultad values(3,'artes',163636);
insert into facultad values(4,'medicina',183626);

insert into alumno_asignatura values(1,'1-1',2006,'otoño',4);
insert into alumno_asignatura values(1,'1-2',2006,'otoño',4);
insert into alumno_asignatura values(1,'1-3',2006,'otoño',5);
insert into alumno_asignatura values(1,'1-4',2006,'otoño',6);
insert into alumno_asignatura values(2,'1-1',2006,'otoño',3);
insert into alumno_asignatura values(2,'1-2',2006,'otoño',4);
insert into alumno_asignatura values(2,'1-3',2006,'otoño',5);
insert into alumno_asignatura values(2,'1-4',2006,'otoño',4);
insert into alumno_asignatura values(3,'1-1',2006,'primavera',4);
insert into alumno_asignatura values(3,'1-2',2006,'primavera',4);
insert into alumno_asignatura values(3,'1-3',2006,'primavera',5);
insert into alumno_asignatura values(3,'1-4',2006,'primavera',6);
insert into alumno_asignatura values(4,'1-1',2006,'primavera',3);
insert into alumno_asignatura values(4,'1-2',2006,'primavera',4);
insert into alumno_asignatura values(4,'1-3',2006,'primavera',5);
insert into alumno_asignatura values(4,'1-4',2006,'primavera',4);
insert into alumno_asignatura values(1,'1-5',2007,'otoño',4);
insert into alumno_asignatura values(1,'1-6',2007,'otoño',4);
insert into alumno_asignatura values(1,'1-7',2007,'otoño',5);
insert into alumno_asignatura values(1,'1-8',2007,'otoño',6);
insert into alumno_asignatura values(2,'1-5',2007,'otoño',3);
insert into alumno_asignatura values(2,'1-6',2007,'otoño',4);
insert into alumno_asignatura values(2,'1-7',2007,'otoño',5);
insert into alumno_asignatura values(2,'1-8',2007,'otoño',4);
insert into alumno_asignatura values(3,'1-5',2007,'primavera',4);
insert into alumno_asignatura values(3,'1-6',2007,'primavera',4);
insert into alumno_asignatura values(3,'1-7',2007,'primavera',5);
insert into alumno_asignatura values(3,'1-8',2007,'primavera',6);
insert into alumno_asignatura values(4,'1-5',2007,'primavera',3);
insert into alumno_asignatura values(4,'1-6',2007,'primavera',4);
insert into alumno_asignatura values(4,'1-7',2007,'primavera',5);
insert into alumno_asignatura values(4,'1-8',2007,'primavera',4);
insert into alumno_asignatura values(6,'1-1',2007,'primavera',4);
insert into alumno_asignatura values(6,'1-2',2007,'primavera',4);
insert into alumno_asignatura values(6,'1-3',2007,'primavera',5);
insert into alumno_asignatura values(6,'1-4',2007,'primavera',6);
insert into alumno_asignatura values(6,'1-5',2007,'primavera',3);
insert into alumno_asignatura values(6,'1-6',2007,'primavera',4);
insert into alumno_asignatura values(6,'1-7',2007,'primavera',5);
insert into alumno_asignatura values(6,'1-8',2007,'primavera',4);
insert into alumno_asignatura values(6,'1-9',2007,'primavera',4);
insert into alumno_asignatura values(1,'2-1',2008,'otoño',4);
insert into alumno_asignatura values(1,'2-2',2008,'otoño',4);
insert into alumno_asignatura values(1,'2-3',2008,'otoño',5);
insert into alumno_asignatura values(1,'1-9',2008,'otoño',3);

--1)  Mostrar todas las facultades (nombre) y las asignaturas (nombre de la asignatura) que tienen.

select f.nombre_facultad, a.nombre_asignatura
from facultad f left join asignatura a
on (f.cod_facultad=a.cod_facultad);

select f.nombre_facultad, a.nombre_asignatura
from facultad f, asignatura a
where f.cod_facultad=a.cod_facultad(+);

--2) Mostrar todos los alumnos (nombre del alumno) junto a la asignatura (nombre de la asignatura) que tiene cada uno de ellos.

select a.nombres_alumno, aaa.nombre_asignatura
from alumno a left join alumno_asignatura aa
on (a.rut_alumno=aa.rut_alumno) left join asignatura aaa
on (aa.cod_asignatura=aaa.cod_asignatura);

--3) Mostrar la facultad (nombre) que no tiene asignaturas.

select f.nombre_facultad
from facultad f left join asignatura a
on (f.cod_facultad=a.cod_facultad)
where a.cod_facultad is null;

--4) Mostrar la asignatura (nombre) que no tiene alumnos asignados.

select a.nombre_asignatura
from asignatura a left join alumno_asignatura aa
on (a.cod_asignatura=aa.cod_asignatura)
where aa.cod_asignatura is null;

