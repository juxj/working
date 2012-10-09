import ConfigParser

class AppConfig:

    def __init__(self):
        self.config = {}

    def load(self, config_file):
        config = ConfigParser.RawConfigParser()
        config.read(config_file)
        return config
