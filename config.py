from os import getenv

class Config:
    DRUID_BASE_URL = getenv('DRUID_BASE_URL', 'http://localhost:8888/druid/v2/sql')
    