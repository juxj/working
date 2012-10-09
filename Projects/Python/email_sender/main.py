#!/usr/bin/env python
from dao.product_dao import ProductDAO
from dao.message_dao import MessageDAO
from util.email_util import EmailUtil
from environment import config

class Main:
    def __init__(self):
        self.email = EmailUtil(config)

    def __get_message_list(self):
        dao = MessageDAO()
        return dao.get_messages_in_queue()  

    def run(self):
        for instance in self.get_message_list():
            self.email.send('Tony Ju<tony.ju@163.com>', instance.receiver,\
                 instance.subject, instance.body)
        self.email.close()

if __name__ == '__main__':
    main = Main()
    main.run()
