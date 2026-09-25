// Connect with node-postgres and count the books.
// DATABASE_URL must end with ?sslmode=require&uselibpqcompat=true
import pg from "pg";

const client = new pg.Client({ connectionString: process.env.DATABASE_URL });
await client.connect();
const { rows } = await client.query("SELECT count(*) AS books FROM books");
console.log(`Connected from Node.js: ${rows[0].books} books`);
await client.end();
