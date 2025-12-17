# Prepoznavanje MITM napada na GPG ključe (Web of Trust)

## 🎯 Cilj vaje
Namen vaje je razumeti, da:
- javni ključ sam po sebi še ne pomeni zaupanja,
- lahko pride do MITM (Man-in-the-Middle) napada pri izmenjavi ključev,
- je preverjanje fingerprinta ključno,
- Web of Trust pomaga pri zaznavanju takih napadov.

---

## 🧠 Kratek uvod
Če napadalec uspe podtakniti svoj javni ključ namesto pravega, lahko:
- bere vsa šifrirana sporočila,
- se izdaja za drugo osebo,
- GPG tega brez preverjanja zaupanja ne zazna.

---

## 🧪 Scenarij
V vaji sodelujejo tri osebe:
- **Alice** – pošiljatelj
- **Bob** – prejemnik
- **Mallory** – napadalec (MITM)

Vse se izvaja na **isti napravi**.

---

## 🔑 1) Ustvarjanje ključev

Ustvarite tri GPG ključe:

```bash
gpg --full-generate-key
```

Podatki (primer):
- Alice: `alice@example.com`
- Bob: `bob@example.com`
- Mallory: `mallory@example.com`

Preverite ključe:
```bash
gpg --list-keys
```

---

## 🧾 2) Izpis fingerprintov (zelo pomembno)

```bash
gpg --fingerprint alice@example.com
gpg --fingerprint bob@example.com
gpg --fingerprint mallory@example.com
```

📌 Fingerprint je edini zanesljiv način preverjanja ključa.

---

## 🕵️ 3) MITM napad – zamenjava ključa

Mallory izvozi **svoj** javni ključ in ga poimenuje kot Bobovega:

```bash
gpg --armor --export mallory@example.com > bob_pubkey.asc
```

Alice uvozi ključ:
```bash
gpg --import bob_pubkey.asc
```

➡️ Alice verjame, da ima Bobov ključ, v resnici pa ima Malloryjevega.

---

## 🔐 4) Alice šifrira sporočilo

```bash
echo "Zaupno sporocilo za Boba" > secret.txt
```

```bash
gpg --encrypt --recipient bob@example.com secret.txt
```

➡️ Sporočilo je šifrirano z napačnim ključem.

---

## 👀 5) Mallory dešifrira sporočilo

```bash
gpg --decrypt secret.txt.gpg
```

✔ MITM napad je uspešen.

---

## 🚨 6) Zaznava napada – preverjanje fingerprinta

Bob posreduje Alice **pravilen fingerprint po drugem kanalu** (osebno, telefon).

Alice preveri:
```bash
gpg --fingerprint bob@example.com
```

❌ Fingerprint se ne ujema → zaznan MITM napad.

---

## 🛡️ 7) Web of Trust – nastavitev zaupanja

Alice nastavi zaupanje preverjenemu ključu:

```bash
gpg --edit-key bob@example.com
```

V konzoli:
```text
trust
5
quit
```

---

## 🧠 Razmislek
Odgovorite:
1. Zakaj GPG ne zazna MITM napada samodejno?
2. Kaj je fingerprint in zakaj je pomemben?
3. Zakaj e-pošta ni varen kanal za izmenjavo ključev?
4. Kako Web of Trust zmanjša tveganje MITM napada?

---

## ⭐ Dodatni izziv

Podpis Bobovega ključa z Aliceinim ključem:
```bash
gpg --sign-key bob@example.com
```

Razložite razliko med:
- zaupanjem (trust),
- podpisanim ključem (signed key),
- ultimativnim zaupanjem (ultimate trust).

---

## 📌 Povzetek
- Kriptografija deluje pravilno, dokler zaupamo pravemu ključu.
- Fingerprint je temelj zaupanja.
- Web of Trust pomaga zaznavati MITM napade.
