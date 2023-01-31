create schema LisandroMarquez;
use Lisandromarquez;

create table empleados (
id_empleados int not null auto_increment,
dni int not null unique,
nombre varchar(30),
apellido varchar(30),
categoria varchar(30),
PRIMARY KEY(Id_empleados)
);

create table operador (
id_operador int not null auto_increment,
fecha date,
opentime timestamp,
closetime timestamp,
cierrecaja decimal,
PRIMARY KEY(Id_operador)
);
/* EJECUTAR LAS FK */

create table ventas (
id_ventas int not null auto_increment,
total decimal not null,
n_ticket varchar(20),
id_operador int,
id_stock int,
PRIMARY KEY(id_ventas),
FOREIGN KEY (id_operador) references operador(id_operador)
);

create table stock (
id_stock int not null auto_increment,
producto varchar(60),
cantidad int,
valor_venta decimal not null,
id_ventas int,
PRIMARY KEY(Id_stock),
FOREIGN KEY (id_ventas) references ventas(id_ventas)
);

create table descripcionTicket (
d_ticket int not null auto_increment,
medio_pago char(20),
tipofactura char(1),
producto varchar(60),
cantidad int not null,
monto decimal not null,
total decimal not null,
PRIMARY KEY(d_ticket)
);

create table empresa (
id_empresa int not null auto_increment,
nombre varchar(40),
CUIT varchar(15),
Direccion varchar(60),
cod_postal int,
iva varchar(30),
id_empleados int,
PRIMARY KEY(Id_empresa),
FOREIGN KEY (id_empleados) references empleados(id_empleados)
);

create table ticket (
n_ticket varchar(30) not null,
fecha_hora datetime,
id_empresa int,
d_ticket int,
total decimal not null,
PRIMARY KEY(n_ticket),
FOREIGN KEY (id_empresa) references empresa(id_empresa),
FOREIGN KEY (d_ticket) references descripcionTicket(d_ticket)
);

create table pagos (
id_pagos int not null auto_increment,
saldo decimal,
aprovado char(2),
fecha date,
PRIMARY KEY(Id_pagos)
);
 
create table proveedor (
id_proveedor int not null auto_increment,
nombre varchar(40),
direccion varchar(100),
telefono varchar(15),
id_pagos int,
PRIMARY KEY(Id_proveedor),
FOREIGN KEY (id_pagos) references pagos(id_pagos)
);
 
create table ordenes (
id_compra int not null auto_increment,
producto varchar(60),
cantidad int,
id_proveedor int,
id_empleados int,
PRIMARY KEY(Id_compra),
FOREIGN KEY (id_proveedor) references proveedor(id_proveedor),
FOREIGN KEY (id_empleados) references empleados(id_empleados)
);

create table descripcionFacturas (
n_facturas varchar(30) not null,
cantidad int,
valor_u decimal,
producto varchar(60),
monto decimal,
total decimal,
PRIMARY KEY(n_facturas)
);

create table faturas (
id_facturas int not null auto_increment,
n_clinete int not null,
n_facturas varchar(30),
id_empresa int,
id_pagos int,
id_proveedor int,
total decimal,
PRIMARY KEY(Id_facturas),
FOREIGN KEY (n_facturas) references descripcionFacturas(n_facturas),
FOREIGN KEY (id_empresa) references empresa(id_empresa),
FOREIGN KEY (id_pagos) references pagos(id_pagos),
FOREIGN KEY (id_proveedor) references proveedor(id_proveedor)
);