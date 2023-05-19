DROP SCHEMA IF EXISTS App2S3 cascade;
CREATE schema App2S3;
set search_path = App2S3, pg_catalog;


CREATE TABLE Campus
(
    id_Campus VARCHAR(32) NOT NULL,
    CampusNom VARCHAR(128) NOT NULL,
    PRIMARY KEY (id_Campus)
);

CREATE TABLE CARACTERISTIQUE
(
    id_Caracte VARCHAR(128) NOT NULL,
    CaracteNom VARCHAR(512) NOT NULL,
    --Quantite INT NOT NULL,
    PRIMARY KEY (id_Caracte)
);

CREATE TABLE STATUT
(
    id_Statut VARCHAR(32) NOT NULL,
    StatutNom VARCHAR(128) NOT NULL,
    PRIMARY KEY (id_Statut)
);

CREATE TABLE Fonction
(
    id_Fonction VARCHAR(32) NOT NULL,
    FonctionNom VARCHAR(128) NOT NULL,
    PRIMARY KEY (id_Fonction)
);

CREATE TABLE STATUT_Privilege
(
    Privilege VARCHAR(1024) NOT NULL,
    id_Statut VARCHAR(32) NOT NULL,
    PRIMARY KEY (Privilege, id_Statut),
    FOREIGN KEY (id_Statut) REFERENCES STATUT(id_Statut)
);

CREATE TABLE PAVILLON
(
    id_Pavillon VARCHAR(32) NOT NULL,
    PavillonNom VARCHAR(128) NOT NULL,
    id_Campus VARCHAR(32) NOT NULL,
    PRIMARY KEY (id_Pavillon),
    FOREIGN KEY (id_Campus) REFERENCES Campus(id_Campus)
);

CREATE TABLE DEPARTEMENT
(
    id_Departement VARCHAR(32) NOT NULL,
    DepartementNom VARCHAR(128) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    PRIMARY KEY (id_Departement),
    FOREIGN KEY (id_Pavillon) REFERENCES PAVILLON(id_Pavillon)
);

CREATE TABLE LOCAL
(
    Capacite INT NOT NULL,
    Notes VARCHAR(1024),
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    id_Fonction VARCHAR(32) NOT NULL,
    PRIMARY KEY (id_Locaux, id_Pavillon),
    FOREIGN KEY (id_Pavillon) REFERENCES PAVILLON(id_Pavillon),
    FOREIGN KEY (id_Fonction) REFERENCES Fonction(id_Fonction)
);

CREATE TABLE MEMBRE
(
    Cip VARCHAR(16) NOT NULL,
    Nom VARCHAR(32) NOT NULL,
    Prenom VARCHAR(32) NOT NULL,
    id_Departement VARCHAR(32) NOT NULL,
    PRIMARY KEY (Cip),
    FOREIGN KEY (id_Departement) REFERENCES DEPARTEMENT(id_Departement)
);

CREATE TABLE RESERVATION
(
    id_Reservation VARCHAR(128) NOT NULL,
    Date_debut DATE NOT NULL,
    Date_fin DATE NOT NULL,
    Description VARCHAR(1024),
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_Reservation),
    FOREIGN KEY (id_Locaux, id_Pavillon) REFERENCES LOCAL(id_Locaux, id_Pavillon),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE LOG
(
    id_Log VARCHAR(32) NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    Date DATE NOT NULL,
    id_Reservation VARCHAR(128) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_Log),
    FOREIGN KEY (id_Reservation) REFERENCES RESERVATION(id_Reservation),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE CUBICULE
(
    numCubile INT NOT NULL,
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    PRIMARY KEY (numCubile, id_Locaux, id_Pavillon),
    FOREIGN KEY (id_Locaux, id_Pavillon) REFERENCES LOCAL(id_Locaux, id_Pavillon)
);

CREATE TABLE CaractLocal
(
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    id_Caracte VARCHAR(128) NOT NULL,
    PRIMARY KEY (id_Locaux, id_Pavillon, id_Caracte),
    FOREIGN KEY (id_Locaux, id_Pavillon) REFERENCES LOCAL(id_Locaux, id_Pavillon),
    FOREIGN KEY (id_Caracte) REFERENCES CARACTERISTIQUE(id_Caracte)
);

CREATE TABLE StatutMembre
(
    id_Statut VARCHAR(32) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_Statut, Cip),
    FOREIGN KEY (id_Statut) REFERENCES STATUT(id_Statut),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

INSERT INTO CARACTERISTIQUE VALUES (0, 'Connexion à Internet');
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
