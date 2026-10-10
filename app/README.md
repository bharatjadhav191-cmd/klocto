# Klicto Portal — Backend Repair Candidate

This package contains the Klicto browser UI and Express/PostgreSQL backend. The web UI now uses the backend login endpoint on HTTP/HTTPS; Training mode remains browser-local and isolated.

## Bootstrap
1. Configure a PostgreSQL database and Cloud Run environment/secrets from `.env.example`.
2. On a brand-new database, set `PLATFORM_OWNER_EMAIL`, `PLATFORM_OWNER_PASSWORD` (minimum 12 characters), and optionally `PLATFORM_OWNER_NAME`. The first platform owner is created once if none exists; the password is hashed and is not logged.
3. On startup the backend applies ordered, tracked SQL migrations and syncs 130 template records. A migration failure stops startup instead of being silently ignored.
4. Configure `DATABASE_URL`, a unique `JWT_SECRET` of at least 32 characters, `CORS_ORIGIN`, `TRUST_PROXY=1`, and `PUBLIC_BASE_URL` for the deployed HTTPS portal URL. Keep secrets out of ZIP files and source control.

## Checks run in this environment
- Node syntax checks: PASS.
- Existing static/smoke checks: PASS.
- Migration-order/core-table/template and online-login static checks: PASS.
- ZIP integrity: verified when packaged.
- PostgreSQL migrations against a live PostgreSQL instance: NOT RUN (no PostgreSQL server/client available here).
- npm dependency installation and Docker build: NOT VERIFIED (dependency install timed out).
- Live Cloud Run deployment and multi-tenant end-to-end tests: NOT RUN.

Do not describe this package as production-certified until the remaining live database, container build, login, tenant-isolation, persistence, billing and public-form tests pass.
