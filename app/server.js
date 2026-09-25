// A small read-only API over the bookshop database.
// DATABASE_URL must end with ?sslmode=require&uselibpqcompat=true
import express from "express";
import pg from "pg";

// max: 3 keeps the pool small: every running instance opens its own.
const pool = new pg.Pool({ connectionString: process.env.DATABASE_URL, max: 3 });
pool.on("error", (err) => console.error(`pool error: ${err.message}`));

const app = express();

app.get("/health", async (req, res) => {
  try {
    await pool.query("SELECT 1");
    res.json({ status: "ok", database: "ok" });
  } catch (err) {
    console.error(`health check failed: ${err.message}`);
    res.status(503).json({ status: "error", database: err.message });
  }
});

app.get("/books", async (req, res, next) => {
  try {
    const { rows } = await pool.query(
      "SELECT b.id, b.title, a.name AS author, b.price FROM books b JOIN authors a ON a.id = b.author_id ORDER BY b.id"
    );
    res.json(rows);
  } catch (err) {
    next(err);
  }
});

const port = Number(process.env.PORT) || 8080;
const server = app.listen(port, () => console.log(`bookshop-api listening on ${port}`));

process.on("SIGTERM", () => {
  server.close(() => pool.end().then(() => process.exit(0)));
});
