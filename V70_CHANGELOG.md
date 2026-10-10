# Apexjov V70 – CRM / Pipeline Testing Improvements

Changes requested during mobile testing:

1. Customer entry mobile number UI fixed so country code + mobile input stay on one row; no duplicate-looking mobile field.
2. Pipeline creation now supports individual stage rows with `+ Add Stage` and Remove controls.
3. CRM now supports Customer → Pipeline selection.
4. CRM displays the selected pipeline as a stage-wise lead board with lead counts.
5. Clicking a stage opens the leads in that stage; clicking a lead opens lead details.
6. Lead stage changes are validated against the selected pipeline stages.
7. New leads use the first stage of their selected pipeline instead of always forcing `New`.
8. Lead data can be downloaded as an Excel-compatible `.xls` file from CRM.
9. Customer edit now persists Owner/Profile Photo changes.
10. Offline/staging mode supports customer edits and lead stage changes so content:// testing remains functional.

Existing V69 AI/HTML import, publish foundation, image upload, customer profile, billing/GST and other testing features are preserved.
