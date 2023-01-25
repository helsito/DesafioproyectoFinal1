create schema MayoristaDrink;
use mayoristadrink;

create table empleados (
DNI int primary key NOT NULL ,
NOMBRE varchar (15) ,
APELLIDO varchar (15 ) ,
FEC_NAC date ,
TIPO varchar (15)
 );
 
create table operador (
DNI int,
id_operador int auto_increment primary key,
opentime datetime,
closetime datetime,
cierre_caja decimal,
foreign key(DNI) references Empleados(DNI)
);

create table ventas (
id_ventas int not null primary key,
id_operador int,
N_ticket varchar (30) not null,
importe decimal,
foreign key(id_operador) references operador(id_operador)
);

create table ticket (
N_ticket varchar(30) primary key,
hora_fecha datetime,
nom_producto varchar (30),
cantidad int,
valor decimal,
importe_total decimal,
factura char,
id_ventas int,
foreign key(id_ventas) references ventas(id_ventas)
);

create table proveedores (
proveedor varchar(20) primary key,
direccion varchar(20),
telefono int,
orden_compra varchar(40),
foreign key(orden_compra) references ordenes(orden_compra));

create table ordenes (
id_stock int,
nom_producto varchar(30),
cantidad int,
valor_unitario decimal,
N_factuta varchar(30),
saldo decimal,
orden_compra varchar(40) primary key,
foreign key(orden_compra) references pagos(orden_compra));

create table pagos (
orden_compra varchar(40) primary key,
n_factuta varchar (30),
saldo decimal,
aprovado char,
nom_proveedor varchar (30)
);

 create table stock (
 id_stock int auto_increment primary key,
 linea varchar(20),
 nom_producto varchar (30),
 cantidad int,
 valor decimal,
 id_ventas int,
 foreign key(id_ventas) references ventas(id_ventas)
 );







