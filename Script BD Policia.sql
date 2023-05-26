CREATE DATABASE POLICIAESTATAL;
USE POLICIAESTATAL;

-- creacion de tablas 

CREATE TABLE Banco(
idBanco varchar(15) NOT NULL UNIQUE,
nombre varchar(25),

PRIMARY KEY (idBanco)
);

CREATE TABLE Sucursal(
idSucursal varchar(15) NOT NULL UNIQUE,
calle varchar(30),
idMunicipio int(3),
idColonia int(3),
idBanco varchar(15),

PRIMARY KEY (idSucursal),

FOREIGN KEY (idBanco) REFERENCES Banco(idBanco),
FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio),
FOREIGN KEY (idColonia) REFERENCES Colonia(idColonia)
);

CREATE TABLE Municipio(
idMunicipio int(15) NOT NULL UNIQUE,
municipio varchar(45),

PRIMARY KEY (idMunicipio)
);

CREATE TABLE Colonia(
idColonia int(15) NOT NULL UNIQUE,
Colonia varchar(35),

PRIMARY KEY (idColonia)
);

CREATE TABLE Contrata(
idContrata varchar(15) NOT NULL UNIQUE,
fecha date,
idSucursal varchar(15),
idVigilantes varchar(15),

PRIMARY KEY (idContrata),
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal),
FOREIGN KEY (idVigilantes) REFERENCES Vigilantes(idVigilantes)
);

CREATE TABLE Vigilante(
idVigilante varchar(15) NOT NULL UNIQUE, 
nombre varchar(40),
segundoNombre varchar(40),
apellidoP varchar(40),
apellidoM varchar(40),
edad int(3),

PRIMARY KEY (idVigilante)
);

CREATE TABLE Roba(
idRoba varchar(15) NOT NULL UNIQUE,
fecha date,
idSucursal varchar(15),
idRatero varchar(15),

PRIMARY KEY (idRoba),
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal),
FOREIGN KEY (idRatero) REFERENCES Ratero(idRatero)
);

CREATE TABLE RATERO(
idRatero varchar(15),
nombre varchar(40),
segundoNombre varchar(40),
apellidoP varchar(40),
apellidoM varchar(40),
idBanda varchar(15),

PRIMARY KEY (idRatero),
FOREIGN KEY (idBanda) REFERENCES Banda(idBanda)
);

CREATE TABLE Banda(
idBanda varchar(15) NOT NULL UNIQUE,
nombre varchar(45),
numMiembros int(4),

PRIMARY KEY (idBanda)
);