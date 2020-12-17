from flask import Flask
#Import the module
from sigscimodule import Middleware

application = Flask(__name__)
application.wsgi_app = Middleware(application.wsgi_app)
 
@application.route("/")
def hello():
    return """<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Signal Sciences">
        <meta name="author" content="Signal Sciences">
        <title>Lab-In-A-Box - Python Gunicorn</title>
    </head>
    <body>
        <p>Welcome to lab-in-a-box Python Gunicorn!</p>
    </body>
    </html>"""
 
if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)