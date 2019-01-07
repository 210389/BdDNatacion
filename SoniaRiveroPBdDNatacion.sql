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

-- introducion de datos en tabla de mundiales
insert into MUNDIALES values ('03/02/2003 10:00:00','Luxemburgo');
insert into MUNDIALES values ('08/02/2005 10:00:00','Australia');
insert into MUNDIALES values ('12/02/2007 10:00:00','Japon');
insert into MUNDIALES values ('13/02/2009 10:00:00','Reino Unido');
commit;

create table pruebas (
  id_prueba int primary key,
  genero char(1),
  nombre varchar2(6),
  distancia number(3,3),
  estilo varchar2(20),
  fecha timestamp
  CONSTRAINT pruebas_fk1 REFERENCES mundiales (fecha)
);

insert into PRUEBAS values (1,'m','50m',50,'libre','08/2/2005 10:00:00');
insert into PRUEBAS values (2,'f','50m',50,'espalda','08/2/2005 10:00:00');
insert into PRUEBAS values (3,'m','100m',100,'pecho','12/2/2007 10:00:00');
insert into PRUEBAS values (4,'f','100m',100,'mariposa','12/2/2007 10:00:00');
insert into PRUEBAS values (5,'m','50m',500,'espalda','08/2/2005 10:00:00');
insert into PRUEBAS values (6,'f','200m',200,'combinados','13/02/2009 10:00:00');
insert into PRUEBAS values (7,'m','400m',400,'combinados','13/02/2009 10:00:00');
commit;


create table clasificaciones (
  id_clasificacion int default 0,
  posicion         int default 0,
  tiempo           number,
  id_participante  int
  CONSTRAINT clasificaciones_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba int
  CONSTRAINT clasificaciones_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT clasificaciones_pk primary key (id_clasificacion,posicion)
);

insert into CLASIFICACIONES values (1,1,12.074,4,3);
insert into CLASIFICACIONES values (1,2,12.083,6,2);
insert into CLASIFICACIONES values (1,3,12.085,6,4);
insert into CLASIFICACIONES values (1,4,12.092,6,6);
insert into CLASIFICACIONES values (1,5,12.101,8,2);
insert into CLASIFICACIONES values (1,6,12.112,8,4);
insert into CLASIFICACIONES values (1,7,12.224,7,4);
insert into CLASIFICACIONES values (1,8,13.332,3,7);
insert into CLASIFICACIONES values (1,9,13.450,8,6);
insert into CLASIFICACIONES values (1,10,13.592,1,5);
insert into CLASIFICACIONES values (2,1,20.423,1,3);
insert into CLASIFICACIONES values (2,2,20.523,3,5);
insert into CLASIFICACIONES values (2,3,20.990,3,7);
insert into CLASIFICACIONES values (2,4,21.423,1,1);
insert into CLASIFICACIONES values (2,5,21.793,1,7);
insert into CLASIFICACIONES values (2,6,22.995,2,1);
insert into CLASIFICACIONES values (2,7,23.443,2,3);
insert into CLASIFICACIONES values (2,8,23.928,5,7);
insert into CLASIFICACIONES values (2,9,24.766,5,1);
insert into CLASIFICACIONES values (2,10,32.001,9,6);
insert into CLASIFICACIONES values (3,1,24.289,9,2);
insert into CLASIFICACIONES values (3,2,33.937,10,6);
insert into CLASIFICACIONES values (3,3,34.001,10,4);
commit;

create table  participar (
  id_participante int
    CONSTRAINT participar_fk1 REFERENCES PARTICIPANTES (ID_PARTICIPANTE),
  id_prueba       int
    CONSTRAINT participar_fk2 REFERENCES pruebas (ID_prueba),
  CONSTRAINT participar_pk primary key (id_participante, id_prueba)
);

insert into PARTICIPAR values (4,3);
insert into PARTICIPAR values (6,2);
insert into PARTICIPAR values (6,4);
insert into PARTICIPAR values (6,6);
insert into PARTICIPAR values (8,2);
insert into PARTICIPAR values (8,4);
insert into PARTICIPAR values (7,4);
insert into PARTICIPAR values (8,6);
insert into PARTICIPAR values (3,5);
insert into PARTICIPAR values (3,7);
insert into PARTICIPAR values (1,1);
insert into PARTICIPAR values (1,3);
insert into PARTICIPAR values (1,5);
insert into PARTICIPAR values (1,7);
insert into PARTICIPAR values (2,1);
insert into PARTICIPAR values (2,3);
insert into PARTICIPAR values (5,7);
insert into PARTICIPAR values (5,1);
insert into PARTICIPAR values (9,6);
insert into PARTICIPAR values (9,2);
insert into PARTICIPAR values (10,6);
insert into PARTICIPAR values (10,4);
commit; /*cada vez que introducimos datos haremos un commit para grabar dichos datos en la tabla*/

-- creamos tabla de semifinales
create table  semifinales (
  id_semifinal int  default 0 primary key,
  posicion_sem int default 0 primary key,
  tiempo_sem number(2,2),
  id_prueba int default 0
  CONSTRAINT semifinales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);
-- insertamos datos en la tabla semifinales
insert into SEMIFINALES values (1,1,18.439,3);
insert into SEMIFINALES values (1,2,18.979,3);
insert into SEMIFINALES values (1,3,19.654,3);
insert into SEMIFINALES values (2,1,17.439,3);
insert into SEMIFINALES values (2,2,17.579,3);
insert into SEMIFINALES values (2,3,18.967,3);
insert into SEMIFINALES values (3,1,19.635,4);
insert into SEMIFINALES values (3,2,20.514,4);
insert into SEMIFINALES values (3,3,20.620,4);
insert into SEMIFINALES values (4,1,32.789,1);
commit;

-- creamos tabla de finales
create table  finales (
  id_final int  default 0 primary key,
  posicion_fin int default 0,
  tiempo_fin number(2,2),
  id_prueba int default 0
  CONSTRAINT finales_fk1 REFERENCES PRUEBAS (ID_PRUEBA)
);

--insertamos datos en tablas de finales
insert into FINALES values (1,1,40.654,1);
insert into FINALES values (1,2,41.020,1);
insert into FINALES values (1,3,46.798,1);
insert into FINALES values (2,1,38.798,3);
insert into FINALES values (2,2,40.232,3);
insert into FINALES values (2,3,41.030,3);
insert into FINALES values (3,1,43.544,7);
insert into FINALES values (3,2,45.366,7);
insert into FINALES values (3,3,46.123,7);


alter table FINALES modify TIEMPO_FIN NUMBER;

alter table FINALES drop constraint FINALES_FK1;

alter table FINALES
	add constraint FINALES_FK1
		foreign key (ID_PRUEBA) references PRUEBAS;

