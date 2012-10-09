import smtplib
from email.mime.text import MIMEText

class EmailUtil:
    def __init__(self, config):
        self.host = config.get('smtp','host')
        self.user = config.get('smtp','user')
        self.password = config.get('smtp', 'password')
        self.smtp = self.get_connection()

    def get_connection(self):
        smtp = smtplib.SMTP()
        smtp.connect(self.host)
        smtp.login(self.user, self.password)
        return smtp

    def send(self, sender,  receiver, subject, messages):
        content = MIMEText(messages, 'html')
        content['Subject'] = subject
        content['From'] = sender
        content['To'] = receiver 
        self.smtp.sendmail(sender, receiver,content.as_string())
        result = True
    def close(self):
        self.smtp.close() 
