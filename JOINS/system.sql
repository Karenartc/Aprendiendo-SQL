create user c##curso identified by curso default tablespace users temporary tablespace temp account unlock; 
grant create session, create table, create view, create materialized view, create trigger, create sequence, create procedure, create indextype, unlimited tablespace to c##curso;

create user c##clase identified by clase default tablespace users temporary tablespace temp account unlock; 
grant create session, create table, create view, create materialized view, create trigger, create sequence, create procedure, create indextype, unlimited tablespace to c##clase;


create user c##ejercicio identified by ejercicio default tablespace users temporary tablespace temp account unlock; 
grant create session, create table, create view, create materialized view, create trigger, create sequence, create procedure, create indextype, unlimited tablespace to c##ejercicio;

create user c##prueba1 identified by prueba1 default tablespace users temporary tablespace temp account unlock; 
grant create session, create table, create view, create materialized view, create trigger, create sequence, create procedure, create indextype, unlimited tablespace to c##prueba1;
