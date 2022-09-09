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
    cors = {}
    for table in tables:
        entry = list(table)
        cursor.execute(query.format(site_id, entry[1]))
        cors[entry[0]] = cursor.lastrowid
        con.commit()
    
    cursor.close()
    return cors

def write_user_types(con: MySQLConnection):
    query = 'insert into user_types(label, is_admin, stock, orders, menu, users, cancel_order) '
    query += 'values("{}", {}, {}, {}, {}, {}, {}, NOW(), NOW());'
    cursor = con.cursor()
    id_maps = {}
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

def write_site_users(con: MySQLConnection, users: List, site_id: int, user_type_map: List):
    query = 'insert into users(site_id, user_type_id, name, surname, contact, address, username, password, gender) '
    query += 'values({}, {}, "{}", "{}", "{}", "{}", "{}", "{}", "{}")'

    cursor = con.cursor()
    user_id_map = {}
    for user in users:
        entry = list(user)
        user_type = int(user_type_map[entry[8]])
        entry[7] = '00000000' if entry[7] is None  else entry[7]
        entry[1] = 'YAOUNDE' if entry[1] is None else entry[1]
        entry[2] = 'MASCULIN' if entry[2]==0  else 'FEMININ'
        
        cursor.execute(query.format(
            site_id, user_type, entry[3], entry[6],
            entry[7], entry[1], entry[9], entry[4],
            entry[2]
        ))
        user_id_map[entry[0]] = cursor.lastrowid
        con.commit()

    return user_id_map


def write_menu_types(con: MySQLConnection, menu_types: List, site_id: int):
    query = 'insert into menu_types(site_id, name, created_at, update_at) values({}, "{}", NOW(), NOW())'
    
    menu_type_map = {}
    cursor = con.cursor()
    for type in menu_types:
        cursor.execute(query.format(site_id, type[1]))
        menu_type_map[type[0]] = cursor.lastrowid
    
    return menu_type_map

def write_menu_groups(con: MySQLConnection, menu_groups: List, site_id: int, menu_type_map: List):
    query = 'insert into menu_groups(site_id, menu_type_id, name, created_at, update_at) values({},{},"{}", NOW(), NOW())'

    menu_group_map = {}
    cursor = con.cursor()
    for group in menu_groups:
        type_id = int(menu_type_map[group[2]])
        cursor.execute(query.format(site_id, type_id, group[1]))
        menu_group_map[group[0]] = cursor.lastrowid

    return menu_group_map

def create_item_types(con: MySQLConnection):
    query = 'insert into item_types(name, created_at, deleted_at) values("{}", NOW(), NOW())'

    cursor = con.cursor()
    item_type_map = {}
    #FOOD
    cursor.execute(query.format('NOURITURE'))
    item_type_map[0] = cursor.lastrowid
    #DRINKS
    cursor.execute(query.format('BOISSONS'))
    item_type_map[1] = cursor.lastrowid
    #FORMULAS
    cursor.execute(query.format('FORMULES'))
    item_type_map[2] = cursor.lastrowid

    return item_type_map

def write_items(con: MySQLConnection, items: List, site_id: int, menu_type_map: List, menu_group_map: List, item_type_map: List):
    pass


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
