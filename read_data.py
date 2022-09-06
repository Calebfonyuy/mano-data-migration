from mysql.connector import MySQLConnection
from db_connection import get_source_connection as get_con

def read_users(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("select * from person")
    data = cursor.fetchall()
    cursor.close()
    return data

def read_user_connections(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from userconnection")
    data = cursor.fetchmany(10)
    while len(data)>0:
        print(data)
        yield data
        data = cursor.fetchmany(10)
    cursor.close()

def read_tables(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("select * from housetable")
    data = cursor.fetchall()
    cursor.close()
    return data

def read_menu_types(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("select * from menutype")
    data = cursor.fetchall()
    cursor.close()
    return data

def read_menu_groups(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("select * from menugroup")
    data = cursor.fetchall()
    cursor.close()
    return data

def read_items(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from element")
    data = cursor.fetchmany(10)
    while len(data)>0:
        print(data)
        yield data
        data = cursor.fetchmany(10)
    cursor.close()

def read_stock(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from stock")
    data = cursor.fetchmany(10)
    while len(data)>0:
        print(data)
        yield data
        data = cursor.fetchmany(10)
    cursor.close()

def read_stockdelivery(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from stockdelivery")
    data = cursor.fetchmany(10)
    while len(data)>0:
        print(data)
        yield data
        data = cursor.fetchmany(10)
    cursor.close()

def read_command(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from element")
    data = cursor.fetchmany(10)
    while len(data)>0:
        print(data)
        yield data
        data = cursor.fetchmany(10)
    cursor.close()

def read_command_elements(con: MySQLConnection, id):
    cursor = con.cursor()
    cursor.execute("Select * from commandelement where COMMAND_ID="+id)
    data = cursor.fetchall()
    return data


if __name__ == "__main__":
    con = get_con()

    # data = read_tables(con)
    # print(data)
    # data = read_menu_types(con)
    # print(data)
    # data = read_menu_groups(con)
    # print(data)
    for data in read_user_connections(con):
        print(data)

    con.close()
