# V80 — Klicto universal footer attribution

- Added a fixed, mobile-responsive `Powered by ApexJov Media` footer to the signed-in portal shell.
- Footer is outside role-specific page content so it appears for every signed-in role using the shared portal shell, including platform owner, agency owner, admin/staff, and customer views.
- Applied the same update to root `index.html` and `app/public/index.html`.
- Added bottom spacing so the footer is less likely to cover page content.
- Updated the local build marker to V80.

## Verification
- Confirmed both HTML entry files contain the footer and CSS.
- Full browser/role regression testing has not been performed; test every role on mobile and desktop before live use.
- This is a testing package, not a production deployment.

## V80 test maintenance follow-up
- Updated legacy consolidated smoke checks to expect the V80 build marker instead of obsolete V76/V77 markers.
- Added a static footer check for the V80 attribution footer.
- These are static/source checks only; database-backed tenant isolation and production deployment still require a configured PostgreSQL instance and seeded test accounts.
