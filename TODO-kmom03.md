# TODO: kmom03

Innehållsgranskning 2026-08-11. Kvarstående punkter, tas en i taget.

---

1. Död länk i `one-page-website.md` till borttagen katalog `/laromaterial/instruktion/gor-en-pr-for-kmom03`, samt en trasig `".`-rest efter länken.

2. Samma buggfamilj (död länk + trasig `".`-rest) finns även i `kmom06/duckhunt.mdx` och (bara den trasiga `".`-resten, länken är redan korrekt) i `kmom10/index.mdx`.

3. Trasig HTML i `bygg-en-one-page-webbplats/mall.mdx`: `<h1>...</p>` (fel stängningstagg). Samma rad förekommer även i ett diff-block i `bilder.mdx`.

4. Stavfel "mllan" → "mellan" och en felplacerad punkt före ett kodspann i `bilder.mdx`.

5. Stavfel "webbpalts" → "webbplats" i `variabler.mdx`.

6. Stavfel "row-elmentet" → "row-elementet" och "rundade hör" → "rundade hörn" i `tre-kolumner.mdx`.

7. Flera fel i en mening i `tva-kolumner-wrap.mdx`: "bar placera" → "bara placera", "tvåkolumning layout" → "tvåkolumniga layout", "jag will" → "jag vill".

8. Stavfel "nyhetet" → "nyheter" i `tva-kolumner-scroll.mdx`.

9. Stavfel "kygga" → "bygga" och "möttes du at" → "möttes du av" i `bygg-en-one-page-webbplats/avslutningsvis.mdx`.

10. Kvarglömda HTML-kommentarer (`<!-- [[_TOC_]] -->` och tomt `TODO`-kommentarblock) i `lab_03.md`, samma sorts städ som gjordes i `kmom02/lab_02.md`.

11. Kosmetiskt: `sidebar.order: 0020` i `js-common-structures-2.mdx` är stilmässigt inkonsekvent (funktionellt inert eftersom filen är manuellt listad i `astro.config.mjs`, inte autogenererad).

Åtgärdat: punkt 1 och 2 — död länk `/laromaterial/instruktion/gor-en-pr-for-kmomXX` ersatt med `/studieguide/gor-en-pr/` i `one-page-website.md` och `kmom06/duckhunt.mdx`, och trasig `".`-rest efter PR-länken städad bort i dessa två samt i `kmom10/index.mdx` (2026-08-11).

Åtgärdat: punkt 3 — `<h1>...</p>` rättat till `<h1>...</h1>` i `mall.mdx` och i motsvarande diff-block i `bilder.mdx` (2026-08-11).

Åtgärdat: punkt 4 — "mllan" → "mellan" och felplacerad punkt före kodspannet `./img/risbrodammen-oversikt.png` borttagen i `bilder.mdx` (2026-08-11).

Åtgärdat: punkt 5 — "webbpalts" → "webbplats" i `variabler.mdx` (2026-08-11).

Åtgärdat: punkt 6 — "row-elmentet" → "row-elementet" och "rundade hör" → "rundade hörn" i `tre-kolumner.mdx` (2026-08-11).

Åtgärdat: punkt 7 — "bar placera" → "bara placera", "en tvåkolumning layout" → "en tvåkolumnig layout" (även rättat i description-frontmatter) och "jag will" → "jag vill" i `tva-kolumner-wrap.mdx` (2026-08-11).

Åtgärdat: punkt 8 — "nyhetet" → "nyheter" i `tva-kolumner-scroll.mdx` (2026-08-11).

Åtgärdat: punkt 9 — "kygga" → "bygga", "möttes du at" → "möttes du av" i `bygg-en-one-page-webbplats/avslutningsvis.mdx`. Hittade och rättade även ett fjärde fel i samma stycke: "Men hjälp av dessa" → "Med hjälp av dessa" (2026-08-11).

Åtgärdat: punkt 10 — kvarglömda HTML-kommentarer (`<!-- [[_TOC_]] -->` och tomt `TODO`-block) borttagna ur `lab_03.md` (2026-08-11).

Åtgärdat: punkt 11 — `sidebar.order` i `js-common-structures-2.mdx` ändrad från `0020` till `400` för att matcha stilen i kmom02:s motsvarande artikel (2026-08-11).
