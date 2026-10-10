# V60 CHANGELOG

- Rebuilt the local Template Library from the clean template source instead of the legacy embedded 168-template catalog.
- Clean catalog: 36 Forms (Option 1/2), 36 Funnels (Option 1/2), 40 Websites (20 categories x 2, single-page only).
- Removed legacy Option 3 templates from the local testing catalog.
- Added a new localStorage namespace (apex_v60_main_mock_data / apex_v60_training_mock_data) so stale V48-V59 browser data cannot repopulate the UI.
- Website template use now creates a true single-page website payload instead of a multi-page pages array.
- Existing single-page visual template renderer/editor retained.
