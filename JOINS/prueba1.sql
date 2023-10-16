create table bus (
bus_codigo     number(8) primary key,
bus_nombre     varchar2(20),
bus_largo      number(3),
bus_capacidad  varchar2(12));

create table conductor (
con_rut number primary key,
con_nombre     varchar2(10),
pais_codigo     number(3),
bus_codigo      number(8));

create table pais (
pais_codigo number(3) primary key,
pais_nombre   varchar2(15));

create table tipo_mantencion (
tip_mant number primary key,
tip_desc varchar2(30),
tip_hh   number);

create table mantencion (
mant_codigo      number(6) primary key,
mant_fecha       date,
tip_mant         number,
bus_codigo       number(8));

alter table conductor
add(constraint fk_pais foreign key (pais_codigo)
    references pais(pais_codigo),
    constraint fk_bus foreign key (bus_codigo)
    references bus(bus_codigo));

alter table mantencion
add(constraint fk_bus1 foreign key(bus_codigo)
    references bus(bus_codigo),
    constraint fk_tipom foreign key(tip_mant)
    references tipo_mantencion(tip_mant));

insert into bus values(111,'BUS UNO',10,'44 PASAJEROS');
insert into bus values(222,'BUS DOS',10,'44 PASAJEROS');
insert into bus values(333,'BUS TRES',8,'32 PASAJEROS');
insert into bus values(444,'BUS CUATRO',8,'32 PASAJEROS');
insert into bus values(555,'BUS CINCO',8,'12 VIP');

insert into conductor values(11111,'JOSE',100,111);
insert into conductor values(12111,'JUAN',100,111);
insert into conductor values(13111,'MARIO',300,111);
insert into conductor values(14111,'LUIS',200,111);
insert into conductor values(15111,'SERGIO',300,111);
insert into conductor values(16111,'MAURICIO',400,222);
insert into conductor values(17111,'JOEL',100,222);
insert into conductor values(18111,'JORDAN',500,222);
insert into conductor values(19111,'HECTOR',300,222);
insert into conductor values(11211,'CARLOS',200,222);
insert into conductor values(11311,'EDUARDO',100,333);
insert into conductor values(11411,'ANIBAL',400,333);
insert into conductor values(11511,'JOSUE',300,333);
insert into conductor values(11611,'JOHN',100,333);
insert into conductor values(11711,'ANGEL',100,444);
insert into conductor values(11811,'FERNANDO',300,444);
insert into conductor values(11911,'PATRICIO',300,444);
insert into conductor values(11131,'VASCO',100,444);
insert into conductor values(11141,'FRANCISCO',100,444);
insert into conductor values(11151,'MATIAS',300,444);
insert into conductor values(11161,'BRANDON',200,444);
insert into conductor values(11171,'ISMAEL',300,444);
insert into conductor values(11181,'OTTO',100,444);
insert into conductor values(11191,'PEDRO',200,111);
insert into conductor values(11112,'BARUC',200,111);
insert into conductor values(11113,'JORDAN',200,222);
insert into conductor values(11114,'ISRAEL',100,222);
insert into conductor values(11115,'ROBERTO',100,333);
insert into conductor values(11116,'FELIPE',300,333);
insert into conductor values(11117,'RICARDO',300,444);
insert into conductor values(11118,'MIGUEL',400,444);
insert into conductor values(11119,'ALFONSO',400,444);
insert into conductor values(21111,'ALBERTO',500,111);
insert into conductor values(31111,'ROMAN',500,222);
insert into conductor values(51111,'SERGIO',100,555);

insert into pais values(100,'CHILE');
insert into pais values(200,'PERÚ');
insert into pais values(300,'COLOMBIA');
insert into pais values(400,'ARGENTINA');
insert into pais values(500,'BRASIL');

insert into tipo_mantencion values(1,'MANTENCION GENERAL',20);
insert into tipo_mantencion values(2,'MANTENCION ELECTRICA',10);
insert into tipo_mantencion values(3,'MANTENCION MOTOR',15);

