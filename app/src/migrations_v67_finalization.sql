-- V67 finalization: billing ledger, refund state, stronger invoice/payment constraints.
ALTER TABLE payments ADD COLUMN IF NOT EXISTS refund_of_payment_id BIGINT;
CREATE INDEX IF NOT EXISTS payments_invoice_status_idx ON payments(agency_id, invoice_id, status);
CREATE INDEX IF NOT EXISTS invoices_customer_status_idx ON invoices(agency_id, customer_id, status);

-- Optional integrity checks. Existing deployments should apply after reviewing current data.
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname='payments_amount_positive') THEN
    ALTER TABLE payments ADD CONSTRAINT payments_amount_positive CHECK (amount > 0);
  END IF;
END $$;
