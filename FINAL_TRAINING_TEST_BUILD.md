# Apexjov Media — Final Training Test Build

This package is the consolidated **Training/Test build** for end-to-end user testing.

## Training login
- Email: `training@apexjov.test`
- Password: `training123`
- Environment: `Training Portal`

## Main test logins
- Owner: `owner@apexjov.test` / `owner123`
- Agency Admin: `admin@demo.test` / `admin123`
- Agency Staff: `staff@demo.test` / `staff123`
- Customer: `customer@apexjov.test` / `customer123`

## Core training flow
1. Create customer with Business Name.
2. Create customer pipeline.
3. Create a Form manually or use a template.
4. Add multiple questions and question types.
5. Submit the form using Test Submission.
6. Confirm the submission creates a CRM lead.
7. Move the lead through pipeline stages.
8. Create a Funnel and connect it to the customer pipeline.
9. Create/use a Website template and verify the website draft.
10. Test Billing/Invoices/Subscriptions.
11. Test Settings → Tenant/Agency Name and User Access.
12. Test role access with Admin/Staff/Customer logins.
13. Use Training Reset to clear only training data.

## Important
- Training data is stored separately in browser local storage under `apex_training_mock_data`.
- Main testing data uses `apex_v16_mock_data`.
- Live Meta/WhatsApp/Paytm credentials are intentionally not connected in this build.
- Paytm code is integration-ready, but live payment activation requires merchant configuration on the server.
