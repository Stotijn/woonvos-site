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
support.html    Support en contact (vereist door Apple)
404.html        Niet-gevonden-pagina
style.css       Eén stylesheet voor alles
assets/         Beeldmerk (Zashi) en favicons
CNAME           Koppelt het domein woonvos.nl aan GitHub Pages
```

## Regels

- **Geen verzoeken naar derden.** Geen CDN's, geen webfonts, geen analytics,
  geen embeds. De privacypagina belooft het; de site maakt het waar. Daardoor
  is er ook geen cookiebanner nodig.
- **Toegankelijk.** `lang="nl"`, echte koppenstructuur, zichtbare focus,
  contrast op AA-niveau in licht én donker thema.
- **Privacybeleid wijzigen = versienummer en datum ophogen** bovenaan de
  pagina, en de wijziging pas publiceren nadat Bram akkoord heeft gegeven —
  het is een juridische verklaring op zijn naam.

## Publiceren

Push naar `main`; GitHub Pages publiceert vanzelf. Geen actions, geen build.

## DNS (TransIP)

| Type  | Naam | Waarde |
|-------|------|--------|
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |
| AAAA  | @    | 2606:50c0:8000::153 |
| AAAA  | @    | 2606:50c0:8001::153 |
| AAAA  | @    | 2606:50c0:8002::153 |
| AAAA  | @    | 2606:50c0:8003::153 |
| CNAME | www  | stotijn.github.io |
