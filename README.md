# woonvos.nl

De website van **Woonvos**, je slimme huisgenoot. Statische site, gehost op
GitHub Pages met het eigen domein `woonvos.nl`.

## Opzet

Met de hand geschreven HTML en CSS, bewust zonder buildstap, generator of
afhankelijkheden. Een tekstwijziging is een commit; de site moet over twee
jaar nog aan te passen zijn zonder eerst een toolchain te herstellen.

```
index.html          Voorpagina, variant A van het stuk "Over Woonvos"
variant-b.html      Dezelfde voorpagina met variant B ("Van de maker");
                    noindex, canonical naar https://woonvos.nl/
privacy.html        Privacybeleid (vereist voor de app-stores)
support.html        Hulp en contact (de support-URL die Apple vereist)
404.html            Niet-gevonden-pagina
style.css           Eén stylesheet voor alles
check-varianten.sh  Controleert dat A en B alleen in de variantblokken verschillen
favicon.ico         Voor browsers die hem blind opvragen
assets/             zie hieronder
CNAME               Koppelt het domein woonvos.nl aan GitHub Pages
DNS.md              De DNS-records bij TransIP en hoe ze gecontroleerd zijn
```

`assets/`:

- `zashi-mark.png` is het beeldmerk (256 px, transparant), de bron.
  `zashi-mark-96.webp` is de versie die de site laat zien, in de kop en de
  voet (36 px, dus scherp tot 2,5x).
- `bitter-600.woff2` is het koplettertype Bitter SemiBold (latin, SIL Open
  Font License in `Bitter-OFL.txt`). De lopende tekst gebruikt de
  systeemletter van het toestel.
- `schermen/` bevat echte schermafbeeldingen van de app, per scherm twee
  WebP-bestanden: `-390` (1x) en `-780` (2x). Zie "Schermafbeeldingen".
- `og-woonvos.png` (1200 × 630) is de afbeelding die WhatsApp, Signal,
  LinkedIn en dergelijke tonen als iemand een link naar de site deelt.
- `favicon-32.png` en `apple-touch-icon.png` zijn de icoontjes.

## Wat er op de voorpagina staat

1. Een smalle testbalk bovenaan: "Testversie van de site" met de knoppen
   Variant A en Variant B (gewone links naar `/#over` en
   `/variant-b.html#over`, de actieve heeft `aria-current="page"`).
2. De kop "Je huis, goed geregeld." met de knop "Doe mee met de test"
   (een mailto naar hallo@woonvos.nl) en twee echte appschermen in een
   telefoon van CSS.
3. "Wat Woonvos voor je doet": drie rijen met scherm en tekst (gereedschap
   uitlenen, bewijs bij schade of diefstal, klussen) en vier korte blokken
   (alles op één plek, onderhoud, scannen, op al je toestellen).
4. "Zorgvuldig met je gegevens": zes punten, met een link naar het
   privacybeleid.
5. "Voor wie is Woonvos?": huiseigenaren en huurders.
6. Het stuk over de maker, per variant anders.
7. "Doe mee met de test": drie stappen en dezelfde knop.

Bewust níet op de site: plannen en alles wat nog niet in de app zit, en
namen van diensten of hulpmiddelen buiten het privacybeleid. Wat er komt,
staat alleen in de app.

## Twee varianten van het stuk over de maker

`index.html` en `variant-b.html` zijn op drie blokken na hetzelfde bestand.
Die blokken staan tussen commentaarregels:

```
<!-- variant:begin robots -->    alleen in B: <meta name="robots" content="noindex">
<!-- variant:begin testbalk -->  welke knop aria-current="page" heeft
<!-- variant:begin over -->      het stuk zelf: A "Over Woonvos", B "Van de maker"
```

**Een tekstwijziging buiten die blokken doe je in beide bestanden**, op
dezelfde manier. Daarna:

```
sh check-varianten.sh
```

Dat haalt de variantblokken uit beide bestanden en vergelijkt de rest. "OK"
betekent dat alleen de variantblokken verschillen; anders zie je precies
welke regels uit de pas lopen. Een wijziging in het stuk over de maker doe je
alleen in het bestand van die variant.

Is er een keuze gemaakt, dan: de gekozen tekst in `index.html` zetten,
`variant-b.html` verwijderen, de testbalk (het blok `testbalk`) uit
`index.html` halen, de lege `robots`-markering mag blijven of weg, en
`check-varianten.sh` weggooien.

## Regels

- **Geen verzoeken naar derden.** Geen CDN's, geen analytics, geen embeds,
  geen lettertypes van een fontdienst, geen JavaScript. Het ene lettertype
  staat in `assets/` en komt van het eigen domein. De privacypagina belooft
  het; de site maakt het waar. Daardoor is er ook geen cookiebanner nodig.
