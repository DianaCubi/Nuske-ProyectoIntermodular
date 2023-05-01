
--- TABLA 1
--- La primera tabla es la de usuario ya que de esta dependen muchas otras.
--- Se ha utilizado la restricci�n "unique" en el e-mail para indicar que es una clave alternativa.
--- La columna "Foto" se le ha puesto el tipo de dato "varchar2" para indicar que aqu� se quiere almacenar una foto.

create table NUSKE_USUARIO (
CODIGO number (4) primary key,
E_MAIL varchar2 (200) unique,
CONTRASENA varchar2 (100) not null,
NOMBRE varchar2 (50) not null,
APELLIDOS varchar2 (150) not null,
FECHA_NAC date not null,
TELEFONO number (12),
FOTO Varchar2(200),
ULTIMA_CONEXION date not null
);



--- TABLA 2
--- En esta tabla de "administrador" la hemos creado como la tabla reflexiva que es.
--- Como vemos, el "cod_usuario" de la tabla Nuske_Usuario es la clave principal y a su vez clave ajena.

create table NUSKE_ADMINISTRADOR (
COD_USUARIO number(4) primary key,
foreign key (cod_usuario) references nuske_usuario
);



--- TABLA 3
--- La siguiente tabla es igual a la anterior; solo que en ella tambi�n guardamos dos campos m�s.
--- Las restricciones son las mismas a la de la tabla anterior.

create table NUSKE_RESPONSABLE (
COD_USUARIO number(4) primary key,
DNI varchar2 (10),
foreign key (cod_usuario) references nuske_usuario
);



--- TABLA 4
--- La siguiente tabla es igual a las dos anteriores (parten de la tabla 1 "usuario")
--- En este caso, la tabla "nuske_socio" recoge datos adicionales del "usuario"

create table NUSKE_SOCIO (
COD_USUARIO number (4) primary key,
NOMBRE_ENTIDAD varchar2 (50),
TELEFONO_ENTIDAD number (9),
CORREO_EMPRESA varchar2 (50),
foreign key (cod_usuario) references nuske_usuario
);



--- TABLA 5
--- La siguiente tabla es igual a las anteriores y hace referencia a la tabla 1 "usuario".
--- En esta tabla se recogen los datos necesarios para que un usuario pueda ser "cliente".

create table NUSKE_CLIENTE(
COD_USUARIO number(4) primary key,
DNI varchar2 (10),
foreign key (cod_usuario) references nuske_usuario
);



--- TABLA 6
--- Las siguiente tabla recoge los datos de la mascota.
--- Tiene, como restricciones, las claves ajenas que vienen de nuske_cliente y nuske_socio 
--- En el campo "estado" hemos creado una restricci�n tipo "check" para que el usuario (cliente o socio)
--- pueda elegir el estado de su mascota.

create table NUSKE_MASCOTA(
N_IDENTIF number (4) primary key,
NOMBRE varchar2 (20) not null,
RAZA varchar2 (30) not null, 
DESCRIPCION varchar2 (250) not null, 
FOTO varchar2(50) not null,
CAMADA varchar2 (15),
COLOR varchar2 (15) not null,
ESTADO varchar2 (30) not null,
COD_RESPONSABLE number(4),
COD_SOCIO number(4),
DATOS_INTERNOS varchar2 (200),
RAZON_ESTADO varchar2 (200),
ULTIMA_UBICACION varchar2 (200),
foreign key (COD_RESPONSABLE) references nuske_responsable,
foreign key (COD_SOCIO) references nuske_socio,
constraint condicion_estado_mascota check (estado in('EN_CASA', 'VULNERABLE', 'PERDIDA'))
);


--- TABLA 10
--- En esta tabla tenemos  la restricciones de que hay dos claves primarias y una de ellas tambi�n es ajena.

create table NUSKE_LISTA (
NOMBRE varchar2 (50),
COD_CLIENTE number(4),
foreign key (cod_cliente) references nuske_cliente, 
constraint pk_lista primary key (nombre, cod_cliente)
);



--- TABLA 11
--- Esta tabla es la cesta de los clientes. Como vemos, tenemos la restriccion de que el cod_cliente es
--- una clave alternativa que a su vez viene como clave ajena de la tabla de nuske_cliente.

