# Analiza varnostnih groženj in ranljivosti

V tej vaji boste spoznali najpogostejše grožnje v elektronskem poslovanju in prepoznali ranljivosti v spletnih aplikacijah s pomočjo enostavne spletne storitve za pregled ranljivosti. Naučili se boste prepoznati tipične napake razvijalcev in oblikovalcev ter kako jih zmanjšati.

---

# 🧪 Varnostne grožnje in ranljivosti

Elektronsko poslovanje vključuje izmenjavo občutljivih podatkov med uporabniki in podjetji prek spletnih aplikacij. Če aplikacije niso pravilno zaščitene, so lahko izpostavljene različnim napadom, ki ogrožajo podatke in poslovanje.

OWASP (Open Web Application Security Project) pripravlja seznam 10 najpogostejših ranljivosti (OWASP Top 10), ki služi kot standard pri ocenjevanju varnosti spletnih aplikacij.

---

## 1️⃣ Uvod: Cilji

✅ razumeti najpogostejše vrste ranljivosti spletnih aplikacij  
✅ spoznati OWASP Top 10 v kontekstu e-poslovanja  
✅ znati prepoznati ranljivosti in razpravljati o njihovih posledicah  

---

## 2️⃣ Aktivnost: Pregled spletne aplikacije z HostedScan

Za to vajo bomo uporabili spletno storitev **HostedScan OWASP Vulnerability Scan**:  
🌐 [https://hostedscan.com/owasp-vulnerability-scan](https://hostedscan.com/owasp-vulnerability-scan)

### Navodila

1️⃣ Odprite povezavo [https://hostedscan.com/owasp-vulnerability-scan](https://hostedscan.com/owasp-vulnerability-scan)  
2️⃣ Prijavite se z e-poštnim naslovom (če je potrebno) in izberite brezplačno možnost.  
3️⃣ Vnesite URL spletne strani, ki jo boste pregledali. Uporabite demo spletno stran, ki jo bo določil predavatelj (npr. pripravljena e-poslovna stran za testiranje).  
4️⃣ Zaženite pregled. Počakajte, da se zaključi, in prenesite poročilo (PDF ali HTML).  
5️⃣ Analizirajte rezultate: katere ranljivosti so bile zaznane?

### Dokumentacija

Za vsako zaznano ranljivost zapišite:  
- ime ranljivosti  
- oceno resnosti (npr. nizka, srednja, visoka)  
- kratko pojasnilo, zakaj je nevarna  
- kako bi jo odpravili

---

## 3️⃣ OWASP Top 10 (2021)

Za referenco se opirajte na OWASP Top 10:  
✅ Broken Access Control  
✅ Cryptographic Failures  
✅ Injection  
✅ Insecure Design  
✅ Security Misconfiguration  
✅ Vulnerable and Outdated Components  
✅ Identification and Authentication Failures  
✅ Software and Data Integrity Failures  
✅ Security Logging and Monitoring Failures  
✅ Server-Side Request Forgery (SSRF)

---

## 4️⃣ Refleksija in poročilo

### 📝 Navodila za poročilo

- Naštejte in opišite vsaj 3 zaznane ranljivosti (ime, resnost, posledice).  
- Katere ranljivosti iz OWASP Top 10 ste prepoznali?  
- Katere ukrepe bi priporočili za izboljšanje varnosti?  
- Ali vas je kateri rezultat presenetil? Zakaj?

---

📑 Poročilo oddajte v pisni obliki (priporočeno: 1–2 strani).  
📣 Pomembno: pregledujte samo pripravljene testne spletne strani — ne izvajajte pregledov na tujih proizvodnih sistemih brez dovoljenja!