# Apexjov Media Portal — V74 Consolidated Testing Build

## Base
This build is based on the uploaded V73 Tenant + Logo Upload testing package. Existing application files are preserved.

## Confirmed in source
- Platform Owner / Agency-Tenant management UI and API calls
- Agency Admin creation flow
- Agency logo image upload (PNG/JPG/WebP; staging size limit 500 KB; no logo URL required)
- Agency branding management UI
- Existing customer, CRM, pipeline, billing, template and public-link areas from the base build

## Important: testing status
This is a staging/testing package, not a production deployment. Packaging and static checks do not prove every browser workflow or backend integration works. Test the actual flows before relying on them.

## Requirements to validate during this pass
1. Platform Owner can create an agency and its first Agency Admin.
2. Agency branding uses the agency's own name/logo, not Apexjov branding (unless intentionally configured).
3. Logo upload survives save, refresh, and reopen.
4. Agency Admin can manage staff/users within their own agency.
5. Customer, staff, agency, lead, invoice and website records stay scoped to the correct tenant.
6. CRM pipeline: customer filter, pipeline selector, stage counts, stage lead details, stage changes, Excel export.
7. Customer entry: only one contact/mobile field; password setup and secure password change/reset.
8. Form/funnel/website: edit, image upload, public link, form submission to CRM.
9. External AI HTML/CSS/JS import: test only with a safe sample package; ZIP import and script handling may need additional implementation.
10. Subscription lifecycle: plan, payment status, expiry/grace period, suspend/read-only and reactivation.
11. WhatsApp: provider connection, approved templates, message cost/wallet and sending require real provider configuration; do not assume live sending is available.
12. Mobile/PWA: responsive UI and installability must be checked separately; PWA production behavior may require additional manifest/service-worker/hosting setup.

## Known limitations / not claimed as production-ready
- A preview subdomain label does not create a live DNS record.
- Custom-domain hosting, DNS verification and SSL provisioning require real hosting/DNS infrastructure.
- Payment, WhatsApp/Meta and live AI provider integrations require secure credentials and server-side configuration.
- Static smoke/syntax checks cannot prove tenant-isolation security. Test with separate accounts and do not use real customer data.


## V75 add-on — Rental Plan Management
- Platform Owner Agency Management now includes Manage Plans.
- Staging plan editor supports add/remove/edit plan name, INR price, Monthly/Quarterly/Yearly cycle, user limit, WhatsApp quota and included-features text.
- Agency creation/edit plan selector reads configured plan list.
- Plan editor currently saves to this browser's localStorage for staging only. It is not a shared production database and does not automatically enforce quotas or collect subscription payments.
- Default Starter ₹1,499, Growth ₹3,499 and Enterprise ₹7,999 are editable example values; confirm final prices before production.
