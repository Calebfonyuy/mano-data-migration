from mysql import connector as con
from configs import source_db, target_db

def get_connection(db_config):
    connection = con.connect(
        host=db_config.get("host"),
        database=db_config.get("database"),
        user=db_config.get("username"),
        password=db_config.get("password")
    )
    if connection.is_connected():
        return connection
    else:
        return None


def get_source_connection():
    return get_connection(source_db)


def get_target_connection():
    return get_connection(target_db)


if __name__ == "__main__":
    print("Trying source connection")
    source = get_source_connection()
    if source is not None:
        print("Source connection works")
        print("Closing source connection....")
        source.close()
    else:
        print("Unable to create source connection!")


    print("Trying target connection")
    target = get_target_connection()
    if target is not None:
        print("target connection works")
        print("Closing target connection....")
        target.close()
    else:
        print("Unable to create target connection!")

