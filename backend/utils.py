from loguru import logger
from config import Config


def process_json(request):
    """
    If the request has a Content-type header of application/json, then the body of the request is parsed
    as JSON and returned
    
    :param request: The request object that contains the data
    :return: The body of the request.
    """
    content_type = request.headers.get('Content-type')
    body = {}
    if content_type == 'application/json':
        body = request.json

    return body
