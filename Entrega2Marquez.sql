create schema LisandroMarquez2;
use Lisandromarquez2;

create table empresa (
id_empresa int not null auto_increment,
nombre varchar(40),
CUIT varchar(15),
Direccion varchar(60),
cod_postal int,
iva varchar(30),
PRIMARY KEY(Id_empresa)
);

create table empleados (
id_empleado int not null auto_increment,
dni int not null unique,
nombre varchar(30),
apellido varchar(30),
telefono varchar(16),
correo varchar(50),
categoria varchar(30),
id_empresa int,
PRIMARY KEY(id_empleado),
FOREIGN KEY (id_empresa) references empresa (id_empresa)
);

create table operador (
id_operador int not null auto_increment,
open datetime,
close datetime,
cierrecaja float not null,
id_empleado int,
PRIMARY KEY(Id_operador),
FOREIGN KEY (id_empleado) references empleados (id_empleado)
);

create table logistica (
id_log int not null auto_increment,
open datetime,
close datetime,
id_empleado int,
PRIMARY KEY(Id_log),
FOREIGN KEY (id_empleado) references empleados (id_empleado)
);

create table pagos (
id_pagos int not null auto_increment,
saldo decimal(10.2) not null,
aprovado bool,
fecha date,
PRIMARY KEY(Id_pagos)
);
 
create table proveedor (
id_proveedor int not null auto_increment,
nombre varchar(60),
direccion varchar(100),
telefono varchar(15),
id_pagos int,
PRIMARY KEY(Id_proveedor),
FOREIGN KEY (id_pagos) references pagos(id_pagos)

);

create table administracion (
id_admin int not null auto_increment,
open datetime,
close datetime,
id_empleado int,
PRIMARY KEY(id_admin),
FOREIGN KEY (id_empleado) references empleados (id_empleado)
);

create table ordenes (
id_ord int not null auto_increment,
ord_compra int not null,
producto varchar(100),
cantidad int,
id_proveedor int,
id_admin int,
PRIMARY KEY(id_ord),
FOREIGN KEY (id_proveedor) references proveedor(id_proveedor),
FOREIGN KEY (id_admin) references administracion(id_admin)
);

create table stock (
cod_producto int unique,
id_proveedor int,
cantidad int not null,
tipo_producto varchar(100),
PRIMARY KEY (cod_producto),
FOREIGN KEY (id_proveedor) references proveedor(id_proveedor)
);

create table descripcion_Facturas (
n_factura varchar(50) not null,
id int auto_increment not null,
cantidad int,
valor_u decimal(10.2) not null,
producto varchar(60),
monto decimal(10.2) not null,
PRIMARY KEY(id)
);

create table facturas (
id_facturas int not null auto_increment,
n_cliente int not null,
n_factura varchar(50),
id_empresa int,
id_proveedor int,
id int,
total decimal(10.2),
PRIMARY KEY(Id_facturas),
FOREIGN KEY (id) references descripcion_Facturas(id),
FOREIGN KEY (id_empresa) references empresa(id_empresa),
FOREIGN KEY (id_proveedor) references proveedor(id_proveedor)
);

create table gaseosas (
id_gaseosa int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_gaseosa),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table aguas (
id_agua int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_agua),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table energizantes (
id_energ int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_energ),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table jugos (
id_jugo int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_jugo),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table cervezas (
id_cerv int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_cerv),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table alcohol (
id_alcohol int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_alcohol),
FOREIGN KEY (cod_producto) references stock(cod_producto)

);

create table snacks (
id_snack int not null auto_increment,
nombre varchar(100),
linea varchar(50),
cantidad int not null,
compra decimal(10.2) not null,
venta decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id_snack),
FOREIGN KEY (cod_producto) references stock(cod_producto)
);

create table VentaProductos (
id int not null auto_increment,
nombre varchar(100),
cantidad int not null,
monto decimal(10.2) not null,
cod_producto int,
PRIMARY KEY (id)
);