insert into mantencion values(1,to_date('10/06/2012','dd/mm/yyyy'),1,111);
insert into mantencion values(2,to_date('10/08/2012','dd/mm/yyyy'),1,222);
insert into mantencion values(3,to_date('10/10/2012','dd/mm/yyyy'),2,333);
insert into mantencion values(4,to_date('10/12/2012','dd/mm/yyyy'),1,444);
insert into mantencion values(5,to_date('10/02/2013','dd/mm/yyyy'),2,111);
insert into mantencion values(6,to_date('10/04/2013','dd/mm/yyyy'),1,222);
insert into mantencion values(7,to_date('10/06/2013','dd/mm/yyyy'),1,333);
insert into mantencion values(8,to_date('10/08/2013','dd/mm/yyyy'),2,444);
insert into mantencion values(9,to_date('10/10/2013','dd/mm/yyyy'),1,111);
insert into mantencion values(10,to_date('10/12/2013','dd/mm/yyyy'),1,222);
insert into mantencion values(11,to_date('10/02/2014','dd/mm/yyyy'),2,333);
insert into mantencion values(12,to_date('10/04/2014','dd/mm/yyyy'),2,444);
insert into mantencion values(13,to_date('10/06/2014','dd/mm/yyyy'),1,111);
insert into mantencion values(14,to_date('10/08/2014','dd/mm/yyyy'),1,222);
insert into mantencion values(15,to_date('10/10/2014','dd/mm/yyyy'),2,333);
insert into mantencion values(16,to_date('10/12/2014','dd/mm/yyyy'),3,444);
insert into mantencion values(17,to_date('10/02/2015','dd/mm/yyyy'),1,111);
insert into mantencion values(18,to_date('10/06/2015','dd/mm/yyyy'),3,222);
insert into mantencion values(19,to_date('10/06/2015','dd/mm/yyyy'),2,333);
insert into mantencion values(20,to_date('10/08/2015','dd/mm/yyyy'),1,444);
insert into mantencion values(21,to_date('10/10/2015','dd/mm/yyyy'),3,111);
insert into mantencion values(22,to_date('10/12/2015','dd/mm/yyyy'),3,222);
insert into mantencion values(23,to_date('10/02/2016','dd/mm/yyyy'),1,333);
insert into mantencion values(24,to_date('10/04/2016','dd/mm/yyyy'),2,444);

--1) Crear la expresión de sql para mostrar los nombres de los conductores 
--   junto con la nacionalidad(pais_nombre). (25 Puntos)

select c.con_nombre, p.pais_nombre
from conductor c inner join pais p
on (c.pais_codigo = p.pais_codigo);

--2) Crear la expresión de sql para mostrar el país junto con el nombre
--   del bus donde el conductor de ese bus tenga esa nacionalidad. (25 Puntos)

select c.con_nombre, p.pais_nombre, b.bus_nombre
from pais p inner join conductor c
on (c.pais_codigo = p.pais_codigo) 
inner join bus b
on (c.bus_codigo = c.bus_codigo)
;

-- Realizado por el profe
select distinct c.con_nombre, p.pais_nombre, b.bus_nombre
from pais p inner join conductor c
on (c.pais_codigo = p.pais_codigo) 
inner join bus b
on (c.bus_codigo = c.bus_codigo)
order by 1;
--

--3) Crear la expresión de sql para mostrar los códigos de mantención junto con el nombre 
--   del bus al cual se le realizo esa mantención, se deben incluir todos los buses. (25 Puntos)

select m.mant_codigo, b.bus_nombre
from bus b left join mantencion m
on (b.bus_codigo = m.bus_codigo);

--4) Crear la expresión de sql para mostrar los nombres de los conductores de
--   los buses que no tengan mantención. (25 Puntos)

select c.con_nombre
from bus b inner join conductor c
on (c.bus_codigo = c.bus_codigo)
left join mantencion m
on (b.bus_codigo = m.bus_codigo)
where m.mant_codigo is null;

-- Realizado por el profe
select c.con_nombre
from bus b inner join conductor c
on (c.bus_codigo = c.bus_codigo)
left join mantencion m
on (b.bus_codigo = m.bus_codigo)
where m.bus_codigo is null;
--