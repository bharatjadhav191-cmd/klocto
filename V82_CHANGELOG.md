# V82 — Klicto release candidate and payment validation fix

- Set package identity and current release documentation to Klicto while retaining ApexJov Media as owner/parent brand.
- Updated generated public form and website/funnel page labels to Klicto; retained “Powered by ApexJov Media” attribution.
- Changed MFA issuer label to Klicto.
- Fixed manual-payment validation order: if a selected invoice does not belong to the selected customer and agency, the API rejects the request before inserting a payment.
- Added a regression static test for that payment validation ordering.
- Added `npm run test:static` for repeatable local static checks.
- Updated setup and production-gate documentation so staging, backend and browser-local data are not confused.

## Validation performed for this archive
- JavaScript syntax checks passed for server and test files.
- Static training/UI, billing, media upload, CRM pipeline, V76, V77, V80 footer and payment-invoice validation checks passed.
- The live PostgreSQL tenant-isolation test requires a running configured API and seeded accounts; it was not passed in this offline package audit.
- This archive has not been deployed to Google Cloud. It is an updated test/release-candidate ZIP, not a claim that production deployment or live provider integrations are complete.
