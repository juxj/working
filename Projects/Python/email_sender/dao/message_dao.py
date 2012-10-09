from environment import Session
from model.models import Message

class MessageDAO:
    def get_messages_in_queue (self):
      return Session.query(Message).all()
