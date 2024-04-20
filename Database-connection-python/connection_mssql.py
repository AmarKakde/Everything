import pyodbc
import time
import os
import csv

def db_connection():
    return f'Trusted_Connection=yes;DRIVER={{SQL Server}};SERVER={servername}; DATABASE={DB};'

def display_employee(conn):

    with conn.cursor() as cursor:
        cursor.execute('Select * From tblEmployee')
        data = cursor.fetchall()
        print(data)

FILEPATH = r'Filepath'
def upload_data_48471(conn):
    with open(os.path.join(FILEPATH, 'temperature.csv')) as fp:
        reader = csv.reader(fp)
        columns = next(reader)
        with conn.cursor() as cursor:
            for row in reader:
                query = f'Insert Into temp1 ({columns[0]},{columns[1]}, {columns[2]}, {columns[3]}, {columns[4]}, {columns[5]}, {columns[6]}, {columns[7]}, {columns[8]}, {columns[9]}) values(?,?,?,?,?,?,?,?,?,?)'
                cursor.execute(query, (row[0],row[1], row[2], row[3], row[4],row[5], row[6], row[7], row[8], row[9]))
                cursor.commit()

def bulk_upload(conn):
    sql = """
        BULK INSERT temp2
        FROM 'filepath' WITH (
            FIRSTROW=2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='0x0a'
            );
        """
    with conn.cursor() as cursor:
        cursor.execute(sql)


def main():
    cnxString = db_connection() 
    print(cnxString)

    conn = pyodbc.connect(cnxString)
    start = time.time()
    # upload_data_48471(conn)
    bulk_upload(conn)
    end = time.time()
    conn.close()

    timetaken =end-start
    print(f'time take to upload data = {timetaken}')

if __name__ == "__main__":
    main()
