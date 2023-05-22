--Caracteristique
INSERT INTO caracteristique VALUES (0, 'Connexion à Internet');
INSERT INTO CARACTERISTIQUE VALUES (1, 'Tables fixes en U et chaises mobiles');
INSERT INTO CARACTERISTIQUE VALUES (2, 'Monoplaces');
INSERT INTO CARACTERISTIQUE VALUES (3, 'Tables fixes et chaises fixes');
INSERT INTO CARACTERISTIQUE VALUES (6, 'Tables pour 2 ou + et chaises mobiles');
INSERT INTO CARACTERISTIQUE VALUES (7, 'Tables mobiles et chaises mobiles');
INSERT INTO CARACTERISTIQUE VALUES (8, 'Tables hautes et chaises hautes');
INSERT INTO CARACTERISTIQUE VALUES (9, 'Tables fixes et chaises mobiles');
INSERT INTO CARACTERISTIQUE VALUES (11, 'Écran');
INSERT INTO CARACTERISTIQUE VALUES (14, 'Rétroprojecteur');
INSERT INTO CARACTERISTIQUE VALUES (15, 'Gradins');
INSERT INTO CARACTERISTIQUE VALUES (16, 'Fenêtres');
INSERT INTO CARACTERISTIQUE VALUES (17, '1 piano');
INSERT INTO CARACTERISTIQUE VALUES (18, '2 pianos');
INSERT INTO CARACTERISTIQUE VALUES (19, 'Autres instruments');
INSERT INTO CARACTERISTIQUE VALUES (20, 'Système de son');
INSERT INTO CARACTERISTIQUE VALUES (21, 'Salle réservée (spéciale)');
INSERT INTO CARACTERISTIQUE VALUES (22, 'Ordinateurs PC');
INSERT INTO CARACTERISTIQUE VALUES (23, 'Ordinateurs SUN pour génie électrique');
INSERT INTO CARACTERISTIQUE VALUES (24, 'PC');
INSERT INTO CARACTERISTIQUE VALUES (25, 'Ordinateurs (oscillomètre et multimètre)');
INSERT INTO CARACTERISTIQUE VALUES (26, 'Ordinateurs modélisation des structures');
INSERT INTO CARACTERISTIQUE VALUES (27, 'Ordinateurs PC');
INSERT INTO CARACTERISTIQUE VALUES (28, 'Équipement pour microélectronique');
INSERT INTO CARACTERISTIQUE VALUES (29, 'Équipement pour génie électrique');
INSERT INTO CARACTERISTIQUE VALUES (30, 'Ordinateurs et équipement pour mécatroni');
INSERT INTO CARACTERISTIQUE VALUES (31, 'Équipement métrologie');
INSERT INTO CARACTERISTIQUE VALUES (32, 'Équipement de machinerie');
INSERT INTO CARACTERISTIQUE VALUES (33, 'Équipement de géologie');
INSERT INTO CARACTERISTIQUE VALUES (34, 'Équipement pour la caractérisation');
INSERT INTO CARACTERISTIQUE VALUES (35, 'Équipement pour la thermodynamique');
INSERT INTO CARACTERISTIQUE VALUES (36, 'Équipement pour génie civil');
INSERT INTO CARACTERISTIQUE VALUES (37, 'Télévision');
INSERT INTO CARACTERISTIQUE VALUES (38, 'VHS');
INSERT INTO CARACTERISTIQUE VALUES (39, 'Hauts parleurs');
INSERT INTO CARACTERISTIQUE VALUES (40, 'Micro');
INSERT INTO CARACTERISTIQUE VALUES (41, 'Magnétophone à cassette');
INSERT INTO CARACTERISTIQUE VALUES (42, 'Amplificateur audio');
INSERT INTO CARACTERISTIQUE VALUES (43, 'Local barré');
INSERT INTO CARACTERISTIQUE VALUES (44, 'Prise réseau');