create table Descripcion_ventas (
D_ventas int not null auto_increment,
hora time,
fecha date,
formaPago char(30),
total decimal(10.2) not null,
id int,
PRIMARY KEY (d_ventas),
FOREIGN KEY (id) references ventaproductos(id)
);

create table ventas (
id_venta int not null auto_increment,
fecha_hora datetime,
id_operador int,
tipo varchar(50),
D_ventas int,
PRIMARY KEY (id_venta),
FOREIGN KEY (id_operador) references operador(id_operador),
FOREIGN KEY (D_ventas) references Descripcion_ventas(D_ventas)
);

 create table BitacoraVentaProductos (
 id int auto_increment primary key,
 id_tabla int,
 usuario varchar(30),
 accion varchar(30),
 fecha datetime,
 cantidad int,
 monto decimal(10.2)
 );
 
/* Calcula el margen de ganancia de un producto */

DELIMITER //
create function MARGEN (c decimal(10.2), v decimal(10.2)) returns varchar(25) 
deterministic
begin
declare a int;
declare f decimal(10.2);
set a=100;
set f=a*((v-c)/v); 
return F;
end ;
//

/* El procedure "stock" basicamente selecciona la tabla stock y la ordena segun la cantidad de productos de forma descendente */
DELIMITER // 
create procedure stock ()
begin
select * from stock order by cantidad desc;
end;
//
/* El procedure "ins_empleado" es de insert en la tabla de empleados y abajo deje un ejemplo para aplicar */
DELIMITER // 
create procedure ins_empleado
(IN dni int,nombre varchar(30), apellido varchar(30), telefono varchar(20), correo varchar(50), categoria varchar(30), id_empresa int)
begin
insert into empleados (dni,nombre,apellido,telefono,correo,categoria, id_empresa) 
values (dni,nombre,apellido,telefono,correo,categoria,id_empresa);
end;
//
 /* call ins_empleado (40818352,'Ramon','Diaz',15589753,'proceduremail@gmail.com','logistica',2); */
 
Delimiter // 
create trigger BitacoraInsertVenta 
after insert on ventaproductos
for each row
begin
insert into 
bitacoraVentaProductos (id_tabla,usuario,accion,fecha,cantidad,monto) values
(new.id,system_user(),'Insert',current_timestamp(),new.cantidad,new.monto);
end;
//
 
Delimiter // 
create trigger Delete_venta
before delete  on ventaproductos
for each row
begin
insert into 
bitacoraVentaProductos (id_tabla,usuario,accion,fecha,cantidad,monto) values
(old.id,system_user(),'DELETE',current_timestamp(),old.cantidad,old.monto);
end;
//

/* Triggers LOG sobre las ventas de productos */

insert into empresa (nombre,cuit,direccion,cod_postal,iva) values
('MarquezMayorista','204827148','callefalsa 8624',5826,'responsable inscripto'),
('MarquezMayorista','204827148','falsacalle 78',9364,'responsable inscripto');

insert into empleados (dni,nombre,apellido,telefono,correo,categoria,id_empresa) values
("32566310","Phoebe","Houston","11-6583-2425","molestie.tellus@hotmail.edu","administracion",(select id_empresa from empresa where id_empresa=1)),
("46571052","Wylie","Woodard","11-3281-3845","mauris.sagittis@yahoo.ca","administracion",(select id_empresa from empresa where id_empresa=1)),
(38120405,'Ivan','Giles','11-2714-4192','mattis.ornare@yahoo.net','RRHH',(select id_empresa from empresa where id_empresa=1)),
(42753759,'Colette','Pope','11-6686-6156','maecenas@google.org','cajero',(select id_empresa from empresa where id_empresa=2)),
(45414231,'Guy','Sellers','015-9983-2236','mauris@google.org','cajero',(select id_empresa from empresa where id_empresa=2)),
(33273691,'April','Woods','NULL','convallis@google.edu','logistica',(select id_empresa from empresa where id_empresa=2));



