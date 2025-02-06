/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: ________________
****************************************************** */

-- Pregunta 1
SELECT nom, icao from companyia
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
SELECT nom, pais, CHAR_LENGTH(nom) AS longitud FROM aeroport
WHERE LENGTH(nom) BETWEEN 7 AND 9 AND nom LIKE '%e%e%e'
ORDER BY longitud DESC, pais ASC;

-- Pregunta 5
SELECT num_serie FROM Avio WHERE fabricant LIKE 'Concorde' OR
companyia LIKE 'Alitalia' AND any_fabricacio = 2008
ORDER BY num_serie;

-- Pregunta 6
SELECT CONCAT(cognom, ', ',nom) AS nom_complet FROM Passatger
WHERE nom LIKE '%k%k' OR cognom LIKE '%K%K' AND adreca LIKE 'Barcelona'
ORDER BY cognom ASC;

-- Pregunta 7
select 'No ho sé';

-- Pregunta 8
select 'No ho sé';

-- Pregunta 9
select 'No ho sé';