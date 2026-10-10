const fs = require('fs');
const path = require('path');
const base = path.join(__dirname, '..', 'src');
const server = fs.readFileSync(path.join(base, 'server.js'), 'utf8');
const required = [
  'migrations_v00_base_schema.sql', 'migrations_v01_compat.sql',
  'migrations_public_links.sql', 'migrations_v66_customer_billing.sql',
  'migrations_v67_finalization.sql', 'migrations_v68_media.sql',
  'migrations_v72_tenant_white_label.sql', 'migrations_v77_agency_owner_role.sql'
];
const order = server.match(/const MIGRATION_ORDER=\[([^\]]+)\]/)?.[1] || '';
let ok = true;
for (const name of required) {
  if (!fs.existsSync(path.join(base, name)) || !order.includes(name)) {
    console.error('FAIL — missing or unordered migration:', name); ok = false;
  }
}
for (const table of ['agencies','customers','users','auth_tokens','audit_logs','pipelines','forms','leads','workspace_records','templates_catalog','invoices','payments']) {
  if (!fs.readFileSync(path.join(base, 'migrations_v00_base_schema.sql'), 'utf8').includes(`CREATE TABLE IF NOT EXISTS ${table}`)) {
    console.error('FAIL — base schema table missing:', table); ok = false;
  }
}
const templates = JSON.parse(fs.readFileSync(path.join(base, 'templates.json'), 'utf8'));
if (templates.length !== 130) { console.error('FAIL — expected 130 templates, found', templates.length); ok = false; }
if (!server.includes("await migrateDatabase();await q('SELECT 1');app.listen")) { console.error('FAIL — server is not gated on migration success'); ok = false; }
if (server.includes('ensurePublicPublishingSchema().catch(()=>{})')) { console.error('FAIL — silent schema failure handler remains'); ok = false; }
if (ok) console.log(`PASS — ${required.length} ordered migrations; core schema tables; ${templates.length} templates; startup blocked on migration failure`);
process.exitCode = ok ? 0 : 1;
