# Lab 00

## 🧪 Vaja: Osnovni ukazi

✅ **Naloga:**  
- Premaknite se v domači imenik.
- Ustvarite imenik `linux-vaja`.
- Vstopite vanj.

```bash
cd ~
mkdir linux-vaja
cd linux-vaja
```
### 2️⃣ Delo z datotekami in imeniki

✅ **Naloga:**
- Ustvarite datoteko `opis.txt` in vanjo zapiši svoje ime.
- Ustvarite imenik `testni`.
- Premaknite `opis.txt` v `testni`.

```bash
echo "Matej" > opis.txt
mkdir testni
mv opis.txt testni
```

### 3️⃣ Premikanje in kopiranje

✅ **Naloga:**
- Preimenujte `opis.txt` v `moj_profil.txt`.
- Kopirajte `moj_profil.txt` v domačo mapo.

```bash
cd testni
ls -la
mv opis.txt moj_profil.txt
cp moj_profil.txt ~
```

### 4️⃣ Pravice in velikosti

✅ **Naloga:**
- Preverite velikost vseh datotek v mapi.
- Spremenite pravice datoteki `moj_profil.txt` tako, da je samo za branje za vse.

```bash
cd ~
chmod 444 moj_profil.txt
ls -lh
```

### 5️⃣ Prikaz sistemskih informacij

✅ **Naloga:**
- Ugotovite ime svojega uporabnika in velikost domačega imenika.
- Preverite, koliko prostora je na voljo v sistemu.

```bash
whoami
df -h

du -ah ~ | sort -rh | head -n 5\n
```