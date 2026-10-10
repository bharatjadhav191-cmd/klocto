import fs from 'fs';
const p=fs.readFileSync(new URL('../script.js',import.meta.url),'utf8');
for(const s of ['imageUploadField','readImageFile','owner_photo_url','Business Logo','Owner / Profile Photo','Use Customer Logo for Hero']) if(!p.includes(s)) throw new Error('Missing media feature: '+s);
console.log('media upload static smoke: PASS');
