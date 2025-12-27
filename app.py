from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def hello():
    return f"Hello from pod {socket.gethostname()}"

@app.route("/health")
def health():
    return "OK", 200

@app.route("/ready")
def ready():
    return "READY", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
