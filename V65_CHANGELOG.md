# Apexjov V65 — Landing Page Public Links Completion

## Added
- Landing Page templates now receive a dedicated public URL when published.
- Landing Page links use `/public/landing/<slug>` while normal Websites use `/public/website/<slug>`.
- Published landing pages are resolved separately from normal websites using `template_type=landing`.
- Existing Form and Funnel public links remain unchanged.
- Website Builder clearly labels landing-page records as `Landing Page` in the list.
- Existing color themes, language controls, template library, CRM connection, and tenant isolation are preserved.

## Public link flow
- Form → `/public/form/<slug>`
- Funnel → `/public/funnel/<slug>`
- Website → `/public/website/<slug>`
- Landing Page → `/public/landing/<slug>`

## Preserved
- V64 public publishing and copy-link workflow.
- V63 color themes and English/Hindi/Marathi website options.
- V62 distinct website design families.
- Existing auth/RBAC and tenant/customer scope checks.
- No live Meta/Paytm/WhatsApp credentials added.

## Verification
- `node --check app/src/server.js` passed.
- `node --check app/script.js` passed.
- ZIP integrity checked after packaging.