create table NUSKE_CESTA(
CODIGO number (5) primary key,
COD_CLIENTE number (4) unique not null,
foreign key (cod_cliente) references nuske_cliente
);



--- TABLA 12
--- Esta tabla recoge la direcci�n de los clientes para poder realizar la factura y el env�o.
--- Como vemos tenemos dos restricciones como son: dos claves primarias (num_direccion y cod_cliente) y
--- una clave ajena que viene de la tabla nuske_cliente.

create table NUSKE_DIRECCION (
NUM_DIRECCION number (4), 
COD_USUARIO number (4),
DIRECCION varchar2 (50) not null,
POBLACION varchar2 (25) not null,
PROVINCIA varchar2 (25) not null,
CP number (5) not null,
TIPO varchar2 (25) not null,
constraint PK_NUSKE_DIRECCION primary key (NUM_DIRECCION, COD_USUARIO),
foreign key (cod_usuario) references nuske_usuario,
constraint lista_provincias check (provincia in ('A_CORUNA', 'ALAVA', 'ALBACETE', 'ALICANTE',
'ALMERIA', 'ASTURIAS', 'AVILA', 'BADAJOZ', 'BALEARES',
'BARCELONA', 'BURGOS', 'CACERES', 'CADIZ', 'CANTABRIA',
'CASTELLON', 'CIUDAD_REAL', 'CORDOBA', 'CUENCA', 'GIRONA',
'GRANADA', 'GUADALAJARA', 'GIPUZKOA', 'HUELVA', 'HUESCA',
'JAEN', 'LA_RIOJA', 'LAS_PALMAS', 'LEON', 'LERIDA', 'LUGO',
'MADRID', 'MALAGA', 'MURCIA', 'NAVARRA', 'OURENSE', 'PALENCIA',
'PONTEVEDRA', 'SALAMANCA', 'SEGOVIA', 'SEVILLA', 'SORIA', 'TARRAGONA',
'SANTA_CRUZ_DE_TENERIFE', 'TERUEL', 'TOLEDO', 'VALENCIA', 'VALLADOLID',
'VIZCAYA', 'ZAMORA', 'ZARAGOZA', 'CEUTA', 'MELILLA'))
);



