-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-09-13 16:11:56.527

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    ID int  NOT NULL COMMENT 'contiene el identificador unico de un cliente',
    tipo_documento char(3)  NOT NULL COMMENT 'contiene el tipo de documento :DNI,CNE',
    numero_documento char(3)  NOT NULL COMMENT 'Numero de documento de identidad',
    nombre varchar(60)  NOT NULL COMMENT 'Nombre del cliente',
    apellido varchar(90)  NOT NULL COMMENT 'Apellido del cliente',
    email varchar(80)  NULL COMMENT 'correo electronico del cliente',
    celular char(9)  NULL COMMENT 'correo electronico del cliente',
    fecha_nacimiento date  NOT NULL COMMENT 'fecha de nacimiento del cliente',
    activo bool  NOT NULL COMMENT 'estado activo o inactivo del cliente',
    CONSTRAINT Identificador PRIMARY KEY (ID)
) COMMENT 'un vendedor puede comprar una o mas prendas ';

-- Table: DETALLE
CREATE TABLE DETALLE (
    id int  NOT NULL COMMENT 'contiene el identificador de detalle de venta ',
    cantidades int  NOT NULL COMMENT 'cantidad de las prendas en el detalle de venta ',
    VENTA_id int  NOT NULL,
    CONSTRAINT DETALLE_pk PRIMARY KEY (id)
) COMMENT 'contiene los datos de registro de la venta detalle';

-- Table: PRENDA
CREATE TABLE PRENDA (
    id int  NOT NULL COMMENT 'contiene el identificador unico de una prenda ',
    descripcion varchar(90)  NOT NULL COMMENT 'contiene el la descripcion de la prenda',
    marca varchar(60)  NOT NULL COMMENT 'contiene el nombre de la marca de la prenda',
    cantidad int  NOT NULL COMMENT 'cantidad de prenda con las que cuenta la tienda',
    talla varchar(10)  NOT NULL COMMENT 'contiene la talla de cada prenda ',
    precio int  NOT NULL COMMENT 'contiene precio de cada prenda',
    estado bool  NOT NULL COMMENT 'estado activo o inactivo de la prenda ',
    venta_de_detalle_id int  NOT NULL,
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
) COMMENT 'contiene los datos de las prendas';

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    ID int  NOT NULL COMMENT 'contiene el identificador unico del vendedor ',
    tipo_documento char(3)  NOT NULL COMMENT 'contiene el tipo de documento de NDI -CNE',
    numero_documento char(3)  NOT NULL COMMENT 'NUmero del documento de Identidad',
    nombre varchar(60)  NOT NULL COMMENT 'NOmbre del vendedor ',
    apellido varchar(90)  NOT NULL COMMENT 'apellido del vendedor ',
    salario int  NOT NULL COMMENT 'contiene el salario del vendedor ',
    celular char(9)  NULL COMMENT 'numero de celular del vendedor ',
    email varchar(80)  NULL COMMENT 'correo electronico del vendedor ',
    activo bool  NOT NULL COMMENT 'estado activo  o inactivo del vendedor ',
    VENTA_id int  NOT NULL,
    CONSTRAINT Identificador PRIMARY KEY (ID)
) COMMENT 'contiene los datos del vendedor';

-- Table: VENTA
CREATE TABLE VENTA (
    id int  NOT NULL COMMENT 'contiene el identificador de cada venta ',
    fecha_hora timestamp  NOT NULL COMMENT 'fecha y hora en que se realizo la venta ',
    activo bool  NOT NULL COMMENT 'estado o inactivo de la venta ',
    CLIENTE_ID int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) COMMENT 'contiene los datos de resgistro de la venta ';

-- foreign keys
-- Reference: PRENDA_VENTA_DE_DETALLE (table: PRENDA)
ALTER TABLE PRENDA ADD CONSTRAINT PRENDA_VENTA_DE_DETALLE FOREIGN KEY PRENDA_VENTA_DE_DETALLE (venta_de_detalle_id)
    REFERENCES DETALLE (id);

-- Reference: VENDEDOR_VENTA (table: VENDEDOR)
ALTER TABLE VENDEDOR ADD CONSTRAINT VENDEDOR_VENTA FOREIGN KEY VENDEDOR_VENTA (VENTA_id)
    REFERENCES VENTA (id);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CLIENTE_ID)
    REFERENCES CLIENTE (ID);

-- Reference: VENTA_DE_DETALLE_VENTA (table: DETALLE)
ALTER TABLE DETALLE ADD CONSTRAINT VENTA_DE_DETALLE_VENTA FOREIGN KEY VENTA_DE_DETALLE_VENTA (VENTA_id)
    REFERENCES VENTA (id);

-- End of file.

