CREATE DATABASE IF NOT EXISTS LittleLemon;
USE LittleLemon;

CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telephone VARCHAR(20)
);

CREATE TABLE Tables_Resto (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroTable INT NOT NULL,
    Capacite INT NOT NULL
);

CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT NOT NULL,
    TableID INT NOT NULL,
    DateReservation DATE NOT NULL,
    HeureDebut TIME NOT NULL,
    HeureFin TIME NOT NULL,
    NombrePersonnes INT NOT NULL,
    Statut ENUM('Confirmée', 'Annulée', 'En attente') DEFAULT 'En attente',
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TableID) REFERENCES Tables_Resto(TableID)
);

-- Exemples d'insertion
INSERT INTO Clients (Nom, Prenom, Email, Telephone) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', '0123456789'),
('Martin', 'Claire', 'claire.martin@example.com', '0987654321');

INSERT INTO Tables_Resto (NumeroTable, Capacite) VALUES
(1, 4), (2, 2), (3, 6);

INSERT INTO Reservations (ClientID, TableID, DateReservation, HeureDebut, HeureFin, NombrePersonnes, Statut) VALUES
(1, 1, '2025-08-01', '19:00:00', '21:00:00', 4, 'Confirmée'),
(2, 3, '2025-08-01', '20:00:00', '22:00:00', 2, 'En attente');
