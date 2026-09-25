-- Up Migration
ALTER TABLE reviews ADD COLUMN created_at TIMESTAMPTZ NOT NULL DEFAULT now();

-- Down Migration
ALTER TABLE reviews DROP COLUMN created_at;