- **Kleur is functie.** Leisteen (het huisje uit het logo) voor tekst, koppen,
  de knop en het blok over je gegevens. Oranje (de vacht) alleen voor de
  focusring en de streep onder links, nooit als tekst op wit. Het podium
  (de crèmekleur van de app zelf) alleen achter de appschermen en het
  aanmeldblok. Het paginavlak blijft wit.
- **Het logo alleen in de kop en de voet.** Geen vos die om hoeken kijkt,
  geen andere decoraties.
- **Tekst in gewone taal (B1).** Je-vorm, korte zinnen, de uitkomst voorop,
  de vakterm tussen haakjes achter het gewone woord. Geen gedachtestreepjes,
  geen beloftes over wat nog niet af is, geen prijzen. Beweer niets over
  gegevens wat niet in het privacybeleid staat.
- **Toegankelijk.** `lang="nl"`, een link "Naar de inhoud", echte
  koppenstructuur (één h1 per pagina), zichtbare focus, tikdoelen van
  minstens 44 px, contrast op AA-niveau in licht én donker thema, geen
  beweging bij `prefers-reduced-motion`. Afbeeldingen hebben `width`,
  `height` en een alt-tekst; onder de vouw `loading="lazy"`.
- **Privacybeleid wijzigen = versienummer en datum ophogen** bovenaan de
  pagina, en de wijziging pas publiceren nadat Bram akkoord heeft gegeven.
  Het is een juridische verklaring op zijn naam. De opmaak mag mee
  veranderen met de rest van de site; de tekst alleen via een nieuwe versie.
- De ankers `support.html#privacyverzoek` en `privacy.html` staan in de
  app-stores en in de app; niet hernoemen.

## Schermafbeeldingen

De schermen in `assets/schermen/` komen van de iPhone 17-simulator (iOS 26,
licht thema, statusbalk op 9:41) met een testaccount en alleen
voorbeeldgegevens (Voorbeeldlaan 12, Utrecht). Er staan geen echte namen,
e-mailadressen of foutmeldingen in beeld. De scripts en de tijdelijke
integratietest om ze opnieuw te maken staan buiten deze repo, in
`WoonVos/bijlagen/website-2026-09/shots/tool/`, met een beschrijving per
scherm in `shots/manifest.md`. Inloggegevens gaan daar via
omgevingsvariabelen, nooit in een bestand.

Recept voor een nieuw scherm:

1. Maak de schermafbeelding op de simulator (1206 × 2622 px), bijvoorbeeld
   met `xcrun simctl io <udid> screenshot scherm.png`.
2. Maak de twee webversies:
   `cwebp -q 82 -metadata none -resize 390 0 scherm.png -o naam-390.webp` en
   `cwebp -q 82 -metadata none -resize 780 0 scherm.png -o naam-780.webp`.
3. Zet ze in `assets/schermen/` en gebruik ze zo:

   ```html
   <div class="toestel">
     <img src="/assets/schermen/naam-780.webp"
          srcset="/assets/schermen/naam-390.webp 390w, /assets/schermen/naam-780.webp 780w"
          sizes="(max-width: 440px) 58vw, 256px"
          width="390" height="848" loading="lazy" decoding="async" alt="…">
   </div>
   ```

   De telefoon eromheen is alleen CSS (`.toestel`); de breedte stel je in met
   `--b`, de rest schaalt mee.

De deelafbeelding `og-woonvos.png` is een schermafdruk van
`WoonVos/bijlagen/website-2026-09/og/og-kaart.html` op 1200 × 630.

## Controleren voor je publiceert

- `sh check-varianten.sh` moet "OK" geven.
- Bekijk elke pagina op 390 en 1280 px breed, in licht en donker thema. Met
  Playwright gaat dat zo (vanuit een map waar `playwright` is geïnstalleerd):

  ```
  node shot.mjs http://127.0.0.1:8765/ index-1280.png 1280 1
  node shot.mjs http://127.0.0.1:8765/ index-390.png 390 1
  ```

  Scroll bij een volledige schermafdruk eerst de pagina door, anders zijn de
  afbeeldingen met `loading="lazy"` nog niet geladen.

## Publiceren

Push naar `main`; GitHub Pages publiceert vanzelf. Geen actions, geen build.

## DNS (TransIP)

Zie `DNS.md` voor de volledige recordlijst (website én mail) en de controle
na de wijziging van 16 september 2026.

## Lokaal bekijken

```
python3 -m http.server 8765 --bind 127.0.0.1
```

Daarna http://127.0.0.1:8765/ openen. Rechtstreeks vanaf schijf werkt niet:
de paden beginnen met `/`.
