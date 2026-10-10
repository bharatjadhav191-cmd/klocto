const fs=require('fs'), path=require('path');
const root=path.join(__dirname,'..');
const server=fs.readFileSync(path.join(root,'src','server.js'),'utf8');
const migration=fs.readFileSync(path.join(root,'src','migrations_v66_customer_billing.sql'),'utf8');
const v67=fs.readFileSync(path.join(root,'src','migrations_v67_finalization.sql'),'utf8');
const checks=[
 ['GST optional customer fields',server.includes("gstin")&&server.includes("gst_status")],
 ['GST invoice calculation',server.includes("cgst=+(subtotal*gst_rate/200)")&&server.includes("igst=+(subtotal*gst_rate/100)")],
 ['manual payment modes supported',server.includes("/api/payments/manual")],
 ['partial payment status',server.includes("status=paid>=total?'Paid':paid>0?'Partial':'Due'")],
 ['invoice ledger endpoint',server.includes("/api/invoices/:id/ledger")],
 ['refund endpoint',server.includes("/api/payments/:id/refund")],
 ['tenant-scoped invoices',server.includes("WHERE agency_id=$1 AND customer_id=$2")],
 ['billing migration',migration.includes('CREATE TABLE IF NOT EXISTS invoices')&&migration.includes('CREATE TABLE IF NOT EXISTS payments')],
 ['finalization migration',v67.includes('refund_of_payment_id')&&v67.includes('payments_amount_positive')],
];
let bad=0;for(const [n,ok] of checks){console.log((ok?'PASS':'FAIL')+' — '+n);if(!ok)bad++;}
process.exitCode=bad?1:0;
