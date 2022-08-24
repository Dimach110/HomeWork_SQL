import configparser
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from models import *

if __name__ == '__main__':

    config = configparser.ConfigParser()
    config.read('settings/set.ini')
    login_db = config['Data_Base']['login']
    pass_db = config['Data_Base']['pass']

    DSN = f'postgresql://{login_db}:{pass_db}@localhost:5432/test3'

    engine = sql.create_engine(DSN)

    create_tables(engine)

    Session = sessionmaker(bind=engine)
    session = Session()

    nt1 = Publisher(name="Netology_University")
    nt2 = Publisher(name="Netology_School")
    nt3 = Publisher(name="PYH")

    b1 = Book(title="Вводная часть в Pyhton", id_publisher=2)
    b2 = Book(title="Pyhton", id_publisher=3)
    b3 = Book(title="SQL BD", id_publisher=1)
    b4 = Book(title="PostgreSQL", id_publisher=1)


    sh1 = Shop(name="My_shop")
    sh2 = Shop(name="Your_shop")
    sh3 = Shop(name="Лучший магазин")
    sh4 = Shop(name="Книжный магазин")

    st1 = Stock(id_book=1, id_shop=1, count=5)
    st2 = Stock(id_book=1, id_shop=2, count=4)
    st3 = Stock(id_book=1, id_shop=3, count=22)
    st4 = Stock(id_book=1, id_shop=4, count=10)
    st5 = Stock(id_book=2, id_shop=1, count=15)
    st6 = Stock(id_book=2, id_shop=3, count=11)
    st7 = Stock(id_book=3, id_shop=3, count=5)
    st8 = Stock(id_book=3, id_shop=4, count=3)
    st9 = Stock(id_book=4, id_shop=1, count=12)
    st10 = Stock(id_book=4, id_shop=2, count=10)
    st11 = Stock(id_book=4, id_shop=3, count=11)
    st12 = Stock(id_book=4, id_shop=4, count=8)

    sl1 = Sale(price=110, id_stock=5, count=2)
    sl2 = Sale(price=120, id_stock=8, count=5)
    sl3 = Sale(price=130, id_stock=10, count=7)

    session.add_all([nt1,nt2,nt3,b1,b2,b3,b4,sh1,sh2,sh3,sh4,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12,sl1,sl2,sl3])

    session.commit()

    # Задание 2
    # request = input("Введите имя издателя: ")
    # for r in session.query(Publisher).filter(Publisher.name.like(f"%{request}%")).all():
    #     print(r)

    # Задание 2 с выводом магазинов и количеством товара (усложнение)
    request = input("Введите имя издателя: ")
    for r in session.query(Publisher).filter(Publisher.name.like(f"%{request}%")).all():
        for b in session.query(Book).join(Book.publisher).filter(Publisher.id == r.id).all():
            for st in session.query(Stock).join(Stock.book).join(Stock.shop).filter(Stock.id_book == b.id).all():
                for sh in session.query(Shop).join(Stock.shop).filter(Stock.id == st.id).all():
                    print(f'Книга {b.title} издательства {r.name} доступна в магазине {sh.name} в количестве {st.count}')

    session.close()