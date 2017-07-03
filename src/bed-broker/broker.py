from flask import Flask
from flask_basicauth import BasicAuth

def setup_basic_auth(app):
    app.config['BASIC_AUTH_FORCE'] = True
    app.config['BASIC_AUTH_USERNAME'] = 'foo'
    app.config['BASIC_AUTH_PASSWORD'] = 'bar'
    return BasicAuth(app)

app = Flask(__name__)
basic_auth = setup_basic_auth(app)

@app.route('/ping')
def ping():
    return 'pong'

if __name__ == "__main__":
    app.run()
