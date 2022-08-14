import json

from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from models_task3 import *

DSN = 'postgresql://user1:psqluser1@localhost:5432/test3'

engine = sql.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()



# Задание 3
with open("tests_data.json","r", encoding="UTF-8") as f:
    data = json.load(f)
    for id, d in enumerate(data):
        if d["model"] == "publisher":
            locals()["d" + str(id)] = Publisher(id=d["pk"], name=d["fields"]["name"])
            session.add(locals()["d" + str(id)])
            print(f'{"d" + str(id)} = {(d["pk"], d["fields"]["name"])}')
        if d["model"] == "book":
            locals()["d" + str(id)] = Book(id=d["pk"], title=d["fields"]["title"],
                                           id_publisher=d["fields"]["id_publisher"])
            session.add(locals()["d" + str(id)])
            print(f'{"d" + str(id)} = {(d["pk"], d["fields"]["title"], d["fields"]["id_publisher"])}')
        if d["model"] == "shop":
            locals()["d" + str(id)] = Shop(id=d["pk"], name=d["fields"]["name"])
            session.add(locals()["d" + str(id)])
            print(f'{"d" + str(id)} = {(d["pk"], d["fields"]["name"])}')
        if d["model"] == "stock":
            locals()["d" + str(id)] = Stock(id=d["pk"], id_shop=d["fields"]["id_shop"],
                                            id_book=d["fields"]["id_book"], count=d["fields"]["count"])
            session.add(locals()["d" + str(id)])
            print(f'{"d" + str(id)} = {(d["pk"], d["fields"]["id_shop"],d["fields"]["id_book"], d["fields"]["count"])}')
        if d["model"] == "sale":
            locals()["d" + str(id)] = Sale(id=d["pk"], price=d["fields"]["price"],
                                            date_sale=d["fields"]["date_sale"], count=d["fields"]["count"],
                                           id_stock=d["fields"]["id_stock"])
            session.add(locals()["d" + str(id)])
            print(f'{"d" + str(id)} = {(d["pk"], d["fields"]["price"],d["fields"]["date_sale"], d["fields"]["count"], d["fields"]["id_stock"])}')


    session.commit()


session.close()