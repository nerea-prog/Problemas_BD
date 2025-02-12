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
WHERE LENGTH(nom) BETWEEN 7 AND 9 AND nom LIKE '%e%e%e%'
ORDER BY longitud DESC, pais ASC;

-- Pregunta 5
SELECT num_serie, fabricant, companyia, any_fabricacio FROM Avio WHERE fabricant LIKE 'Concorde' AND any_fabricacio = 2008 OR
companyia LIKE 'Alitalia' AND any_fabricacio = 2008
ORDER BY num_serie;

-- Pregunta 6
SELECT CONCAT(cognom, ', ',nom) AS nom_complet, adreca FROM passatger
WHERE adreca LIKE '%Barcelona' AND (nom LIKE '%k%k%' OR cognom LIKE '%K%K%')
ORDER BY cognom ASC;

-- Pregunta 7
SELECT DISTINCT fabricant FROM Avio WHERE any_fabricacio = 2000
ORDER BY fabricant ASC;

-- Pregunta 8
SELECT cognom, nom, DATE_FORMAT(data_naix, "%d/%m/%Y (%W)") AS naixement FROM Passatger
WHERE nom NOT LIKE '%a%' AND naixement BETWEEN '01/10/2003' AND '31/10/2003'
ORDER BY naixement DESC, cognom ASC;

-- Pregunta 9
select 'No ho sé';