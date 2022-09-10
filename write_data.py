from calendar import c
from typing import List
from mysql.connector import MySQLConnection
from configs import target_site

def write_target_site(con: MySQLConnection):
    query = 'insert into sites(name, address, currency, contact, slogan, immatriculation, logo)'
    query += ' values("{}", "{}", "{}", "{}", "{}", "{}", "{}");'
    cursor = con.cursor()
    cursor.execute(query.format(
        target_site.get("name"),
        target_site.get("address"),
        target_site.get("currency"),
        target_site.get("contact"),
        target_site.get("slogan"),
        target_site.get("immatriculation"),
        target_site.get("logo"),
    ))
    con.commit()
    id = cursor.lastrowid
    cursor.close()
    return id

def write_site_tables(con: MySQLConnection, tables: List, site_id: int):
    query = 'insert into house_tables(site_id, name, created_at, updated_at) values({}, "{}", NOW(), NOW());'
    cursor = con.cursor()
    table_map = {}
    con.start_transaction()
    for table in tables:
        entry = list(table)
        cursor.execute(query.format(site_id, entry[1]))
        table_map[entry[0]] = cursor.lastrowid
    
    con.commit()
    cursor.close()
    return table_map

def write_user_types(con: MySQLConnection):
    query = 'insert into user_types(label, is_admin, stock, orders, menu, users, cancel_order, created_at, updated_at) '
    query += 'values("{}", {}, {}, {}, {}, {}, {}, NOW(), NOW());'
    cursor = con.cursor()
    id_maps = {}
    con.start_transaction()
    #Admin
    cursor.execute(query.format('ADMINISTRATEUR', 1, 1, 1,1 ,1 ,1))
    id_maps[0] = cursor.lastrowid
    #CASHIER
    cursor.execute(query.format('CAISSIER', 0, 1, 1,1 ,0, 1))
    id_maps[1] = cursor.lastrowid
    #SERVANT
    cursor.execute(query.format('SERVANT', 0, 0, 1,1 ,0 ,1))
    id_maps[2] = cursor.lastrowid

    con.commit()
    cursor.close()
    return id_maps

def write_site_users(con: MySQLConnection, users: List, site_id: int, user_type_map: dict):
    query = 'insert into users(site_id, user_type_id, name, surname, contact, address, username, password, gender) '
    query += 'values({}, {}, "{}", "{}", "{}", "{}", "{}", "{}", "{}")'

    cursor = con.cursor()
    user_id_map = {}
    con.start_transaction()
    for user in users:
        entry = list(user)
        user_type = int(user_type_map[entry[8]])
        username = entry[3]+entry[6]
        username = username.lower() if entry[9] is None else entry[9]
        entry[7] = '00000000' if entry[7] is None  else entry[7]
        entry[1] = 'YAOUNDE' if entry[1] is None else entry[1]
        entry[2] = 'MASCULIN' if entry[2]==0  else 'FEMININ'
        
        cursor.execute(query.format(
            site_id, user_type, entry[3], entry[6],
            entry[7], entry[1], username, entry[4],
            entry[2]
        ))
        user_id_map[entry[0]] = cursor.lastrowid
    
    con.commit()
    cursor.close()

    return user_id_map


def write_menu_types(con: MySQLConnection, menu_types: List, site_id: int):
    query = 'insert into menu_types(site_id, name, created_at, updated_at) values({}, "{}", NOW(), NOW())'
    
    menu_type_map = {}
    cursor = con.cursor()
    con.start_transaction()
    for type in menu_types:
        cursor.execute(query.format(site_id, type[1]))
        menu_type_map[type[0]] = cursor.lastrowid
    
    con.commit()
    cursor.close()
    
    return menu_type_map

def write_menu_groups(con: MySQLConnection, menu_groups: List, site_id: int, menu_type_map: dict):
    query = 'insert into menu_groups(site_id, menu_type_id, name, created_at, updated_at) values({},{},"{}", NOW(), NOW())'

    menu_group_map = {}
    cursor = con.cursor()
    con.start_transaction()
    for group in menu_groups:
        type_id = int(menu_type_map[group[2]])
        cursor.execute(query.format(site_id, type_id, group[1]))
        menu_group_map[group[0]] = cursor.lastrowid
        
    con.commit()
    cursor.close()

    return menu_group_map