insert into logistica (open,close,id_empleado) values
('2023-01-02 10:00','2023-01-02 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-03 10:00','2023-01-03 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-04 10:00','2023-01-04 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-05 10:00','2023-01-05 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-06 10:00','2023-01-06 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-09 10:00','2023-01-09 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-10 10:00','2023-01-10 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-11 10:00','2023-01-11 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-12 10:00','2023-01-12 18:00',(select id_empleado from empleados where id_empleado=6)),
('2023-01-13 10:00','2023-01-13 18:00',(select id_empleado from empleados where id_empleado=6));

insert into pagos (saldo,aprovado,fecha) values
('95111.19',true,'2022-08-15'),
('177949.73',true,'2022-09-19'),
('151340.68',true,'2022-10-06'),
('105112.89',true,'2022-11-01'),
('166695.53',true,'2022-12-05'),
('122066.66',false,'2023-01-02'),
('111477.78',false,'2023-01-30');

insert into proveedor (nombre,direccion,telefono,id_pagos) values
('Maxiconsumo','96 Red Cloud Circle',15859205,1),
('Potigian','3123 Trailsway Terrace',15563641,4),
('GoloMax','482 Claremont Circle',15094308,2),
('Crovara','6846 Westport Junction',15521837,7),
('changomax','2973 Aberg Park',15084523,6);

insert into administracion (open,close,id_empleado) values
('2023-01-02 10:00','2023-01-02 18:00',(select id_empleado from empleados where id_empleado=1)),
('2023-01-03 10:00','2023-01-03 18:00',(select id_empleado from empleados where id_empleado=2)),
('2023-01-04 10:00','2023-01-04 18:00',(select id_empleado from empleados where id_empleado=1)),
('2023-01-05 10:00','2023-01-05 18:00',(select id_empleado from empleados where id_empleado=2)),
('2023-01-06 10:00','2023-01-06 18:00',(select id_empleado from empleados where id_empleado=1)),
('2023-01-09 10:00','2023-01-09 18:00',(select id_empleado from empleados where id_empleado=2)),
('2023-01-10 10:00','2023-01-10 18:00',(select id_empleado from empleados where id_empleado=1)),
('2023-01-11 10:00','2023-01-11 18:00',(select id_empleado from empleados where id_empleado=1)),
('2023-01-12 10:00','2023-01-12 18:00',(select id_empleado from empleados where id_empleado=2)),
('2023-01-13 10:00','2023-01-13 18:00',(select id_empleado from empleados where id_empleado=2));

insert into ordenes (ord_compra,producto,cantidad,id_proveedor,id_admin) values
(73915,'Coca-Cola 3L sabor original',36,5,1),
(73915,'Coca-Cola 2L sabor original',48,5,1),
(73915,'Coca-Cola 675ml sabor original',60,5,1),
(73915,'Coca-Cola 2L reducido en azucares',48,5,1),
(73915,'Coca-Cola 675ml reducido en azucares',60,5,1),
(73915,'Coca-Cola 3L reducido en azucares',12,5,1),
(73915,'Coca-Cola lata sabor original',48,5,1),
(73915,'Coca-Cola lata mundial dorada',48,5,1),
(73915,'MANAOS 2L Cola',48,5,1),
(73915,'MANAOS 600ml cola',60,5,1),
(73915,'MANAOS 2L Lima',24,5,1),
(73915,'MANAOS 600ml lima',36,5,1),
(73915,'MANAOS 2L pomelo',24,5,1),
(73915,'Agua Kim 500ml',36,5,1),
(73915,'Agua VillaVicencio 2L',48,5,1),
(73915,'Agua VillaVicencio 1L',36,5,1),
(73915,'Agua VillaVicencio 500ml',72,5,1),
(73915,'7up 2L',36,5,1),
(73915,'Pepsi 2L',36,5,1),
(73915,'Pepsi 600ml',48,5,1);

