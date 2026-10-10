-- V66: essential customer business profile + GST-ready billing + manual/offline payments
ALTER TABLE customers ADD COLUMN IF NOT EXISTS industry TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS address TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS city TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS state TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS pincode TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS website_url TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS instagram_url TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS facebook_url TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS logo_url TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS billing_name TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS pan TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS gstin TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS gst_status TEXT DEFAULT 'Not Registered';
ALTER TABLE customers ADD COLUMN IF NOT EXISTS billing_address TEXT;
ALTER TABLE customers ADD COLUMN IF NOT EXISTS notes TEXT;

CREATE TABLE IF NOT EXISTS invoices (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL,
  customer_id BIGINT NOT NULL,
  invoice_no TEXT NOT NULL,
  invoice_type TEXT NOT NULL DEFAULT 'Non-GST',
  billing_name TEXT,
  billing_address TEXT,
  pan TEXT,
  gstin TEXT,
  gst_status TEXT,
  place_of_supply TEXT,
  sac_code TEXT,
  gst_rate NUMERIC(6,2) DEFAULT 0,
  cgst NUMERIC(12,2) DEFAULT 0,
  sgst NUMERIC(12,2) DEFAULT 0,
  igst NUMERIC(12,2) DEFAULT 0,
  subtotal NUMERIC(12,2) NOT NULL DEFAULT 0,
  total NUMERIC(12,2) NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'Due',
  due_date DATE,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS invoices_agency_no_uq ON invoices(agency_id,invoice_no);

CREATE TABLE IF NOT EXISTS payments (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL,
  customer_id BIGINT NOT NULL,
  invoice_id BIGINT,
  amount NUMERIC(12,2) NOT NULL,
  payment_mode TEXT NOT NULL,
  transaction_ref TEXT,
  paid_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  proof_url TEXT,
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'Paid',
  provider TEXT DEFAULT 'manual',
  created_by BIGINT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS payments_agency_customer_idx ON payments(agency_id,customer_id);
