/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: 
****************************************************** */


-- Claves primarias

ALTER TABLE companyia ADD CONSTRAINT pk_companyia PRIMARY KEY (nom);
ALTER TABLE personal ADD CONSTRAINT pk_personal PRIMARY KEY (num_empleat);
ALTER TABLE hostessa ADD CONSTRAINT pk_hostessa PRIMARY KEY (num_empleat);
ALTER TABLE pilot ADD CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);
ALTER TABLE avio ADD CONSTRAINT pk_avio PRIMARY KEY (num_serie);
ALTER TABLE passatger ADD CONSTRAINT pk_passatger PRIMARY KEY (passaport);
ALTER TABLE aeroport ADD CONSTRAINT pk_aeroport PRIMARY KEY (codi);
ALTER TABLE mostrador ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero, codi_aeroport);
ALTER TABLE vol ADD CONSTRAINT pk_vol PRIMARY KEY (codi);
ALTER TABLE volar ADD CONSTRAINT pk_volar PRIMARY KEY (passatger, vol);



-- Claves foraneas

ALTER TABLE companyia ADD CONSTRAINT fk_companyia FOREIGN KEY (filial_de) REFERENCES companyia(nom);
ALTER TABLE hostessa ADD CONSTRAINT fk_hostessa FOREIGN KEY (num_empleat) REFERENCES personal(num_empleat);
ALTER TABLE pilot ADD CONSTRAINT fk_pilot FOREIGN KEY (num_empleat) REFERENCES personal(num_empleat);
ALTER TABLE avio ADD CONSTRAINT fk_avio FOREIGN KEY (companyia) REFERENCES companyia(num_empleat);
ALTER TABLE mostrador ADD CONSTRAINT fk_mostrador FOREIGN KEY (codi_aeroport) REFERENCES aeroport(codi);
ALTER TABLE vol ADD CONSTRAINT fk_vol_aeroport FOREIGN KEY (aeroport_origen, aeroport_desti) REFERENCES aeroport(codi);
ALTER TABLE vol ADD CONSTRAINT fk_vol_avio FOREIGN KEY (avio) REFERENCES avio(num_serie);
ALTER TABLE vol ADD CONSTRAINT fk_vol_hostessa FOREIGN KEY (hostessa) REFERENCES hostessa(num_empleat);
ALTER TABLE vol ADD CONSTRAINT fk_vol_pilot FOREIGN KEY (pilot) REFERENCES pilot(num_empleat);
ALTER TABLE volar ADD CONSTRAINT fk_volar_passatger FOREIGN KEY (passatger) REFERENCES passatger(passaport);
ALTER TABLE volar ADD CONSTRAINT fk_volar_vol FOREIGN KEY (vol) REFERENCES vol(codi);




-- Otras restricciones

ALTER TABLE volar ADD CONSTRAINT ch_volar_seient CHECK (seient >=1 and seient <=200);
ALTER TABLE personal ADD CONSTRAINT unique_passaport UNIQUE (passaport);
ALTER TABLE avio ADD CONSTRAINT ch_avio_tipus CHECK (tipus='COM-PAS' or tipus='JET' or tipus='CARGO');
ALTER TABLE vol ADD CONSTRAINT ch_vol_descripcio CHECK (descripcio='ON-TIME' or descripcio='DELAYED' or descripcio='UNKNOWN');
ALTER TABLE pilot ADD CONSTRAINT ch_pilot_hores_vol CHECK (hores_vol >=400);
ALTER TABLE volar ADD CONSTRAINT unique_seient UNIQUE (vol, seient);
ALTER TABLE vol ADD CONSTRAINT vol_durada CHECK (durada >= 10 and durada <= 1200);
ALTER TABLE personal ADD CONSTRAINT personal_sou CHECK (sou >= 20000 );
ALTER TABLE aeroport ADD CONSTRAINT unique_IATA UNIQUE (IATA);


/* HECHO! LO MIRAMOS EL PROXIMO DIA :)
2.3.- Restriccions textuals
A banda de les claus primàries, foranes i d’obligatorietat, altres restriccions que el model ha de
complir i que no s’han vist reflexades en el model anterior són:
- El seient és un número entre 1 i 200.
- El número de passaport del personal no es pot repetir.
- El tipus d’avió pot valer només COM-PAS, JET, o CARGO.
- La descripció del vol pot valer només ON-TIME, DELAYED, o UNKNOWN
- Per ser pilot s’han de tenir com a mínim 400 hores de vol.
- En un vol un seient no pot estar ocupat per més d’una persona.
- La durada dels vols ha de ser un valor entre 10 i 1200 (és a dir, entre 10 minuts i 20
hores)
- El sou no pot ser negatiu. A més el sou mínim ha de ser de 20.000 dolars.
- El codi IATA dels aeroports no es pot repetir
*/