/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: 20/02/2025
****************************************************** */

--Pregunta 1
SELECT a.nom AS ciutat, a.ciutat AS aeroport, v.data, v.codi
FROM aeroport a, vol v
WHERE a.codi = v.aeroport_origen
AND durada < 40
AND DATA BETWEEN '2024/02/01' AND '2024/02/29'
AND descripcio LIKE '%DELAYED%'
ORDER BY ciutat, DATA;

--Pregunta 2
SELECT a.any_fabricacio AS any, c.nom AS compania, a.num_serie, a.tipus
FROM  avio a, companyia c
WHERE a.companyia = c.nom
AND pais LIKE '%spain%'
AND any_fabricacio < 2000
ORDER BY any_fabricacio DESC, compania ASC, num_serie ASC;

--Pregunta 3


--Pregunta 4
 SELECT CONCAT(p.cognom, ', ', p.nom) AS passatger
 CONCAT(h.cognom, ', ', h.nom) AS hostessa
 v.aeroport_origen, v.aeroport_desti, durada
 FROM passatger p JOIN volar v ON()  
--Pregunta 5

--Pregunta 6

--Pregunta 7

--Pregunta 8