insert into stock (id_proveedor,cantidad,tipo_producto,cod_producto) values
(5,20,'gaseosa',83849),
(5,18,'gaseosa',37459),
(5,6,'gaseosa',74691),
(5,60,'gaseosa',62857),
(5,24,'gaseosa',27585),
(5,0,'gaseosa',23504),
(5,0,'gaseosa',53999),
(5,0,'gaseosa',12971),
(5,30,'gaseosa',39550),
(5,30,'gaseosa',60925),
(5,6,'gaseosa',85172),
(5,15,'gaseosa',56731),
(5,24,'gaseosa',35791),
(5,12,'gaseosa',56871),
(5,3,'gaseosa',12386),
(5,6,'gaseosa',78952),
(5,30,'gaseosa',12786),
(5,20,'gaseosa',78126),
(5,22,'gaseosa',38731),
(5,25,'gaseosa',57931),
(5,14,'gaseosa',57932),
(5,14,'gaseosa',27586),

(4,16,'jugo',24956),
(4,49,'jugo',76263),
(4,21,'jugo',78012),
(4,31,'jugo',10015),
(4,48,'jugo',58370),

(2,16,'energizante',50403),
(2,32,'energizante',62709),
(2,12,'energizante',63801),
(2,59,'energizante',28770),
(2,31,'energizante',33885),
(2,45,'energizante',85718),

(1,32,'alcohol',47893),
(1,31,'alcohol',91421),
(1,55,'alcohol',57807),

(1,14,'snack',49481),
(1,14,'snack',75169),
(1,14,'snack',88852),
(1,14,'snack',55569),

(3,14,'agua',42064),
(3,30,'agua',86904),
(3,15,'agua',97295),
(3,34,'agua',60848),
(3,24,'agua',85404);


insert into energizantes (nombre,linea,cantidad,compra,venta,cod_producto) values
('Moster 575ml','Moster',(select cantidad from stock where cod_producto=50403),543.82,'1033.29',50403),
('Moster-MangoLoco 575ml','Moster',(select cantidad from stock where cod_producto=62709),547.52,'1127.92',62709),
('Moster-Rossi 575ml','Moster',(select cantidad from stock where cod_producto=63801),332.96,'1052.94',63801),
('Speed 475ml','Speed',(select cantidad from stock where cod_producto=28770),415.95,'1034.91',28770),
('Red-Bull 375ml','Red-Bull',(select cantidad from stock where cod_producto=33885),305.72,'1078.54',33885),
('Red-Bull Sin Azucar 375ml','Red-Bull',(select cantidad from stock where cod_producto=85718),305.72,'1078.54',85718);

insert into jugos (nombre,linea,cantidad,compra,venta,cod_producto) values
('ADES-Manzana','Coca-Cola',(select cantidad from stock where cod_producto=24956),543.82,'1500.29',24956),
('Aquarius-Pomelo','Coca-Cola',(select cantidad from stock where cod_producto=76263),547.52,'1300.92',76263),
('Aquarius-Manzana','Coca-Cola',(select cantidad from stock where cod_producto=78012),332.96,'1400.94',78012),
('Aquarius-Uva','Coca-Cola',(select cantidad from stock where cod_producto=10015),415.95,'1200.91',10015),
('Aquarius-Pera','Coca-Cola',(select cantidad from stock where cod_producto=58370),305.72,'1000.54',58370);

insert into snacks (nombre,linea,cantidad,compra,venta,cod_producto) values
('Papas Fritas-sabor clasico 500gr','krachitos',(select cantidad from stock where cod_producto=49481),286.93,520,49481),
('Papas Fritas-sabor Americano 500gr','krachitos',(select cantidad from stock where cod_producto=75169),286.93,520,75169),
('Papas Fritas-sabor Cheddar 500gr','krachitos',(select cantidad from stock where cod_producto=88852),286.93,520,88852),
('Palitos','krachitos',(select cantidad from stock where cod_producto=55569),624.12,800,55569);

