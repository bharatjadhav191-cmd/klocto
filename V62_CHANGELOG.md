# Apexjov V62 — 40 Distinct Single-Page Website Designs

## What changed
- Reworked the single-page website preview system so business categories no longer share one repeated visual layout.
- 40 website templates remain: 20 business categories × 2 options.
- Every category now has its own visual layout family and each category's Option 1 / Option 2 use different composition patterns.
- Added unique design labels for every website option (e.g. Editorial Growth, Luxury Property Story, Organic Botanical, Beauty Editorial, Travel Immersive, Tech Interface, Luxury Collection, etc.).
- Added category-specific visual structures: split hero, centered hero, image-overlap, organic/arched imagery, restaurant circular hero, salon editorial, education spotlight, healthcare trust layout, travel immersive, interior portfolio, fitness dark hero, photography darkroom, event story, automotive, home-services circular layout, ecommerce product spotlight, SaaS interface, consulting authority, construction angular layout, jewellery collection layout.
- Kept websites single-page only.
- Kept 20 categories × 2 website choices; no Option 3 added.
- Synchronized the visual preview function into the standalone/root `index.html` and `app/public/index.html` so local/mobile testing uses the same design renderer.
- Updated template metadata with unique design names and layout-family identifiers.
- Option 2 themes receive category-specific alternate accents while preserving the category identity.

## Preserved
- Existing Forms and Funnels catalog.
- Existing Website Builder, Use Template and Edit flow.
- CRM-ready enquiry CTA structure.
- Mobile responsive portal behavior.

## Verification
- `node --check app/script.js` passed.
- `node --check app/src/server.js` passed.
- Root and public inline JavaScript syntax checks passed.
- 40 website templates verified.
- ZIP integrity verified.
