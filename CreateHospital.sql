USE master
GO

/* Creación de las Tablas */

CREATE TABLE pacientes
	(
	    DNI varchar(10) NOT NULL,
	    nombre varchar(100),
		apellido varchar(100),
		sexo varchar(1),
		nacimiento smalldatetime,
		CONSTRAINT PK_pacientes PRIMARY KEY (DNI)
	) 

DROP TABLE medicos

CREATE TABLE medicos(
matricula varchar(100),
nombre varchar(100),
apellido varchar(100),
activo bit,
sexo varchar(1),
constraint PK_medicos primary key (matricula)
)

CREATE TABLE institutos(
idinstituto smallint not null,
instituto varchar(100),
activo bit,
constraint PK_institutos primary key (idinstituto)
)

CREATE TABLE especialidades(
idespecialidad smallint not null,
especialidad varchar(100),
constraint PK_especialidades primary key (idespecialidad)
)

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('estudios') AND type in ('U'))
BEGIN
	CREATE TABLE estudios
	(
		idestudio smallint not null,
		estudio varchar(100),
		activo bit,
		constraint PK_estudios primary key (idestudio)
	)
END
GO

CREATE TABLE ooss(
sigla varchar(8) not null,
nombre varchar(100),
categoria varchar(2),
constraint PK_ooss primary key (sigla)
)

CREATE TABLE espemedi(
matricula varchar(100),
idespecialidad smallint not null,
constraint PK_espemedi primary key (matricula,idespecialidad),
constraint FK_espemedi_medicos foreign key (matricula)
references medicos(matricula),
constraint FK_espemedi_especialidades foreign key (idespecialidad)
references especialidades(idespecialidad)
)

CREATE TABLE precios(
idestudio smallint not null,
idinstituto smallint not null,
precio decimal(10,2) check (precio>0),
constraint PK_precios primary key (idestudio,idinstituto),
constraint FK_precios_institutos foreign key (idinstituto)
references institutos(idinstituto),
constraint FK_precios_estudios foreign key (idestudio)
references estudios(idestudio)
)

CREATE TABLE estuespe(
idestudio smallint not null,
idespecialidad smallint not null,
constraint PK_estuespe primary key (idestudio,idespecialidad),
constraint FK_estuespe_especialidades foreign key (idespecialidad)
references especialidades(idespecialidad),
constraint FK_estuespe_estudios foreign key (idestudio)
references estudios(idestudio)
)

CREATE TABLE planes(
sigla varchar(8) not null,
nroplan int check (nroplan>0),
nombre varchar(100),
activo bit,
constraint PK_planes primary key (sigla,nroplan),
constraint FK_planes_ooss foreign key (sigla)
references ooss(sigla)
)

CREATE TABLE afiliados(
dni varchar(10) not null,
sigla varchar(8) not null,
nroplan int check (nroplan>0),
nroafiliado varchar(100),
constraint PK_afiliados primary key (dni,sigla),
constraint FK_afiliados_pacientes foreign key (dni)
references pacientes(dni),
constraint FK_afiliados_planes foreign key (sigla,nroplan)
references planes(sigla,nroplan)
)

CREATE TABLE coberturas(
sigla varchar(8) not null,
nroplan int check (nroplan>0),
idestudio smallint not null,
cobertura dec(3,2) check (0<cobertura),
constraint PK_coberturas primary key (sigla,nroplan,idestudio),
constraint FK_coberturas_planes foreign key (sigla,nroplan)
references planes(sigla,nroplan),
constraint FK_coberturas_estudios foreign key (idestudio)
references estudios(idestudio)
)

CREATE TABLE historias(
dni varchar(10) not null,
idestudio smallint not null,
idinstituto smallint not null,
fecha varchar(100),
matricula varchar(100),
sigla varchar(8) not null,
pagado bit,
observaciones varchar(100),
constraint PK_historias primary key (dni,idestudio,fecha),
constraint FK_historias_medicos foreign key (matricula)
references medicos(matricula),
constraint FK_historias_precios foreign key (idestudio,idinstituto)
references precios(idestudio,idinstituto),
constraint FK_historias_pacientes foreign key (dni)
references pacientes(dni),
constraint FK_historias_afiliados foreign key (dni,sigla)
references afiliados(dni,sigla)
)

/* INSERCIÓN DE DATOS */

INSERT INTO ooss values ('OSDE', 'Organización de Servicios Directos Empresarios', '1')
INSERT INTO ooss values ('UP', 'Union Personal', '2')
INSERT INTO ooss values ('OSECAC','Obra Social de Empleados de Comercio y Actividades Civiles', '3')

SELECT * from ooss

/* CREACIÓN DE VISTAS */

CREATE VIEW vw_estudios AS 
SELECT estudio, activo FROM estudios


CREATE VIEW vw_ooss AS 
SELECT nombre, categoria FROM ooss



/* CREACIÓN DE PROCEDIMIENTOS */


/* DEFINIR FUNCIONES */


/* DEFINIR CURSORES Y STORES PROCEDURES */
