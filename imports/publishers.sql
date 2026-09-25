-- Publishers for the bookshop, as a supplier might send them.
-- The publishers are made up. Import this into bookshop-db once:
-- it creates a table and a column, so a second run fails.

CREATE TABLE publishers (
  id   SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT
);

INSERT INTO publishers (name, city) VALUES
  ('Lighthouse Press', 'Edinburgh'),
  ('Northwind Books', 'Toronto'),
  ('Blue Harbour', 'Gdansk');

ALTER TABLE books ADD COLUMN publisher_id INTEGER REFERENCES publishers(id);

UPDATE books SET publisher_id = 1 WHERE author_id IN (1, 3);
UPDATE books SET publisher_id = 2 WHERE author_id = 2;
UPDATE books SET publisher_id = 3 WHERE author_id = 4;