--Campus
INSERT INTO CAMPUS VALUES (1, 'Campus Principal');
INSERT INTO CAMPUS VALUES (2, 'Campus Medecine');
INSERT INTO CAMPUS VALUES (3, 'Campus Longueur');

--Pavillon
INSERT INTO PAVILLON VALUES('C1', 'J Armand Bombardier',1);
INSERT INTO PAVILLON VALUES('C2', 'J.-Armand-Bombardier',1);
INSERT INTO PAVILLON VALUES('D7', 'Centre universitaire de formation en environnement et developpement durable',1);

--Fonction
INSERT INTO fonction VALUES (0110, 'Salle de classe générale');
INSERT INTO fonction VALUES (0111, 'Salle de classe spécialisée');
INSERT INTO fonction VALUES (0112, 'Salle de séminaire');
INSERT INTO fonction VALUES (0113, 'Cubicules');
INSERT INTO fonction VALUES (0114, 'Laboratoire informatique');
INSERT INTO fonction VALUES (0115, 'Laboratoire denseignement spécialisé');
INSERT INTO fonction VALUES (0116, 'Atelier');
INSERT INTO fonction VALUES (0117, 'Salle à dessin');
INSERT INTO fonction VALUES (0118, 'Atelier (civil)');
INSERT INTO fonction VALUES (0119, ' Salle de musique');
INSERT INTO fonction VALUES (0120, 'Atelier sur 2 étages, conjoint avec autre local');
INSERT INTO fonction VALUES (0121, 'Salle de conférence');
INSERT INTO fonction VALUES (0123, 'Salle de réunion');
INSERT INTO fonction VALUES (0124, 'Salle dentrevue et de tests');
INSERT INTO fonction VALUES (0125, 'Salle de lecture ou de consultation');
INSERT INTO fonction VALUES (0126, 'Auditorium');
INSERT INTO fonction VALUES (0127, 'Salle de concert');
INSERT INTO fonction VALUES (0128, 'Salle daudience');
INSERT INTO fonction VALUES (0129, 'Salon du personnel');
INSERT INTO fonction VALUES (0130, 'Studio denregistrement');
INSERT INTO fonction VALUES (0131, 'Hall dentrée');

--Departement
INSERT INTO DEPARTEMENT VALUES (2045, 'GEGI','C1');
INSERT INTO DEPARTEMENT VALUES (3698, 'GM','C2');
INSERT INTO DEPARTEMENT VALUES (2684, 'GB','D7');
INSERT INTO DEPARTEMENT VALUES (6994, 'GC','D7');


--Local
INSERT INTO LOCAL VALUES('C1', '1007', 21, 0110, 'Grand');
INSERT INTO LOCAL VALUES('C1', '2018', 10, 0111, 'Materiaux Composites');
INSERT INTO LOCAL VALUES('C1', '3041', 50, 0112);
INSERT INTO LOCAL VALUES('C1', '2055', 24, 0113);
INSERT INTO LOCAL VALUES('C1', '3014', 25, 0114, 'Laboratoire mecatronique');
INSERT INTO LOCAL VALUES('C1', '3027', 15, 0115, 'Petit laboratoire de elect');
INSERT INTO LOCAL VALUES('C1', '3016', 50, 0116);
INSERT INTO LOCAL VALUES('C1', '3018', 50, 0117);
INSERT INTO LOCAL VALUES('C1', '3024', 50, 0118);
INSERT INTO LOCAL VALUES('C1', '3035', 50, 0119);
INSERT INTO LOCAL VALUES('C1', '3007', 106, 0120, 'Avec console multi-media');
INSERT INTO LOCAL VALUES('C1', '3010', 30, 0121, 'Laboratoire de conception VLSI');
INSERT INTO LOCAL VALUES('C1', '4016', 91, 0123);
INSERT INTO LOCAL VALUES('C1', '4018', 10, 0123, 'Metallurgie');
INSERT INTO LOCAL VALUES('C1', '4019', 8, 0124, 'Laboratoire accessoire Atelier');
INSERT INTO LOCAL VALUES('C1', '4021', 28, 0125);
INSERT INTO LOCAL VALUES('C1', '4023', 108, 0126);
INSERT INTO LOCAL VALUES('C1', '4030', 25, 0127, 'Équipement photoelasticité');
INSERT INTO LOCAL VALUES('C1', '4028', 14,0128);
INSERT INTO LOCAL VALUES('C1', '4008', 106, 0129);
INSERT INTO LOCAL VALUES('C1', '5012', 35, 0130, '3 cubicules');
INSERT INTO LOCAL VALUES('C1', '5026', 38, 0131,'Ordinateurs');
INSERT INTO LOCAL VALUES('D7', '2018', 57, 0123);
INSERT INTO LOCAL VALUES('D7', '3001', 35, 0111);
INSERT INTO LOCAL VALUES('D7', '3002', 22, 0113);
INSERT INTO LOCAL VALUES('D7', '3007', 54, 0114);
INSERT INTO LOCAL VALUES('D7', '3009', 45,0115);
INSERT INTO LOCAL VALUES('D7', '3010', 21,0116);

