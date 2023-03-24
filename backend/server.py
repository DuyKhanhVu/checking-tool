from eve import URL_PREFIX, Eve
from flask_session import Session
from flask_cors import CORS

from backend import settings
from core.query import query

app = Eve(settings=settings.rest_settings)

# App Session
app.secret_key = 'super secret key'
app.config.from_object(__name__)
Session(app)

CORS(app)

app.register_blueprint(query, url_prefix="/v1")


@app.route('/ping', methods=['GET'])
def ping():
    """
    This is an API support health check
    """
    return '{"msg": "pong"}'