def create_item_types(con: MySQLConnection):
    query = 'insert into item_types(name, created_at, updated_at) values("{}", NOW(), NOW())'

    cursor = con.cursor()
    item_type_map = {}
    con.start_transaction()
    #FOOD
    cursor.execute(query.format('NOURITURE'))
    item_type_map[0] = cursor.lastrowid
    #DRINKS
    cursor.execute(query.format('BOISSONS'))
    item_type_map[1] = cursor.lastrowid
    #FORMULAS
    cursor.execute(query.format('FORMULES'))
    item_type_map[2] = cursor.lastrowid
    
    con.commit()
    cursor.close()

    return item_type_map

def write_items(con: MySQLConnection, items: List, menu_type_map: dict, menu_group_map: dict, item_type_map: dict):
    query = 'insert into items(menu_type_id, menu_group_id, item_type_id, name, description, price, stock) '
    query += 'values({}, {}, {}, "{}", "{}", {}, 0);'

    cursor = con.cursor()
    item_map = {}
    con.start_transaction()
    for item in items:
        item_type = int(item_type_map[item[2]])
        menu_type = int(menu_type_map[item[6]])
        menu_group = 'NULL'
        if item[5] is not None:
            int(menu_group_map[item[5]])
        cursor.execute(query.format(
            menu_type, menu_group, item_type,
            item[3], item[1], item[4]
        ))
        item_map[item[0]] = cursor.lastrowid
        
    con.commit()
    cursor.close()
    
    return item_map

def write_item_stock(con: MySQLConnection, stocks: List, item_map: dict):
    query = 'insert into stocks(item_id, last_delivery, quantity) values({}, "{} 12:00:00", {});'
    update = 'update items set stock=1 where id={};'

    cursor = con.cursor()
    con.start_transaction()
    for stock in stocks:
        if stock[1] is None: # Item stock is not managed
            continue
        
        item = int(item_map[stock[2]])
        cursor.execute(update.format(item))
        cursor.execute(query.format(item, stock[0], stock[2]))

    con.commit()

def write_payment_mode(con: MySQLConnection):
    query = 'insert into payment_modes(name, created_at, deleted_at) values("{}", NOW(), NOW())'

    cursor = con.cursor()
    con.start_transaction()
    
    cursor.execute(query.format('ESPECES'))
    id = cursor.lastrowid
    
    con.commit()
    cursor.close()

    return id

def write_orders(con: MySQLConnection, orders: List, site_id: int, item_map: dict, user_map: dict, table_map: dict, payment_mode: int, order_details: callable, source: MySQLConnection):
    query = 'insert into orders(site_id, user_id, house_table_id, name, order_date, serving_mode, discount, paid, served, served_by) '
    query += 'values({}, {}, {}, "{}", "{}", {}, {}, {}, {}, {});'

    iquery = 'insert into order_items(order_id, item_id, price, quantity) values({}, {}, {}, {});'
    
    pquery = 'insert into payments(order_id, payment_mode_id, user_id, amount, payment_date) '
    pquery += 'values({}, {}, {}, {},"{}");'

    cursor = con.cursor()
    con.start_transaction()
    for order in orders:
        order_items = order_details(source, int(order[0]))
        table = int(table_map[order[10]])
        serving_mode = int(order[6])-1
        user_id = int(user_map[order[8]])
        server_id = int(user_map[order[9]])
        paid = int(order[5])
        cursor.execute(query.format(
            site_id, user_id, table, 
            order[2], order[3], serving_mode,
            order[1], paid, int(order[7]), server_id
        ))
        order_id = cursor.lastrowid
        price = 0
        for item in order_items:
            item_id = int(item_map[item[3]])
            price += int(item[0]) * item[1]
            cursor.execute(iquery.format(
                order_id, item_id, int(item[0]), item[1]
            ))
        
        if paid:
            paid_val = price - price*0.01*order[1]
            cursor.execute(pquery.format(
                order_id, payment_mode, user_id, paid_val, order[4]
            ))

    con.commit()
    cursor.close()


if __name__ == "__main__":
    from db_connection import get_target_connection as get_con
    from db_connection import get_source_connection as get_scon
    from read_data import read_tables
    con = get_con()
    scon = get_scon()

    id = write_target_site(con)
    print(id)
    tables = read_tables(scon)
    new_tables = write_site_tables(con, tables, id)
    
    print(new_tables)

    con.close()
    scon.commit()
