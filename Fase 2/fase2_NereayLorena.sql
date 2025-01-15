/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'Aplicacions Multiplataforma
    Mòdul: 0484 Bases de dades. 
    AUTORS: Nerea Narváez y Lorena Peiró
    DATA: 15/01/2025
****************************************************** */


-- Claves primarias

ALTER TABLE companyia
ADD CONSTRAINT pk_companyia PRIMARY KEY (nom);

ALTER TABLE personal
ADD CONSTRAINT pk_personal PRIMARY KEY (num_empleat);

ALTER TABLE hostessa
ADD CONSTRAINT pk_hostessa PRIMARY KEY (num_empleat);

ALTER TABLE pilot
ADD CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);

ALTER TABLE avio
ADD CONSTRAINT pk_avio PRIMARY KEY (num_serie);

ALTER TABLE passatger
ADD CONSTRAINT pk_passatger PRIMARY KEY (passaport);

ALTER TABLE aeroport
ADD CONSTRAINT pk_aeroport PRIMARY KEY (codi);

ALTER TABLE mostrador
ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero, codi_aeroport);

ALTER TABLE vol
ADD CONSTRAINT pk_vol PRIMARY KEY (codi);

ALTER TABLE volar
ADD CONSTRAINT pk_volar PRIMARY KEY (passatger, vol);



-- Claves foraneas

ALTER TABLE companyia
ADD CONSTRAINT fk_companyia FOREIGN KEY (filial_de) REFERENCES companyia(nom)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE hostessa
ADD CONSTRAINT fk_hostessa FOREIGN KEY (num_empleat) REFERENCES personal(num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE pilot
ADD CONSTRAINT fk_pilot FOREIGN KEY (num_empleat) REFERENCES personal(num_empleat)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE avio
ADD CONSTRAINT fk_avio FOREIGN KEY (companyia) REFERENCES companyia(nom)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE mostrador
ADD CONSTRAINT fk_mostrador FOREIGN KEY (codi_aeroport) REFERENCES aeroport(codi)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE vol
ADD CONSTRAINT fk_vol_aeroport_origen FOREIGN KEY (aeroport_origen) REFERENCES aeroport(codi)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE vol
ADD CONSTRAINT fk_vol_aeroport_desti FOREIGN KEY (aeroport_desti) REFERENCES aeroport(codi)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE vol
ADD CONSTRAINT fk_vol_avio FOREIGN KEY (avio) REFERENCES avio(num_serie)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE vol
ADD CONSTRAINT fk_vol_hostessa FOREIGN KEY (hostessa) REFERENCES hostessa(num_empleat)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE vol
ADD CONSTRAINT fk_vol_pilot FOREIGN KEY (pilot) REFERENCES pilot(num_empleat)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE volar
ADD CONSTRAINT fk_volar_passatger FOREIGN KEY (passatger) REFERENCES passatger(passaport)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE volar
ADD CONSTRAINT fk_volar_vol FOREIGN KEY (vol) REFERENCES vol(codi)
ON DELETE RESTRICT
ON UPDATE CASCADE;




-- Otras restricciones

ALTER TABLE volar
ADD CONSTRAINT ch_volar_seient CHECK (seient >=1 and seient <=200);

ALTER TABLE personal
ADD CONSTRAINT unique_passaport UNIQUE (passaport);

ALTER TABLE avio
ADD CONSTRAINT ch_avio_tipus CHECK (tipus='COM-PAS' or tipus='JET' or tipus='CARGO');

ALTER TABLE vol
ADD CONSTRAINT ch_vol_descripcio CHECK (descripcio='ON-TIME' or descripcio='DELAYED' or descripcio='UNKNOWN');

ALTER TABLE pilot
ADD CONSTRAINT ch_pilot_hores_vol CHECK (hores_vol >=400);

ALTER TABLE volar
ADD CONSTRAINT unique_seient UNIQUE (vol, seient);

ALTER TABLE vol
ADD CONSTRAINT ch_vol_durada CHECK (durada >= 10 and durada <= 1200);

ALTER TABLE personal
ADD CONSTRAINT ch_personal_sou CHECK (sou >= 20000);

ALTER TABLE aeroport
ADD CONSTRAINT unique_IATA UNIQUE (IATA);