CREATE TABLE Campus
(
    id_Campus INT NOT NULL,
    CampusNom VARCHAR(64) NOT NULL,
    PRIMARY KEY (id_Campus)
);

CREATE TABLE CARACTERISTIQUE
(
    id_Caracte INT NOT NULL,
    CaracteNom VARCHAR(64) NOT NULL,
    Quantite INT NOT NULL,
    PRIMARY KEY (id_Caracte)
);

CREATE TABLE STATUT
(
    id_Statut INT NOT NULL,
    StatutNom VARCHAR(75) NOT NULL,
    PRIMARY KEY (id_Statut)
);

CREATE TABLE Fonction
(
    id_Fonction INT NOT NULL,
    FonctionNom VARCHAR(64) NOT NULL,
    PRIMARY KEY (id_Fonction)
);

CREATE TABLE STATUT_Privilege
(
    Privilege VARCHAR(250) NOT NULL,
    id_Statut INT NOT NULL,
    PRIMARY KEY (Privilege, id_Statut),
    FOREIGN KEY (id_Statut) REFERENCES STATUT(id_Statut)
);

CREATE TABLE PAVILLON
(
    id_Pavillon VARCHAR(8) NOT NULL,
    PavillonNom VARCHAR(255) NOT NULL,
    id_Campus INT NOT NULL,
    PRIMARY KEY (id_Pavillon),
    FOREIGN KEY (id_Campus) REFERENCES Campus(id_Campus)
);

CREATE TABLE DEPARTEMENT
(
    id_Departement INT NOT NULL,
    DepartementNom VARCHAR(64) NOT NULL,
    id_Pavillon VARCHAR(8) NOT NULL,
    PRIMARY KEY (id_Departement),
    FOREIGN KEY (id_Pavillon) REFERENCES PAVILLON(id_Pavillon)
);

CREATE TABLE MEMBRE
(
    Cip VARCHAR(8) NOT NULL,
    Nom VARCHAR(64) NOT NULL,
    Prenom VARCHAR(64) NOT NULL,
    id_Departement INT NOT NULL,
    PRIMARY KEY (Cip),
    FOREIGN KEY (id_Departement) REFERENCES DEPARTEMENT(id_Departement)
);

CREATE TABLE StatutMembre
(
    id_Statut INT NOT NULL,
    Cip VARCHAR(8) NOT NULL,
    PRIMARY KEY (id_Statut, Cip),
    FOREIGN KEY (id_Statut) REFERENCES STATUT(id_Statut),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE LOCAL
(
    Capacite INT NOT NULL,
    Notes VARCHAR(64),
    id_Local VARCHAR(8) NOT NULL,
    numCubicule INT NOT NULL,
    id_Pavillon VARCHAR(8) NOT NULL,
    id_Fonction INT NOT NULL,
    Compose_id_Local VARCHAR(8),
    numCubicule INT,
    id_Pavillon VARCHAR(8),
    PRIMARY KEY (id_Local, numCubicule, id_Pavillon),
    FOREIGN KEY (id_Pavillon) REFERENCES PAVILLON(id_Pavillon),
    FOREIGN KEY (id_Fonction) REFERENCES Fonction(id_Fonction),
    FOREIGN KEY (Compose_id_Local, numCubicule, id_Pavillon) REFERENCES LOCAL(id_Local, numCubicule, id_Pavillon)
);

CREATE TABLE RESERVATION
(
    id_Reservation INT NOT NULL,
    Date_debut DATE NOT NULL,
    Date_fin DATE NOT NULL,
    Description VARCHAR(255),
    id_Local VARCHAR(8) NOT NULL,
    numCubicule INT NOT NULL,
    id_Pavillon VARCHAR(8) NOT NULL,
    Cip VARCHAR(8) NOT NULL,
    PRIMARY KEY (id_Reservation),
    FOREIGN KEY (id_Local, numCubicule, id_Pavillon) REFERENCES LOCAL(id_Local, numCubicule, id_Pavillon),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE LOG
(
    id_Log INT NOT NULL,
    Description VARCHAR(64) NOT NULL,
    Date DATE NOT NULL,
    id_Reservation INT NOT NULL,
    Cip VARCHAR(8) NOT NULL,
    PRIMARY KEY (id_Log),
    FOREIGN KEY (id_Reservation) REFERENCES RESERVATION(id_Reservation),
    FOREIGN KEY (Cip) REFERENCES MEMBRE(Cip)
);

CREATE TABLE CaractLocal
(
    id_Local VARCHAR(8) NOT NULL,
    numCubicule INT NOT NULL,
    id_Pavillon VARCHAR(8) NOT NULL,
    id_Caracte INT NOT NULL,
    PRIMARY KEY (id_Local, numCubicule, id_Pavillon, id_Caracte),
    FOREIGN KEY (id_Local, numCubicule, id_Pavillon) REFERENCES LOCAL(id_Local, numCubicule, id_Pavillon),
    FOREIGN KEY (id_Caracte) REFERENCES CARACTERISTIQUE(id_Caracte)
);