-- INSERT INTO LOCAL VALUES('C1', '3041-4', 8, null,'C1', '3041');
-- INSERT INTO LOCAL VALUES('C1', '3041-5', 8, null,'C1', '3041');
-- INSERT INTO LOCAL VALUES('C1', '3041-6', 8, null,'C1', '3041');

-- --CaractLocal
INSERT INTO CaractLocal VALUES(30, '3014', 'C1');
INSERT INTO CaractLocal VALUES(22, '3035', 'C1');
INSERT INTO CaractLocal VALUES(11, '3041', 'C1');
INSERT INTO CaractLocal VALUES(22, '3041', 'C1');
INSERT INTO CaractLocal VALUES(11, '3007', 'C1');
INSERT INTO CaractLocal VALUES(14, '3007', 'C1');
INSERT INTO CaractLocal VALUES(24, '3007', 'C1');
INSERT INTO CaractLocal VALUES(38, '3007', 'C1');
INSERT INTO CaractLocal VALUES(40, '3007', 'C1');
INSERT INTO CaractLocal VALUES(11, '4016', 'C1');
INSERT INTO CaractLocal VALUES(14, '4016', 'C1');
INSERT INTO CaractLocal VALUES(40, '4016', 'C1');
INSERT INTO CaractLocal VALUES(24, '4016', 'C1');
INSERT INTO CaractLocal VALUES(22, '4021', 'C1');
INSERT INTO CaractLocal VALUES(11, '4023', 'C1');
INSERT INTO CaractLocal VALUES(14, '4023', 'C1');
INSERT INTO CaractLocal VALUES(24, '4023', 'C1');
INSERT INTO CaractLocal VALUES(38, '4023', 'C1');
INSERT INTO CaractLocal VALUES(40, '4023', 'C1');
INSERT INTO CaractLocal VALUES(22, '4028', 'C1');
INSERT INTO CaractLocal VALUES(11, '4008', 'C1');
INSERT INTO CaractLocal VALUES(14, '4008', 'C1');
INSERT INTO CaractLocal VALUES(24, '4008', 'C1');
INSERT INTO CaractLocal VALUES(38, '4008', 'C1');
INSERT INTO CaractLocal VALUES(40, '4008', 'C1');
INSERT INTO CaractLocal VALUES(11, '5026', 'C1');
INSERT INTO CaractLocal VALUES(14, '5026', 'C1');
INSERT INTO CaractLocal VALUES(22, '5026', 'C1');

