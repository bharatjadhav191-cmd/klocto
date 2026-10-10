# Klicto Portal — Release Candidate V82

**Brand:** Klicto  
**Owner / parent agency:** ApexJov Media  
**Attribution:** Powered by ApexJov Media

This ZIP contains the Klicto browser testing UI and an Express/PostgreSQL backend. Use the root `index.html` for browser-local UI review and `app/` for backend deployment/testing. The local UI and API backend are separate paths; browser-local demo data does not automatically sync with PostgreSQL.

## Included
- Klicto branding and “Powered by ApexJov Media” attribution in the portal shell and print views.
- Role-based portal UI and the existing CRM, templates, forms/funnels/websites, billing, referrals, reports and settings modules.
- Express API with PostgreSQL, authentication, rate limiting, tenant-scoped API routes and server-side provider integration points.
- Manual payment validation now checks the selected invoice belongs to the same agency and customer **before** creating a payment, preventing an orphan payment row on an invalid invoice.
- Automated static/syntax checks in `app/test/`.

## Backend setup for online testing
1. Install Node.js LTS and PostgreSQL.
2. Create a dedicated PostgreSQL database/user.
3. Copy `app/.env.example` to `app/.env` and set `DATABASE_URL`, `JWT_SECRET` (random, 32+ characters), `CORS_ORIGIN`, `PUBLIC_APP_URL`, database TLS settings and any required provider keys. Never commit real secrets.
4. Apply the SQL migrations in `app/src/` in the documented version order; take a backup first if using an existing database.
5. Install dependencies with `npm install` from `app/`, then run `npm start`.
6. Create/seed non-production test accounts in the database. The tenant-isolation test requires these accounts and a running API; it is not a self-contained offline test.
7. Run `npm test` only after adding/confirming the scripts, or run the individual test files listed in `app/package.json`.

## Required before production
- Run authenticated end-to-end tests against a configured PostgreSQL database with at least two agencies, their owners/staff/customers, and cross-tenant negative tests.
- Verify login, role permissions, record create/edit/delete, payments/ledger/invoice balances, form submission-to-lead mapping, template publish/unpublish, reports, mobile layout and PDF print.
- Configure HTTPS, production secrets, database backups, monitoring, CORS to the real Klicto origin and provider credentials. Test Paytm in staging before enabling real payments.
- Do not use demo passwords or mock/localStorage data for production.

## Status
Static checks can be run locally. This archive has **not** been deployed to the user's Google Cloud project, and no real production database/provider credentials are included. A real online end-to-end and tenant-isolation test is required before calling it production-ready.
