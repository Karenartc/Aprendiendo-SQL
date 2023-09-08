/*Clase 28-08
Inner Join*/

create table empleado
(emp_cod        number,
 emp_nombre     varchar2(80),
 emp_apellido   varchar2(80),
 emp_fecha_cont date,
 emp_sueldo     number,
 dep_cod        number,
 constraint pk_empleado primary key (emp_cod));
 
insert into empleado
values(1,'JUAN','SOTO',to_date('10/03/2005','dd/mm/yyyy'),800,3);
insert into empleado
values(2,'JOSE','SANCHEZ',to_date('20/03/2005','dd/mm/yyyy'),1100,2);
insert into empleado
values(3,'JUANA','TORRES',to_date('10/03/2005','dd/mm/yyyy'),1400,1);
insert into empleado
values(4,'LUIS','QUINTERO',to_date('01/05/2006','dd/mm/yyyy'),1100,3);
insert into empleado
values(5,'GINA','OLIVERO',to_date('01/09/2007','dd/mm/yyyy'),800,1);
insert into empleado
values(6,'MARIBEL','VALENCIA',to_date('01/03/2009','dd/mm/yyyy'),1000,2);
insert into empleado
values(7,'FERNANDO','CASTILLO',to_date('01/03/2010','dd/mm/yyyy'),1300,3);
insert into empleado
values(8,'LILIANA','ARAYA',to_date('01/04/2010','dd/mm/yyyy'),1300,3);
insert into empleado
values(9,'JOANNA','GONZALEZ',to_date('01/04/2010','dd/mm/yyyy'),1300,3);

create table vehiculo(
    veh_codigo number primary key,
    veh_marca varchar2(50));

insert into vehiculo values(1, 'toyota');
insert into vehiculo values(2, 'nissan');

create table  veh_asignado(
    emp_cod number,
    veh_codigo number,
    constraint pk_veh_asig primary key (emp_cod, veh_codigo), 
    constraint fk_veh_asig1 foreign key (emp_cod) references empleado(emp_cod),
    constraint fk_veh_asig2 foreign key (veh_codigo) references vehiculo(veh_codigo));

insert into veh_asignado values(1, 1);
insert into veh_asignado values(1, 2);
insert into veh_asignado values(3, 1);
insert into veh_asignado values(4, 2);

/*sub consulta*/
select *
from empleado
where emp_cod in (select emp_cod from veh_asignado);

/*Producto cartesiano*/
select *
from empleado, vehiculo;

/*Consultar en dos tablas con where*/
select *
from empleado e, veh_asignado va
where e.emp_cod=va.emp_cod;

/*Consultar en una tercera tabla con where*/
select *
from empleado e, veh_asignado va, vehiculo v
where e.emp_cod=va.emp_cod and va.veh_codigo=v.veh_codigo;

/*Consultar en una tercera tabla, todo lo de la tabla empleado y solo la marca del vehiculo, con where*/
select e.*, veh_marca
from empleado e, veh_asignado va, vehiculo v
where e.emp_cod=va.emp_cod and va.veh_codigo=v.veh_codigo;

/*Consultar en dos tablas con inner join*/
select *
from empleado e inner join veh_asignado va 
on e.emp_cod=va.emp_cod;

/*Consultar en una tercera tabla, todo lo de la tabla empleado y solo la marca del vehiculo, con inner join*/
select e.*, veh_marca
from empleado e inner join veh_asignado va
on (e.emp_cod=va.emp_cod) inner join vehiculo v
on (va.veh_codigo=v.veh_codigo);

/*-----------------------------------*/
/*Ejercicio realizado luego de clase*/

create table departamento
(dep_cod    number,
 dep_nombre varchar2(80),
 constraint pk_departamento primary key (dep_cod));

create table proyecto
(pro_cod number,
 pro_nombre varchar2(80),
 pro_fecha_ini date,
 pro_fecha_fin date,
 pro_ubicacion varchar2(80),
 pro_estado char(1),
 constraint pk_proyecto primary key (pro_cod));

create table asignado
(emp_cod       number,
 pro_cod       number,
 asi_fecha_ini date,
 asi_fecha_fin date,
 asi_estado    char(1));
 
alter table empleado 
add (constraint fk_emp1 foreign key (dep_cod)
     references departamento(dep_cod));

alter table asignado
add (constraint pk_asignado primary key (emp_cod,pro_cod),
     constraint fk_asignado1 foreign key (emp_cod)
     references empleado(emp_cod),
     constraint fk_asignado2 foreign key (pro_cod)
     references proyecto(pro_cod));
     
