# Apexjov V64 — Public Links for Forms, Funnels & Websites

## Added
- Publish public URL for Forms, Funnels and Websites.
- `Publish & Get Link` button in portal.
- Existing published items show their public URL and `Copy Link` action.
- Public Form URL renders the form and accepts submissions without portal login.
- Public Form submission creates a CRM lead in the correct agency/customer pipeline.
- Public Website/Funnel URL renders a shareable page.
- Per-record public slugs with collision handling.
- `PUBLIC_BASE_URL` support for production domains.
- Tenant-scoped publishing: agency/customer ownership is checked server-side.
- Public publishing columns/index are auto-created on startup and included in migration SQL.

## Important
- The real public URL works after the backend is deployed on a public HTTPS domain.
- Local `content://` testing cannot create an internet-accessible public URL by itself.
- Meta Ads can use the published Form/Funnel/Landing/Website URL as the destination once the portal is deployed.
- No live Meta/Paytm/WhatsApp credentials are added by this build.

## Preserved
- V63 color themes and language options.
- Existing website template library and editors.
- Existing auth/RBAC/tenant isolation baseline.
