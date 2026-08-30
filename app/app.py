from flask import Flask, jsonify, render_template
import os

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "service": "secure-devsecops-app"
    })


@app.route("/api/info")
def info():
    return jsonify({
        "application": "Secure DevSecOps Pipeline",
        "version": os.getenv("APP_VERSION", "1.0.0"),
        "environment": os.getenv("APP_ENV", "development")
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
