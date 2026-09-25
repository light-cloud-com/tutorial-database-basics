# Connect with psycopg and count the books.
# DATABASE_URL must end with ?sslmode=require
import os

import psycopg

with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
    (books,) = conn.execute("SELECT count(*) FROM books").fetchone()
    print(f"Connected from Python: {books} books")
