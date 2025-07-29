USE LittleLemon;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity(IN tableNum INT, OUT maxCap INT)
BEGIN
    SELECT Capacite INTO maxCap FROM Tables_Resto WHERE NumeroTable = tableNum;
END //

CREATE PROCEDURE AddBooking(
    IN pClientID INT,
    IN pTableID INT,
    IN pDate DATE,
    IN pHeureDebut TIME,
    IN pHeureFin TIME,
    IN pNombrePersonnes INT
)
BEGIN
    INSERT INTO Reservations(ClientID, TableID, DateReservation, HeureDebut, HeureFin, NombrePersonnes, Statut)
    VALUES(pClientID, pTableID, pDate, pHeureDebut, pHeureFin, pNombrePersonnes, 'En attente');
END //

DELIMITER ;
