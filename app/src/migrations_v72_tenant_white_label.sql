ALTER TABLE agencies ADD COLUMN IF NOT EXISTS brand_name TEXT;
ALTER TABLE agencies ADD COLUMN IF NOT EXISTS logo_url TEXT;
ALTER TABLE agencies ADD COLUMN IF NOT EXISTS subdomain TEXT;
UPDATE agencies SET brand_name=name WHERE brand_name IS NULL OR brand_name='';
CREATE UNIQUE INDEX IF NOT EXISTS agencies_subdomain_uq ON agencies(lower(subdomain)) WHERE subdomain IS NOT NULL AND subdomain<>'';
