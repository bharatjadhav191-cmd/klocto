import fs from 'node:fs';
import assert from 'node:assert/strict';
const root=fs.readFileSync(new URL('../../index.html',import.meta.url),'utf8');
const pub=fs.readFileSync(new URL('../public/index.html',import.meta.url),'utf8');
for (const [label,needle] of [
 ['V76 marker','apex_build_version","V80'],['separate Plans & Pricing','plans_pricing'],['working module manager','function moduleManager'],
 ['chatbot route','function chatbot()'],['owner P&L and reports','Net Cash Profit / Loss'],['expenses CRUD','function saveExpense'],
 ['invoice payment linking','Record Payment & Link Invoice'],['payment receipt print/PDF','PAYMENT RECEIPT'],['customer/agency ledger','Customer / Agency Ledger'],
 ['referral reward credited to referrer','issueReferralReward'],['duplicate email/mobile protection','Duplicate update blocked'],['agency owner profile','Agency Owner Profile'],
 ['state/city dropdowns','function stateCityInputs'],['multi-page website','multi_page:true'],['domain and SEO editing','function saveDomainRecord'],['notification editing','function saveNotification'],['Agency Owner role','role:\'agency_owner\''],['agency owner creates team','function newPortalUser()'],['Admin approval hierarchy','Only Agency Owner can approve Admin access']
]) { assert.ok(root.includes(needle),`root missing ${label}`); }
assert.equal(root,pub,'root and served public index should match');
console.log('V77 consolidated static smoke: PASS');
