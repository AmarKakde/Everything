import mysql.connector


def db_connection():
    return mysql.connector.connect(user='root', password='root', host='127.0.0.1', database='pythondb')
    
def main():
    conx = db_connection()

    sql_query = ("Insert Into Emp (id, name, salary) values(%(id)s, %(name)s, %(salary)s)")

    data = {
        'id':10,
        'name':'John',
        'salary': 1500
    }

    with conx.cursor() as cursor:
        cursor.execute(sql_query, data)

        conx.commit()
    
    conx.close()

if __name__ == '__main__':
    main()
