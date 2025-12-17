# GPG: ustvarjanje ključev, šifriranje in podpisovanje

## 🎯 Cilj vaje
V tej vaji boste praktično uporabili **GPG (GNU Privacy Guard)** za:
- generiranje para ključev,
- izvoz in uvoz javnega ključa,
- šifriranje datoteke,
- digitalno podpisovanje,
- dešifriranje in preverjanje podpisa.

---

## 🧰 Zahteve
- Linux / Ubuntu
- nameščen paket `gnupg`

Namestitev (če še ni nameščen):

```bash
sudo apt update
sudo apt install gnupg
```

---

## ✅ 1) Generiranje GPG para ključev

```bash
gpg --full-generate-key
```

Izberite:
- **Key type:** RSA and RSA  
- **Key size:** 4096  
- **Expiration:** 1y  
- **Name:** Student Ime  
- **Email:** student@example.com  

Preverite ključe:

```bash
gpg --list-keys
```

---

## ✅ 2) Izvoz in uvoz javnega ključa

### Izvoz javnega ključa

```bash
gpg --armor --export student@example.com > student_pubkey.asc
```

### Uvoz tujega javnega ključa

```bash
gpg --import peer_pubkey.asc
```

Namig: v kolikor nimate tujega javnega ključa si ustvarite še en lasten ključ, ponovite zgornji postopek z drugo identiteto.

Preverjanje:

```bash
gpg --list-keys
```

---

## ✅ 3) Priprava sporočila

```bash
echo "To: peer@example.com
From: student@example.com
Date: $(date)
Secret message: Zaupno sporocilo" > message.txt
```

---

## ✅ 4) Šifriranje in podpis

```bash
gpg --encrypt --sign --armor --recipient peer@example.com message.txt
```

Rezultat:
```
message.txt.asc
```

---

## ✅ 5) Dešifriranje in preverjanje podpisa

```bash
gpg --decrypt message.txt.asc > decrypted_message.txt
```

```bash
cat decrypted_message.txt
```

Pričakovan izpis:
```
gpg: Good signature from "Student Ime <student@example.com>"
```

---

## 📝 Priprava poročila
V poročilo vključite:
- uporabljene ukaze,
- posnetek zaslona terminala,
- kratke odgovore:
  1. Razlika med šifriranjem in podpisom
  2. Vloga javnega in zasebnega ključa
  3. Kaj se zgodi ob spremembi šifrirane datoteke

---

## ⭐ Dodatne naloge

### Revocation certificate

```bash
gpg --gen-revoke student@example.com > revoke.asc
```

### Samo podpis (brez šifriranja)

```bash
gpg --clearsign message.txt
```

### Preverjanje podpisa

```bash
gpg --verify message.txt.asc
```

---

## 🧠 Povzetek
- Šifriranje zagotavlja **zaupnost**
- Digitalni podpis zagotavlja **avtentičnost in integriteto**
- GPG uporablja **asimetrično kriptografijo (RSA)**
