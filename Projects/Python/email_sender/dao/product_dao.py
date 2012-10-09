from environment import Session
from model.models import Product
class ProductDAO:
    def get_all(self):
      return Session.query(Product).all()
