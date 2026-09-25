#!/bin/sh
# Controleert dat index.html (variant A) en variant-b.html alleen verschillen
# binnen de blokken tussen <!-- variant:begin ... --> en <!-- variant:end ... -->.
# Gebruik: sh check-varianten.sh   (afsluitcode 0 = gelijk, 1 = verschil)
cd "$(dirname "$0")" || exit 2
strip() { sed '/<!-- variant:begin/,/<!-- variant:end/d' "$1"; }
tmp_a=$(mktemp) tmp_b=$(mktemp)
strip index.html > "$tmp_a"
strip variant-b.html > "$tmp_b"
if diff -u "$tmp_a" "$tmp_b"; then
  echo "OK: buiten de variantblokken zijn index.html en variant-b.html gelijk."
  status=0
else
  echo "LET OP: de pagina's verschillen buiten de variantblokken (zie hierboven)."
  status=1
fi
rm -f "$tmp_a" "$tmp_b"
exit $status
