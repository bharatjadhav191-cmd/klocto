const fs=require('fs');const s=fs.readFileSync(require('path').join(__dirname,'../src/server.js'),'utf8');
const start=s.indexOf("app.post('/api/payments/manual'");const end=s.indexOf("app.get('/api/invoices/:id/ledger'",start);const block=s.slice(start,end);
const invoiceCheck=block.indexOf("if(!inv)return res.status(404).json({error:'Invoice not found for this customer'})");const insert=block.indexOf("INSERT INTO payments(");
if(start<0||end<0||invoiceCheck<0||insert<0||invoiceCheck>insert){console.error('FAIL — invoice ownership must be validated before payment insert');process.exit(1)}
if(!block.includes("inv?inv.id:null")){console.error('FAIL — payment insert must use validated invoice');process.exit(1)}
console.log('PASS — invalid invoice/customer association is rejected before payment insert');