insert into aguas (nombre,linea,cantidad,compra,venta,cod_producto) values
('Agua VillaVicencio 1L','Villa-Vicencio',(select cantidad from stock where cod_producto=42064),472.98,858.19,42064),
('Agua VillaVicencio 2L','Villa-Vicencio',(select cantidad from stock where cod_producto=86904),472.98,858.19,86904),
('Agua VillaVicencio 500ml','Villa-Vicencio',(select cantidad from stock where cod_producto=97295),306.85,677.34,97295),
('Agua Kim 500ml','Coca-Cola',(select cantidad from stock where cod_producto=85404),540.57,1.270,85404),
('Agua VillaVicencio 1.5L','Villa-Vicencio',(select cantidad from stock where cod_producto=60848),393.99,1.114,60848);

insert into gaseosas (nombre,linea,cantidad,compra,venta,cod_producto) values
('Coca-Cola 3L sabor original','Coca-Cola',(select cantidad from stock where cod_producto=83849),315.89,603.18,(select cod_producto from stock where cod_producto=83849)),
('Coca-Cola 2L sabor original','Coca-Cola',(select cantidad from stock where cod_producto=37459),376.82,718.40,(select cod_producto from stock where cod_producto=37459)),
('Coca-Cola 675ml sabor original','Coca-Cola',(select cantidad from stock where cod_producto=74691),264.79,768.33,(select cod_producto from stock where cod_producto=74691)),
('Coca-Cola 2L reducido en azucares','Coca-Cola',(select cantidad from stock where cod_producto=62857),206.07,783.25,(select cod_producto from stock where cod_producto=62857)),
('Coca-Cola 675ml reducido en azucares','Coca-Cola',(select cantidad from stock where cod_producto=27585),399.60,620.42,(select cod_producto from stock where cod_producto=27585)),
('Coca-Cola 3L reducido en azucares','Coca-Cola',(select cantidad from stock where cod_producto=27586),363.23,616.83,(select cod_producto from stock where cod_producto=27586)),
('Coca-Cola lata sabor original','Coca-Cola',(select cantidad from stock where cod_producto=23504),213.47,650.97,(select cod_producto from stock where cod_producto=23504)),
('Coca-Cola lata mundial dorada','Coca-Cola',(select cantidad from stock where cod_producto=53999),286.93,519.45,(select cod_producto from stock where cod_producto=53999)),
('MANAOS 2L Cola','Manaos',(select cantidad from stock where cod_producto=12971),224.07,574.11,(select cod_producto from stock where cod_producto=12971)),
('MANAOS 600ml cola','Manaos',(select cantidad from stock where cod_producto=39550),274.77,617.55,(select cod_producto from stock where cod_producto=39550)),
('MANAOS 2L Lima','Manaos',(select cantidad from stock where cod_producto=60925),363.79,600.22,(select cod_producto from stock where cod_producto=60925)),
('MANAOS 600ml lima','Manaos',(select cantidad from stock where cod_producto=85172),315.01,593.43,(select cod_producto from stock where cod_producto=85172)),
('MANAOS 2L pomelo','Manaos',(select cantidad from stock where cod_producto=56731),275.95,633.76,(select cod_producto from stock where cod_producto=56731)),
('Agua Kim 500ml','Coca-Cola',(select cantidad from stock where cod_producto=35791),367.20,696.27,(select cod_producto from stock where cod_producto=35791)),
('Agua VillaVicencio 2L','Coca-Cola',(select cantidad from stock where cod_producto=56871),375.22,798.48,(select cod_producto from stock where cod_producto=56871)),
('Agua VillaVicencio 1L','Coca-Cola',(select cantidad from stock where cod_producto=12386),394.28,720.60,(select cod_producto from stock where cod_producto=12386)),
('Agua VillaVicencio 500ml','Coca-Cola',(select cantidad from stock where cod_producto=78952),379.24,692.39,(select cod_producto from stock where cod_producto=78952)),
('7up 2L','seven-up',(select cantidad from stock where cod_producto=38731),228.05,611.41,(select cod_producto from stock where cod_producto=38731)),
('Pepsi 2L','pepsi',(select cantidad from stock where cod_producto=57932),279.04,792.40,(select cod_producto from stock where cod_producto=57932)),
('Pepsi 600ml','pepsi',(select cantidad from stock where cod_producto=57931),349.93,548.22,(select cod_producto from stock where cod_producto=57931));  
 

