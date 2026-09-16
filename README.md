# woonvos.nl

De website van **Woonvos** — je slimme huisgenoot. Statische site, gehost op
GitHub Pages met het eigen domein `woonvos.nl`.

## Opzet

Met de hand geschreven HTML en CSS, bewust zonder buildstap, generator of
afhankelijkheden. Een tekstwijziging is een commit; de site moet over twee
jaar nog aan te passen zijn zonder eerst een toolchain te herstellen.

```
index.html      Voorpagina
privacy.html    Privacybeleid (vereist voor de app-stores)
support.html    Hulp en contact (de support-URL die Apple vereist)
404.html        Niet-gevonden-pagina
style.css       Eén stylesheet voor alles
favicon.ico     Voor browsers die hem blind opvragen
assets/         Beeldmerk (zashi-mark.png met transparantie voor header,
                voet en kaartje; zashi.png alleen nog als og:image), favicons,
                het koplettertype Bitter SemiBold (bitter-600.woff2, latin,
                SIL Open Font License in Bitter-OFL.txt) en het app-scherm op
                de voorpagina (scherm-cv-ketel.webp: echte schermafbeelding
                van de iPhone-simulator, 2x, bovenste deel van het
                apparaatscherm; recept in de Woonvos-repo,
                integration_test/site_screenshot_probe_test.dart)
CNAME           Koppelt het domein woonvos.nl aan GitHub Pages
DNS.md          De DNS-records bij TransIP en hoe ze gecontroleerd zijn
```

## Regels

- **Geen verzoeken naar derden.** Geen CDN's, geen analytics, geen embeds,
  geen lettertypes van een fontdienst. Het ene lettertype staat in `assets/`
  en komt van het eigen domein. De privacypagina belooft het; de site maakt
  het waar. Daardoor is er ook geen cookiebanner nodig.
- **Kleur is functie.** Leisteen (het huisje) voor tekst en de ene knop,
  oranje (Zashi's vacht) alleen voor onderstreping en focusring, crème
  (Zashi's eigen vlak) alleen voor het dossierkaartje op de voorpagina. Het
  paginavlak blijft wit. Geen decoratieve kleur, geen kaders om secties,
  geen beweging.
- **Tekst in gewone taal.** Je-vorm, korte zinnen, de vakterm tussen haakjes
  achter het gewone woord. Voorbeelden uit een echt huis, geen
  marketingtaal. Dezelfde woorden als de app ("scan", "dossier").
- **Toegankelijk.** `lang="nl"`, echte koppenstructuur, zichtbare focus,
  contrast op AA-niveau in licht én donker thema.
- **Privacybeleid wijzigen = versienummer en datum ophogen** bovenaan de
  pagina, en de wijziging pas publiceren nadat Bram akkoord heeft gegeven —
  het is een juridische verklaring op zijn naam.

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