INSERT INTO CaractLocal VALUES(07, '2018', 'D7');
INSERT INTO CaractLocal VALUES(11, '2018', 'D7');
INSERT INTO CaractLocal VALUES(14, '2018', 'D7');
INSERT INTO CaractLocal VALUES(43, '2018', 'D7');
INSERT INTO CaractLocal VALUES(02, '3001', 'D7');
INSERT INTO CaractLocal VALUES(11, '3001', 'D7');
INSERT INTO CaractLocal VALUES(14, '3001', 'D7');
INSERT INTO CaractLocal VALUES(02, '3002', 'D7');
INSERT INTO CaractLocal VALUES(11, '3002', 'D7');
INSERT INTO CaractLocal VALUES(14, '3002', 'D7');
INSERT INTO CaractLocal VALUES(02, '3007', 'D7');
INSERT INTO CaractLocal VALUES(11, '3007', 'D7');
INSERT INTO CaractLocal VALUES(02, '3009', 'D7');
INSERT INTO CaractLocal VALUES(11, '3009', 'D7');
INSERT INTO CaractLocal VALUES(02, '3010', 'D7');
INSERT INTO CaractLocal VALUES(11, '3010', 'D7');
INSERT INTO CaractLocal VALUES(14, '3010', 'D7');

--Cubicule
INSERT INTO CUBICULE VALUES(1, '5012', 'C1');
INSERT INTO CUBICULE VALUES(2, '5012', 'C1');
INSERT INTO CUBICULE VALUES(3, '5012', 'C1');

--Membre
INSERT INTO MEMBRE VALUES('guea0902', 'Guerard', 'Alexis', 2045);
INSERT INTO MEMBRE VALUES('bour0703', 'Bouchard', 'Raphael', 3698);
INSERT INTO MEMBRE VALUES('beab1234', 'Beaulieu', 'Bernard', 2045);
INSERT INTO MEMBRE VALUES('admi1234', 'User', 'Admin', 6994);

--Status
INSERT INTO STATUT VALUES (1,'Etudiant');
INSERT INTO STATUT VALUES (2,'Professeur');
INSERT INTO STATUT VALUES (3,'Personel de soutien');

--Status membre
INSERT INTO StatutMembre VALUES(1, 'guea0902');
INSERT INTO StatutMembre VALUES(1, 'bour0703');
INSERT INTO StatutMembre VALUES(2, 'beab1234');
INSERT INTO StatutMembre VALUES(3, 'admi1234');

--Status Privilege
INSERT INTO STATUT_Privilege VALUES('Reservez 24h a lavance' ,1);
INSERT INTO STATUT_Privilege VALUES('Reservez en tout temps' ,2);
INSERT INTO STATUT_Privilege VALUES('Annuler reservation' ,3);

--Reservation
INSERT INTO RESERVATION VALUES (1,'2021-09-28 08:00:00','2021-09-28 10:00:00','1007','C1','guea0902','Revision examen app2');
INSERT INTO RESERVATION VALUES (2,'2021-09-28 08:30:00','2021-09-28 10:00:00','2018','C1','bour0703','Big Data');
INSERT INTO RESERVATION VALUES (3,'2021-09-28 09:00:00','2021-09-28 10:00:00','2055','C1','admi1234','Data Mining');
INSERT INTO RESERVATION VALUES (4,'2021-09-28 10:00:00','2021-09-28 12:00:00','3014','C1','admi1234','Actionable Analytics');
INSERT INTO RESERVATION VALUES (5,'2021-09-28 11:00:00','2021-09-28 15:00:00','4019','C1','admi1234','Artificial Intelligence');
INSERT INTO RESERVATION VALUES (6,'2021-09-28 10:30:00','2021-09-28 16:00:00','4023','C1','admi1234','Machine Learning');
INSERT INTO RESERVATION VALUES (7,'2021-09-28 12:00:00','2021-09-28 18:45:00','3035','C1','admi1234','Personalization');
--UPDATE RESERVATION SET id_locaux = 2018 WHERE id_reservation = 1;
