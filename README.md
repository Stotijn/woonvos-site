# woonvos.nl

De website van **Woonvos**, een app voor je huis. Statische site, gehost op
GitHub Pages met het eigen domein `woonvos.nl`.

## Opzet

Met de hand geschreven HTML en CSS, bewust zonder buildstap, generator of
afhankelijkheden. Een tekstwijziging is een commit; de site moet over twee
jaar nog aan te passen zijn zonder eerst een toolchain te herstellen.

```
index.html          Voorpagina, met het stuk "Van de maker"
zakelijk.html       Dezelfde voorpagina met het zakelijke stuk "Over Woonvos";
                    noindex, canonical naar https://woonvos.nl/, nergens gelinkt
variant-b.html      Doorverwijzing naar /#over, zodat oude links blijven werken
privacy.html        Privacybeleid (vereist voor de app-stores)
support.html        Hulp en contact (de support-URL die Apple vereist)
404.html            Niet-gevonden-pagina
style.css           Eén stylesheet voor alles
check-varianten.sh  Controleert dat index.html en zakelijk.html alleen in de
                    variantblokken verschillen
favicon.ico         Voor browsers die hem blind opvragen
assets/             zie hieronder
CNAME               Koppelt het domein woonvos.nl aan GitHub Pages
DNS.md              De DNS-records bij TransIP en hoe ze gecontroleerd zijn
```

`assets/`:

- `zashi-mark.png` is het beeldmerk (256 px, transparant), de bron.
  `zashi-mark-96.webp` is de versie die de site laat zien, in de kop en de
  voet (36 px, dus scherp tot 2,5x).
- `bitter-400.woff2`, `bitter-400-italic.woff2` en `bitter-600.woff2` zijn
  Bitter Regular, Italic en SemiBold (latin, SIL Open Font License in
  `Bitter-OFL.txt`). Bitter is de enige letter: gewoon voor de tekst,
  cursief voor bijschriften, SemiBold voor koppen en knoppen.
- `schermen/` bevat echte schermafbeeldingen van de app, per scherm twee
  WebP-bestanden: `-390` (1x) en `-780` (2x). Er staan alleen schermen in
  die de site gebruikt. Zie „Schermafbeeldingen”.
- `og-woonvos.png` (1200 × 630) is de afbeelding die WhatsApp, Signal,
  LinkedIn en dergelijke tonen als iemand een link naar de site deelt.
- `favicon-32.png` en `apple-touch-icon.png` zijn de icoontjes.

## Wat er op de voorpagina staat

1. De vraag "Waar is de bon van de vaatwasser?" met het antwoord in één
   alinea, de knop "Doe mee met de test" (springt naar het aanmeldblok) en
   daaronder voor wie de app is. Rechts het woningoverzicht als echt scherm,
   afgesneden boven de scanknop, met een cursief bijschrift.
2. "Wat er in de app zit": eerst vier korte stukken tekst zonder iconen
   (wat er in huis staat, het typeplaatje, onderhoud, noodinfo met een echte
   vraag uit de app), dan drie bladzijden als in een handleiding: links de
   tekst, rechts het scherm met genummerde aanwijzingen die bij de lijst
   horen (verzekeringsdossier, uitlenen met het echte berichtje, klussen).
3. "Waar je gegevens staan": een tabel met wat, waar en wanneer, en een
   link naar het privacybeleid.
4. "Van de maker": Bram vertelt wie hij is, waarom hij Woonvos maakt en hoe
   je hem bereikt.
5. "Doe mee met de test": per toestel een kolom met de uitleg en de knop
   eronder, daarna één regel over het account. Op een computer een QR-code.

De site beschrijft alleen wat nu in de app zit. Namen van diensten staan
alleen in het privacybeleid.

## De zakelijke versie van het stuk over de maker

Op 2 oktober 2026 koos Bram de persoonlijke tekst ("Van de maker") voor de
voorpagina, zonder wisselknop. De zakelijke tekst ("Over Woonvos") staat in
`zakelijk.html`, met `noindex` en een canonical naar de voorpagina, en is
nergens gelinkt. `variant-b.html` verwijst door naar `/#over`, het blok „Van de maker”.

`index.html` en `zakelijk.html` zijn op twee blokken na hetzelfde bestand.
Die blokken staan tussen commentaarregels:

```
<!-- variant:begin robots -->    alleen in zakelijk.html: <meta name="robots" content="noindex">
<!-- variant:begin over -->      het stuk zelf: "Van de maker" of "Over Woonvos"
```

Een variantblok staat nooit binnen een ander variantblok; het
controlescript knipt van `begin` tot de eerstvolgende `end`.

**Een tekstwijziging buiten die blokken doe je in beide bestanden**, op
dezelfde manier. Daarna:

```
sh check-varianten.sh
```

