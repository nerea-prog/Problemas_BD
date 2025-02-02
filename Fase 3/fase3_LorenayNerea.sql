/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: ________________
****************************************************** */

-- Pregunta 1
select nom, icao from companyia
ORDER BY icao;

-- Pregunta 2
SELECT num_serie, fabricant, any_fabricacio AS 'any', companyia FROM avio
WHERE fabricant NOT LIKE 'Boeing' AND any_fabricacio >= 2020
ORDER BY any_fabricacio, fabricant, num_serie;

-- Pregunta 3
SELECT CONCAT('L''aeroport ', nom, ' esta a ', ciutat, ' i va ser construir a ', any_construccio)
AS aeroport FROM aeroport
WHERE pais LIKE 'Spain' ORDER BY nom;

-- Pregunta 4
select 'No ho sé';

-- Pregunta 5
select 'No ho sé';

-- Pregunta 6
select 'No ho sé';

-- Pregunta 7
select 'No ho sé';

-- Pregunta 8
select 'No ho sé';

-- Pregunta 9
select 'No ho sé';