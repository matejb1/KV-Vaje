# Uporaba varne komunikacije

V vsakdanjem življenju komuniciramo prek elektronske pošte, klepetalnih aplikacij in družbenih omrežij. Večina teh komunikacij ni zaščitena, zato jo lahko prestreže kdorkoli med pošiljateljem in prejemnikom.  
**Šifriranje** omogoča, da sporočilo prebere le pravi prejemnik, ter preprečuje prisluškovanje, manipulacijo in krajo podatkov.

V tej vaji boste delali v **realističnem scenariju** in uporabili **PGP za šifriranje e-pošte** ter **Signal za varno sporočanje**.  

---

## 🎯 Scenarij
Predstavljajte si, da ste novinar, ki se pogovarja z žvižgačem iz podjetja.  
Prejemate občutljive dokumente in morate poskrbeti, da:
1. Nihče drug ne bo mogel prebrati vsebine.
2. Dokument bo potrjeno prišel od prave osebe.
3. Pošiljatelj in prejemnik se bosta lahko prepričala, da se med njima ni vmešal tretji.

---

## 1️⃣ Uvod v šifriranje

- **Simetrično šifriranje** – isti ključ za šifriranje in dešifriranje (npr. AES).
- **Asimetrično šifriranje** – par javni/zasebni ključ (npr. RSA, ECC).  
  PGP (Pretty Good Privacy) uporablja ta princip.
- **Digitalni podpis** – zasebnim ključem podpišeš sporočilo, javni ključ pa omogoča preverjanje pristnosti.

---

## 2️⃣ Simulacija ranljivosti
Najprej bomo pokazali ranljivost pri uporabi nešifriranih povezav na primeru testnega SMTP strežnika. 

1. Povežite se na **testni SMTP strežnik** (lahko lokalni) in pošljite e-pošto brez šifriranja.
2. S programom **Wireshark** ali `tcpdump` prikažite, da je vsebina vidna v “cleartext”.
3. Zapišite ugotovitve – kakšna tveganja bi to pomenila v realnem svetu.

Ta vaja prikazuje, kako zajeti **cleartext** SMTP promet v okolju Google Cloud Shell in ga analizirati v Wiresharku.
Uporabili bomo MailHog kot testni SMTP strežnik in `swaks` za pošiljanje testnega sporočila.

---

### Zagon MailHog v GitHub Codespaces

```bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo docker run -d --name mailhog -p 1025:1025 -p 8025:8025 mailhog/mailhog

```

- SMTP: `127.0.0.1:1025` (brez TLS)
- UI: Web Preview → Port 8080

---

### Zajem s `tcpdump`

```bash
sudo apt install tcpdump
sudo tcpdump -i any tcp port 1025 -w smtp.pcap &
```

- `&` pošlje proces v ozadje, da lahko v istem terminalu izvedeš še `swaks`.

---

### Pošiljanje testnega sporočila s **swaks**

```bash
sudo apt install swaks
swaks --server 127.0.0.1 --port 1025   --from ti@example.com --to test@example.com   --data "Subject: Codespace SWAKS Test\n\nPozdrav iz FIS!"
```

- Ker MailHog nima TLS, `swaks` ne bo šifriral — promet bo viden kot *cleartext*.

---

### Ustavite zajem

```bash
sudo pkill tcpdump
```
*(ali **Ctrl + C**, če `tcpdump` ni bil v ozadju)*

---

### Prenesite `.pcap` na lokalni računalnik

- V Codespace panelu poiščite `smtp.pcap`
- Desni klik → **Download**
- Odprite datoteko v Wiresharku.

---

### Analiza v Wiresharku

1. Filter:
    ```
    tcp.port == 1025
    ```
2. Kliknite na paket z `DATA` v **Info** stolpcu.
3. Desni klik → **Follow → TCP Stream**.
4. V novem oknu vidite celotno SMTP sejo:
    - SMTP ukaze (`EHLO`, `MAIL FROM`, `RCPT TO`)
    - Glave e-pošte (`Subject: ...`)
    - Telo e-pošte


---

## 3️⃣ Aktivnost: Šifrirana komunikacija

### Zajem in analiza šifriranega SMTP prometa

Ta vaja prikazuje, kako zajeti **cleartext** SMTP promet v okolju Google Cloud Shell in ga analizirati v Wiresharku.
Uporabili bomo MailHog kot testni SMTP strežnik in `swaks` za pošiljanje testnega sporočila.

### Namestitev Postfix

```bash
docker run -d --name postfix587   -p 587:587   -e ALLOWED_SENDER_DOMAINS="localdomain"   -e POSTFIX_myhostname=postfix.local   boky/postfix
```

---

### Zajem s `tcpdump`

```bash
sudo tcpdump -i any tcp port 587 -w smtpssl.pcap &
```

- `&` pošlje proces v ozadje, da lahko v istem terminalu izvedete še `swaks`.

---

### Pošiljanje testnega sporočila s **swaks**

```bash
swaks --server 127.0.0.1 --port 587 --tls   --from test@localdomain --to demo@localdomain   --header 'Subject: STARTTLS test'   --body 'Pozdrav prek TLS!'
```
---

### Ustavite zajem

```bash
sudo pkill tcpdump
```
*(ali **Ctrl + C**, če `tcpdump` ni bil v ozadju)*

---

### Prenesite `.pcap` na lokalni računalnik

- V Codespace panelu poiščite `smtpssl.pcap`
- Desni klik → **Download**
- Odprite datoteko v Wiresharku.

---

### Analiza v Wiresharku

1. Filter:
    ```
    tcp.port == 587
    ```
2. Kliknite na paket z `DATA` v **Info** stolpcu.
3. Desni klik → **Follow → TCP Stream**.
4. V novem oknu vidite celotno SMTP sejo s šifrirano vsebino.

---

## 5️⃣ Refleksija

- Kako bi razložili razliko med nešifriranim (npr. SMTP brez TLS na portu 1025) in šifriranim sporočilom (SMTP s STARTTLS na portu 587)? Katere podatke lahko napadalec vidi v prvem primeru in katere v drugem?
- Zakaj je preverjanje fingerprinta pri PGP za preprečitev man-in-the-middle napada?
- Kdaj bi uporabili PGP in kdaj Signal?
- Ali menite, da bi moralo biti end-to-end šifriranje privzeto v vseh komunikacijskih aplikacijah?
Utemeljite odgovor z vidika varnosti, zasebnosti in uporabniške izkušnje.

---

## Reference

1.	Boky, Postfix Docker image, https://hub.docker.com/r/boky/postfix
2.	MailHog, MailHog email testing tool, https://github.com/mailhog/MailHog
3.	Docker Inc., Docker – Empowering App Development, https://www.docker.com/
4.	Tcpdump Group, tcpdump, https://www.tcpdump.org/
5.	Jetmore, J., swaks – Swiss Army Knife for SMTP, https://github.com/jetmore/swaks
4. OpenAI. (2025), *ChatGPT* (Aug 2025) [Large language model], https://chat.openai.com/