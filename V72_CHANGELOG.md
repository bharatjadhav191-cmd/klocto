# V72 — Tenant Management & White-Label Testing

- Platform Owner-only Agency/Tenant Management entry.
- Create agency with registered name, portal display name, logo URL, preferred subdomain label, plan and status.
- Create the first Agency Admin login with a required password of at least 8 characters.
- Edit agency details and branding in the tenant manager.
- Tenant agency branding can appear in the portal header in offline/demo mode.
- Agency Admin settings include user/team management for agency staff and customers.
- Added database migration for agency brand_name, logo_url and subdomain.
- Subdomain field is a testing label only; DNS, hosting and SSL are not provisioned by this staging build.
- This is a staging/testing package; no claim of production-ready tenant isolation or live white-label domains.


## V73 update — Agency logo upload
- Replaced Agency/Tenant logo URL entry with upload-only image control in Create Agency and Manage Branding.
- Accepts PNG/JPG/WebP, max 500 KB in this local testing build; shows preview before save.
- Keeps existing agency logo when editing unless a replacement is uploaded.
- This does not implement the other Gemini recommendations; those remain separate backlog items: WhatsApp embedded signup/wallet/templates, Kanban drag-and-drop and instant actions, subscription collection/grace-period enforcement, and PWA/mobile polish.
