/* CREATE RESTAURANT */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Unidades') AND type in ('U'))
BEGIN
	CREATE TABLE Unidades
	(
		IdUnidad int NOT NULL,
		descripcion varchar(40) NULL,
		CONSTRAINT PK_Unidades PRIMARY KEY CLUSTERED (IdUnidad)
	) 
END
GO

INSERT INTO UNIDADES VALUES ( 1,'Caja X 6')
INSERT INTO UNIDADES VALUES ( 2,'Caja X 12')
INSERT INTO UNIDADES VALUES ( 3,'Caja X 24')
INSERT INTO UNIDADES VALUES ( 4,'Caja X 48')
INSERT INTO UNIDADES VALUES ( 5,'Bolsa 5 Krg')
INSERT INTO UNIDADES VALUES ( 6,'Bolsa 10 Krg')
INSERT INTO UNIDADES VALUES ( 7,'Bolsa 1 Krg')
INSERT INTO UNIDADES VALUES ( 8,'Paquete 1 Krg')
INSERT INTO UNIDADES VALUES ( 9,'Litro')
INSERT INTO UNIDADES VALUES ( 10,'Kilogramo')
INSERT INTO UNIDADES VALUES ( 11,'Gramo')
INSERT INTO UNIDADES VALUES ( 12,'Cent. Cub.')
INSERT INTO UNIDADES VALUES ( 13,'Botella')
INSERT INTO UNIDADES VALUES ( 14,'Lata')
INSERT INTO UNIDADES VALUES ( 15,'Cajon X 20 Kgs')
INSERT INTO UNIDADES VALUES ( 16,'Unidad')
INSERT INTO UNIDADES VALUES ( 17,'Docena')
INSERT INTO UNIDADES VALUES ( 18,'Lata X 5 Lts.')

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Rubros') AND type in ('U'))
BEGIN
	CREATE TABLE Rubros
	(
		IdRubro int NOT NULL,
		descripcion varchar(40) NULL,
		CONSTRAINT PK_Rubro PRIMARY KEY CLUSTERED (IdRubro)
	)
END
GO

Insert into Rubros values ( 1,'Entradas')
Insert into Rubros values ( 2,'Pescados')
Insert into Rubros values ( 3,'Carnes Blancas')
Insert into Rubros values ( 4,'Carnes Rojas')
Insert into Rubros values ( 5,'Pastas Caseras')
Insert into Rubros values ( 6,'Postres')
Insert into Rubros values ( 7,'Helados')
Insert into Rubros values ( 8,'Vinos Blancos')
Insert into Rubros values ( 9,'Vinos Tintos')
Insert into Rubros values ( 10,'Aperitivos y Licores')
Insert into Rubros values ( 11,'Cafeteria')

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Localidades') AND type in ('U'))
BEGIN
	CREATE TABLE Localidades
	(
		IdCodpos int NOT NULL,
		localida varchar(40) NULL,
		CONSTRAINT PK_Localida PRIMARY KEY CLUSTERED (IdCodpos)
	)
END
GO

Insert into Localidades values ( 1040,'Villa Adelina')
Insert into Localidades values ( 1141,'Parque Centenario')
Insert into Localidades values ( 1321,'Moreno')
Insert into Localidades values ( 1340,'Martinez')
Insert into Localidades values ( 1418,'Bernal')
Insert into Localidades values ( 1512,'Castelar')
Insert into Localidades values ( 1736,'Tigre')
Insert into Localidades values ( 6212,'La Plata')

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Sectores') AND type in ('U'))
BEGIN
	CREATE TABLE Sectores
	(
		IdSector int NOT NULL,
		descripcion varchar(40) NULL,
		CONSTRAINT PK_Sectores PRIMARY KEY CLUSTERED (IdSector)
	)
END
GO

Insert into Sectores values ( 1,'Salon Azul')
Insert into Sectores values ( 2,'Salon Central')
Insert into Sectores values ( 3,'Salon Madera')
Insert into Sectores values ( 4,'Sala de las Cortinas')
Insert into Sectores values ( 5,'Reservados')

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Mesas') AND type in ('U'))
BEGIN
	CREATE TABLE Mesas
	(
		IdMesa int NOT NULL,
		Descripcion varchar(40) NULL,
		IdSector int NULL,
		CONSTRAINT PK_Mesas PRIMARY KEY CLUSTERED (IdMesa),
		CONSTRAINT FK_Mesas_Sectores FOREIGN KEY(IdSector)
				   REFERENCES Sectores (IdSector)
	)
END
GO

Insert into Mesas values ( 1,'Mesa Redonda', 1)
Insert into Mesas values ( 2,'Mesa Redonda', 1)
Insert into Mesas values ( 3,'Rinconera', 1)
Insert into Mesas values ( 4,'Rinconera', 1)
Insert into Mesas values ( 5,'Reservado', 1)
Insert into Mesas values ( 6,'Mesa Redonda', 3)
Insert into Mesas values ( 7,'Mesa Redonda', 3)
Insert into Mesas values ( 8,'Rinconera', 3)
Insert into Mesas values ( 9,'Rinconera', 4)
Insert into Mesas values ( 10,'Reservado', 4)
Insert into Mesas values ( 11,'Mesa Redonda', 2)
Insert into Mesas values ( 12,'Mesa Redonda', 2)
Insert into Mesas values ( 13,'Rinconera', 3)
Insert into Mesas values ( 14,'Reservado Blanco', 5)
Insert into Mesas values ( 15,'Reservado Rosa', 5)
Insert into Mesas values ( 16,'Reservado Azul', 5)
Insert into Mesas values ( 17,'Reservado Verde', 5)
Insert into Mesas values ( 18,'Reservado Gris', 5)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Mozos') AND type in ('U'))
BEGIN
	CREATE TABLE Mozos
	(
		IdMozo int NOT NULL,
		nombre varchar(20) NULL,
		apellido varchar(20) NULL,
		calle varchar(40) NULL,
		numero int NULL,
		piso int NULL,
		departamento varchar(4) NULL,
		IdCodPos int NULL,
		CONSTRAINT PK_Mozos PRIMARY KEY CLUSTERED (IdMozo),
		CONSTRAINT FK_Mozos_Localidades FOREIGN KEY(IdCodPos)
				   REFERENCES Localidades (IdCodpos)
	)
END
GO

Insert into Mozos values ( 1,'Juan Carlos','Gonzalez','Quintana', null, 2311,' ', 1141)
Insert into Mozos values ( 2,'Ignacio ','Ramirez','Roca ', 3836,2,'C', 1340)
Insert into Mozos values ( 3,'Pablo ','Andrade','Cerrito ', 827,null,' ', 1321)
Insert into Mozos values ( 4,'Carolina ','Arce ','Castro ', 45,1,'F', 1040)
Insert into Mozos values ( 5,'Maria Belen','Zagala ','Rivadavia', 4563,null,' ', 1418)
Insert into Mozos values ( 6,'Romina ','Amarante','Mansilla', 2210,8,'A', 1512)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Ingredientes') AND type in ('U'))
BEGIN
	CREATE TABLE Ingredientes
	(
		IdIngrediente int NOT NULL,
		descripcion varchar(40) NULL,
		cUniCompra int NULL,
		cUniUso int NULL,
		precComp decimal(6, 2) NULL,
		precUso decimal(8, 6) NULL,
		stock decimal(8, 3) NULL,
		puntoRep decimal(8, 3) NULL,
		cantComp decimal(8, 3) NULL,
	    CONSTRAINT PK_Ingredientes PRIMARY KEY CLUSTERED (IdIngrediente),
		CONSTRAINT FK_Ingrediente_Unidad_De_Compra FOREIGN KEY(cUniCompra)
				   REFERENCES Unidades (IdUnidad),
	    CONSTRAINT FK_Ingrediente_Unidad_De_Uso FOREIGN KEY(cUniUso)
				   REFERENCES Unidades (IdUnidad)
	)
END
GO

