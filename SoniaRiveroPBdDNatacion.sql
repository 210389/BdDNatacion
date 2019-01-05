create table participantes (
 id_participante int default 0 primary key,
 nombre varchar2(15),
 apellido1 varchar2(20),
 apellido2 varchar2(20),
 dni varchar2(9) not null unique,
 nacionalidad varchar2(15),
 sexo char(1)
);
create table mundiales (
  fecha timestamp primary key,
  lugar varchar2(20)
);

create table pruebas (
  id_prueba int primary key,
  genero char(1),
  nombre varchar2(3),
  distancia number(3,3),
  estilo varchar2(20),
  fecha timestamp
  CONSTRAINT pruebas_fk1 REFERENCES mundiales (fecha)
);

create table clasificaciones
(
  id_clasificacion int default 0,
  posicion         int default 0,
  tiempo           number(2,2),
  id_participante  int
  CONSTRAINT clasificaciones_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba int
  CONSTRAINT clasificaciones_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT clasificaciones_pk primary key (id_clasificacion,posicion)
);

create table  participar
(
  id_participante int
    CONSTRAINT participar_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba       int
    CONSTRAINT participar_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT participar_pk primary key (id_participante, id_prueba)
);

create table  semifinales
(
  id_semifinal int  default 0 primary key,
  posicion_sem int default 0,
  tiempo_sem number(2,2),
  id_prueba int default 0
  CONSTRAINT semifinales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);

create table  finales
(
  id_final int  default 0 primary key,
  posicion_fin int default 0,
  tiempo_fin number(2,2),
  id_prueba int default 0
  CONSTRAINT finales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);