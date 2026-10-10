-- V64: public links for Forms, Funnels and Websites
ALTER TABLE workspace_records ADD COLUMN IF NOT EXISTS public_slug TEXT;
ALTER TABLE workspace_records ADD COLUMN IF NOT EXISTS published_at TIMESTAMPTZ;
CREATE UNIQUE INDEX IF NOT EXISTS workspace_records_public_slug_uq
  ON workspace_records(module, public_slug)
  WHERE public_slug IS NOT NULL;
