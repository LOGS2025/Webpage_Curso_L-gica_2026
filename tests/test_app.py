# flask --app .\tests\test_app.py run
from flask import Flask
'''
If you have the debugger disabled or trust the users on your network, you can make the server publicly available simply by adding --host=0.0.0.0 to the command line:

    $ flask run --host=0.0.0.0

This tells your operating system to listen on all public IPs.
'''

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!"

if __name__ == "__main__":
    app.run(debug=True)