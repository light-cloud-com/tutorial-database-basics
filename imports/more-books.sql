-- Two more books, to import with psql from the terminal.

INSERT INTO books (title, author_id, year, price, in_stock, publisher_id) VALUES
  ('Wyrd Sisters', 2, 1988, 9.49, 6, 2),
  ('Dawn', 3, 1987, 11.00, 4, 1);
