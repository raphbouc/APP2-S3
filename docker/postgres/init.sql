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
    id_Fonction INT NOT NULL,
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
    id_Pavillon VARCHAR(32) NOT NULL,
    id_Locaux VARCHAR(32) NOT NULL,
    Capacite INT NOT NULL,
    id_Fonction INT NOT NULL,
    Notes VARCHAR(1024),
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
    Date_debut TIMESTAMP NOT NULL,
    Date_fin TIMESTAMP NOT NULL,
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    Description VARCHAR(1024),
    PRIMARY KEY (id_Reservation),
    FOREIGN KEY (id_Locaux, id_Pavillon) REFERENCES LOCAL(id_Locaux, id_Pavillon),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE LOG
(
    id_Log SERIAL NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    Date TIMESTAMP NOT NULL,
    id_Reservation VARCHAR(128) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_Log),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip),
    FOREIGN KEY (id_Reservation) REFERENCES RESERVATION(id_Reservation)
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

    id_Caracte VARCHAR(128) NOT NULL,
    id_Locaux VARCHAR(32) NOT NULL,
    id_Pavillon VARCHAR(32) NOT NULL,
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

ALTER TABLE log
    DROP CONSTRAINT log_id_reservation_fkey,
    ADD CONSTRAINT log_id_reservation_fkey
        FOREIGN KEY (id_Reservation)
            REFERENCES reservation (id_Reservation)
            ON DELETE CASCADE;

