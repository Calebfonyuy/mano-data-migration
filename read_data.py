from mysql.connector import MySQLConnection

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
    data = cursor.fetchall()
    cursor.close()
    return data

def read_stock(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from stock")
    data = cursor.fetchall()
    cursor.close()
    return data

def read_stockdelivery(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from stockdelivery")
    data = cursor.fetchall()
    cursor.close()
    return data()

def read_command(con: MySQLConnection):
    cursor = con.cursor()
    cursor.execute("Select * from command")
    data = cursor.fetchmany(100)
    while len(data)>0:
        yield data
        data = cursor.fetchmany(100)
    cursor.close()

def read_command_elements(con: MySQLConnection, id):
    cursor = con.cursor()
    cursor.execute("Select * from commandelement where COMMAND_ID={}".format(id))
    data = cursor.fetchall()
    return data


if __name__ == "__main__":
    from db_connection import get_source_connection as get_con
    con = get_con()

    data = read_tables(con)
    item = list(data[0])
    print(item)
    id = 2
    entry = [
        item[0], id, item[1]
    ]
    item = tuple(entry)
    print(item)

    con.close()
