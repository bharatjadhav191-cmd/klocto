# V71 CRM + Customer Account Testing Changes

- Removed duplicate-looking customer mobile entry: one Mobile Number control with country-code selector + 10-digit field.
- Customer login password is set by Owner/Admin during customer creation.
- Customer can change their own password from My Account.
- Owner/Admin can reset a customer password; reset action is not exposed to staff/customer roles.
- New Pipeline now uses a stage dropdown + Add Stage flow, with editable stage names and remove controls before creation.
- CRM now supports Customer → Pipeline selection.
- Pipeline stage board shows per-stage lead counts and clickable stage cards.
- Clicking a stage opens lead details and allows changing the lead stage.
- CRM provides Excel-compatible `.xls` export for filtered lead data.
- Customer API scope tightened so customer accounts only receive their own customer record.
- Added customer My Account navigation.
