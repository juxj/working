import os
import os.path
import ConfigParser

class AppConfig:
    def __init__(self, file_name):
        self.config = {}
        self.file_name = file_name

    def load_config(self):
        config = ConfigParser.RawConfigParser()
        config.read(self.file_name)
        return config
