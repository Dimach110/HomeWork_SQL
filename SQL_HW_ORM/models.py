import sqlalchemy as sql
from sqlalchemy.orm import declarative_base, relationship
import datetime

Base = declarative_base()

class Publisher(Base):
    __tablename__ = "publisher"
    id = sql.Column(sql.Integer, primary_key=True)
    name = sql.Column(sql.String(length=80), unique=True, nullable=False)

class Book(Base):
    __tablename__ = "book"
    id = sql.Column(sql.Integer, primary_key=True)
    title = sql.Column(sql.String(length=80), unique=True, nullable=False)
    id_publisher = sql.Column(sql.Integer, sql.ForeignKey("publisher.id"), nullable=False)
    publisher = relationship(Publisher, backref="book")
#
class Shop(Base):
    __tablename__ = "shop"
    id = sql.Column(sql.Integer, primary_key=True)
    name = sql.Column(sql.String(length=80), unique=True, nullable=False)

class Stock(Base):
    __tablename__ = "stock"
    id = sql.Column(sql.Integer, primary_key=True)
    id_book = sql.Column(sql.Integer, sql.ForeignKey("book.id"), nullable=False)
    id_shop = sql.Column(sql.Integer, sql.ForeignKey("shop.id"), nullable=False)
    book = relationship(Book, backref="stock")
    shop = relationship(Shop, backref="stock")

class Sale(Base):
    __tablename__ = "sale"
    id = sql.Column(sql.Integer, primary_key=True)
    price = sql.Column(sql.Integer, nullable=False)
    # date_sale = sql.Column(sql.DateTime, default=datetime.datetime.utcnow)
    date_sale = sql.Column(sql.String(length=10), nullable=False)
    id_stock = sql.Column(sql.Integer, sql.ForeignKey("stock.id"), nullable=False)
    count = sql.Column(sql.Integer, nullable=False)
    stock = relationship(Stock, backref="sale")
#
def create_tables(engine):
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)

