/* Créer une base de données */

CREATE DATABASE training;

/* Créer une table SEGMENT */ 

CREATE TABLE SEGMENT(
 N_SEGMENT VARCHAR(10) PRIMARY KEY,
 NOM_SEGMENT VARCHAR(20));

/* Créer une table SALLE */

 CREATE TABLE SALLE(
 N_SALLE VARCHAR(7) PRIMARY KEY,
 NOM_SALLE VARCHAR(20),
 NB_POSTE NUMERIC(3),
 N_SEGMENT VARCHAR(10)) REFERENCES SEGMENT(N_SEGMENT);

/* Créer une table POSTE */ 

CREATE TABLE POSTE(
 N_POSTE VARCHAR(7) PRIMARY KEY,
 NOM_POSTE VARCHAR(20),
 N_SEGMENT VARCHAR(10) REFERENCES SEGMENT(N_SEGMENT),
 AD VARCHAR(2),
 TYPE_POSTE VARCHAR(20),
 N_SALLE VARCHAR(7) REFERENCES SALLE(N_SALLE));

 /* Créer une table LOGICIEL */

 CREATE TABLE LOGICIEL(
 N_LOGICIEL VARCHAR(5) PRIMARY KEY,
 NOM_LOGICIEL VARCHAR(20),
 DATE_ACHAT DATE,
 VERSION VARCHAR(7),
 TYPE_LOGICIEL VARCHAR(20));

/* Créer une table INSTALLER */ 

CREATE TABLE INSTALLER(
 N_POSTE VARCHAR(7),
 N_LOGICIEL VARCHAR(5),
 DATE_INST DATE,
 PRIMARY KEY(N_POSTE, N_LOGICIEL),
 FOREIGN KEY (N_POSTE) REFERENCES POSTE(N_POSTE),
 FOREIGN KEY (N_LOGICIEL) REFERENCES LOGICIEL(N_LOGICIEL));

/* DROP DE TABLE */

DROP TABLE IF EXIST nomTable;

/* INSERT DE DONNÉES DANS LA TABLE SEGMENT */

INSERT INTO segment(n_segment,nom_segment)
  VALUES('130.120.80','segment 80'),
  ('130.120.81', 'segment 81'),
  ('130.120.82', 'segment 82');


/* INSERT DE DONNÉES DANS LA TABLE SALLE */

INSERT INTO Salle (N_SALLE, NOM_SALLE, NB_POSTE, N_SEGMENT) VALUES
('S01', 'Salle 1', 3, '130.120.80'),
('S02', 'Salle 2', 2, '130.120.80'),
('S03', 'Salle 3', 2, '130.120.80'),
('S11', 'Salle 11', 2, '130.120.81'),
('S12', 'Salle 12', 1, '130.120.81'),
('S21', 'Salle 21', 2, '130.120.82');

/* INSERT DE DONNÉES DANS LA TABLE POSTE*/

INSERT INTO POSTE (N_POSTE, NOM_POSTE, N_SEGMENT, AD, TYPE_POSTE, N_SALLE) VALUES
 ('P1', 'Poste 1', '130.120.80', '01', 'TX', 'S01'),
 ('P2', 'Poste 2', '130.120.80', '02', 'UNIX', 'S01'),
 ('P3', 'Poste 3', '130.120.80', '03', 'TX', 'S01'),
 ('P4', 'Poste 4', '130.120.80', '04', 'PCWS', 'S02'),
 ('P5', 'Poste 5', '130.120.80', '05', 'PCWS', 'S02'),
 ('P6', 'Poste 6', '130.120.80', '06', 'UNIX', 'S03'),
 ('P7', 'Poste 7', '130.120.80', '07', 'TX', 'S03'),
 ('P8', 'Poste 8', '130.120.81', '01', 'UNIX', 'S11'),
 ('P9', 'Poste 9', '130.120.81', '02', 'TX', 'S11'),
 ('P10', 'Poste 10', '130.120.81', '03', 'UNIX', 'S12'),
 ('P11', 'Poste 11', '130.120.82', '01', 'PCXP', 'S21'),
 ('P12', 'Poste 12', '130.120.82', '02', 'PCXP', 'S21');


/* INSERT DE DONNÉES DANS LA TABLE LOGICIEL*/

INSERT INTO Logiciel (N_LOGICIEL, NOM_LOGICIEL, DATE_ACHAT, VERSION, TYPE_LOGICIEL) VALUES
 ('Log1', 'Oracle 9i', '2021-05-13', '9.2', 'UNIX'),
 ('Log2', 'Oracle 10g', '2020-09-15', '10.1', 'UNIX'),
 ('Log3', 'Sql Server', '2022-04-12', '2020SE', 'PCXP'),
 ('Log4', '4D', '2020-06-03', '2019.4', 'PCXP'),
 ('Log5', 'Windev', '2021-11-12', '10', 'PCWS'),
 ('Log6', 'Sql*Net', '2021-05-13', '2.5', 'UNIX'),
 ('Log7', 'I. I. S.', '2020-04-12', '6.0', 'PCXP'),
 ('Log8', 'Autocad', '2022-03-21', 'AU2019', 'PCWS');


/*INSERT DE DONNÉES DANS LA TABLE INSTALLER*/

INSERT INTO Installation (N_POSTE, N_LOGICIEL, DATE_INSTALL) VALUES
('P2', 'Log1', '2021-05-15'),
('P2', 'Log2', '2020-09-17'),
('P4', 'Log5', '2022-05-30'),
('P6', 'Log6', '2021-05-20'),
('P6', 'Log1', '2021-05-20'),
('P8', 'Log2', '2021-05-19'),
('P8', 'Log6', '2021-05-20'),
('P11', 'Log3', '2022-04-20'),
('P12', 'Log4', '2020-06-20'),
('P11', 'Log7', '2022-04-20');

/* MERGE DE DONNÉES DANS LA TABLE SEGMENT */

MERGE INTO segment
 USING (VALUES
     ('130.120.80', 'segment 80'),
     ('130.120.81', 'segment 80'),
     ('130.120.82', 'segment 82')
 ) AS source (n_segment, nom_segment)
 ON segment.n_segment = source.n_segment
 WHEN MATCHED THEN
     UPDATE SET nom_segment = source.nom_segment
 WHEN NOT MATCHED THEN
     INSERT (n_segment, nom_segment) VALUES (source.n_segment, source.nom_segment);