Insert into Ingredientes values ( 116,'Gancia', 13, 12, 48, .048, 10, 6, 12)
Insert into Ingredientes values ( 201,'Colon Riesling', 1, 13, 36, 6, 20, 20, 6)
Insert into Ingredientes values ( 202,'Suter Etiqueta Marron', 1, 13, 48, 8, 22, 20, 6)
Insert into Ingredientes values ( 205,'Mont Fleuri', 1, 13, 48, 8, 24, 20, 6)
Insert into Ingredientes values ( 206,'Chateau Vieux', 1, 13, 36, 6, 30, 35, 6)
Insert into Ingredientes values ( 207,'San Felipe', 1, 13, 36, 6, 23, 30, 6)
Insert into Ingredientes values ( 208,'Bianchi Borgo¤a', 1, 13, 24, 4, 21, 44, 6)
Insert into Ingredientes values ( 209,'Clos du Moulin', 1, 13, 36, 6, 32, 23, 6)
Insert into Ingredientes values ( 210,'Comte du Valmont ', 1, 13, 48, 8, 41, 31, 6)
Insert into Ingredientes values ( 211,'Chateau Monchenot', 1, 13, 48, 8, 22, 33, 6)
Insert into Ingredientes values ( 212,'San Felipe', 1, 13, 24, 4, 42, 24, 6)
Insert into Ingredientes values ( 213,'Vintage', 1, 13, 24, 4, 21, 30, 6)
Insert into Ingredientes values ( 214,'Armaneuse', 1, 13, 36, 6, 12, 15, 6)
Insert into Ingredientes values ( 215,'Flitchman', 1, 13, 36, 6, 33, 24, 6)
Insert into Ingredientes values ( 217,'Tia Maria', 13, 12, 48, .048, 10, 6, 12)
Insert into Ingredientes values ( 218,'Contreau', 13, 12, 48, .048, 10, 6, 12)
Insert into Ingredientes values ( 219,'Jonny Walker Black', 13, 12, 120, .12, 5, 6, 6)
Insert into Ingredientes values ( 220,'Courvosier Napoleon', 13, 12, 240, .24, 1, 2, 1)
Insert into Ingredientes values ( 221,'Bianchi Chablis', 1, 13, 24, 4, 21, 44, 6)
Insert into Ingredientes values ( 222,'Hennesey V.S.O.P', 13, 12, 360, .36, 1, 2, 1)
Insert into Ingredientes values ( 230,'Trucha ', 3, 16, 80, 5, 50, 17, 48)
Insert into Ingredientes values ( 232,'Tomates ', 15, 11, 80, .004, 8000, 5000, 10000)
Insert into Ingredientes values ( 233,'Langostinos ', 5, 11, 200, .004, 2000, 1000, 3000)
Insert into Ingredientes values ( 234,'Champingones ', 10, 11, 20, .002, 2000, 1500, 3000)
Insert into Ingredientes values ( 235,'Kanikama ', 10, 11, 80, .08, 2000, 1000, 1500)
Insert into Ingredientes values ( 236,'Queso Rallado ', 10, 11, 30, .03, 500, 1500, 4000)
Insert into Ingredientes values ( 237,'Jamon de Ciervo ', 10, 11, 120, .12, 5000, 1000, 7000)
Insert into Ingredientes values ( 238,'Alcaparras ', 10, 11, 60, .06, 1000, 400, 1000)
Insert into Ingredientes values ( 239,'Limon ', 6, 11, 70, .007, 15000, 4000, 10000)
Insert into Ingredientes values ( 241,'Manteca ', 8, 11, 20, .02, 1500, 3000, 4000)
Insert into Ingredientes values ( 242,'Salmon ', 2, 16, 80, 6.64, 30, 19, 48)
Insert into Ingredientes values ( 243,'Crema ', 9, 12, 6, .006, 12000, 10000, 10000)
Insert into Ingredientes values ( 244,'Pollo ', 10, 11, 10, .01, 15000, 17000, 40000)
Insert into Ingredientes values ( 245,'Pavo ', 16, 11, 140, .014, 10000, 10000, 10000)
Insert into Ingredientes values ( 246,'Cebolla ', 6, 11, 30, .003, 25000, 15000, 20000)
Insert into Ingredientes values ( 247,'Cebolla de Verdeo ', 5, 11, 40, .008, 4300, 5000, 10000)
Insert into Ingredientes values ( 248,'Lomo ', 10, 11, 26, .026, 4300, 9000, 15000)
Insert into Ingredientes values ( 251,'Marsalla ', 13, 12, 8, .008, 1000, 2000, 5000)
Insert into Ingredientes values ( 252,'Carre de Cerdo ', 10, 11, 22, .022, 2300, 5000, 10000)
Insert into Ingredientes values ( 253,'Cerezas ', 8, 11, 24, .0024, 2000, 1000, 2000)
Insert into Ingredientes values ( 254,'Fetuccini ', 8, 11, 8, .008, 3000, 4000, 5000)
Insert into Ingredientes values ( 255,'Tagliatelli ', 8, 11, 10, .01, 4500, 4000, 5000)
Insert into Ingredientes values ( 256,'Ravioles ', 8, 11, 10, .01, 4000, 4000, 5000)
Insert into Ingredientes values ( 257,'Ficcile ', 8, 11, 8, .008, 2500, 4000, 5000)
Insert into Ingredientes values ( 258,'Sorrentinos ', 8, 11, 12, .012, 1500, 4000, 5000)
Insert into Ingredientes values ( 265,'Frutillas ', 5, 11, 8, .008, 2800, 3000, 4000)
Insert into Ingredientes values ( 267,'Biscochuelo ', 16, 11, 16, .016, 4000, 2000, 4000)
Insert into Ingredientes values ( 268,'Bananas ', 17, 16, 8, .66, 36, 12, 24)
Insert into Ingredientes values ( 269,'Dulce de Leche ', 10, 11, 14, .014, 2000, 1700, 3000)
Insert into Ingredientes values ( 270,'Helado Americana ', 18, 12, 60, .012, 3100, 2000, 3000)
Insert into Ingredientes values ( 271,'Helado Chocolate ', 18, 12, 60, .012, 2700, 2000, 3000)
Insert into Ingredientes values ( 272,'Helado Frutilla ', 18, 12, 60, .012, 1700, 2000, 3000)
Insert into Ingredientes values ( 273,'Almendrado ', 4, 16, 120, 2.4, 50, 30, 40)
Insert into Ingredientes values ( 274,'Salsa de Chocolate ', 14, 12, 12, .012, 1200, 1000, 1000)
Insert into Ingredientes values ( 275,'Enalada de Frutas ', 10, 11, 12, .012, 1000, 3000, 4000)
Insert into Ingredientes values ( 276,'Obleas ', 8, 16, 16, .16, 50, 30, 100)
Insert into Ingredientes values ( 277,'Huevos ', 17, 16, 10, .83, 48, 96, 144)
Insert into Ingredientes values ( 300,'Cafe en Granos ', 5, 11, 160, .032, 8000, 10000, 10000)
Insert into Ingredientes values ( 301,'Leche ', 9, 12, 2, .002, 6, 5, 5)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Platos') AND type in ('U'))
BEGIN
	CREATE TABLE Platos
	(
		IdPlato int NOT NULL,
		descripcion varchar(25) NULL,
		precio decimal(5, 2) NULL,
		IdRubro int NULL,
		CONSTRAINT PK_Platos PRIMARY KEY CLUSTERED (IdPlato),
		CONSTRAINT FK_Platos_Rubros FOREIGN KEY(IdRubro)
				   REFERENCES Rubros (IdRubro)
	)
END
GO

