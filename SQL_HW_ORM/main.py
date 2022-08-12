import sqlalchemy as sql
from sqlalchemy.orm import sessionmaker
from models import create_tables

DSN = 'postgresql://user1:psqluser1@localhost:5432/test3'

engine = sql.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()

session.close()