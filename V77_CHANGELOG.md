# ApexJov Media CRM Portal — V77 Agency Team Ownership Update

## Based on
V76 consolidated testing build. Existing modules are retained.

## V77 changes
1. Platform Owner creates an Agency/Tenant and its Agency Owner login only. Platform Owner does not create individual tenant Staff accounts.
2. The account created with a new Agency is explicitly assigned the `agency_owner` role. The Agency Owner is responsible for the agency workspace and team.
3. Settings / Users & Permissions now shows `Add Team Member` only to Agency Owner and authorized Agency Admin accounts.
4. Agency Owner may create Staff or an Agency Admin. Creating an Admin is an explicit Agency Owner decision.
5. Agency Admin may create Staff accounts only; they cannot promote a user to Admin or change the Agency Owner account.
6. Team-member creation includes per-module permission checkboxes, minimum 8-character password validation and duplicate-email protection in the browser testing flow.
7. Customer accounts remain created through the Customers module, not the team-member form.
8. Server API `/api/users` now rejects Platform Owner team-member creation, limits team creation to the caller's own agency, enforces the Admin-vs-Staff hierarchy and strips platform-only modules from assigned permissions.
9. Platform Owner retains Agency/Tenant and Plans & Pricing control. Agency data stays scoped to the signed-in agency in server routes.

## Testing limitations
This remains a testing build. Browser-local demo records are not a shared production database. Interactive browser testing and live production database validation have not been performed in this environment. Test the role hierarchy using dummy accounts before deployment. Existing production integrations remain unconfigured unless separately connected.
