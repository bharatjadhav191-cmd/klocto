# V57 — Embedded Catalog Fix

- Root cause: direct-file portal used an embedded `TEMPLATES` array inside `app/public/index.html`, while previous fixes only changed `app/script.js`.
- Replaced the embedded catalog in both public entry files with the verified 228-template catalog from `app/script.js`.
- Website templates are exactly 40: 20 business categories × 2 options.
- Website templates contain no Option 3.
- Bumped browser build/catalog namespace to V57 so old template-cache keys are not reused.
- Default `index.html` is the corrected entry point.
