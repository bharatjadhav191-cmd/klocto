# V66 — Customer Business Profile + GST-ready Billing + Manual Payments

- Added essential customer business profile fields: business name, contact person, mobile, email, industry, address, city/state/PIN, optional website/social/logo.
- Added billing fields: billing/legal name, PAN, GSTIN, GST status, billing address and internal notes.
- GST is optional; customers can remain non-GST and later add GSTIN without stopping service.
- Added GST and Non-GST invoice types with CGST/SGST or IGST calculation fields.
- Added manual/offline payment recording for Cash, UPI, Bank Transfer, Cheque and Other.
- Manual payment supports transaction/UTR, payment date, proof reference and notes.
- Recording a valid manual payment marks the customer Active; invoice is marked Paid when linked.
- Added customer profile editing from Admin/Staff.
- Kept existing public links, website templates, forms, funnels and other modules unchanged.

## V68 Media/Image Upload Addition
- Added Business Logo upload and Owner/Profile Photo upload to Customer creation/edit.
- Added image upload/change controls to Website/Landing editor for Hero and About images.
- Added customer media reuse action so a saved customer logo can be applied to website Hero image.
- Added customer media previews on Customer cards.
- Added `owner_photo_url` customer field and migration foundation.
- Upload validation for PNG/JPG/WebP and 3 MB staging limit.
- Existing template/customer/billing workflows preserved; media is optional.
