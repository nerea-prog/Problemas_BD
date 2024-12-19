/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS DAM
    Mòdul: 0484 Bases de dades. 
    AUTORS: Lorena Peiró i Nerea Narvaez
    DATA: 12/12/2024
****************************************************** */
DROP TABLE IF EXISTS Companyia;
DROP TABLE IF EXISTS Personal;
DROP TABLE IF EXISTS Hostessa;
DROP TABLE IF EXISTS Pilot;
DROP TABLE IF EXISTS Avio;
DROP TABLE IF EXISTS Passatger;
DROP TABLE IF EXISTS Aeroport;
DROP TABLE IF EXISTS Mostrador;
DROP TABLE IF EXISTS Vol;
DROP TABLE IF EXISTS Volar;

CREATE TABLE Companyia(
    nom VARCHAR (40) NOT NULL,
    IATA VARCHAR (6) NOT NULL,
    CODE3 VARCHAR (6),
    ICAO VARCHAR (6),
    pais VARCHAR (40) NOT NULL,
    filial_de VARCHAR (40) NOT NULL
);

CREATE TABLE Personal(
    num_empleat INT unsigned,
    nom VARCHAR (25) NOT NULL,
    cognom VARCHAR (35) NOT NULL,
    passaport VARCHAR (20) NOT NULL,
    sou FLOAT NOT NULL
);

CREATE TABLE Hostessa(
    num_empleat INT unsigned
);

CREATE TABLE Pilot(
    num_empleat INT unsigned,
    hores_vol SMALLINT unsigned
);

CREATE TABLE Avio(
    num_serie VARCHAR (30) NOT NULL,
    tipus VARCHAR (10) NOT NULL,
    fabricant VARCHAR (20) NOT NULL,
    any_fabricacio YEAR (4),
    companyia VARCHAR (40) NOT NULL
);

CREATE TABLE Passatger(
    passaport VARCHAR (20) NOT NULL,
    nom VARCHAR (30) NOT NULL,
    cognom VARCHAR (50),
    adreca VARCHAR (70),
    telefon VARCHAR (9),
    email VARCHAR (40),
    data_naix DATE,
    genere CHAR (1)
);

CREATE TABLE Aeroport(
    codi VARCHAR (4) NOT NULL,
    pais VARCHAR (40) NOT NULL,
    ciutat VARCHAR (40) NOT NULL,
    IATA VARCHAR (4),
    nom VARCHAR (55) NOT NULL,
    any_construccio YEAR (4)
);

CREATE TABLE Mostrador (
    numero SMALLINT UNSIGNED,
    codi_aeroport VARCHAR (4) NOT NULL
);

CREATE TABLE Vol(
    codi VARCHAR (9) NOT NULL,
    aeroport_desti VARCHAR (4),
    data DATE NOT NULL,
    durada SMALLINT unsigned NOT NULL,
    aeroport_origen VARCHAR (4),
    avio VARCHAR (30) NOT NULL,
    hostessa INT unsigned,
    pilot INT unsigned,
    descripcio VARCHAR (50)
);

CREATE TABLE volar (
    passatger VARCHAR (20) NOT NULL,
    vol VARCHAR (9) NOT NULL,
    seient TINYINT unsigned
);