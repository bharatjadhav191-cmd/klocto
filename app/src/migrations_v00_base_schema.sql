-- Klicto initial PostgreSQL schema. Safe to run repeatedly on a fresh database.
CREATE TABLE IF NOT EXISTS agencies (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  brand_name TEXT,
  logo_url TEXT,
  subdomain TEXT,
  plan TEXT NOT NULL DEFAULT 'Agency Pro',
  status TEXT NOT NULL DEFAULT 'Active',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS customers (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  business_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL DEFAULT '',
  plan TEXT NOT NULL DEFAULT 'Custom',
  status TEXT NOT NULL DEFAULT 'Active',
  industry TEXT, address TEXT, city TEXT, state TEXT, pincode TEXT,
  website_url TEXT, instagram_url TEXT, facebook_url TEXT, logo_url TEXT, owner_photo_url TEXT,
  billing_name TEXT, pan TEXT, gstin TEXT, gst_status TEXT DEFAULT 'Not Registered', billing_address TEXT, notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(agency_id,email)
);
CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('platform_owner','agency_owner','agency_admin','agency_staff','customer')),
  name TEXT NOT NULL DEFAULT '',
  agency_id BIGINT REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT REFERENCES customers(id) ON DELETE CASCADE,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  permissions JSONB NOT NULL DEFAULT '[]'::jsonb,
  email_verified BOOLEAN NOT NULL DEFAULT FALSE,
  last_login_at TIMESTAMPTZ,
  mfa_secret TEXT,
  mfa_enabled BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CHECK ((role='platform_owner' AND agency_id IS NULL) OR role<>'platform_owner')
);
CREATE INDEX IF NOT EXISTS users_agency_role_idx ON users(agency_id,role);
CREATE TABLE IF NOT EXISTS auth_tokens (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash TEXT NOT NULL UNIQUE,
  purpose TEXT NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  used_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS audit_logs (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  agency_id BIGINT,
  action TEXT NOT NULL,
  entity TEXT NOT NULL,
  entity_id TEXT,
  details JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS audit_logs_agency_created_idx ON audit_logs(agency_id,created_at DESC);
CREATE TABLE IF NOT EXISTS pipelines (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  name TEXT NOT NULL DEFAULT 'Ads Leads Pipeline',
  stages JSONB NOT NULL DEFAULT '["New","Contacted","Interested","Converted","Lost"]'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS forms (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  pipeline_id BIGINT REFERENCES pipelines(id) ON DELETE SET NULL,
  name TEXT NOT NULL DEFAULT 'Untitled Form',
  payload JSONB NOT NULL DEFAULT '{}'::jsonb,
  status TEXT NOT NULL DEFAULT 'Active',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS leads (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  pipeline_id BIGINT REFERENCES pipelines(id) ON DELETE SET NULL,
  form_id BIGINT,
  name TEXT NOT NULL DEFAULT '', phone TEXT NOT NULL DEFAULT '', email TEXT NOT NULL DEFAULT '',
  source TEXT NOT NULL DEFAULT 'Manual', stage TEXT NOT NULL DEFAULT 'New',
  fields JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS leads_agency_customer_idx ON leads(agency_id,customer_id,id DESC);
CREATE TABLE IF NOT EXISTS workspace_records (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT REFERENCES customers(id) ON DELETE CASCADE,
  module TEXT NOT NULL,
  payload JSONB NOT NULL DEFAULT '{}'::jsonb,
  status TEXT NOT NULL DEFAULT 'Active',
  created_by BIGINT REFERENCES users(id) ON DELETE SET NULL,
  public_slug TEXT,
  published_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS workspace_records_scope_idx ON workspace_records(agency_id,customer_id,module,id DESC);
CREATE TABLE IF NOT EXISTS templates_catalog (
  id BIGINT PRIMARY KEY,
  type TEXT NOT NULL,
  name TEXT NOT NULL,
  variant TEXT NOT NULL DEFAULT '',
  design TEXT NOT NULL DEFAULT '',
  payload JSONB NOT NULL DEFAULT '{}'::jsonb,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS invoices (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  invoice_no TEXT NOT NULL,
  invoice_type TEXT NOT NULL DEFAULT 'Non-GST',
  billing_name TEXT, billing_address TEXT, pan TEXT, gstin TEXT, gst_status TEXT,
  place_of_supply TEXT, sac_code TEXT,
  gst_rate NUMERIC(6,2) NOT NULL DEFAULT 0,
  cgst NUMERIC(12,2) NOT NULL DEFAULT 0, sgst NUMERIC(12,2) NOT NULL DEFAULT 0, igst NUMERIC(12,2) NOT NULL DEFAULT 0,
  subtotal NUMERIC(12,2) NOT NULL DEFAULT 0, total NUMERIC(12,2) NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'Due', due_date DATE, notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(agency_id,invoice_no)
);
CREATE TABLE IF NOT EXISTS payments (
  id BIGSERIAL PRIMARY KEY,
  agency_id BIGINT NOT NULL REFERENCES agencies(id) ON DELETE CASCADE,
  customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  invoice_id BIGINT REFERENCES invoices(id) ON DELETE SET NULL,
  amount NUMERIC(12,2) NOT NULL CHECK(amount>0),
  payment_mode TEXT NOT NULL,
  transaction_ref TEXT, paid_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  proof_url TEXT, notes TEXT, status TEXT NOT NULL DEFAULT 'Paid', provider TEXT DEFAULT 'manual',
  created_by BIGINT REFERENCES users(id) ON DELETE SET NULL,
  refund_of_payment_id BIGINT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS payments_agency_customer_idx ON payments(agency_id,customer_id);
CREATE INDEX IF NOT EXISTS payments_invoice_status_idx ON payments(agency_id,invoice_id,status);
