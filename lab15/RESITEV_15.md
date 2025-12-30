## 🧠 Razmislek
Odgovorite:
1. Zakaj GPG ne zazna MITM napada samodejno? Ker GPG ne more vedeti s kom si izmenjuješ sporočila. Če dobiš lažen ključ, lahko preveriš fingerprint, ki ti ga pa mora zaupati še ta oseba s katero se naj bi pogovarjal, da je res to ta za katero se izdaja.
2. Kaj je fingerprint in zakaj je pomemben? Fingerprint je nek unikaten niz, s katerim lahko preverimo, ali je javni ključ res tisti, za katerega se ta oseba izdaja. 
3. Zakaj e-pošta ni varen kanal za izmenjavo ključev? Ker e-pošte ne moremo preveriti kdo je ključ dejansko poslal.
4. Kako Web of Trust zmanjša tveganje MITM napada? Ker lahko nastavimo prioriteto zaupanja. V bistvu določimo, katerim osebam (ključem) zaupamo. Na podlagi te prioritete nas GPG lahko opozori, če je oseba točno ta za katero se izdaja.