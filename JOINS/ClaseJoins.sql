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
from empleado e inner join departamento d
on (e.dep_cod = d.dep_cod)inner join asignado a
on (e.emp_cod=a.emp_cod)inner join proyecto p
on (a.pro_cod = p.pro_cod);

/*Select de todos los campos de departamento y proyecto, además, del nombre y apellido del empleado
de las cuatro tablas con inner join*/
select emp_nombre, emp_apellido, d.*, p.*
from empleado e inner join departamento d
on (e.dep_cod = d.dep_cod)inner join asignado a
on (e.emp_cod=a.emp_cod)inner join proyecto p
on (a.pro_cod = p.pro_cod);

