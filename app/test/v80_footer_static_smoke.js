import fs from 'node:fs';
import assert from 'node:assert/strict';
const root=fs.readFileSync(new URL('../../index.html',import.meta.url),'utf8');
const pub=fs.readFileSync(new URL('../public/index.html',import.meta.url),'utf8');
assert.equal(root,pub,'root and served public index should match');
assert.ok(root.includes('apex_build_version","V80'),'V80 build marker missing');
assert.ok(root.includes('Powered by ApexJov Media'),'ApexJov attribution missing');
assert.ok(root.includes('powered-footer'),'shared footer selector missing');
console.log('V80 footer static smoke: PASS');
