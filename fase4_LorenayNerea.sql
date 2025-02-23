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

--Pregunta 3

--Pregunta 4

--Pregunta 5

--Pregunta 6

--Pregunta 7

--Pregunta 8