import requests
from loguru import logger
from flask import Blueprint, request
from backend import utils
from config import Config

query = Blueprint('query', __name__)


@query.route('/query', methods=["POST"])
def execute_query():
    body = utils.process_json(request)
    logger.info(f"Submit query: {body}")
    res = requests.post(url=Config.DRUID_BASE_URL,json=body)

    return res.json(), res.status_code
