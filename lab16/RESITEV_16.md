## 🧠 Razmislek (obvezno)
Odgovorite:
1. Zakaj skrivnosti ne sodijo v izvorno kodo?

Ker če pride skrivnost na git, se to pozna za vedno - kdor ima dostop do gita ima dostop do skrivnosti. Bolj smiselno in praktično je da del kode ločimo na konfiguracijo, ki je dostopna izven aplikacije. Prav tako zaradi deployev, mi se tipično ne želimo fixirati samo za eno okolje, ampak naredimo splošno konfiguracijo, ki jo lahko uporabimo različno v vsakem okolju (npr. druga uporaniška imena, gesla, api ključi...)

2. Kakšna je razlika med simetričnim in asimetričnim šifriranjem skrivnosti?
Simetrična uporablja en ključ (nek niz s katerim de/šifriramo), asimetrično šifriranje pa uporablja par ključev.

3. Kaj se zgodi, če izgubimo zasebni ključ?

Ne moremo več dešifrirati sporočil / skrivnosti, ne moremo podpisovati sporočila.

4. Kako bi to rešili v večjem podjetju?

Backup in recovery. 
Preklic tega ključa, ki smo ga izgubili in uporabimo drugega, temu primerno prilagodimo tudi vse procese, ki se nanašajo na ta ključ (npr. CI/CD pipeline; npr. če ta ključ uporablja oseba za kakšno podpisovanje).