Insert into Platos values ( 100,'Tomates Rellenos', 6.5, 1)
Insert into Platos values ( 101,'Copa de Langostinos', 12, 1)
Insert into Platos values ( 102,'Carpaccio', 8, 1)
Insert into Platos values ( 103,'Kanikama', 6, 1)
Insert into Platos values ( 104,'Jamon de Ciervo', 10, 1)
Insert into Platos values ( 202,'Trucha a la Manteca Negra', 15, 2)
Insert into Platos values ( 203,'Salmon a la Crema', 11, 2)
Insert into Platos values ( 204,'Salmon a la Parrilla', 9, 2)
Insert into Platos values ( 302,'Pollo a la Parrilla', 6, 3)
Insert into Platos values ( 303,'Pavo Relleno', 11, 3)
Insert into Platos values ( 304,'Pollo al Estragon', 9, 3)
Insert into Platos values ( 305,'Pollo al Champignon', 9, 3)
Insert into Platos values ( 402,'Lomo a la Pimienta', 8, 4)
Insert into Platos values ( 403,'Lomo al Marsalla', 8, 4)
Insert into Platos values ( 404,'Lomo al Champignon', 9, 4)
Insert into Platos values ( 405,'Carre con Cerezas', 13, 4)
Insert into Platos values ( 406,'Lomo Strogonoff', 12, 4)
Insert into Platos values ( 502,'Fetuccini', 6, 5)
Insert into Platos values ( 503,'Tagliatteli', 7, 5)
Insert into Platos values ( 504,'Ravioles', 6, 5)
Insert into Platos values ( 505,'Fuccile', 7, 5)
Insert into Platos values ( 506,'Sorrentinos', 7, 5)
Insert into Platos values ( 600,'Frutillas con Crema', 4.5, 6)
Insert into Platos values ( 601,'Tiramisu', 6, 6)
Insert into Platos values ( 602,'Banana Split', 8, 6)
Insert into Platos values ( 603,'Macedonia de Frutas', 3.5, 6)
Insert into Platos values ( 604,'Peras al Borgo¤a', 9, 6)
Insert into Platos values ( 700,'Helado tres sabores', 6, 7)
Insert into Platos values ( 701,'Almendrado', 6, 7)
Insert into Platos values ( 702,'Charlotte', 7, 7)
Insert into Platos values ( 703,'Copa Melba', 9, 8)
Insert into Platos values ( 704,'Copa Falfala', 15, 9)
Insert into Platos values ( 800,'Bianchi Chablis ', 6, 8)
Insert into Platos values ( 801,'Colon Riesling', 9, 8)
Insert into Platos values ( 802,'Suter Etiqueta Marron', 12, 8)
Insert into Platos values ( 803,'Chateau Monchenot', 15, 8)
Insert into Platos values ( 805,'Mont Fleuri', 9, 8)
Insert into Platos values ( 806,'Chateau Vieux', 12, 8)
Insert into Platos values ( 807,'San Felipe', 7, 8)
Insert into Platos values ( 900,'Bianchi Borgo¤a', 6, 9)
Insert into Platos values ( 901,'Clos du Moulin', 10, 9)
Insert into Platos values ( 902,'Comte du Valmont ', 12, 9)
Insert into Platos values ( 903,'Chateau Monchenot', 15, 9)
Insert into Platos values ( 904,'San Felipe', 7, 9)
Insert into Platos values ( 905,'Vintage', 10, 9)
Insert into Platos values ( 906,'Armaneuse', 15, 9)
Insert into Platos values ( 907,'Flitchman', 14, 9)
Insert into Platos values ( 1000,'Gancia', 3, 10)
Insert into Platos values ( 1001,'Tia Maria', 4, 10)
Insert into Platos values ( 1002,'Contreau', 4, 10)
Insert into Platos values ( 1003,'Jonny Walker Black', 7, 10)
Insert into Platos values ( 1004,'Courvosier Napoleon', 8, 10)
Insert into Platos values ( 1005,'Hennesey V.S.O.P', 15, 10)
Insert into Platos values ( 1108,'Cafe', 1.5, 11)
Insert into Platos values ( 1121,'Te / Te digestivo', 1, 11)
Insert into Platos values ( 1133,'Capuccino', 2.5, 11)
Insert into Platos values ( 1180,'Cortado', 1.5, 11)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Facturas') AND type in ('U'))
BEGIN
	CREATE TABLE Facturas
	(
		NroFactura int NOT NULL,
		IdMesa int NOT NULL,
		IdMozo int NOT NULL,
		cantidadPersonas int null,
		total decimal(6, 2) NULL,
		fechaApertura datetime NULL,
		horaApertuta datetime NULL,
		fechaCierre datetime null,
		horaCierre datetime null,
		CONSTRAINT PK_Facturas PRIMARY KEY CLUSTERED (NroFactura),
		CONSTRAINT FK_Facturas_Mesas FOREIGN KEY(IdMesa)
				   REFERENCES Mesas (IdMesa),
		CONSTRAINT FK_Facturas_Mozos FOREIGN KEY(IdMozo)
				   REFERENCES Mozos (IdMozo)
	)
END
GO
set dateformat 'dmy'
go
Insert into Facturas values ( 1, 1, 3,2, 165,'15/01/2009','22:12:00','15/01/2009',null)
Insert into Facturas values ( 2, 3, 4,2,  34,'15/01/2009','22:30:00','15/01/2009',null)
Insert into Facturas values ( 3, 4, 3,2,  62,'15/01/2009','22:31:00','15/01/2009',null)
Insert into Facturas values ( 4, 3, 2,2,  98,'15/01/2009','21:12:00','15/01/2009',null)
Insert into Facturas values ( 5, 7, 1,2,  24,'25/01/2009','23:00:00','25/01/2009',null)
Insert into Facturas values ( 6, 6, 4,2,  86,'25/01/2009','22:15:00','25/01/2009',null)
Insert into Facturas values ( 7, 9, 5,2,  18,'25/01/2009','23:05:00','25/01/2009',null)
Insert into Facturas values ( 8, 2, 3,2, 154,'25/01/2009','21:44:00','25/01/2009',null)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('Proveedores') AND type in ('U'))
BEGIN
	CREATE TABLE Proveedores
	(
		IdProveedor int NOT NULL,
		razsoc varchar(40) NULL,
		calle varchar(40) NULL,
		numero int NULL,
		piso int NULL,
		departamento varchar(4) NULL,
		IdCodPos int NULL,
		CONSTRAINT PK_Proveed PRIMARY KEY CLUSTERED (IdProveedor),
		CONSTRAINT FK_Proveedores_Localidades FOREIGN KEY(IdCodPos)
				   REFERENCES Localidades (IdCodpos)
	)
END
GO

Insert into Proveedores values ( 10,'La Rural S.A. ','Rivadavia', 1310, 1,'G', 1141)
Insert into Proveedores values ( 20,'San Ignacio ','Ramirez ', 836, 0,'', 1340)
Insert into Proveedores values ( 30,'Frig. Peualla ','Andrade ', 1827, 5,'T', 1321)
Insert into Proveedores values ( 40,'Santander SRL ','Arce ', 245, 0,' ', 1040)
Insert into Proveedores values ( 50,'Las Marias ','Zagala ', 463, 10,'H', 1418)
Insert into Proveedores values ( 60,'Granja Amor ','Amarante ', 103, 0,' ', 1512)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('ItemsFactura') AND type in ('U'))
BEGIN
	CREATE TABLE ItemsFactura
	(
		NroFactura int NOT NULL,
		IdPlato int NOT NULL,
		cantida int NULL,
		precio decimal(6, 2) NULL,
		CONSTRAINT PK_ItemsFactura PRIMARY KEY CLUSTERED (NroFactura, IdPlato),
		CONSTRAINT FK_ItemsFactura_Facturas FOREIGN KEY(NroFactura)
				   REFERENCES Facturas (NroFactura),
		CONSTRAINT FK_ItemsFactura_Platos FOREIGN KEY(IdPlato)
				   REFERENCES Platos (IdPlato)
	)
END
GO

Insert into ItemsFactura values ( 1, 100, 1, 13)
Insert into ItemsFactura values ( 1, 102, 1, 24)
Insert into ItemsFactura values ( 1, 402, 1, 16)
Insert into ItemsFactura values ( 1, 406, 1, 24)
Insert into ItemsFactura values ( 1, 702, 2, 14)
Insert into ItemsFactura values ( 1, 803, 1, 30)
Insert into ItemsFactura values ( 1, 1005, 1, 30)
Insert into ItemsFactura values ( 2, 1003, 2, 14)
Insert into ItemsFactura values ( 2, 1108, 2, 3)
Insert into ItemsFactura values ( 3, 303, 1, 22)
Insert into ItemsFactura values ( 3, 502, 1, 12)
Insert into ItemsFactura values ( 3, 603, 2, 7)
Insert into ItemsFactura values ( 3, 807, 1, 14)
Insert into ItemsFactura values ( 4, 1000, 3, 6)
Insert into ItemsFactura values ( 4, 1001, 2, 8)
Insert into ItemsFactura values ( 4, 1003, 4, 16)
Insert into ItemsFactura values ( 5, 1108, 8, 3)
Insert into ItemsFactura values ( 6, 403, 2, 16)
Insert into ItemsFactura values ( 6, 601, 2, 12)
Insert into ItemsFactura values ( 6, 803, 1, 30)
Insert into ItemsFactura values ( 7, 801, 1, 18)
Insert into ItemsFactura values ( 8, 104, 2, 20)
Insert into ItemsFactura values ( 8, 404, 1, 18)
Insert into ItemsFactura values ( 8, 405, 1, 26)
Insert into ItemsFactura values ( 8, 704, 1, 30)
Insert into ItemsFactura values ( 8, 905, 2, 20)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('PlaIng') AND type in ('U'))
BEGIN
	CREATE TABLE PlaIng
	(
		IdPlato int NOT NULL,
		IdIngrediente int NOT NULL,
		cantida decimal(6, 3) NULL,
	    CONSTRAINT PK_PlaIng PRIMARY KEY CLUSTERED (IdPlato, IdIngrediente),
		CONSTRAINT FK_PlaIng_Ingredientes FOREIGN KEY(IdIngrediente)
				   REFERENCES Ingredientes (IdIngrediente),
		CONSTRAINT FK_PlaIng_Platos FOREIGN KEY(IdPlato)
				   REFERENCES Platos (IdPlato)
	)
