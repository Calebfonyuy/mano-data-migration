from read_data import *
from write_data import *
from configs import *
from db_connection import *

# Establish database connections
print("Getting source connection")
source = get_source_connection()
source2 = get_source_connection()
if source is not None and source2 is not None:
    print("Source connection works established...")
else:
    print("Unable to create source connection! exiting...")
    if source is not None:
        source.close()
    if source2 is not None:
        source2.close()
    exit()


print("Getting target connection")
target = get_target_connection()
if target is not None:
    print("target connection established....")
else:
    source.close()
    print("Unable to create target connection! Exiting...")

# Transfer data
print("Creating new site...")
site_id = write_target_site(target)

print("Copying site tables...")
tables = read_tables(source)
house_table_map = write_site_tables(target, tables, site_id)

print("Creating user types...")
user_type_map = write_user_types(target);

print("Copying users...")
users = read_users(source)
user_map = write_site_users(target, users, site_id, user_type_map)

print("Copying menu types...")
menu_types = read_menu_types(source)
menu_type_map = write_menu_types(target, menu_types, site_id)

print("Copying menu groups...")
menu_groups = read_menu_groups(source)
menu_group_map = write_menu_groups(target, menu_groups, site_id, menu_type_map)

print("Creating Item Types...")
item_type_map = create_item_types(target)

print("Copying articles...")
items = read_items(source) # should be passed to function
item_map = write_items(target, items, menu_type_map, menu_group_map, item_type_map)

print("Copying Stock...")
stock = read_stock(source)
write_item_stock(target, stock, item_map)

print("Create Payment mode...")
payment_mode = write_payment_mode(target)

print("Copying order information....")
copied = 0
for orders in read_command(source):
    write_orders(target, orders, site_id, item_map, user_map, house_table_map, payment_mode, read_command_elements, source2)
    copied += len(orders)
    print("\tCopied {} Orders".format(copied))


#close connections 
source.close()
target.close()
print("Data Migration complete!!!")