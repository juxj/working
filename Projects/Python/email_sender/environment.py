from util.db_engine import DBEngine
from util.app_config import AppConfig
# app configurations
config = AppConfig('config/config.ini').load_config()

# db engine
engine = DBEngine(config)
Session = engine.get_session()