END
GO

Insert into PlaIng values ( 100, 232, 200)
Insert into PlaIng values ( 100, 239, 20)
Insert into PlaIng values ( 100, 241, 50)
Insert into PlaIng values ( 100, 246, 100)
Insert into PlaIng values ( 101, 233, 200)
Insert into PlaIng values ( 101, 239, 60)
Insert into PlaIng values ( 102, 236, 60)
Insert into PlaIng values ( 102, 238, 20)
Insert into PlaIng values ( 102, 239, 60)
Insert into PlaIng values ( 102, 248, 200)
Insert into PlaIng values ( 103, 235, 200)
Insert into PlaIng values ( 103, 239, 60)
Insert into PlaIng values ( 104, 237, 200)
Insert into PlaIng values ( 202, 230, 1)
Insert into PlaIng values ( 202, 241, 200)
Insert into PlaIng values ( 203, 242, 1)
Insert into PlaIng values ( 203, 243, 200)
Insert into PlaIng values ( 204, 239, 60)
Insert into PlaIng values ( 204, 242, 1)
Insert into PlaIng values ( 302, 239, 60)
Insert into PlaIng values ( 302, 244, 500)
Insert into PlaIng values ( 303, 234, 50)
Insert into PlaIng values ( 303, 243, 100)
Insert into PlaIng values ( 303, 245, 400)
Insert into PlaIng values ( 303, 247, 100)
Insert into PlaIng values ( 303, 277, 1)
Insert into PlaIng values ( 304, 236, 50)
Insert into PlaIng values ( 304, 243, 100)
Insert into PlaIng values ( 304, 244, 400)
Insert into PlaIng values ( 305, 234, 100)
Insert into PlaIng values ( 305, 244, 400)
Insert into PlaIng values ( 402, 243, 100)
Insert into PlaIng values ( 402, 248, 250)
Insert into PlaIng values ( 403, 248, 250)
Insert into PlaIng values ( 403, 251, 150)
Insert into PlaIng values ( 404, 234, 100)
Insert into PlaIng values ( 404, 248, 259)
Insert into PlaIng values ( 405, 238, 50)
Insert into PlaIng values ( 405, 252, 300)
Insert into PlaIng values ( 405, 253, 100)
Insert into PlaIng values ( 406, 234, 100)
Insert into PlaIng values ( 406, 243, 150)
Insert into PlaIng values ( 406, 246, 100)
Insert into PlaIng values ( 406, 248, 250)
Insert into PlaIng values ( 502, 236, 50)
Insert into PlaIng values ( 502, 254, 200)
Insert into PlaIng values ( 503, 236, 50)
Insert into PlaIng values ( 503, 255, 300)
Insert into PlaIng values ( 504, 236, 50)
Insert into PlaIng values ( 504, 256, 300)
Insert into PlaIng values ( 505, 236, 50)
Insert into PlaIng values ( 505, 257, 300)
Insert into PlaIng values ( 506, 236, 50)
Insert into PlaIng values ( 506, 257, 300)
Insert into PlaIng values ( 600, 243, 100)
Insert into PlaIng values ( 600, 265, 200)
Insert into PlaIng values ( 601, 243, 100)
Insert into PlaIng values ( 601, 267, 150)
Insert into PlaIng values ( 601, 269, 80)
Insert into PlaIng values ( 601, 274, 50)
Insert into PlaIng values ( 602, 243, 100)
Insert into PlaIng values ( 602, 268, 2)
Insert into PlaIng values ( 602, 269, 100)
Insert into PlaIng values ( 603, 275, 300)
Insert into PlaIng values ( 700, 270, 100)
Insert into PlaIng values ( 700, 271, 100)
Insert into PlaIng values ( 700, 272, 100)
Insert into PlaIng values ( 701, 273, 1)
Insert into PlaIng values ( 702, 273, 1)
Insert into PlaIng values ( 702, 274, 100)
Insert into PlaIng values ( 703, 243, 80)
Insert into PlaIng values ( 703, 270, 100)
Insert into PlaIng values ( 703, 275, 100)
Insert into PlaIng values ( 703, 276, 4)
Insert into PlaIng values ( 704, 243, 100)
Insert into PlaIng values ( 704, 253, 50)
Insert into PlaIng values ( 704, 270, 50)
Insert into PlaIng values ( 704, 271, 50)
Insert into PlaIng values ( 704, 272, 50)
Insert into PlaIng values ( 704, 274, 50)
Insert into PlaIng values ( 704, 276, 4)
Insert into PlaIng values ( 800, 221, 1)
Insert into PlaIng values ( 801, 201, 1)
Insert into PlaIng values ( 802, 202, 1)
Insert into PlaIng values ( 803, 211, 1)
Insert into PlaIng values ( 805, 205, 1)
Insert into PlaIng values ( 806, 206, 1)
Insert into PlaIng values ( 807, 207, 1)
Insert into PlaIng values ( 900, 208, 1)
Insert into PlaIng values ( 901, 209, 1)
Insert into PlaIng values ( 902, 210, 1)
Insert into PlaIng values ( 903, 211, 1)
Insert into PlaIng values ( 904, 212, 1)
Insert into PlaIng values ( 905, 213, 1)
Insert into PlaIng values ( 906, 214, 1)
Insert into PlaIng values ( 907, 215, 1)
Insert into PlaIng values ( 1000, 116, 150)
Insert into PlaIng values ( 1001, 217, 60)
Insert into PlaIng values ( 1002, 218, 60)
Insert into PlaIng values ( 1003, 219, 40)
Insert into PlaIng values ( 1004, 220, 40)
Insert into PlaIng values ( 1005, 222, 40)
Insert into PlaIng values ( 1108, 300, 15)
Insert into PlaIng values ( 1121, 301, 5)
Insert into PlaIng values ( 1133, 300, 15)
Insert into PlaIng values ( 1133, 301, 20)
Insert into PlaIng values ( 1180, 300, 15)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('TelefonoMozo') AND type in ('U'))
BEGIN
	CREATE TABLE TelefonoMozo
	(
		IdTelefono int NOT NULL,
		IdMozo int NOT NULL,
		codArea int NULL,
		central int NULL,
		numero int NULL,
		celular int NULL,
		CONSTRAINT PK_TelefonoMozo PRIMARY KEY CLUSTERED (IdTelefono),
		CONSTRAINT FK_TelefonoMozo_Mozos FOREIGN KEY(IdMozo)
				   REFERENCES Mozos (IdMozo)
	)

END
GO

Insert into TelefonoMozo values ( 1, 6, 11, 4438, 4471,null)
Insert into TelefonoMozo values ( 2, 3, 11, 4237, 9879,15)
Insert into TelefonoMozo values ( 3, 4, 11, 5411, 3343,null)
Insert into TelefonoMozo values ( 4, 5, 11, 4432, 9876,15)
Insert into TelefonoMozo values ( 5, 3, 11, 4832, 1808,null)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('ProIng') AND type in ('U'))
BEGIN
	CREATE TABLE ProIng
	(
		IdIngrediente int NOT NULL,
		IdProveedor int NOT NULL,
		factor decimal(6, 3) NULL,
		fechComp datetime NOT NULL,
		CONSTRAINT PK_ProIng PRIMARY KEY CLUSTERED (IdIngrediente, IdProveedor, fechComp),
		CONSTRAINT FK_ProIng_Ingredientes FOREIGN KEY(IdIngrediente)
				   REFERENCES Ingredientes (IdIngrediente),
		CONSTRAINT FK_ProIng_Proveedores FOREIGN KEY(IdProveedor)
				   REFERENCES Proveedores (IdProveedor)
	)
END
GO