Dat haalt de variantblokken uit beide bestanden en vergelijkt de rest. "OK"
betekent dat alleen de variantblokken verschillen; anders zie je precies
welke regels uit de pas lopen.

## Regels

- **Geen verzoeken naar derden.** Geen CDN's, geen analytics, geen embeds,
  geen lettertypes van een fontdienst, geen JavaScript. Het ene lettertype
  staat in `assets/` en komt van het eigen domein. De privacypagina belooft
  het; de site maakt het waar. Daardoor is er ook geen cookiebanner nodig.
- **Kleur is functie.** Leisteen (het huisje uit het logo) voor tekst, koppen,
  de knop en de genummerde aanwijzingen. Oranje (de vacht) alleen voor de
  focusring en de streep onder links, nooit als tekst op wit. Koele grijzen
  voor lijnen en het aanmeldvlak. De crèmekleur van de app zit alleen in de
  schermen zelf; er staat geen telefoon van CSS en geen crème vlak omheen.
  Het paginavlak blijft wit.
- **Het logo alleen in de kop en de voet.** Geen vos die om hoeken kijkt,
  geen andere decoraties.
- **Tekst in gewone taal (B1).** Je-vorm, korte zinnen, de uitkomst voorop,
  de vakterm tussen haakjes achter het gewone woord. Geen gedachtestreepjes,
  Nederlandse aanhalingstekens („…”) en bij getallen „40 tot 50”.
  Beschrijf alleen wat nu in de app zit, en niet meer dan de app doet.
  Beweer niets over gegevens wat niet in het privacybeleid staat.
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
e-mailadressen of foutmeldingen in beeld.

Recept voor een nieuw scherm:

1. Maak de schermafbeelding op de simulator (1206 × 2622 px), bijvoorbeeld
   met `xcrun simctl io <udid> screenshot scherm.png`.
2. Maak de twee webversies:
   `cwebp -q 82 -metadata none -resize 390 0 scherm.png -o naam-390.webp` en
   `cwebp -q 82 -metadata none -resize 780 0 scherm.png -o naam-780.webp`.
3. Zet ze in `assets/schermen/` en gebruik ze zo:

   ```html
   <div class="aangewezen">
     <div class="scherm rond">
       <img src="/assets/schermen/naam-780.webp"
            srcset="/assets/schermen/naam-390.webp 390w, /assets/schermen/naam-780.webp 780w"
            sizes="(max-width: 819px) 80vw, 340px"
            width="390" height="848" loading="lazy" decoding="async" alt="…">
     </div>
     <span class="pin rechts" style="top: 20%" aria-hidden="true">1</span>
   </div>
   ```

   `scherm rond` toont het hele scherm. Een uitsnede krijgt geen `rond`
   maar een eigen hoogte, bijvoorbeeld `style="aspect-ratio: 390 / 530"`.
   De cijfers (`pin`) staan in de marge naast het scherm, nooit erop:
   `pin rechts` of `pin links`, met `top` in procenten van de hoogte van het
   scherm, op de regel waar ze bij horen. Ze horen bij de
   `<ol class="aanwijzingen">` ernaast; de uitleg staat in die lijst, dus de
   cijfers zelf zijn `aria-hidden`. De figuur houdt aan de kant met cijfers
   40 px vrij (`--pinruimte`); op een telefoon (onder 820 px) zijn de cijfers
   kleiner en hangen ze in de witte rand van de pagina, zodat het scherm bijna
   de volle kolom krijgt. De breedte van de figuur ligt vast per soort
   (`--schermbreedte` op `uitleg-groot`, `uitleg-klein` en `uitleg-middel`),
   zodat de cijfers op hun plek blijven zolang een scherm nog laadt.
   Tekst en scherm staan pas naast elkaar vanaf 820 px venster én 50rem
   pagina (een containerquery in rem). Bij grotere tekst blijven ze dus
   langer onder elkaar, zodat de tekstkolom niet te smal wordt.

   Een uitsnede kan ook een eigen bestand zijn, met `cwebp -crop x y b h`.
   `05-klus-lijst` is zo gemaakt: `-crop 0 204 1206 2418` haalt alleen de
   statusbalk eraf.

## Controleren voor je publiceert

- `sh check-varianten.sh` moet "OK" geven.
- De teksten en afdrukken van elke pagina (390 en 1280 px breed, licht en
  donker thema) worden nagekeken voordat je publiceert.

## Publiceren

Push naar `main`; GitHub Pages publiceert vanzelf. Geen actions, geen build.

## DNS (TransIP)

Zie `DNS.md` voor de volledige recordlijst (website én mail) en de controle
na de wijziging van 16 september 2026.

## Lokaal bekijken

Bekijk de site via een eenvoudige webserver in deze map. Rechtstreeks vanaf
schijf werkt niet: de paden beginnen met `/`.
