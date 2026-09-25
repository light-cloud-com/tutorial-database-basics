# Database basics on Light Cloud

Sample data and connection examples for the Light Cloud database tutorials. Each tutorial in the series builds on this small bookshop database.

- `seed.sql` creates two tables, `authors` and `books`, with sample rows. It drops and recreates them, so you can run it again to reset.
- `connect/node.mjs` connects with node-postgres.
- `connect/python.py` connects with psycopg.

```mermaid
erDiagram
  authors ||--o{ books : writes
  authors {
    int id PK
    text name
    text country
  }
  books {
    int id PK
    text title
    int author_id FK
    int year
    numeric price
    int in_stock
  }
```

## Connection string endings

Light Cloud databases only accept encrypted connections. Copy the connection string from the database's **Credentials** tab and add the ending your client needs:

| Client | Ending |
| --- | --- |
| psql, psycopg (Python), Prisma, GUI tools | `?sslmode=require` |
| node-postgres (`pg`) | `?sslmode=require&uselibpqcompat=true` |

## Try it

```bash
export DATABASE_URL='postgresql://USER:PASSWORD@HOST:5432/DB?sslmode=require'
psql "$DATABASE_URL" -f seed.sql

python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
.venv/bin/python connect/python.py

npm install
DATABASE_URL="$DATABASE_URL&uselibpqcompat=true" node connect/node.mjs
```

## Tutorials

1. [Create a PostgreSQL database and connect from your laptop](https://blog.light-cloud.com/tutorials/create-a-postgres-database)
2. [Browse and edit data in the data explorer](https://blog.light-cloud.com/tutorials/database-data-explorer)
3. [Run SQL in the browser](https://blog.light-cloud.com/tutorials/run-sql-queries-in-the-console)
4. [Back up a database and restore it](https://blog.light-cloud.com/tutorials/export-a-database-backup)
