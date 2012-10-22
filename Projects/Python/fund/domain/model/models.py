from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Fund(Base):
    __tablename__ = 'fund'

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
