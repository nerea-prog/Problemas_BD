/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: 20/02/2025
****************************************************** */

--Pregunta 1
SELECT a.ciutat AS ciutat, a.nom AS aeroport, v.data, v.codi
FROM aeroport a, vol v
WHERE a.codi = v.aeroport_origen
  AND durada < 40
  AND DATA BETWEEN '2024/02/01' AND '2024/02/29'
  AND descripcio LIKE '%DELAYED%'
ORDER BY ciutat, data;

--Pregunta 2
SELECT a.any_fabricacio AS any, c.nom AS compania, a.num_serie, a.tipus
FROM  avio a, companyia c
WHERE a.companyia = c.nom
  AND pais LIKE '%spain%'
  AND any_fabricacio < 2000
ORDER BY any_fabricacio DESC, compania ASC, num_serie ASC;

--Pregunta 3
SELECT v.codi, v.data, CONCAT(pe.cognom, ', ', pe.nom, ' (', pi.hores_Vol, ')') AS pilot, a.companyia
FROM vol v
JOIN personal pe ON v.pilot = pe.num_empleat
JOIN pilot pi ON pe.num_empleat = pi.num_empleat
JOIN avio a ON v.avio = a.num_serie
WHERE v.data BETWEEN '2024-02-01' AND '2024-02-29'
  AND pi.hores_Vol > 7000
  AND pe.sou > 53000
  AND v.descripcio LIKE '%DELAYED%'
ORDER BY a.companyia, v.data, v.codi;

--Pregunta 4
SELECT CONCAT(p.cognom, ', ', p.nom) AS passatger, CONCAT(pe.cognom, ', ', pe.nom) AS hostessa, v.aeroport_origen, v.aeroport_desti, v.durada
FROM passatger p
JOIN volar vl ON p.passaport = vl.passatger
JOIN vol v ON vl.vol = v.codi
JOIN hostessa h ON v.hostessa = h.num_empleat
JOIN personal pe ON h.num_empleat = pe.num_empleat
JOIN aeroport a1 ON v.aeroport_desti = a1.codi
JOIN aeroport a2 ON v.aeroport_origen = a2.codi
WHERE p.adreca LIKE '%madrid%' AND v.data = '2023-12-25'
ORDER BY p.cognom;

--Pregunta 5
SELECT v.codi, CONCAT(v.aeroport_origen, ' ','(',a1.ciutat,')') AS origen, CONCAT(vol.aeroport_desti, ' ','(',a2.ciutat,')') AS desti
FROM vol v
JOIN aeroport a1 ON a1.codi = v.aeroport_origen
JOIN aeroport a2 ON a2.codi = v.aeroport_desti
WHERE v.data BETWEEN '2024-01-01' AND '2024-12-31'
	AND v.durada > 160
	AND (a1.ciutat LIKE '__o%' AND a2.ciutat LIKE '__o%')
ORDER BY v.codi;

--Pregunta 6
SELECT c.nom, c.filial_de, CONCAT(pilot.cognom, ', ', pilot.nom) AS pilot, CONCAT(hostessa.cognom, ', ', hostessa.nom) AS hostessa
FROM vol v
JOIN avio a ON v.avio = a.num_serie
JOIN companyia c ON a.companyia = companyia.nom
JOIN personal per1 ON v.pilot = pilot.num_empleat
JOIN personal per2 ON v.hostessa = hostessa.num_empleat
WHERE a.any_fabricacio = 2008
  AND c.filial_de IS NOT NULL  
ORDER BY pilot.cognom, hostessa.cognom;
