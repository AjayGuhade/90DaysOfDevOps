from flask import Flask, request, jsonify
import psycopg2
import os
import time

app = Flask(__name__)

time.sleep(5)

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD")
)

cur = conn.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS notes (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);
""")

conn.commit()
cur.close()

@app.route("/notes", methods=["GET"])
def get_notes():
    cur = conn.cursor()
    cur.execute("SELECT * FROM notes;")
    rows = cur.fetchall()
    cur.close()
    return jsonify(rows)

@app.route("/notes", methods=["POST"])
def add_note():
    data = request.json
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO notes (content) VALUES (%s);",
        (data["content"],)
    )
    conn.commit()
    cur.close()
    return {"message": "Note added"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)