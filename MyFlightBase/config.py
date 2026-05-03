import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Settings, cls).__new__(cls)

            cls._instance.APPLICATION_VERSION = os.getenv("APPLICATION_VERSION", "1.0.0")
            cls._instance.TEST_MODE = os.getenv("TEST_MODE", "false").lower() == "true"
        return cls._instance

settings = Settings()