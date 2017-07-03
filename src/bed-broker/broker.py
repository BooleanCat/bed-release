import os
import json
from flask import Flask
from flask_basicauth import BasicAuth

def load_config():
    config_path = os.environ['BROKER_CONFIG']
    with open(config_path) as config_file:
      return json.load(config_file)

def setup_basic_auth(app):
    config = load_config()
    app.config['BASIC_AUTH_FORCE'] = True
    app.config['BASIC_AUTH_USERNAME'] = config['username']
    app.config['BASIC_AUTH_PASSWORD'] = config['password']
    return BasicAuth(app)

app = Flask(__name__)
basic_auth = setup_basic_auth(app)

@app.route('/ping')
def ping():
    return 'pong'

if __name__ == "__main__":
    app.run()
