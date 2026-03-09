from flask import Flask
import psycopg2
import redis
import os

app = Flask(__name__)

db_host = os.getenv("DB_HOST")
redis_host = os.getenv("REDIS_HOST")

@app.route("/")
def hello():

    db_status = "Not connected"
    cache_status = "Not connected"

    try:
        conn = psycopg2.connect(
            host=db_host,
            database="devopsdb",
            user="devops",
            password="devops"
        )
        db_status = "Connected to Postgres"
    except:
        pass

    try:
        r = redis.Redis(host=redis_host, port=6379)
        r.ping()
        cache_status = "Connected to Redis"
    except:
        pass

    return f"""
    <h1>Hello from Docker Compose 🚀</h1>
    <p>{db_status}</p>
    <p>{cache_status}</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)