Insert into ProIng values ( 116, 10, .001,'01/01/1900')
Insert into ProIng values ( 116, 10, .001,'02/05/2009')
Insert into ProIng values ( 201, 10, 6,'01/01/1900')
Insert into ProIng values ( 202, 10, 6,'01/01/1900')
Insert into ProIng values ( 205, 10, 6,'01/01/1900')
Insert into ProIng values ( 206, 20, 6,'01/01/1900')
Insert into ProIng values ( 207, 20, 6,'01/01/1900')
Insert into ProIng values ( 208, 20, 6,'01/01/1900')
Insert into ProIng values ( 209, 10, 6,'01/01/1900')
Insert into ProIng values ( 210, 10, 6,'01/01/1900')
Insert into ProIng values ( 211, 20, 6,'01/01/1900')
Insert into ProIng values ( 212, 10, 6,'01/01/1900')
Insert into ProIng values ( 213, 20, 6,'01/01/1900')
Insert into ProIng values ( 214, 20, 6,'01/01/1900')
Insert into ProIng values ( 215, 10, .001,'01/01/1900')
Insert into ProIng values ( 215, 10, .001,'02/05/2009')
Insert into ProIng values ( 217, 10, .001,'01/01/1900')
Insert into ProIng values ( 217, 10, .001,'02/05/2009')
Insert into ProIng values ( 218, 10, .001,'01/01/1900')
Insert into ProIng values ( 218, 10, .001,'02/05/2009')
Insert into ProIng values ( 219, 20, .001,'01/01/1900')
Insert into ProIng values ( 219, 20, .001,'02/05/2009')
Insert into ProIng values ( 220, 20, .001,'01/01/1900')
Insert into ProIng values ( 222, 20, .001,'01/01/1900')
Insert into ProIng values ( 230, 30, .063,'01/01/1900')
Insert into ProIng values ( 230, 40, .001,'01/01/1900')
Insert into ProIng values ( 232, 50, 0,'01/01/1900')
Insert into ProIng values ( 232, 50, 0,'01/11/2009')
Insert into ProIng values ( 232, 60, .001,'01/01/1900')
Insert into ProIng values ( 232, 60, .001,'01/01/2009')
Insert into ProIng values ( 233, 30, 0,'01/01/1900')
Insert into ProIng values ( 233, 40, .001,'01/01/1900')
Insert into ProIng values ( 234, 50, .001,'01/01/1900')
Insert into ProIng values ( 234, 50, .001,'01/11/2009')
Insert into ProIng values ( 234, 60, .001,'01/01/1900')
Insert into ProIng values ( 234, 60, .001,'02/01/2009')
Insert into ProIng values ( 235, 30, .001,'01/01/1900')
Insert into ProIng values ( 235, 40, .001,'01/01/1900')
Insert into ProIng values ( 236, 50, .001,'01/01/1900')
Insert into ProIng values ( 236, 60, .001,'01/01/1900')
Insert into ProIng values ( 237, 30, .001,'01/01/1900')
Insert into ProIng values ( 237, 50, .001,'01/01/1900')
Insert into ProIng values ( 238, 50, .001,'01/01/1900')
Insert into ProIng values ( 238, 50, .001,'01/07/2009')
Insert into ProIng values ( 238, 60, .001,'01/01/1900')
Insert into ProIng values ( 238, 60, .001,'02/01/2009')
Insert into ProIng values ( 239, 50, 0,'01/01/1900')
Insert into ProIng values ( 239, 60, .001,'01/01/1900')
Insert into ProIng values ( 239, 60, .001,'02/01/2009')
Insert into ProIng values ( 241, 50, .001,'01/01/1900')
Insert into ProIng values ( 241, 60, .001,'01/01/1900')
Insert into ProIng values ( 242, 30, .083,'01/01/1900')
Insert into ProIng values ( 242, 40, .001,'01/01/1900')
Insert into ProIng values ( 243, 50, .001,'01/01/1900')
Insert into ProIng values ( 243, 60, .001,'01/01/1900')
Insert into ProIng values ( 244, 30, .001,'01/01/1900')
Insert into ProIng values ( 244, 30, .001,'03/07/2009')
Insert into ProIng values ( 244, 60, .001,'01/01/1900')
Insert into ProIng values ( 245, 30, 0,'01/01/1900')
Insert into ProIng values ( 245, 60, .001,'01/01/1900')
Insert into ProIng values ( 246, 50, 0,'01/01/1900')
Insert into ProIng values ( 246, 60, .001,'01/01/1900')
Insert into ProIng values ( 246, 60, .001,'02/01/2009')
Insert into ProIng values ( 247, 50, 0,'01/01/1900')
Insert into ProIng values ( 247, 60, .001,'01/01/1900')
Insert into ProIng values ( 247, 60, .001,'02/01/2009')
Insert into ProIng values ( 248, 30, .001,'01/01/1900')
Insert into ProIng values ( 248, 50, .001,'01/01/1900')
Insert into ProIng values ( 251, 10, .001,'01/01/1900')
Insert into ProIng values ( 251, 10, .001,'02/07/2009')
Insert into ProIng values ( 251, 50, .001,'01/01/1900')
Insert into ProIng values ( 252, 30, .001,'01/01/1900')
Insert into ProIng values ( 252, 50, .001,'01/01/1900')
Insert into ProIng values ( 253, 50, .001,'01/01/1900')
Insert into ProIng values ( 253, 50, .001,'03/07/2009')
Insert into ProIng values ( 253, 60, .001,'01/01/1900')
Insert into ProIng values ( 254, 40, .001,'01/01/1900')
Insert into ProIng values ( 254, 40, .001,'03/07/2009')
Insert into ProIng values ( 254, 50, .001,'01/01/1900')
Insert into ProIng values ( 255, 40, .001,'01/01/1900')
Insert into ProIng values ( 255, 50, .001,'01/01/1900')
Insert into ProIng values ( 256, 40, .001,'01/01/1900')
Insert into ProIng values ( 256, 50, .001,'01/01/1900')
Insert into ProIng values ( 257, 40, .001,'01/01/1900')
Insert into ProIng values ( 257, 50, .001,'01/01/1900')
Insert into ProIng values ( 258, 40, .001,'01/01/1900')
Insert into ProIng values ( 258, 40, .001,'02/07/2009')
Insert into ProIng values ( 258, 50, .001,'01/01/1900')
Insert into ProIng values ( 258, 50, .001,'02/07/2009')
Insert into ProIng values ( 265, 50, 0,'01/01/1900')
Insert into ProIng values ( 265, 60, .001,'01/01/1900')
Insert into ProIng values ( 265, 60, .001,'02/01/2009')
Insert into ProIng values ( 267, 40, .001,'01/01/1900')
Insert into ProIng values ( 267, 40, .001,'03/07/2009')
Insert into ProIng values ( 267, 60, 0,'01/01/1900')
Insert into ProIng values ( 267, 60, 0,'03/07/2009')
Insert into ProIng values ( 268, 50, .083,'01/01/1900')
Insert into ProIng values ( 268, 50, .083,'01/07/2009')
Insert into ProIng values ( 268, 60, .001,'01/01/1900')
Insert into ProIng values ( 268, 60, .001,'04/01/2009')
Insert into ProIng values ( 269, 40, .001,'01/01/1900')
Insert into ProIng values ( 269, 40, .001,'03/07/2009')
Insert into ProIng values ( 269, 60, .001,'01/01/1900')
Insert into ProIng values ( 269, 60, .001,'01/07/2009')
Insert into ProIng values ( 270, 40, .001,'01/01/1900')
Insert into ProIng values ( 270, 60, 0,'01/01/1900')
Insert into ProIng values ( 271, 40, .001,'01/01/1900')
Insert into ProIng values ( 271, 60, 0,'01/01/1900')
Insert into ProIng values ( 272, 40, .001,'01/01/1900')
Insert into ProIng values ( 272, 60, 0,'01/01/1900')
Insert into ProIng values ( 273, 40, .001,'01/01/1900')
Insert into ProIng values ( 273, 60, .02,'01/01/1900')
Insert into ProIng values ( 274, 40, .001,'01/01/1900')
Insert into ProIng values ( 274, 60, .001,'01/01/1900')
Insert into ProIng values ( 275, 40, .001,'01/01/1900')
Insert into ProIng values ( 275, 60, .001,'01/01/1900')
Insert into ProIng values ( 276, 40, .001,'01/01/1900')
Insert into ProIng values ( 276, 60, .01,'01/01/1900')
Insert into ProIng values ( 277, 50, .083,'01/01/1900')
Insert into ProIng values ( 277, 60, .083,'01/01/1900')

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('TelefonoProveedor') AND type in ('U'))
BEGIN
	CREATE TABLE TelefonoProveedor
	(
		IdTelefono int NOT NULL,
		IdProveedor int NOT NULL,
		codArea int NULL,
		central int NULL,
		numero int NULL,
		CONSTRAINT PK_TelefonoProveedor PRIMARY KEY CLUSTERED (IdTelefono),
		CONSTRAINT FK_TelefonoProveedor_Proveedores FOREIGN KEY(IdProveedor)
				   REFERENCES Proveedores (IdProveedor)
	)
