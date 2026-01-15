## 5️⃣ Refleksija

- Kako bi razložili razliko med nešifriranim (npr. SMTP brez TLS na portu 1025) in šifriranim sporočilom (SMTP s STARTTLS na portu 587)? Katere podatke lahko napadalec vidi v prvem primeru in katere v drugem?  V nešifiranemu sporočilu lahko preberemo dejansko vse: mail pošiljatelja, mail prejemnika, vsebina sporočila. V primerjavi s šifriranim prometom pa lahko le opazimo le TCP handshake, podatki sporočila so pa zašifrirani, potrebovali bi ključ, če bi želeli ga prebrati.

- Zakaj je preverjanje fingerprinta pri PGP za preprečitev man-in-the-middle napada? VPRAŠI NA DS
- Kdaj bi uporabili PGP in kdaj Signal? VPRAŠI NA DS
- Ali menite, da bi moralo biti end-to-end šifriranje privzeto v vseh komunikacijskih aplikacijah?
Utemeljite odgovor z vidika varnosti, zasebnosti in uporabniške izkušnje.