insert into ventaproductos (nombre,cantidad,monto,cod_producto,id) values
('Coca-Cola 3L sabor original',12,(select venta from gaseosas where cod_producto=83849),83849,1),
('Pepsi 2L',6,(select venta from gaseosas where cod_producto=57932),57932,2),
('ADES-Manzana',12,(select venta from jugos where cod_producto=24956),24956,3),
('Moster 575ml',36,(select venta from energizantes where cod_producto=50403),50403,4),
('Palitos',2,(select venta from snacks where cod_producto=55569),55569,5),
('Papas Fritas-sabor Americano 500gr',5,(select venta from snacks where cod_producto=75169),75169,6),
('Papas Fritas-sabor clasico 500gr',6,(select venta from snacks where cod_producto=49481),49481,7);

insert into descripcion_ventas (hora, fecha, formaPago,total,id) values
('09:20', '2023-01-02', 'efectivo',(select(cantidad*monto) from ventaproductos where id=1),1),
('10:14', '2023-01-02', 'efectivo',(select(cantidad*monto) from ventaproductos where id=2),2),
('12:03', '2023-01-02', 'efectivo',(select(cantidad*monto) from ventaproductos where id=3),3),
('13:00', '2023-01-03', 'efectivo',(select(cantidad*monto) from ventaproductos where id=4),4),
('15:20', '2023-01-03', 'efectivo',(select(cantidad*monto) from ventaproductos where id=5),5),
('16:20', '2023-01-03', 'efectivo',(select(cantidad*monto) from ventaproductos where id=6),6),
('17:20', '2023-01-03', 'efectivo',(select(cantidad*monto) from ventaproductos where id=7),7);

insert into operador (open,close,cierrecaja,id_empleado) values
('2023-01-02 08:00','2023-01-02 20:00',(select sum(total) from descripcion_ventas where fecha='2023-01-02'),4),
('2023-01-03 08:00','2023-01-03 20:00',(select sum(total) from descripcion_ventas where fecha='2023-01-03'),4);

insert into ventas (fecha_hora, id_operador, Tipo, d_ventas) values
('2023-01-02 09:20',1,'consumidorFinal',1),
('2023-01-02 10:14',1,'consumidorFinal',2),
(' 2023-01-02 12:03',1,'consumidorFinal',3),
(' 2023-01-03 13:00',2,'consumidorFinal',4),
(' 2023-01-03 15:20',2,'consumidorFinal',5),
(' 2023-01-03 16:20',2,'consumidorFinal',6),
(' 2023-01-03 17:20',2,'consumidorFinal',7);

insert into descripcion_facturas (n_factura,producto,cantidad,valor_u,monto) values
(2351838200,'Coca-Cola 3L sabor original',40,1532,(select (cantidad)*(valor_u))),
(2351838200,'Coca-Cola 675ml sabor original',45,1126,(select (cantidad)*(valor_u))),
(2351838200,'Coca-Cola 675ml reducido en azucares',11,1252,(select (cantidad)*(valor_u))),
(2351838200,'Coca-Cola lata mundial dorada',30,1251,(select (cantidad)*(valor_u))),
(2351838200,'Agua VillaVicencio 2L',14,1994,(select (cantidad)*(valor_u))),
(2351838200,'7up 2L',3,1204,(select (cantidad)*(valor_u))),
(2351838200,'Pepsi 2L',37,999,(select (cantidad)*(valor_u))),
(2351838200,'MANAOS 2L Cola',48,1095,(select (cantidad)*(valor_u))),
(2351838200,'Pepsi 600ml',33,913,(select (cantidad)*(valor_u))),
(2351838200,'Agua VillaVicencio 1L',22,1178,(select (cantidad)*(valor_u)));




insert into facturas (n_cliente,n_factura,id_empresa,id_proveedor,total) values
(731982,2351838200,1,3,(select sum(monto) from descripcion_facturas where n_factura=2351838200));

