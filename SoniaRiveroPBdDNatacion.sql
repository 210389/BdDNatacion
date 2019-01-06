-- Creación de la tabla participantes
create table participantes (
 id_participante int default 0 primary key,
 nombre varchar2(15),
 apellido1 varchar2(20),
 apellido2 varchar2(20),
 dni varchar2(9) default 0 unique,
 nacionalidad varchar2(15),
 sexo char(1)
);
alter table PARTICIPANTES drop {unique(dni)| constraint unique};
-- introducción de datos
insert into PARTICIPANTES values (1,'Juan','Martin','Aparicio','45232474F','España','m');
insert into PARTICIPANTES values (2,'Paco','Fernandez','Chevera','23274323K','Francia','m');
insert into PARTICIPANTES values (3,'Pepe','Rodriguez','Nipola','46543445E','Italia','m');
insert into PARTICIPANTES values (4,'Sergio','Martin','Manchon','35950847G','Japon','m');
insert into PARTICIPANTES values (5,'Alvaro','Moreno','Manchon','34555945S','Japon','m');
insert into PARTICIPANTES values (6,'Sonia','Trenim','Rivero','49385774R','Rusia','f');
insert into PARTICIPANTES values (7,'Natasha','Guendi','Prenda','4942576L','Rusia','f');
insert into PARTICIPANTES values (8,'Jenifer','Carisa','Nascaret','4938874K','Alemania','f');
insert into PARTICIPANTES values (9,'Carolina','Bello','Tram','493867L','Grecia','f');
insert into PARTICIPANTES values (10,'Pamela','Nervest','kerisi','293857O','japon','f');
commit;

create table mundiales (
  fecha timestamp primary key,
  lugar varchar2(20)
);

--intruducion de datos en tabla de mundiales
insert into mundiales values 

create table pruebas (
  id_prueba int primary key,
  genero char(1),
  nombre varchar2(3),
  distancia number(3,3),
  estilo varchar2(20),
  fecha timestamp
  CONSTRAINT pruebas_fk1 REFERENCES mundiales (fecha)
);

create table clasificaciones (
  id_clasificacion int default 0,
  posicion         int default 0,
  tiempo           number(2,2),
  id_participante  int
  CONSTRAINT clasificaciones_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba int
  CONSTRAINT clasificaciones_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT clasificaciones_pk primary key (id_clasificacion,posicion)
);

create table  participar (
  id_participante int
    CONSTRAINT participar_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba       int
    CONSTRAINT participar_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT participar_pk primary key (id_participante, id_prueba)
);

create table  semifinales (
  id_semifinal int  default 0 primary key,
  posicion_sem int default 0,
  tiempo_sem number(2,2),
  id_prueba int default 0
  CONSTRAINT semifinales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);

create table  finales (
  id_final int  default 0 primary key,
  posicion_fin int default 0,
  tiempo_fin number(2,2),
  id_prueba int default 0
  CONSTRAINT finales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);