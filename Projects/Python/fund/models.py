from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
class Message(Base):
    __tablename__ = 'message'

    id=Column(String, primary_key=True)
    receiver =  Column(String)
    subject = Column(String)
    body = Column(String)
    send_time = Column(DateTime)
    click_time = Column(DateTime)

    def __init__(self, receiver, subject, body, send_time, click_time):
        self.receiver = receiver
        self.subject = subject
        self.body = body
        self.send_time = send_time 
        self.click_time = click_time


class Product(Base):
    __tablename__ = 'product'
    
    id=Column(String, primary_key=True)
    short_name=Column(String)
    full_name=Column(String)
    unit_price=Column(Integer)

    def __init__(self, short_name, full_name, unit_price):
        self.short_name = short_name
        self.full_name = full_name
        self.unit_price = unit_price
