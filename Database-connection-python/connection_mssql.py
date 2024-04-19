import pyodbc

def db_connection():
    return f'DRIVER={{SQL Server}}; SERVER=DESKTOP-6HPCUBT; DATABASE=Db1; UID=admin-amar; PWD=root'

def main():
    cnxString = db_connection() 
    conn = pyodbc.connect(cnxString)

    with conn.cursor() as cursor:
        cursor.execute('Select * From tblemployee')
        data = cursor.fetchall()
        print(data)

if __name__ == "__main__":
    main()
