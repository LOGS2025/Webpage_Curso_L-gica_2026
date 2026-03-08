# flask --app .\tests\test_app.py run
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!"
