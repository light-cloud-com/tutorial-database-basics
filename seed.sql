-- Sample data for the Light Cloud database tutorials: a small bookshop.
-- Safe to run more than once: it drops and recreates its own tables.

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id      SERIAL PRIMARY KEY,
  name    TEXT NOT NULL,
  country TEXT
);

CREATE TABLE books (
  id        SERIAL PRIMARY KEY,
  title     TEXT NOT NULL,
  author_id INTEGER NOT NULL REFERENCES authors(id),
  year      INTEGER,
  price     NUMERIC(6, 2) NOT NULL,
  in_stock  INTEGER NOT NULL DEFAULT 0
);

INSERT INTO authors (name, country) VALUES
  ('Ursula K. Le Guin', 'United States'),
  ('Terry Pratchett', 'United Kingdom'),
  ('Octavia E. Butler', 'United States'),
  ('Stanislaw Lem', 'Poland');

INSERT INTO books (title, author_id, year, price, in_stock) VALUES
  ('A Wizard of Earthsea', 1, 1968, 9.99, 12),
  ('The Left Hand of Darkness', 1, 1969, 11.50, 4),
  ('The Dispossessed', 1, 1974, 12.00, 0),
  ('Guards! Guards!', 2, 1989, 8.99, 20),
  ('Small Gods', 2, 1992, 8.99, 7),
  ('Kindred', 3, 1979, 10.50, 9),
  ('Parable of the Sower', 3, 1993, 13.25, 3),
  ('Solaris', 4, 1961, 10.00, 5),
  ('The Cyberiad', 4, 1965, 9.50, 2);
