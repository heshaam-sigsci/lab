from flask import Flask
#Import the module
from sigscimodule import Middleware

app = Flask(__name__)
app.wsgi_app = Middleware(app.wsgi_app)
 
@app.route("/")
def hello():
    return """<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Signal Sciences">
        <meta name="author" content="Signal Sciences">
        <title>Lab-In-A-Box - Python</title>
    </head>
    <body>
        <p>Welcome to lab-in-a-box Python!</p>
    </body>
    </html>"""
 
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)