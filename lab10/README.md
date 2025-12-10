# CTF vaja na realnem primeru: HackyCorp

V tej seriji praktičnih vaj bomo analizirali varnostne ranljivosti spletne strani **[https://hackycorp.com](https://hackycorp.com)** in pripadajočih GitHub repozitorijev. Vsaka vaja predstavlja samostojen CTF (Capture The Flag) izziv, pri katerem je cilj pridobiti zastavico (`flag`) s pomočjo raziskovanja, tehničnega znanja in razumevanja kibernetske varnosti.

Pri vsakem izzivu poiščite **zastavico** in jo vpišite kot dokaz uspešno opravljene naloge.

---

## Odkrivanje ranljivosti iz znanih URL naslovov

Včasih spletne strani uporabljajo privzete URL naslove za prijavo /login /admin ipd. Te lahko razkrivajo določene ranljivosti in omogočajo dodatno zbiranje informacij.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  Preverimo url /admin
  Zastavica rešitve: `ad1d44d6-ab73-4640-8291-c5bf2343e2a5`
</details>

Namig poskusite poiskati še kakšno zastavico na URL datotekah statičnih datotek (slike, skripte ipd.).

## Odkrivanje ranljivosti iz javnih datotek

Razvijalci spletne strani so na spletni strani pustili javno datoteko, ki vsebuje naš ključ/zastavico, ki jo iščemo. Iščemo javno datoteko key.txt, ki je najverjetneje javna (morda pomotoma), in se nahaja na istem mestu, kjer strežnik streže statične datoteke (assets), kot so npr. slike, CSS ali JS datoteke.


### Namig / Rešitev

Namig: v izvorni kodi spletne strani poiščite poddomeno, ki se uporablja za serviranje statičnih datotek, nato identificirajte končni strežnik s pomočjo ukaza dig, da pridobite dostop do CDN.
<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  Javna datoteka se nahaja na domeni v korenski mapi. Ime datoteke je key.txt.
  Zastavica rešitve: `e94ab8a5-b0c1-4559-8bc7-cae2e53b10e0`
</details>

## Odkrivanje ranljivosti v Javascript datotekah

V naslednjem koraku bomo analizirali spletno stran in med njenimi JavaScript datotekami poiskali hardcodan (vnaprej vnešen) ključ. Takšne napake se pogosto pojavijo v realnih aplikacijah in lahko predstavljajo resno varnostno tveganje, saj omogočajo napadalcem dostop do notranjih sistemov ali podatkov.


### Namig / Rešitev

Namig: v izvorni kodi spletne strani poiščite skripto, ki se uporablja, nato poiščite ključ.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  Preiščemo JS datoteke, v eni izmed njih najdemo zapis o ključu. 
  Zastavica rešitve: `d6b75269-97a3-44de-be32-fff0dd55e7ef`
</details>

## Odkrivanje ranljivosti na spletnem strežniku

Včasih spletni strežnik razkrije v glavi zahteve določene informacije. En primer je uporaba curl zahtevka na domeno ali preiskovanje robots.txt datoteke.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  curl -I https://hackycorp.com/
  Zastavica rešitve: `99d0738b-1e52-4a00-8885-b15894b2c79e`

  curl https://hackycorp.com/robots.txt
  Zastavica rešitve: `af9c328a-02b4-439d-91c6-f46ab4a0835b`

</details>

SSL strežnik običajno za certifikat kreira datoteko security.txt, ki prav tako lahko razkriva določene informacije.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  curl https://hackycorp.com/.well-known/security.txt
  Zastavica rešitve: `99685e30-7061-4ac0-83bf-4ccc0409faac`

</details>

Poskusimo lahko tudi s curl zahtevnom na neobstoječo stran - 404 error.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  curl -I https://hackycorp.com/neobstaja
  Zastavica rešitve: `99d0738b-1e52-4a00-8885-b15894b2c79e`

</details>

## Odkrivanje ranljivosti preko IP naslova

Krovni IP strežnik domene lahko servira ločen spletni strežnik in morebiti razkriva določene informacije.


<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  curl --insecure http://IP_STREZNIKA
  Zastavica rešitve: `5cf83b5d-eb6c-4eee-af6c-945f9aed8dfd`

</details>


## Odkrivanje ranljivosti v Github repozitorijih

V tej nalogi bomo raziskoval GitHub repozitorij, kjer bomo preverili vse obstoječe veje (branches) in poskusili najti skrite ali občutljive podatke, ki se ne nahajajo v privzeti (main ali master) veji. Pri vajah z Github bomo uporabljali profil organizacije: https://github.com/hackycorp

### Odkrivanje ranljivosti v repo3

Namig: Raziščite veje projekta v repozitoriju repo3.  

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  V repo3 najdemo vejo, ki vsebuje zastavico.
  Zastavica rešitve: `08be82ba-e5fd-4fae-b2c2-272a18d31f80` 
</details>

### Odkrivanje ranljivosti v repo4
  
Enako naredimo za repozitorij repo4.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  Zastavica se tokrat nahaja v datoteki v drugi veji.
  Zastavica rešitve: `a60b4aee-642a-483b-9262-ccfc2ed46f0d`
</details>

### Odkrivanje ranljivosti v repo9

V nadaljevanju se osredotočimo še na repo9. Tu moramo poiskati spremembe v datotekah, kjer najdemo izbrisan ključ.


<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  Poiščemo spremembe
  ```bash
  git log --diff-filter=D --summary
  git log -- KEY.txt
  git show COMMIT_HASH:KEY.txt
  ```
  Zastavica rešitve: `3ee505c2-8aa9-4d5e-810e-921778dce1e6`
</details>

### Odkrivanje ranljivosti v repo0a

V nadaljevanju se osredotočimo še na repo0a. Tu moramo poiskati poslano sporočilo ob zapisu, kjer najdemo zapisan ključ.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  Poiščemo log
  ```bash
  git log --oneline
  git log --oneline --grep=key -i
  git show COMMIT_HASH
  ```
  Zastavica rešitve: `5c75cfe9-52dd-475b-8cfa-7ffc492abeca`
</details>

Poskusite poiskati ključe še na repozitorijih:
- https://github.com/hackycorp/repo1
- https://github.com/hackycorp/repo7
- https://github.com/hackycorpdev/test1


## Odkrivanje ranljivosti v DNS zapisih

Včasih lahko s preiskovanjem TXT zapisov pridobimo informacije, ki vključujejo občutljive podatke. Primer tega lahko pridobimo s pregledom TXT zapisa domene key.z.hackycorp.com.

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>
  Namig: dig key.z.hackycorp.com TXT

  Lahko bi tudi uporabili bruteforce strategijo:
  ```bash
  for sub in key test dev txt api admin; do
    dig $sub.z.hackycorp.com TXT +short
  done
  ```
  Zastavica rešitve: `9f883f22-6ea5-4631-bbe8-95841ad63f56`
</details>

## Uporaba mehanizma za sinhronizacijo DNS zapisov

V tej nalogi bomo izvedli DNS sinhronizacijo na domensko cono z.hackycorp.com in tako poskušali pridobiti seznam DNS zapisov, ki jih strežnik razkriva.
Opomba: deluje samo v virtualiziranem okolju

Uporabimo:  
dig AXFR z.hackycorp.com  
dig -t SOA z.hackycorp.com  
dig AXFR z.hackycorp.com @z.hackycorp.com  

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  Zastavica rešitve: `e5fce970-6d94-43c1-bdd5-a06c2b235f9c`
</details>

## Razkrivanje informacij s pomočjo poizvedb programske opreme

Različica programske opreme, ki se uporablja nam pogosto razkrije morebitne varnostne ranljivosti.

Opomba: deluje samo v virtualiziranem okolju

Uporabimo:  
dig -c chaos -t txt VERSION.BIND @z.hackycorp.com

<details>
  <summary>Kliknite tukaj za prikaz rešitve</summary>

  Zastavica rešitve: `4e5e76e1-728a-49be-aea8-4591ba11e588`
</details>


## Skriptno programiranje in avtomatizacija

Velikokrat si lahko pomagamo s pripravo skripte, ki s strategijo brute-force izvede določene akcije.

Pripravili bomo dve skripti:

  ```bash
for i in `seq 1 150`
do
    printf "0x%02x.a.hackycorp.com\n" $i >> hosts.txt
done
  ```

  ```bash
for i in `cat hosts.txt`
do
    curl $i/logo.png -o $i.png
done
  ```

Preizkusite lahko še ostale CTF izzive na spletnih straneh:
- https://www.root-me.org/
- https://pentesterlab.com/exercises/
- https://tryhackme.com/hacktivities
