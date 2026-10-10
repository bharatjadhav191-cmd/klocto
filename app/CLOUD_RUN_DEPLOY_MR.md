# Klicto — Cloud Run verification guide (Marathi)

ही दुरुस्ती केलेली source ZIP आहे; live Cloud Run वर पूर्ण तपासणी झालेली नाही.

## आधी आवश्यक सेटअप
- Dedicated PostgreSQL database आणि त्याची `DATABASE_URL` Cloud Run secret म्हणून द्या.
- `JWT_SECRET` किमान 32 characters चा unique random secret असावा. `CORS_ORIGIN` आणि `PUBLIC_BASE_URL` deployed HTTPS portal URL शी जुळवा; `TRUST_PROXY=1` ठेवा.
- नवीन database वर पहिल्या login साठी `PLATFORM_OWNER_EMAIL`, `PLATFORM_OWNER_PASSWORD` (किमान 12 characters) आणि `PLATFORM_OWNER_NAME` secrets/environment variables द्या. Owner नसल्यास startup एक owner तयार करेल. आधीच owner असल्यास हे bootstrap values पुन्हा वापरले जाणार नाहीत. Password ZIP मध्ये ठेवू नका.
- App startup ordered, tracked migrations चालवतो आणि 130 templates sync करतो. Migration fail झाली तर server startup fail होईल; error लपवला जाणार नाही. Existing database असल्यास आधी backup घ्या.

## Build/deploy
Cloud Shell मध्ये ZIP extract करून `app/` directory मधून deploy करा. Artifact Registry permission error आल्यास Cloud Build log मध्ये दाखवलेला नेमका service account आणि project scope तपासल्याशिवाय IAM role बदलू नका. `roles/logging.logWriter` artifact upload permission देत नाही.

## Live verification gates
- `/api/ready` आणि `/api/health` DB-ready दाखवतात.
- Platform Owner login आणि session restore; Agency Owner आणि Customer login.
- दोन स्वतंत्र agencies मधील customer/lead/invoice data एकमेकांना दिसत नाही याची negative tests.
- Customer CRUD, templates, forms, form-to-lead, pipelines, invoice, partial payment, ledger, refund, exports.
- Browser training mode main production data पासून वेगळा राहतो.
- Backup/restore, rate limits, secrets, CORS आणि provider credentials तपासा.

या environment मध्ये live PostgreSQL/Docker/Cloud Run उपलब्ध नसल्याने हे gates अजून प्रत्यक्ष PASS झालेले नाहीत.
