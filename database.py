import mysql.connector

class LittleLemonDB:
    def __init__(self, host='localhost', user='root', password='', database='LittleLemon'):
        self.conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.conn.cursor()

    def get_max_quantity(self, table_num):
        max_cap = 0
        self.cursor.callproc('GetMaxQuantity', [table_num, max_cap])
        # callproc returns no result, so fetch output param manually:
        for result in self.cursor.stored_results():
            res = result.fetchone()
            if res:
                max_cap = res[0]
        return max_cap

    def add_booking(self, client_id, table_id, date_res, heure_debut, heure_fin, nb_personnes):
        self.cursor.callproc('AddBooking', [
            client_id, table_id, date_res, heure_debut, heure_fin, nb_personnes
        ])
        self.conn.commit()

    def close(self):
        self.cursor.close()
        self.conn.close()

# Exemple d'utilisation
if __name__ == "__main__":
    db = LittleLemonDB(user='root', password='ton_mot_de_passe')
    print("Capacité max table 1:", db.get_max_quantity(1))
    db.add_booking(1, 2, '2025-08-15', '18:00:00', '20:00:00', 2)
    db.close()
