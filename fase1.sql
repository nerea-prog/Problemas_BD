/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS DAM
    Mòdul: 0484 Bases de dades. 
    AUTORS: Lorena Peiró i Nerea Narvaez
    DATA: 12/12/2024
****************************************************** */

-- tabla compañia

CREATE TABLE Companyia(
    nom varchar (40) not null,
    IATA VARCHAR (6) NOT NULL,
    CODE3 VARCHAR (6) NOT NULL,
    ICAO VARCHAR (6) NOT NULL,
    pais VARCHAR (40) NOT NULL,
    filial_de VARCHAR (40) NOT NULL
);

-- Tabla avion

CREATE TABLE Avio(
    num_serie VARCHAR (30) NOT NULL,
    tipus VARCHAR (10) NOT NULL,
    fabricant VARCHAR (20) NOT NULL,
    any_fabricacio YEAR (4),
    companyia VARCHAR (40) NOT NULL
);

-- Tabla aeropuerto


CREATE TABLE Aeroport(
    codi VARCHAR (4) NOT NULL,
    pais VARCHAR (40) NOT NULL,
    ciutat VARCHAR (40) NOT NULL,
    IATA VARCHAR (4),
    nom VARCHAR (55),
    any_construccio YEAR (4)
);

-- Tabla mostrador

CREATE TABLE Mostrador (
    numero SMALLINT unsigned,
    codi_aeroport VARCHAR (4) NOT NULL
);

-- Tabla volar

CREATE TABLE volar (
    seient TINYINT,
    passatger VARCHAR (20) NOT NULL,
    vol VARCHAR (9) NOT NULL,

);



------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Personal(
    num_empleat INT,
    nom VARCHAR NOT NULL,
    cognom VARCHAR NOT NULL,
    passaport VARCHAR NOT NULL,
    sou FLOAT NOT NULL
);

CREATE TABLE Hostessa(
    num_empleat INT
);

CREATE TABLE Pilot(
    num_empleat INT,
    hores_vol SMALLINT
);

CREATE TABLE Passatger(
    passaport VARCHAR (20) NOT NULL,
    nom VARCHAR (30) NOT NULL,
    cognom VARCHAR (50) NOT NULL,
    adreca VARCHAR (30),
    telefon INT,
    email VARCHAR (40),
    data_naix DATE,
    genere CHAR (1)
);

CREATE TABLE Vol(
    codi VARCHAR (9) NOT NULL,
    aeroport_desti VARCHAR (4),
    data DATE NOT NULL,
    durada SMALLINT,
    aeroport_origen VARCHAR (4),
    avio VARCHAR (30) NOT NULL,
    hostessa INT,
    pilot INT,
    descripcio VARCHAR (50)
);