# Apexjov Media CRM Portal — V76 Consolidated Testing Build

## Base and scope
- Based on the V75 Agency/Rental Plans testing package.
- Existing portal modules and template catalog were retained; the root `index.html` and `app/public/index.html` are kept in sync.
- This is a local/browser testing build. Several new screens store their test data in browser localStorage and are not yet connected to a shared production database.

## Consolidated updates included
1. Sales, Operations, Inbox, Calendar, Tasks and Lead Automation now have usable Add/Edit/Delete/Print-PDF testing screens; this fixes the prior missing `moduleManager` function that caused a blank/error panel.
2. Lead stage changes store local stage history and lead comments/notes.
3. Form builder includes background image upload; the existing question editor retains dropdown/single-choice/multiple-choice option support.
4. Customer entry includes Referral Code; valid unique registrations award the configured coupon to the existing referrer, not the new account.
5. Duplicate customer email/mobile checks run on creation and profile edit in the local testing flow. Referral reward is blocked for repeat referrals to the same new account.
6. State and City are dropdown fields in customer and agency-owner profile forms.
7. Settings user access list now includes the added modules; owner/admin testing flow includes password reset.
8. Finance/Billing now shows invoice balance, links payment entry to an invoice, supports partial/full payment, updates invoice status/outstanding and offers Print / Save PDF for invoices and payment receipts.
9. Customer/Agency Ledger is derived from invoices, payments and referral credits; it supports account filtering and Print / Save PDF.
10. Expenses supports Add/Edit/Delete. Reports include users, customers, agencies, business categories, invoice totals, collected payments, outstanding, expenses and cash-based profit/loss, plus printable report output.
11. Referral Program settings allow the Owner to configure reward amount and eligibility; referral events and coupon credit history are visible.
12. Chatbot no longer stays on a blank/loading screen; testing configuration can be saved locally. Live AI/provider responses are not connected by this screen alone.
13. Notifications support Add/Edit/Delete/Mark Read in local testing data.
14. SEO records support Add/Edit/Delete and printable output. Domain records support Add/Edit/Delete and manual DNS/SSL/hosting status fields.
15. Agency/Tenant creation includes the agency owner profile, plan selection, logo upload and referral code; Owner can edit the agency/owner profile. Referral benefit is credited to the existing referrer.
16. Plans & Pricing is a separate main sidebar menu, outside Agency/Tenant Management. It supports main categories and multiple plans per category for Meta Ads, Google Ads, Website Design, Rented Portal and Tenant/Agency Plans.
17. New Website creation defaults to a multi-page structure; website templates create Home/About/Services/Portfolio/Testimonials/Contact page definitions.
18. Owner retains full menu access. Other users see modules based on assigned permissions; owner-only Plans & Pricing and Agency/Tenant management remain restricted.
19. Print / Save PDF opens a print-friendly document; choose “Save as PDF” in the browser print dialog.

## Important testing limitations
- Browser-local records do not sync to a central database and may differ by browser/profile/device.
- DNS verification, SSL provisioning, custom-domain hosting, live publishing, payment gateway collection, WhatsApp/Meta provider calls and live AI require real server-side integrations/credentials and are not claimed as live here.
- The P&L screen is explicitly a cash-based testing summary (received payments minus entered expenses), not a formal accrual-accounting statement.
- PDF export uses the browser print dialog (“Save as PDF”), not a server-generated accounting PDF service.
- Static syntax/smoke tests passed; interactive browser automation was blocked by this environment's browser restrictions. Please re-test the actual flows on the PC.
- Use dummy data only. This is not a production-ready deployment.
