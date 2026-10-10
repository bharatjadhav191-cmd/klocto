-- V68 Media / Image Upload foundation for testing
ALTER TABLE customers ADD COLUMN IF NOT EXISTS owner_photo_url TEXT;
CREATE INDEX IF NOT EXISTS customers_agency_logo_idx ON customers(agency_id, id);
