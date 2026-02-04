from flask import Flask

app = Flask(__name__)

@app.get("/")
def index():
    return """
    <html>
      <head><title>Unbound DNS UI</title></head>
      <body style="font-family: sans-serif; padding: 24px;">
        <h1>Unbound DNS UI</h1>
        <p>UI container is running.</p>
        <p>Next: settings form + apply.</p>
      </body>
    </html>
    """
