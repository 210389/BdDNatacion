create table participantes (
id_participante int primary key,
nombre varchar2(15),
apellido varchar2(20),
dni varchar2(9) not null unique,
nacionalidad varchar2(15),
sexo char(1)
);
create table clasificaciones (
id_clasificacion  int primary key,
tiempo number (2,2),
posicion smallint not null,
id_participante


create table usuarios
(
id_participante int primary key,
nombre varchar2(15),
apellido1 varchar2(20),
apellido2 varchar2(20),
sexo char(1)
);

create table usuarios
(
  id_usuario int primary key,
  nombre varchar2(15),
  apellido varchar2(20),
  dni varchar2(9),
  nacionalidad varchar2(15),
  género char(1)
)