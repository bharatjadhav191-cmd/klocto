const fs=require('fs');
const script=fs.readFileSync(__dirname+'/../script.js','utf8');
const server=fs.readFileSync(__dirname+'/../src/server.js','utf8');
const index=fs.readFileSync(__dirname+'/../../index.html','utf8');
const checks=[
 ['single mobile input layout', /flex-wrap:nowrap/.test(script) && /f_country_code/.test(script) && /f_phone/.test(script)],
 ['pipeline add/remove stages', /addPipelineStage\(\)/.test(script) && /removePipelineStage\(i\)/.test(script)],
 ['crm customer filter', /crmCustomerChanged/.test(script) && /crm_customer_select/.test(script)],
 ['crm pipeline filter', /crmPipelineFilter/.test(script) && /crm_pipeline_select/.test(script)],
 ['stage board', /showStageLeads/.test(script) && /stageHtml/.test(script)],
 ['lead details', /showLeadDetails/.test(script)],
 ['excel export', /downloadLeadsExcel/.test(script) && /Apexjov_Leads_Export\.xls/.test(script)],
 ['server pipeline stage normalization', /new Set\(\(Array\.isArray\(req\.body\.stages\)/.test(server)],
 ['server stage validation', /Stage is not part of this pipeline/.test(server)],
 ['server crm export', /\/api\/crm\/export/.test(server)],
 ['owner photo edit persistence', /owner_photo_url:\$\('f_owner_photo_url'\)\.value/.test(script)],
 ['final index embeds updated script', /crmCustomerChanged/.test(index) && /downloadLeadsExcel/.test(index) && /Apexjov_Leads_Export\.xls/.test(index)]
];
let failed=0;for(const [n,ok] of checks){console.log((ok?'PASS':'FAIL')+' - '+n);if(!ok)failed++;}
if(failed)process.exit(1);
console.log('V70 static CRM/pipeline smoke: PASS');
