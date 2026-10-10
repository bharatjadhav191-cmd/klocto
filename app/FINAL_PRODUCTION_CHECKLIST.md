# Klicto Portal — production verification checklist

## Before first online test
- [ ] Create dedicated PostgreSQL database/user and configure TLS.
- [ ] Set unique production JWT secret (32+ characters), CORS origin, public app URL and provider encryption key.
- [ ] Review/apply all SQL migrations in order with a backup.
- [ ] Provision separate test agencies and users (owner, admin/staff, customer) with non-demo passwords.
- [ ] Start API and verify `/api/health` and `/api/ready`.

## End-to-end checks
- [ ] Login/logout and invalid-password/rate-limit behavior.
- [ ] Create/edit/search/archive customers and leads; validate fields and duplicate handling.
- [ ] Verify agency/customer isolation with positive and negative cross-tenant requests.
- [ ] Verify invoice totals, optional GST, partial/full payment, invalid invoice rejection, ledger balance, refund behavior and date display.
- [ ] Submit public form and verify exactly one correctly mapped lead is created.
- [ ] Publish/unpublish forms/funnels/websites and test public URLs.
- [ ] Verify permissions for platform owner, agency owner, admin, staff and customer.
- [ ] Verify report totals against source records; check empty states and wrong/invalid entries.
- [ ] Test desktop/mobile layouts and print/PDF output.
- [ ] Test database backup and restore.
- [ ] Test payment provider in staging before enabling real payments.

## Release rule
Do not call the portal production-ready until the configured database-backed end-to-end checklist and tenant-isolation tests pass. Never use demo credentials in production.
