# OSINT – zbiranje informacij o posameznikih na spletu

Obveščevalni viri (OSINT - Open Source INTelligence) so viri informacij, ki so javno dostopni, na primer: spletne strani, družbena omrežja, forumi, iskalniki. Pri tej vaji bomo pogledali kako se lahko tudi povprečen uporabnik interneta dokoplje do osebnih informacij druge osebe, če te niso ustrezno zaščitene.

# 🧪 Osnovno o OSINT

OSINT predstavlja obveščevalne podatke iz odprtih virov, kot tehnika pa predstavlja zbiranje in analizo informacij, ki so javno dostopne preko odprtih in zakonitih virov.

OSINT temelji na načelu, da je na spletu in drugih javnih medijih mogoče najti ogromno podatkov, ki jih lahko uporabimo za različne namene – od kibernetske varnosti, etičnega hekinga, do novinarstva, raziskav in varnostnih preiskav.

## 1️⃣ Uvod: Zbiranje informacij o posameznikih na spletu

Cilji vaje so:  
✅ Spoznati tehnike OSINT za zbiranje javno dostopnih informacij o posameznikih.  
✅ Zavedanje koliko osebnih podatkov je mogoče najti na spletu.  
✅ Razprava o tem, kako se lahko zaščitimo pred preveliko izpostavljenostjo.  

### Orodja za zbiranje informacij o posameznikih

Sherlock je OSINT orodje, ki išče uporabniška imena na več kot 300 družbenih omrežjih in spletnih platformah. Omogoča vnos uporabniškega imena v obliki niza, orodje pa preveri, ali obstajajo profili s tem imenom na znanih spletnih straneh.

![Sherlock primer](https://github.com/sherlock-project/sherlock/raw/master/docs/images/demo.png)

[Dokumentacija in GitHub](https://github.com/sherlock-project/sherlock)

Maigret gre še korak dlje kot Sherlock, saj poleg iskanja uporabniških imen ponuja podrobno analizo digitalnega odtisa posameznika, vključno z dodatnimi metapodatki in pogosto tudi aktivnostjo uporabniških računov.

[Dokumentacija in GitHub](https://github.com/soxoj/maigret)


## 2️⃣ Aktivnost: OSINT - Zbiranje informacij o posamezniku

Izberite javno osebo (npr. znanega novinarja, politika, športnika) ali fiktivno osebo z vnaprej pripravljenimi podatki za vadbo (priporoča se uporaba anonimiziranih podatkov za spoštovanje zasebnosti).

### 🖥️ Sherlock

🔷 1️⃣ Priprava okolja

Sherlock je orodje, ki teče v ukazni lupini z nameščenim Pythonom.

✅ Če delate v Linux okolju (npr. Kali) je Sherlock je že pogosto nameščen ali ga namestite:

```bash
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
pip3 install -r requirements.txt
```

Lahko poskusite tudi z:
```bash
python3 -m venv sherlock-env
pip install -r requirements.txt\n
source sherlock-env/bin/activate
pip install sherlock

```


Zaženete Sherlock:

```bash
python3 sherlock <username>
```

### 🖥️ Maigret

🔷 2️⃣ Alternativa oz. dopolnitev Sherlocku

Maigret podobno kot SHerlock teče v ukazni lupini z nameščenim Pythonom. Podpira tudi spletni vmesnik in razne oblike izhodov in poročil.

✅ Namestitev Maigret (če še ni nameščen):
```bash
pip install maigret
```
ali iz izvorne kode:

```bash
git clone https://github.com/soxoj/maigret.git
cd maigret
pip install -r requirements.txt
```

Lahko poskusite tudi z:
```bash
python3 -m venv maigret-env
pip install -r requirements.txt\n
source maigret-env/bin/activate
pip install maigret
```


Zagon Maigret: 

```bash
maigret <username>
```

🔷 Primerjava orodij
Uporabite oba programa za isto uporabniško ime ter rimerjajte rezultate: katero orodje je našlo več profilov? Katero je dalo bolj pregledne podatke?

Razmislite: ali sta se našla profila na družbenih omrežjih, kjer tega niste pričakovali?

### 📝 Analiza in poročilo

- Primerjajte rezultate Sherlocka in Maigreta. Katere razlike ste opazili? 
- Ali ste našli kakšno občutljivo informacijo (npr. e‑poštni naslov, zasebne slike, telefonsko številko)? Kako bi jo lahko oseba zaščitila pred tem, da je javno dostopna?

## 3️⃣ Refleksija in analiza

- Katere informacije so bile najlažje najdene? Katere je bilo najtežje najti?
- Kako bi vi sami prilagodili svoje vedenje na spletu, potem ko ste izvedli to vajo?
- Ali menite, da je uporaba OSINT orodij etično sporna? V katerih primerih je upravičena?

## Reference

1. Sherlock Project, *Sherlock: Find usernames across social networks*, GitHub, https://github.com/sherlock-project/sherlock 
2. Maigret,  *Maigret*, GitHub, https://github.com/soxoj/maigret
3. OSINT Framework, *OSINT tools and resources collection*,https://osintframework.com/  
4. OpenAI, (2025), *ChatGPT* (Aug 2025) [Large language model], https://chat.openai.com/
