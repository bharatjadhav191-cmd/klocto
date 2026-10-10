const fs=require('fs'), path=require('path');
const root=path.join(__dirname,'..');
const html=fs.readFileSync(path.join(root,'public','index.html'),'utf8');
const js=fs.readFileSync(path.join(root,'script.js'),'utf8');
const checks=[
 ['training login',js.includes('training@apexjov.test')&&js.includes('training123')],
 ['separate training storage',js.includes('apex_v60_training_mock_data')&&js.includes('apex_v60_main_mock_data')],
 ['business name field',/formField\('Business Name','business_name'/.test(js)],
 ['manual form builder',js.includes('function newForm')&&js.includes('Add Question')],
 ['multi question types',js.includes('Short Text')&&js.includes('Long Text')&&js.includes('Dropdown')&&js.includes('Multiple Choice')],
 ['form to CRM submission',js.includes("/forms/'+id+'/submit")&&js.includes('MOCK.crm.unshift')],
 ['pipeline manager',js.includes('function pipelines')&&js.includes('function savePipeline')],
 ['template preview/use',js.includes('previewTemplate')&&js.includes('continueTemplateUse')],
 ['tenant settings',js.includes('Tenant / Agency Profile')&&js.includes('saveTenantName')],
 ['user permissions',js.includes('Manage Access')&&js.includes('saveUserAccess')],
 ['training reset',js.includes('resetTraining')&&js.includes('apex_training_token')],
 ['recordsPage defined',js.includes('async function recordsPage(')],
 ['login button',html.includes('id="loginBtn"')],
];
let bad=0;for(const [name,ok] of checks){console.log((ok?'PASS':'FAIL')+' — '+name);if(!ok)bad++;}
const form=(js.match(/"type":"form"/g)||[]).length;
const funnel=(js.match(/"type":"funnel"/g)||[]).length;
const website=(js.match(/"type":"website"/g)||[]).length;
console.log(`Templates: forms=${form}, funnels=${funnel}, websites=${website}, total=${form+funnel+website}`);
if(form<3||funnel<3||website<3)bad++;
process.exitCode=bad?1:0;
