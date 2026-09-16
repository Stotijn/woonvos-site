# DNS voor woonvos.nl (TransIP)

Stand sinds 16-09-2026, ingevoerd via het TransIP-controlepaneel en op alle
drie de nameservers (ns0.transip.net, ns1.transip.nl, ns2.transip.eu)
gecontroleerd (#177 + SPF-fix uit #173). Naam `@` = het kale domein. TTL: de
TransIP-standaard (1 uur).

## Website → GitHub Pages

| Type  | Naam | Waarde                | Actie |
|-------|------|-----------------------|-------|
| A     | @    | 185.199.108.153       | toevoegen |
| A     | @    | 185.199.109.153       | toevoegen |
| A     | @    | 185.199.110.153       | toevoegen |
| A     | @    | 185.199.111.153       | toevoegen |
| AAAA  | @    | 2606:50c0:8000::153   | toevoegen |
| AAAA  | @    | 2606:50c0:8001::153   | toevoegen |
| AAAA  | @    | 2606:50c0:8002::153   | toevoegen |
| AAAA  | @    | 2606:50c0:8003::153   | toevoegen |
| CNAME | www  | stotijn.github.io.    | toevoegen |
| A     | @    | 37.97.254.27          | **verwijderen** (TransIP-parkeerpagina) |
| AAAA  | @    | 2a01:7c8:3:1337::27   | **verwijderen** (parkeerpagina) |
| CNAME | www  | woonvos.nl.           | **verwijderen** (wordt vervangen door de GitHub-CNAME) |

Bron van de adressen: GitHub Docs, "Managing a custom domain for your GitHub
Pages site" (gecontroleerd 16-09-2026). TransIP biedt inmiddels wél een
ALIAS-type in het controlepaneel, maar de vier A-records zijn de door GitHub
gedocumenteerde route en de enige die de "DNS check" van GitHub betrouwbaar
groen maakt; daarom geen ALIAS.

Praktisch: het DNS-formulier van TransIP is een gewoon HTML-formulier
(`name[]`/`expire[]`/`type[]`/`content[]`); de plusknop werkt alleen met een
echte klik, niet met programmatisch gevulde velden.

## Mail (Google Workspace) — laten staan, één record corrigeren

| Type | Naam            | Waarde                                            | Actie |
|------|-----------------|---------------------------------------------------|-------|
| MX   | @               | 1 smtp.google.com.                                | laten staan |
| TXT  | @               | google-site-verification=Pz_pEsoMZmpHEL9DSOPcrN4Y-Pjo8eXKngWP_HsOfoQ | laten staan |
| TXT  | google._domainkey | v=DKIM1; k=rsa; p=…                             | laten staan |
| TXT  | @               | `v=spf1 include:_spf.google.com ~all`             | **wijzigen** (was `v=spf1 ~all`, dat keurt Google's servers niet goed) |
| TXT  | _dmarc          | `v=DMARC1; p=none; rua=mailto:bram@woonvos.nl`    | **wijzigen** (rapportadres erbij; `p=none` blijft tot de transactionele maildienst uit #173 erbij zit) |

## Na de wijziging

1. `dig +short A woonvos.nl @ns2.transip.eu` toont de vier GitHub-adressen
   (gedaan 16-09-2026: alle drie de nameservers correct).
2. `http://woonvos.nl` serveert de site, `www` en `stotijn.github.io` sturen
   door naar het kale domein (gedaan 16-09-2026).
3. HTTPS (gedaan 16-09-2026, ±16:50): GitHub gaf het certificaat pas uit nadat
   het domein via de API één keer verwijderd en opnieuw gezet was
   (`{"cname": null}` en daarna `-f cname=woonvos.nl`; GitHub maakt daarbij
   zelf twee commits "Delete CNAME"/"Create CNAME"). Daarna
   `gh api -X PUT repos/Stotijn/woonvos-site/pages -F https_enforced=true`.
   Let's Encrypt-certificaat voor woonvos.nl en www.woonvos.nl, geldig tot
   15-12-2026 en automatisch verlengd; http en www sturen door naar
   https://woonvos.nl.
4. Mail (gedaan 16-09-2026, 16:56): testmail vanaf bram@woonvos.nl naar
   `check-auth@verifier.port25.com` (gratis controledienst; antwoord komt in
   Spam terecht). Rapport: SPF pass, DKIM pass (header.d=woonvos.nl, sleutel
   2048 bits), iprev pass. Een mail aan jezelf bewijst niets: Gmail bezorgt
   die intern zonder SPF-controle.
