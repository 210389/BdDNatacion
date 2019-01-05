

create table usuarios (
cod_participante int not null primary key identity,
nombre varchar(10),
apellidos varchar(20),
dni varchar(9) not null unique,
nacionalidad varchar(15),
género char(1)
);

create table participar (
cod_participante number,
cod_prueba
primary key (cod_partcipante, cod_prueba)
foreign key 1 (cod_participante)
foreign key 2 (cod_prueba)
-);

create table pruebas (
cod_prueba
distancia
estilo
nombre
fecha
primary key (cod_prueba)
foreign key (fecha)
)

create table mundiales (
fecha
lugar
primary key (fecha)
)

create table clasificaciones (
cod_clasificacion
tiempo
posicion
cod_prueba
primary key (cod_clasificacion)
foreign key 1 (posicion)
foreign key 2 (cod_participante int not null )
foreign key 3 (cod_prueba int not null)
-);

create table semifinales (
cod_semifinal
cod_clasificacion
primary key (cod_semifinal)
foreign key (cod_clasificacion int not null)
-);

create table finales (
cod_final
cod_ semifinal
primary key (cod_final)
foreign key (cod_semifinal int not null)
-);