END
GO

Insert into TelefonoProveedor values ( 1, 10, 64, 34, 2231)
Insert into TelefonoProveedor values ( 2, 10, 64, 34, 2232)
Insert into TelefonoProveedor values ( 3, 20, 1, 342, 2136)
Insert into TelefonoProveedor values ( 4, 20, 1, 342, 6771)
Insert into TelefonoProveedor values ( 5, 30, 1, 540, 2536)
Insert into TelefonoProveedor values ( 6, 40, 1, 977, 4563)
Insert into TelefonoProveedor values ( 7, 40, 1, 977, 7865)
Insert into TelefonoProveedor values ( 8, 40, 1, 977, 2784)
Insert into TelefonoProveedor values ( 9, 50, 1, 442, 2456)
Insert into TelefonoProveedor values ( 10, 60, 1, 332, 9398)
Insert into TelefonoProveedor values ( 11, 60, 1, 332, 9785)

/* EJERCICIOS DE SENTENCIAS SELECT */

-- 1. Listado de nombre y número de teléfono de los mozos

SELECT nombre, codArea, central, TelefonoMozo.numero FROM Mozos, TelefonoMozo

--2. Listado de Proveedores sin el código postal.

SELECT IdProveedor, razsoc, calle, numero, piso, departamento FROM Proveedores

--3. Determine la cantidad de Platos

SELECT COUNT(*) FROM Platos

--4. Determine la cantidad total de facturas

SELECT COUNT(*) FROM Facturas

--5. Determine la cantidad de ingredientes con una letra f en la descripción.

SELECT COUNT(*) FROM Ingredientes WHERE descripcion LIKE '%f%'

--6. Determine cuantas mesas hay en el sector 3

SELECT COUNT(*) from Mesas WHERE IdSector = 3

--7. Determine la menor cantidad en stock de los ingredientes.

SELECT MIN(stock) from Ingredientes

--8. El promedio de platos en las facturas

SELECT AVG(cantidadPersonas) from Facturas

--9. Determine la cantidad total de unidades en stock de todos los ingredientes.

SELECT SUM(stock) from Ingredientes

--10.Determine La cantidad de ítems de la factura 6.

SELECT * from Facturas

--11.Mostrar el importe de cada factura.

SELECT total from Facturas

--12.El mayor monto de una factura.

SELECT MAX(total) from Facturas

--13.Liste los ingredientes y su cantidad en existencia, si la misma es menor o
--igual al punto de reposición.



--14.Liste los ingredientes y su precio en los casos en que la cantidad a comprar 
--sea 1.

SELECT descripcion, precComp FROM Ingredientes WHERE cantComp = 1

--15.Liste los teléfonos de proveedores con código de área igual a 1.

SELECT idTelefono, idProveedor, CONCAT(codArea, central, numero) AS telefono FROM TelefonoProveedor WHERE codArea = 1

--16.Muestre el código postal de la localidad de Tigre.

SELECT IdCodPos, localida as localidad FROM localidades WHERE localida = 'Tigre'

--17.Muestre los números de factura, su total y la fecha de emisión, de las facturas del mes de enero.

SELECT NroFactura, total, fechaApertura FROM facturas WHERE MONTH(fechaApertura) = 01 

--18.Liste la cantidad de ventas por mozo.

SELECT IdMozo, COUNT(NroFactura) AS CantVentasMozo FROM facturas GROUP BY IdMozo

--19.Liste monto vendido por mozo.

SELECT IdMozo, SUM(total) AS Monto FROM facturas GROUP BY IdMozo

--20.Liste el total de ventas por mesa.

SELECT IdMesa, COUNT(NroFactura) AS CantVentasMesa FROM facturas GROUP BY IdMesa

--21.Total de ventas por mozo y mesa.

SELECT IdMesa, IdMozo, COUNT(NroFactura) AS CantidadDeVentas FROM facturas GROUP BY IdMesa, IdMozo

--22.Determine la cantidad vendida de cada plato.

SELECT IdPlato, SUM(cantida) AS CantidadVendida FROM ItemsFactura GROUP BY IdPlato

--23.Determine la cantidad total utilizada de cada ingrediente para hacer un plato 
--de cada uno de los platos.

SELECT IdIngrediente, IdPlato, cantida AS CantidadUtilizada FROM Plaing ORDER BY IdIngrediente

--24.Determine la cantidad de platos por cada rubro.

SELECT COUNT(*) as CantidadDePlatosXRubro FROM Platos GROUP BY IdRubro

--25.Determine la cantidad de ítems por factura.

SELECT NroFactura, SUM(cantida) as CantidadDeItemsXFactura FROM Itemsfactura GROUP BY NroFactura

--26.Determine cuantas veces se pidió cada plato.

SELECT IdPlato,COUNT(*) as CantidadVecesPedidas from ItemsFactura group by IdPlato

--27.Liste las facturas y la cantidad de ítems, donde el total calculado sea mayor que 60.

SELECT * FROM
(SELECT NroFactura, SUM(cantida) as SumaCantidad, SUM(precio) AS SumaPrecio FROM Itemsfactura GROUP BY NroFactura) AS tablax
WHERE SumaPrecio > 60

--28.Liste los proveedores que proveen más de 10 artículos.

SELECT * FROM
(SELECT IdProveedor, COUNT(IdIngrediente) AS CantArticulos FROM proing GROUP BY IdProveedor) AS tablax
WHERE CantArticulos > 10

--29.Liste los platos que hayan sido pedidos más de una vez.

SELECT IdPlato,COUNT(*) as CantidadVecesPedidas from ItemsFactura GROUP BY IdPlato HAVING COUNT(*)>1

--30.Listado de nombre y apellido de los mozos, ordenado alfabéticamente en orden descendente.

SELECT nombre, apellido FROM Mozos ORDER BY apellido DESC

--31.Liste los proveedores y su dirección en orden descendente por dirección.

SELECT razsoc, CONCAT(calle, numero) FROM Proveedores ORDER BY numero DESC

--32.Liste en número de factura y la cantidad de ítems, ordenado por cantidad de ítems descendente.

SELECT NroFactura, SUM(cantida) AS CantidadItems FROM ItemsFactura GROUP BY NroFactura ORDER BY CantidadItems DESC

--33.Liste las facturas con sus totales calculados ordenado en forma descendente por su importe en los casos en que la factura supere los 75 pesos.

SELECT * FROM Facturas WHERE total > 75 ORDER BY total DESC

--34.Liste los ingredientes y la cantidad utilizada en la preparación de una unidad de todos los platos, cuando esa cantidad sea mayor a cien unidades.

SELECT * FROM
(SELECT IdPlato, SUM(cantida) AS CantIng FROM plaing GROUP BY IdPlato) AS tablax
WHERE CantIng > 100

--35.Liste los proveedores que posean más de 2 teléfonos en orden ascendente.

SELECT * from
(SELECT IdProveedor, COUNT(numero) AS CantTelefonos FROM TelefonoProveedor GROUP BY IdProveedor) AS tablax
WHERE CantTelefonos > 2

--36.Liste los sectores con más de 2 mesas ordenado ascendentemente por el id del sector.

SELECT * FROM
(SELECT IdSector, COUNT(IdMesa) AS CantMesas FROM Mesas GROUP BY IdSector) AS tablax
WHERE CantMesas > 2 ORDER BY  IdSector ASC

--37.Liste los rubros y la cantidad de platos de cada rubro en los que los que la cantidad de platos sea mayor que 4, en orden descendente en cantidad de 
--platos.

SELECT tablax.IdRubro, descripcion, CantPlatos FROM
(SELECT IdRubro, count(descripcion) AS CantPlatos FROM Platos GROUP BY IdRubro) AS tablax
INNER JOIN Rubros ON tablax.IdRubro = Rubros.IdRubro WHERE CantPlatos > 4 ORDER BY CantPlatos DESC

--38.Liste de los mozos y su facturación acumulada para cada mozo, excluyendo al mozo de id 1, cuya en las cuales la mencionada sumatoria haya superado 
--el monto de 50 pesos.