--- TABLA 13
--- Esta tabla es la de pedidos y, como vemos, debe venir de la cesta creada por el cliente,
--- por ello tenemos varias restricciones: valores "not null" de direcci�n y cliente, una clave
--- alternativa que viene de la cesta y dos resticciones FK porque hay datos que vienen de dos tablas
--- anteriormente creadas (nuske_cesta y nuske_direcci�n.

create table NUSKE_PEDIDO (
CODIGO  number (6) primary key,
ESTADO varchar2 (50) not null,
FECHA date not null,
NUM_DIRECCION number (4) not null,
COD_USUARIO number (4) not null,
COD_CESTA number (5) unique, 
DESCUENTO number (3),
foreign key (num_direccion, cod_usuario) references nuske_direccion,
foreign key (cod_cesta) references nuske_cesta,
constraint estado_pedido check (estado in ('PENDIENTE_DE_PAGO', 'PROCESANDO', 'EN_ESPERA', 'COMPLETADO', 'CANCELADO'))
);



--- TABLA 14
--- Aqu� tenemos una tabla con varias restricciones: una clave primaria, una clave UK
--- dos claves ajenas y algunos valores no nulos.

create table NUSKE_FACTURA (
NUM_FACTURA number (6) primary key,
FECHA_FACTURA date not null,
COD_PEDIDO number (6) unique,
NUM_DIRECCION number (4) not null,
COD_USUARIO number (4) not null,
foreign key (num_direccion, cod_usuario) references nuske_direccion, 
foreign key (cod_pedido) references nuske_pedido
);



--- TABLA 15
--- Esta la tabla de los art�culo. Como vemos, en ella se dan de alta los articulos de la tienda.
--- Por ello, tenemos la restriccion de cod_admin ya que son los administradores los que pueden crear los art�culos.
--- Esto genera una clave ajena y un valor no nulo del c�digo_administrador. 
--- Vemos tambien que el campo "tipo" tiene una lista interna ya que hacer referenciia al tipo de art�culo o 
--- categor�a a la que pertenece.
        
create table NUSKE_ARTICULO (
CODIGO varchar2 (10) primary key, 
FOTO varchar2(50), 
NOMBRE varchar2 (20),
DESCRIPCION varchar2 (150),
STOCK_ACTUAL number (4),
STOCK_MINIMO number (3),
UNIDADES number (3),
IVA number (2),
PVP number (5,2),
FECHA_CREACION date, 
COD_ADMIN number(4) not null,
TIPO varchar2(100),
CATEGORIA varchar2 (100),
SUBCATEGORIA varchar2 (100),
foreign key (cod_admin) references nuske_administrador,
constraint tipo_articulo check (tipo in ('CAMAS', 'CORREAS', 'TRANSPORTINES', 'COMEDEROS', 'PELOTAS', 'MORDEDORES', 'PELUCHES', 'JUGUETES_INTERACTIVOS', 'CHAMPUS', 'BOLSAS_DE_CALLE', 'ANTIPARASITOS', 'EMPAPADORES', 'PIENSOS', 'SNACKS', 'COMIDAS_HUMEDAS', 'OTROS')),
constraint categoria_articulo check (categoria in ('PERROS', 'GATOS', 'ANIMALES_EXOTICOS')),
constraint subcategoria_articulo check(subcategoria in ('HOGAR', 'ENTRETENIMIENTO', 'SALUD_E_HIGIENE', 'ALIMENTACION'))
);


--- TABLA 21
--- Esta tabla se crea para que el cliente puede guardar los art�culos en ella. Por eso tiene como 
--- restricciones dos FK referidas a las tablas nuske_articulo y nuske_cesta. Adem�s, tiene dos claves primarias.

create table NUSKE_ARTICULO_EN_CESTA (
CODIGO_ART varchar2 (10), 
CODIGO_CESTA number (5),
NUMERO_UNIDADES number (5) not null,
PVP_ART number (6,2) not null,
foreign key (codigo_art) references nuske_articulo,
foreign key (codigo_cesta) references nuske_cesta,
constraint PK_nuske_articulo_en_cesta primary key (codigo_art, codigo_cesta)
);



--- TABLA 22
--- Esta tabla se crea para que el cliente puede guardar los art�culos en ella. Por eso tiene como 
--- restricciones dos FK referidas a las tablas nuske_articulo y nuske_lista. Adem�s, tiene dos claves primarias.
--- Aqu� hay una duda: �El e-mail del cliente debe venir de la tabla de usuario? Est� creado en esta tabla como 
--- independiente y deber�a venir de la tabla de usuario o cliente sino no tiene sentido. Del mismo modo, 
--- el "pvp" debe venir de la tabla de "nuske_art�culo" sino el cliente podr�a modificar este campo a su gusto. 

create table NUSKE_ARTICULO_EN_LISTA (
NOMBRE_LISTA varchar2 (50),
COD_CLIENTE number(4),
CODIGO_ART varchar2 (10), 
foreign key (codigo_art) references nuske_articulo,
foreign key (nombre_lista, cod_cliente) references nuske_lista,
constraint PK_nuske_articulo_en_lista primary key (nombre_lista, cod_cliente, codigo_art)
);



--- TABLA 23
--- Esta tabla realmente es una relaci�n entre la tabla socios y art�culos donde recoge las recomendaciones de ellos.
--- Ocurre igual que las anteriores ya que el campo "e-mail" deber�a importarse de la misma tabla "nuske_socios".

create table NUSKE_RECOMENDACION_SOCIOS(
COD_SOCIO number (4),
CODIGO_ART varchar2 (10), 
E_MAIL_SOCIO varchar2 (50),
DESCRIPCION varchar2 (250),
foreign key (cod_socio) references nuske_socio,
foreign key (codigo_art) references nuske_articulo,
constraint PK_nuske_recomendacion_socios primary key (cod_socio, codigo_art)
);



--- TABLA 24
--- Esta tabla recoge las comisiones de los socios por lo que al igual que la tabla creada con ateriorida
--- tendr� una referencia a la tabla socios y una referencia a la tabla art�culos. 

create table NUSKE_VENTAS_SOCIOS (
COD_SOCIO number (4),
CODIGO_ART varchar2 (10),
COMISION number (4,2),
foreign key (cod_socio) references nuske_socio,
foreign key (codigo_art) references nuske_articulo,
constraint PK_nuske_ventas_socios primary key (cod_socio, codigo_art)
);



--- TABLA 25
--- Esta es la tabla de los comentarios referido a los art�culos. Por ello, la �nica restriccion ser�a la PK del 
--- n�mero de comentario as� como el "cod_art" referente a la tabla nuske_articulo para saber a qu� art�culo se
--- refieren. Tambien hemos creado un "check" en el campo "calidad_precio" para que los usuarios puedan calificarlo,
--- adem�s de poner sus comentarios y valoraciones.

create table NUSKE_COMENTARIO (
NUM_COMENTARIO number (3),
CODIGO_ART varchar2 (10),
PSEUDONIMO varchar2 (25) not null,
VALORACION number (2) not null,
CALIDAD_PRECIO varchar2 (20) not null,
FECHA date not null,
DESCRIPCION varchar2 (250) not null,
VENTAJAS varchar2 (150) not null,
INCONVENIENTES varchar2 (150) not null,
foreign key (codigo_art) references nuske_articulo,
constraint PK_nuske_comentario primary key (num_comentario, codigo_art),
constraint format_calidad_precio check (calidad_precio in('EXCELENTE', 'MUY_BUENA', 'BUENA', 'ACEPTABLE', 'NORMAL', 'MALA', 'MUY_MALA'))
);



--- TABLA 26
--- Esta es la tabla de proveedores. Aqu� solo tendremos una restricci�n de tipo "PK" en el campo c�digo.

create table NUSKE_PROVEEDOR (
CODIGO number (3) primary key,
NOMBRE varchar2 (100),
DIRECCION varchar2 (150),
PERSONA_CONTACTO varchar2 (100),
TELEFONO number (9),
E_MAIL_PROVEEDOR varchar2 (50),
CONDICION_COMPRA varchar2 (250),
OTROS_DATOS_INTERES varchar2 (250)
);



--- TABLA 27
--- Aqu�, en esta tabla, recogeremos los art�culos que nos suministran los diferentes proveedores que tenemos.

create table NUSKE_PROVEEDOR_SUM_ART (
COD_PROVEEDOR number (3),
COD_ARTICULO varchar2 (10),
foreign key (cod_proveedor) references nuske_proveedor,
foreign key (cod_articulo) references nuske_articulo,
constraint PK_nuske_proveedor_art primary key (cod_proveedor, cod_articulo)
);



----------------- borrado de tablas -------------------

/*
DROP TABLE NUSKE_PROVEEDOR_SUM_ART CASCADE CONSTRAINTS;
DROP TABLE NUSKE_PROVEEDOR CASCADE CONSTRAINTS;
DROP TABLE NUSKE_COMENTARIO CASCADE CONSTRAINTS;
DROP TABLE NUSKE_VENTAS_SOCIOS CASCADE CONSTRAINTS;
DROP TABLE NUSKE_RECOMENDACION_SOCIOS CASCADE CONSTRAINTS;
DROP TABLE NUSKE_ARTICULO_EN_LISTA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_ARTICULO_EN_CESTA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_ARTICULO CASCADE CONSTRAINTS;
DROP TABLE NUSKE_FACTURA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_PEDIDO CASCADE CONSTRAINTS;
DROP TABLE NUSKE_DIRECCION CASCADE CONSTRAINTS;
DROP TABLE NUSKE_CESTA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_LISTA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_MASCOTA CASCADE CONSTRAINTS;
DROP TABLE NUSKE_CLIENTE CASCADE CONSTRAINTS;
DROP TABLE NUSKE_SOCIO CASCADE CONSTRAINTS;
DROP TABLE NUSKE_RESPONSABLE CASCADE CONSTRAINTS;
DROP TABLE NUSKE_ADMINISTRADOR CASCADE CONSTRAINTS;
DROP TABLE NUSKE_USUARIO CASCADE CONSTRAINTS;
*/