insert into departamento
values(1,'VENTA');
insert into departamento
values(2,'ADMINISTRACION');
insert into departamento
values(3,'PRODUCCION');

insert into proyecto
values(1,'PROYECTO 1',to_date('01/04/2005','dd/mm/yyyy'),to_date('01/04/2008','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(2,'PROYECTO 2',to_date('01/10/2005','dd/mm/yyyy'),to_date('01/10/2008','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(3,'PROYECTO 3',to_date('01/01/2006','dd/mm/yyyy'),to_date('01/06/2009','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(4,'PROYECTO 4',to_date('01/01/2008','dd/mm/yyyy'),to_date('01/01/2011','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(5,'PROYECTO 5',to_date('01/05/2008','dd/mm/yyyy'),to_date('01/05/2011','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(6,'PROYECTO 6',to_date('01/11/2008','dd/mm/yyyy'),to_date('01/11/2011','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(7,'PROYECTO 7',to_date('01/01/2009','dd/mm/yyyy'),to_date('01/01/2012','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(8,'PROYECTO 8',to_date('01/06/2009','dd/mm/yyyy'),to_date('01/06/2012','dd/mm/yyyy'),'SANTIAGO','C');
insert into proyecto
values(9,'PROYECTO 9',to_date('01/04/2010','dd/mm/yyyy'),to_date('01/11/2013','dd/mm/yyyy'),'CALAMA','A');
insert into proyecto
values(10,'PROYECTO 10',to_date('01/04/2010','dd/mm/yyyy'),to_date('01/11/2013','dd/mm/yyyy'),'RANCAGUA','A');

insert into asignado
values(1,1,to_date('01/04/2005','dd/mm/yyyy'),to_date('01/04/2008','dd/mm/yyyy'),'N');
insert into asignado
values(4,2,to_date('01/10/2005','dd/mm/yyyy'),to_date('01/10/2008','dd/mm/yyyy'),'N');
insert into asignado
values(1,3,to_date('01/01/2006','dd/mm/yyyy'),to_date('01/06/2009','dd/mm/yyyy'),'N');
insert into asignado
values(4,4,to_date('01/01/2008','dd/mm/yyyy'),to_date('01/01/2011','dd/mm/yyyy'),'V');
insert into asignado
values(1,5,to_date('01/05/2008','dd/mm/yyyy'),to_date('01/05/2011','dd/mm/yyyy'),'V');
insert into asignado
values(4,6,to_date('01/11/2008','dd/mm/yyyy'),to_date('01/11/2011','dd/mm/yyyy'),'V');
insert into asignado
values(1,7,to_date('01/01/2009','dd/mm/yyyy'),to_date('01/06/2012','dd/mm/yyyy'),'V');
insert into asignado
values(4,8,to_date('01/06/2009','dd/mm/yyyy'),to_date('01/06/2012','dd/mm/yyyy'),'V');
insert into asignado
values(7,9,to_date('01/04/2010','dd/mm/yyyy'),to_date('01/11/2013','dd/mm/yyyy'),'V');
insert into asignado
values(8,10,to_date('01/04/2010','dd/mm/yyyy'),to_date('01/11/2013','dd/mm/yyyy'),'V');
insert into asignado
values(9,4,to_date('01/04/2010','dd/mm/yyyy'),to_date('01/12/2011','dd/mm/yyyy'),'V');
insert into asignado
values(9,5,to_date('01/04/2010','dd/mm/yyyy'),to_date('01/12/2011','dd/mm/yyyy'),'V');

/*Select con where*/
select *
from empleado, departamento
where empleado.dep_cod=departamento.dep_cod;

/*Select con Inner Join*/
select *
from empleado e inner join departamento d 
on e.dep_cod=d.dep_cod;

select * from empleado;
select * from asignado;
select * from departamento;
select * from proyecto;

/*Select para conocer que campos tiene las tablas*/
select *
from empleado e, asignado a;

/*Encontramos el dato para hacer la equivalencia, hacemos un select con where
mostrará solo el nombre y apellido del empleado, y su estado*/
select emp_nombre, emp_apellido, asi_estado 
from empleado e, asignado a
where e.emp_cod=a.emp_cod;

/*Mismo select que el anterior ahora con inner join
mostrará solo el nombre y apellido del empleado, y su estado*/
select emp_nombre, emp_apellido, asi_estado 
from empleado e inner join asignado a
on e.emp_cod=a.emp_cod;

/*Select para conocer que campos tienen las tres tablas*/
select *
from empleado e, asignado a, proyecto p;

/*Select con where de tres tablas*/
select * 
from empleado e, asignado a, proyecto p
where e.emp_cod=a.emp_cod and a.pro_cod = p.pro_cod;

/*Select con where de tres tablas
muestra el nombre del empleado y el nombre del proyecto*/
select emp_nombre, pro_nombre
from empleado e, asignado a, proyecto p
where e.emp_cod=a.emp_cod and a.pro_cod = p.pro_cod;

/*Select con inner join de tres tablas
muestra el nombre del empleado y el nombre del proyecto*/
select emp_nombre, pro_nombre
from empleado e inner join asignado a
on(e.emp_cod=a.emp_cod) inner join proyecto p
on (a.pro_cod = p.pro_cod);

/*Select para conocer que campos tienen las cuatro tablas*/
select *
from empleado e, asignado a, proyecto p, departamento d;

/*Select para cercionar la relación de estas tablas*/
select *
from empleado e, departamento d
where e.dep_cod = d.dep_cod;

/*Select de todos los campos de las cuatro tablas con where*/
select *
from departamento d, empleado e, asignado a, proyecto p
where e.dep_cod = d.dep_cod and e.emp_cod=a.emp_cod and a.pro_cod = p.pro_cod;

/*Select de todos los campos de las cuatro tablas con inner join*/
select *
from empleado e inner join departamento d
on (e.dep_cod = d.dep_cod)inner join asignado a
on (e.emp_cod=a.emp_cod)inner join proyecto p
on (a.pro_cod = p.pro_cod);

/*Select de todos los campos de departamento y proyecto, además, del nombre y apellido del empleado
de las cuatro tablas con where*/
select emp_nombre, emp_apellido, d.*, p.*
from departamento d, empleado e, asignado a, proyecto p
where e.dep_cod = d.dep_cod and e.emp_cod=a.emp_cod and a.pro_cod = p.pro_cod;

/*Select de todos los campos de departamento y proyecto, además, del nombre y apellido del empleado
de las cuatro tablas con inner join*/
select emp_nombre, emp_apellido, d.*, p.*
from empleado e inner join departamento d
on (e.dep_cod = d.dep_cod)inner join asignado a
on (e.emp_cod=a.emp_cod)inner join proyecto p
on (a.pro_cod = p.pro_cod);

/*Ejercicios realizados en clase
        Clase 04-09*/

/*1. Mostrar el nombre de cada uno de los empleados junto con  el nombre del departamento al cual pertenece.*/
select e.emp_nombre, d.dep_nombre
from empleado e, departamento d
where e.dep_cod=d.dep_cod;

select e.emp_nombre,e.emp_apellido, d.dep_nombre
from empleado e inner join departamento d
on e.dep_cod=d.dep_cod;

/*2. Mostrar los nombres de los proyectos junto con los nombres de los empleados involucrados en los proyectos.*/
select p.pro_nombre, e.emp_nombre, e.emp_apellido
from empleado e, proyecto p, asignado a
where e.emp_cod = a.emp_cod and p.pro_cod = a.pro_cod;

select p.pro_nombre, e.emp_nombre, e.emp_apellido
from empleado e inner join asignado a
on (e.emp_cod = a.emp_cod) inner join proyecto p
on (p.pro_cod = a.pro_cod);

/*3. Mostrar los nombres de los proyectos del departamento venta.*/
select distinct p.pro_nombre, e.dep_cod
from proyecto p, asignado a, empleado e, departamento d
where p.pro_cod = a.pro_cod
  and a.emp_cod = e.emp_cod
  and e.dep_cod = d.dep_cod
  and d.dep_nombre = 'VENTA';

select distinct p.pro_nombre, e.dep_cod
from proyecto p inner join asignado a 
on (p.pro_cod = a.pro_cod) inner join empleado e
on (a.emp_cod = e.emp_cod) inner join departamento d
on (e.dep_cod = d.dep_cod) 
where d.dep_nombre = 'VENTA';

/*Realizado por el profe*/
select distinct p.pro_nombre, e.dep_cod
from proyecto p inner join asignado a
on (p.pro_cod = a.pro_cod) inner join empleado e
on (a.emp_cod=e.emp_cod)
where e.dep_cod in (select dep_cod from departamento where dep_nombre='VENTA');

/*4. Mostrar los nombres de los proyectos y el nombre de los departamentos involucrados*/
select distinct p.pro_nombre, d.dep_nombre
from proyecto p inner join asignado a
on (p.pro_cod = a.pro_cod) inner join empleado e
on (a.emp_cod=e.emp_cod) inner join departamento d
on (e.dep_cod=d.dep_cod);

select distinct p.pro_nombre, d.dep_nombre
from proyecto p, asignado a, empleado e, departamento d
where p.pro_cod = a.pro_cod
and a.emp_cod=e.emp_cod
and e.dep_cod=d.dep_cod;

/*Ejercicios a realizar en Casa*/

create table isapre
(isa_codigo number,
 isa_nombre varchar2(50),
 constraint pk_isapre primary key(isa_codigo));

create table clinica
(clin_codigo number,
 clin_nombre varchar2(50),
 constraint pk_clinica primary key(clin_codigo));

create table convenio
(con_codigo number,
 con_descuento number,
 isa_codigo number,
 clin_codigo number,
 constraint con_codigo primary key(con_codigo));

alter table convenio
add(constraint fk_convenio1 foreign key (isa_codigo)
    references isapre(isa_codigo),
    constraint fk_convenio2 foreign key (clin_codigo)
    references clinica (clin_codigo));

alter table empleado
add(isa_codigo number,
    constraint fk_emp2 foreign key (isa_codigo)
    references isapre (isa_codigo));


insert into isapre values(1, 'ISAPRE 1');
insert into isapre values(2, 'ISAPRE 2');
insert into isapre values(3, 'ISAPRE 3');
insert into isapre values(4, 'ISAPRE 4');

insert into clinica values(1,'CLINICA 1');
insert into clinica values(2,'CLINICA 2');
insert into clinica values(3,'CLINICA 3');
insert into clinica values(4,'CLINICA 4');

insert into convenio values(1,15,1,1);
insert into convenio values(2,12,1,3);
insert into convenio values(3,15,2,1);
insert into convenio values(4,11,3,2);
insert into convenio values(5,15,3,1);

update empleado
set isa_codigo=1
where emp_cod=1;

update empleado
set isa_codigo=2
where emp_cod=2;

update empleado
set isa_codigo=3
where emp_cod=3;

update empleado
set isa_codigo=1
where emp_cod=4;

update empleado
set isa_codigo=2
where emp_cod=5;

update empleado
set isa_codigo=1
where emp_cod=6;

update empleado
set isa_codigo=3
where emp_cod=7;

update empleado
set isa_codigo=3
where emp_cod=8;

update empleado
set isa_codigo=2
where emp_cod=9;

/*1. MOSTRAR LOS NOMBRES DE LOS EMPLEADOS JUNTO CON EL NOMBRE DEL DEPARTAMENTO Y LA ISAPRE QUE TIENE CONTRATADA.*/
select e.emp_nombre, e.emp_apellido, d.dep_nombre, i.isa_nombre
from empleado e, departamento d, isapre i
where e.dep_cod = d.dep_cod
and e.isa_codigo = i.isa_codigo;

select e.emp_nombre, e.emp_apellido, d.dep_nombre, i.isa_nombre
from empleado e inner join departamento d
on (e.dep_cod = d.dep_cod) inner join isapre i
on (e.isa_codigo = i.isa_codigo);

/*2. MOSTRAR LOS NOMBRES DE LAS ISAPRES JUNTO CON EL NOMBRE DE LA CLINICA QUE CON LA CUAL TIENE CONVENIO.*/
select i.isa_nombre, cl.clin_nombre
from isapre i, clinica cl, convenio co
where i.isa_codigo = co.isa_codigo
and cl.clin_codigo = co.clin_codigo;

select i.isa_nombre, cl.clin_nombre
from isapre i inner join convenio co
on (i.isa_codigo = co.isa_codigo)inner join clinica cl
on(cl.clin_codigo = co.clin_codigo);

/*3. MOSTRAR EL NOMBRE DE CADA CLINICA Y EL NOMBRE DEL EMPLEADO QUE PODRIA ATENDERSE CON CONVENIO.*/
select cl.clin_nombre, e.emp_nombre, e.emp_apellido
from empleado e, isapre i, clinica cl, convenio co
where  e.isa_codigo = i.isa_codigo
and i.isa_codigo = co.isa_codigo
and cl.clin_codigo = co.clin_codigo;

select cl.clin_nombre, e.emp_nombre, e.emp_apellido
from empleado e inner join isapre i
on (e.isa_codigo = i.isa_codigo) inner join convenio co
on (i.isa_codigo = co.isa_codigo)inner join clinica cl
on(cl.clin_codigo = co.clin_codigo);

/*4. MOSTRAR EL NOMBRE DE LOS EMPLEADOS QUE NO TENDRIAN CONVENIO CON NINGUNA CLINICA.*/
select e.emp_nombre, e.emp_apellido
from empleado e inner join convenio co
on (e.isa_codigo = co.isa_codigo)
where co.con_codigo is null;