SELECT mozos.IdMozo, nombre, apellido FactAcum FROM
(SELECT IdMozo, sum(total) AS FactAcum FROM facturas GROUP BY IdMozo) AS tablax INNER JOIN
mozos ON mozos.IdMozo = tablax.IdMozo
WHERE mozos.IdMozo != 1 and FactAcum > 50

--39.Liste de facturación acumulada por mesa exceptuando la mesa 'Rinconera' y desechando las facturas menores o iguales a 70 pesos.

SELECT tablax.IdMesa, descripcion AS Descripción, FactAcum FROM
(SELECT IdMesa, SUM(total) AS FactAcum FROM Facturas GROUP BY IdMesa) AS tablax
INNER JOIN Mesas ON tablax.IdMesa = Mesas.IdMesa WHERE FactAcum <= 70

--40.Liste las mesas y los sectores a los que pertenecen.

SELECT IdMesa, Mesas.Descripcion AS DescMesa, Mesas.IdSector, sectores.descripcion AS DescSector FROM Mesas INNER JOIN Sectores ON Mesas.IdSector = Sectores.IdSector

--41.Liste el plato, el rubro y el precio.

select IdPlato, Platos.descripcion as DescPlato, Precio, Rubros.IdRubro, Rubros.descripcion as DescRubro
from Platos inner join Rubros on Platos.IdRubro = Rubros.IdRubro

--42.Liste las facturas con los nombres de los mozos, el nombre de las mesas y el nombre del sector.

select * from facturas
select * from mozos
select * from mesas
select * from sectores

select NroFactura, tablax2.IdMozo, nombre, apellido, tablax2.IdMesa, DescMesa, Sectores.IdSector, Sectores.descripcion as DescSector from Sectores inner join
(select NroFactura, IdMozo, nombre, apellido, Mesas.IdMesa, Mesas.Descripcion as DescMesa, Mesas.IdSector from Mesas inner join
(select NroFactura, Facturas.IdMesa, Facturas.IdMozo, nombre, apellido from facturas inner join Mozos on Facturas.IdMozo = Mozos.IdMozo)
as tablax on tablax.IdMesa = Mesas.IdMesa) as tablax2
on Sectores.IdSector = tablax2.IdSector

--43.Liste de número de facturas con su total mayor que 50 indique el nombre del sector, la mesa y el mozo.

select * from Facturas
select * from Sectores
select * from Mesas
select * from Mozos

select NroFactura, Total, DescSector, DescMesa, Nombre, Apellido from
(select NroFactura, IdMozo, Total, IdMesa, DescMesa, tablax.IdSector, Sectores.Descripcion as DescSector from
(select NroFactura, IdMozo, Total, Facturas.IdMesa, Mesas.Descripcion as DescMesa, Mesas.IdSector from Facturas
inner join Mesas on Facturas.IdMesa = Mesas.IdMesa where Total > 50) as tablax
inner join Sectores on tablax.IdSector = Sectores.IdSector) as tablax2
inner join Mozos on tablax2.IdMozo = Mozos.IdMozo

--44.Liste las facturas con el nombre del mozo cuyo nombre contiene una letra o en el nombre.

select * from Facturas
select * from Mozos

select NroFactura, nombre, apellido from Facturas inner join Mozos on Facturas.IdMozo = Mozos.IdMozo where nombre like '%o%'

--45.Liste los mozos que vivan en la localidad de Castelar.

select * from Mozos
select * from Localidades

select IdMozo, Nombre, Apellido, Calle, Numero, Piso, Departamento, Mozos.IdCodPos, Localidades.localida as Localidad from Mozos inner join
Localidades on Mozos.IdCodPos = Localidades.IdCodPos where localida = 'Castelar'

--46. Liste los proveedores y su dirección de las localidades de Martínez y Moreno.

select * from Proveedores
select * from Localidades

select IdProveedor, razsoc, concat(calle, '', numero, ' ', piso, ' ', departamento) as Direccion from Proveedores
inner join Localidades on Proveedores.IdCodPos = Localidades.IdCodPos where localida = 'Martinez' or localida = 'Moreno'

select razsoc,calle, numero from Proveedores 
where Proveedores.IdCodPos in (select Localidades.IdCodpos from Localidades 
where Localidades.IdCodpos = 1340 or Localidades.IdCodpos = 1321)

--47.Liste los productos provistos por La Rural S.A.

select * from Proveedores
select * from ProIng
select * from Ingredientes

select distinct Ingredientes.descripcion as Producto from Ingredientes inner join
(select Proveedores.IdProveedor, razsoc, ProIng.IdIngrediente from Proveedores
inner join ProIng on Proveedores.IdProveedor = ProIng.IdProveedor where razsoc = 'La Rural S.A.') as tablax
on Ingredientes.IdIngrediente = tablax.IdIngrediente

--48.Listado de cantidad de mesas de cada tipo.

select * from Mesas

select descripcion, count(descripcion) as cantidad from Mesas group by Descripcion

--49.Liste la cantidad de mesas por sector, indique el nombre del sector.

select * from Mesas
select * from Sectores

select tablax.IdSector, descripcion as Sector, CantMesas from
(select IdSector, count(IdMesa) as CantMesas from Mesas group by IdSector) as tablax
inner join Sectores on tablax.IdSector = Sectores.IdSector

--50.Liste los mozos y la cantidad de números telefónicos registrados de cada uno.

select * from Mozos
select * from TelefonoMozo

select tablax.IdMozo, nombre, apellido as nombre, apellido, CantidadNumerosRegistrados from
(select IdMozo, count(numero) as CantidadNumerosRegistrados from TelefonoMozo group by IdMozo) as tablax
inner join Mozos on tablax.IdMozo = Mozos.IdMozo 

--51.Liste los mozos con sus totales vendidos por cada uno de ellos, indicando su nombre y apellido.

select * from Mozos
select * from Facturas

select Mozos.IdMozo, Nombre, Apellido, TotalVendido from Mozos inner join
(select IdMozo, sum(total) as TotalVendido from Facturas group by IdMozo) as tablax
on Mozos.IdMozo = tablax.IdMozo

--52.Liste los platos y la cantidad de veces que cada uno aparece en una factura.

select * from Platos
select * from ItemsFactura

select Platos.IdPlato, descripcion as DescPlato, CantVeces from Platos inner join
(select IdPlato, count(NroFactura) as CantVeces from ItemsFactura group by IdPlato) as tablax
on Platos.IdPlato = tablax.IdPlato
select tablax.IdSector, descripcion as Sector, CantidadDeMesas from
(select IdSector, count(IdMesa) as CantidadDeMesas from Mesas group by IdSector) as tablax
inner join Sectores on tablax.IdSector = Sectores.IdSector

--53.Liste los proveedores (su razón social) que proveen más de 10 artículos.

select * from Proveedores
select * from ProIng

select Proveedores.IdProveedor, razsoc, CantArticulos from Proveedores inner join
(select IdProveedor, count(IdIngrediente) as CantArticulos from ProIng group by IdProveedor) as tablax
on Proveedores.IdProveedor = tablax.IdProveedor where CantArticulos > 10

--54.Liste los platos, con su respectiva descripción en los casos que hayan sido pedidos más de una vez.

select Platos.IdPlato, descripcion, CantidadVecesPedido from Platos inner join
(select IdPlato, count(IdPlato) as CantidadVecesPedido from ItemsFactura group by IdPlato) as tablax
on Platos.IdPlato = tablax.IdPlato where CantidadVecesPedido > 1

--55.Liste la cantidad de uso de los ingredientes en cada uno de los platos con su 
-- correspondiente unidad de uso y ordenado descendentemente por cantidad de utilización.

select * from PlaIng
select * from Ingredientes

select descripcion, PlaIng.IdIngrediente, cUniUso from PlaIng inner join Ingredientes
on PlaIng.IdIngrediente = Ingredientes.IdIngrediente order by cUniUso desc

--56.Liste de Razón Social de los proveedores con la cantidad de productos que proveen cada uno, ordenados alfabéticamente.

select * from Proveedores
select * from ProIng

select Proveedores.IdProveedor, razsoc, CantProductos from Proveedores inner join
(select IdProveedor, count(distinct IdIngrediente) as CantProductos from ProIng group by IdProveedor) as tablax
on Proveedores.IdProveedor = tablax.IdProveedor order by razsoc ASC

--57.Liste platos con chocolate o crema o ambos.

select * from platos
select * from plaing
select * from ingredientes

