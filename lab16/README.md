# Secrets Management z uporabo GPG

## 🎯 Cilj vaje
Cilj vaje je razumeti:
- kaj so skrivnosti (secrets) v informacijskih sistemih,
- zakaj skrivnosti ne sodijo v izvorno kodo ali repozitorije,
- kako lahko z uporabo GPG zaščitimo občutljive podatke,
- osnovni koncept **Secrets Management** brez specializiranih orodij.

---

## 🧠 Kratek uvod
Skrivnosti (gesla, API ključi, tokeni, certifikati) so pogosto:
- shranjene v konfiguracijskih datotekah,
- del CI/CD okolij,
- tarča napadalcev pri vdoru ali uhajanju kode.

Napaka:
```text
API_KEY=abc123
```
v Git repozitoriju ❌

---

## 🧪 Scenarij
Podjetje razvija aplikacijo, ki uporablja zunanji API.
API ključ mora biti:
- shranjen lokalno,
- zaščiten pred nepooblaščenim dostopom,
- dostopen samo pooblaščenemu uporabniku.

---

## 🧰 Zahteve
- Linux / Ubuntu
- nameščen `gnupg`

Namestitev:
```bash
sudo apt update
sudo apt install gnupg
```

---

## 🔑 1) Priprava skrivnosti

Ustvarite datoteko s skrivnostmi:

```bash
echo "API_KEY=super-secret-key-123
DB_PASSWORD=VeryStrongPassword" > secrets.env
```

⚠️ Ta datoteka je v **nešifrirani obliki** in ni varna.

---

## 🔐 2) Simetrično šifriranje skrivnosti (geslo)

Šifrirajte datoteko z geslom:

```bash
gpg -c secrets.env
```

Rezultat:
```
secrets.env.gpg
```

Odstranite original:
```bash
rm secrets.env
```

---

## 🔓 3) Dešifriranje skrivnosti

Ko aplikacija ali administrator potrebuje skrivnosti:

```bash
gpg secrets.env.gpg
```
Datoteka `secrets.env` se ponovno ustvari.

Lahko pa tudi samo izpišemo na zaslon:

```bash
gpg -d secrets.env.gpg
```

---

## 🔐 4) Asimetrično šifriranje (priporočeno)

Namesto gesla uporabimo javni ključ.

```bash
gpg --encrypt --recipient student@example.com secrets.env
```

Rezultat:
```
secrets.env.gpg
```

Prednost:
- ni skupnega gesla,
- samo lastnik zasebnega ključa lahko dešifrira.

---

## 🔁 5) Uporaba skrivnosti v aplikaciji (simulacija)

Naložite spremenljivke v okolje:

```bash
source secrets.env
echo $API_KEY
```

Po uporabi:
```bash
unset API_KEY
unset DB_PASSWORD
```

---

## 🧪 6) Simulacija uhajanja repozitorija

Predpostavimo, da je v repozitoriju samo:

```text
secrets.env.gpg
```

Napadalec brez ključa:
```bash
gpg secrets.env.gpg
```

➡️ Dostop ni mogoč.

---

## 🧠 Razmislek (obvezno)
Odgovorite:
1. Zakaj skrivnosti ne sodijo v izvorno kodo?
2. Kakšna je razlika med simetričnim in asimetričnim šifriranjem skrivnosti?
3. Kaj se zgodi, če izgubimo zasebni ključ?
4. Kako bi to rešili v večjem podjetju?

---

## ⭐ Dodatni izziv

### Več uporabnikov
Šifrirajte skrivnosti za več prejemnikov:

```bash
gpg --encrypt --recipient alice@example.com --recipient bob@example.com secrets.env
```

### Samodejna uporaba (script)
```bash
gpg --decrypt secrets.env.gpg | source /dev/stdin
```

---

## 📌 Povzetek
- Secrets management je ključni del kibernetske varnosti.
- GPG omogoča osnovno, a učinkovito zaščito skrivnosti.
- V praksi se uporabljajo orodja kot so Vault, SOPS, AWS Secrets Manager.
