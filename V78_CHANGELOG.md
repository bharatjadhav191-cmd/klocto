# V78 Consolidated Testing Update

Based on the previous V77 Agency Owner / Team Permissions package. The V77 role-hierarchy files and existing portal modules are retained.

## V78 change
- Date entry/display uses DD/MM/YYYY in the invoice Due Date field and invoice/ledger/expense date displays where wired.
- ISO YYYY-MM-DD remains the internal/API storage format.
- Added date parsing and validation helpers for DD/MM/YYYY.

## Verification limits
- ZIP archive integrity and JavaScript syntax checks were run.
- Full interactive browser regression and production database / tenant-isolation validation were not completed. Use dummy data and keep the previous ZIP as backup. This is not a production-ready declaration.