select Platos.IdPlato, Platos.descripcion as DescPlato, tablax2.IdIngrediente, tablax2.Descripcion from Platos inner join
(select PlaIng.IdPlato, PlaIng.IdIngrediente, Descripcion from PlaIng inner join
(select IdIngrediente, Descripcion from ingredientes where descripcion = 'Crema' or descripcion = 'Chocolate') as tablax
on PlaIng.IdIngrediente = tablax.IdIngrediente) as tablax2
on Platos.IdPlato = tablax2.IdPlato

--58.Liste los platos y su precio que no tengan ni pescado, ni frutos de mar, ni cebolla, ordenado por precio de mayor a menor.

select * from PlaIng
select * from Platos
select * from Ingredientes

select Platos.IdPlato, Platos.descripcion as DescPlato, Platos.Precio from Platos inner join
(select PlaIng.IdPlato, PlaIng.IdIngrediente from PlaIng inner join
(select IdIngrediente, descripcion from Ingredientes where descripcion != 'Cebolla' and descripcion != 'Gancia' and descripcion != 'Clos du Moulin') as tablax
on PlaIng.IdIngrediente = tablax.IdIngrediente) as tablax2
on Platos.IdPlato = tablax2.IdPlato

-- 59.Liste las facturas con su total y la mesa, que se realizaron en el Salón Azul.

select * from Facturas
select * from Mesas
select * from Sectores

select NroFactura, total, tablax.IdMesa, tablax.Descripcion as DescMesa, tablax.IdSector, Sectores.Descripcion as DescSector from Sectores inner join
(select NroFactura, total, Facturas.IdMesa, Mesas.Descripcion, Mesas.IdSector from Facturas inner join Mesas on Facturas.IdMesa = Mesas.IdMesa) as tablax
on Sectores.IdSector = tablax.IdSector where Sectores.Descripcion = 'Salon Azul'

-- 60.Listado de platos que poseen algún ingrediente de cantidad menor o igual a la cantidad de reposición ordenado por alfabéticamente por ingrediente.

select * from PlaIng
select * from Platos
select * from Ingredientes

select Platos.IdPlato, Platos.Descripcion, tablax2.DescIngrediente from Platos inner join
(select IdPlato, PlaIng.IdIngrediente, tablax.DescIngrediente from PlaIng inner join
(select IdIngrediente, descripcion as DescIngrediente from Ingredientes where stock <= puntoRep) as tablax
on PlaIng.IdIngrediente = tablax.IdIngrediente) as tablax2
on Platos.IdPlato = tablax2.IdPlato

/*Hay que tener en cuenta que, cuando un procedimiento tiene variables de salida, las declaramos al 
comienzo del procedimiento*/
GO
CREATE OR ALTER PROCEDURE EJP (@rubro nvarchar(max),
							   @i int output,
							   @ii int output)
AS
BEGIN

/*Punto 1. Crea la tabla (35%)*/

CREATE TABLE tablax (
descripcion NVARCHAR(MAX)
)

/*La idea es crear un cursor que se mueva por los ingredientes*/
	
DECLARE @c CURSOR
SET @c = CURSOR FOR
SELECT descripcion FROM Ingredientes

DECLARE @a1 nvarchar(max)

OPEN @c

FETCH NEXT FROM @c INTO
@a1

/*Ponemos un contador para devolverlo más adelante (10%)*/
	
SET @i = 0
	
/*Le insertamos las descripciones de los ingredientes a la tabla*/

WHILE @@FETCH_STATUS = 0
BEGIN
		
	INSERT INTO tablax values (cast(@a1 as nvarchar(max)))

	FETCH NEXT FROM @c INTO
	@a1
	SET @i = @i+1
END

CLOSE @c
DEALLOCATE @c

/*Declaramos el segundo cursor, esta vez para ir insertando columnas con el nombre de los platos*/

DECLARE @c2 CURSOR
SET @c2 = CURSOR FOR
SELECT idplato FROM platos P,rubros R
WHERE P.IdRubro=R.IdRubro
AND R.descripcion=@rubro

DECLARE @a2 nvarchar(max)

OPEN @c2

FETCH NEXT FROM @c2 INTO
@a2

/*Ponemos otro contador*/

SET @ii = 0


declare @SQL nvarchar(max)

WHILE @@FETCH_STATUS = 0
BEGIN

/*Punto 3. Verifica que el rubro exista (5%)*/

IF NOT (EXISTS (SELECT * FROM Rubros WHERE descripcion=@rubro)) BEGIN
	PRINT 'No existe el rubro'
	RETURN
END

/*Punto 4. Verifica que existan ingredientes y platos (10%)*/

IF NOT (EXISTS (SELECT * FROM Rubros R,Platos P,PlaIng I
				WHERE R.IdRubro=p.IdRubro
				AND P.IdPlato=I.IdPlato
				AND R.descripcion=@rubro)) BEGIN
				PRINT 'No existe platos con ese rubro o ingredientes
				asociados a esos platos'
				RETURN
END
	
/*Nos pide que las columnas tengan la letra P al principio, por eso tenemos que convertir todo a un
string y ejecutarlo*/

SET @SQL = 'P' + CAST(@a2 AS NVARCHAR)
		
EXEC('ALTER TABLE tablax ADD '+ @SQL +' INT')

FETCH NEXT FROM @c2 INTO
@a2

SET @ii = @ii+1
END

CLOSE @c2
DEALLOCATE @c2

/*Bueno. Ya creamos la tabla, ahora toca insertarle los datos.
Cabe resaltar que esta parte es la más difícil del ejercicio
y no es necesario hacerla para aprobar.
Recomiendo dejarlo para el final.*/

/*Vamos a crear un nuevo cursor que se mueva por una tabla
especial con la forma:

	IdPlato | descripcion | cantidad
	102     | Alcaparras  | 20
	102     | Limon       | 60
	103     | Lomo        | 200
	*/

DECLARE @c3 CURSOR
SET @c3 = CURSOR FOR
SELECT P.IdPlato,I.descripcion,cantida 
FROM plaing PG,platos P ,RUBROS R,Ingredientes I
WHERE PG.IdPlato=P.IdPlato
AND P.IdRubro=R.IdRubro
AND PG.IdIngrediente=I.IdIngrediente
AND R.descripcion=@rubro

DECLARE 
	@d INT, 
	@d2 NVARCHAR(MAX), 
	@d3 INT

OPEN @c3

FETCH NEXT FROM @c3 INTO
	@d, 
	@d2, 
	@d3

WHILE @@FETCH_STATUS = 0
BEGIN

/*La clave de esto es la sentencia UPDATE.
Si no la sabemos NO PODEMOS RESOLVER EL EJERCICIO.*/

/*Es IMPORTANTE saber que hay que poner WHERE tablax.descripcion LIKE '%limón%' 
y NO WHERE tablax.descripcion = 'limon'.
*/

DECLARE @SQLCOM NVARCHAR(MAX) = 
'UPDATE tablax SET P'+CAST(@d AS NVARCHAR(MAX))+' = '+CAST(@d3 AS NVARCHAR(MAX))+
'WHERE tablax.descripcion LIKE '+CHAR(39)+'%'+@d2+'%'+CHAR(39)

EXEC sp_executesql @SQLCOM

FETCH NEXT FROM @c3 INTO
	@d, 
	@d2, 
	@d3
END

CLOSE @c3
DEALLOCATE @c3


/*Ahora tenemos que renombrar la tabla (5%).
Para eso, primero hay que reemplazar los espacios por guiones bajos. 
Si es Carnes Rojas, cambiarlo a Carnes_Rojas*/

DECLARE @r NVARCHAR(MAX) = REPLACE(@rubro, ' ', '_')

/*Después es meter todo en un string y ejecutarlo. Como hay comillas en la sintaxis original,
tenemos que poner CHAR(39), que sería el equivalente a una comilla simple.
Como sp_rename (la función que cambia el nombre no se puede ejecutar directamente con el EXEC, hay que poner 
antes un sp_executesql
*/

DECLARE @SQLCOMAND NVARCHAR(MAX) ='sp_rename '+CHAR(39)+'tablax'+CHAR(39)+', '+CHAR(39)+'Ingredientes_'+@r+CHAR(39)
EXEC sp_executesql  @SQLCOMAND

	
END

/*Para verificar que el programa funciona hay que guardar las dos varibles del output. Recordar la sintaxis*/

DECLARE @v1 int,
	    @v2 int

EXEC EJP 'Entradas', @i = @v1 OUTPUT, @ii = @v2 OUTPUT

SELECT @v1, @v2
