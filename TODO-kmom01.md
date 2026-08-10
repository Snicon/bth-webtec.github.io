# TODO: kmom01

Innehållsgranskning 2026-08-10. Kvarstående punkter, tas en i taget.

---

Åtgärdat: två a11y-fynd i `footer-i-tre-delar.mdx` (2026-08-10):
- Kontrastfel i hover-länkarna i footer-kolumnerna: `#2e8b57` mot kolumnbakgrunden `#3a3a3a` gav ~2.7:1, under både 3:1 (stor text) och 4.5:1 (normal text). Bytt till `#5cb85c` (~4.6:1).
- Rubrikhierarkin hoppade h1→h3 (sidan har bara en h1, ingen h2). Bytt footerns kolumnrubriker från `<h3>` till `<h2>`.
Synkat till `public/me.html` och `public/css/footer.css` i webtec-mos.

Åtgärdat: två a11y/CSS-kvalitetsfynd i `header-med-logo-navbar.mdx` (2026-08-10):
- Kontrastfel i hover-färgen på navlänkarna: `#2e8b57` mot bakgrunden `#eaf5ea` gav ~3.8:1, men 1rem fet text kräver 4.5:1 (WCAG AA). Bytt hover-textfärg till `#1f6f46` (~5.5:1, klarar kravet); understrykningens `border-bottom-color` fick behålla `#2e8b57` eftersom UI-komponenter (icke-text) bara kräver 3:1.
- Selektorn `.siteheader a` matchade även navlänkarna (läckte in `display:flex` m.m. i onödan, overridades bara delvis av `.siteheader nav a`). Lade till `class="brand"` på logo-länken i alla html-block (inkl. div-varianten i `validera-html.mdx`) och riktade om selektorn till `.siteheader .brand`.
Synkat till `public/me.html` och `public/css/header.css` i webtec-mos.

Åtgärdat: rubrikhierarkin i `artikel-med-aside.mdx` — asidens `<h4>Innehållsförteckning</h4>` hamnade före sidans enda `<h1>` i DOM-ordningen (aside ligger före main i html-koden). Bytt till `<h2>`. Synkat till `public/report.html` i webtec-mos (2026-08-10).

Åtgärdat: ogiltigt `width="100px"` på byline-bilden i `artikel-med-header-och-footer.mdx` — `width`-attributet på `<img>` måste vara ett rent heltal utan enhet, bekräftat med W3C Nu Html Checker ("Bad value "100px" for attribute "width" on element "img": Expected a digit but saw "p" instead."). Bytt till `width="100"` (2026-08-10).

Åtgärdat: navbar-länkarna hoppade vid hover i `header-med-logo-navbar.mdx` (båda CSS-blocken, "Navbar styla länkarna" och "En komplett stylesheet") — `border-bottom` lades bara till i `:hover`-regeln utan att utrymmet reserverades i grundregeln, vilket gjorde att raden växte 2px och innehållet nedanför knuffades ner. Fix: `border-bottom: 2px solid transparent` i grundregeln, `border-bottom-color` byts i hover, `transition` uppdaterad till `border-bottom-color`. Synkat till `public/css/header.css` i webtec-mos (2026-08-10).

Åtgärdat: hover-effekten på navbar-länkar i stegvisa sektionen (`.siteheader nav a:hover`) synkad med "En komplett stylesheet" — bytt `text-decoration: underline` mot `border-bottom: 2px solid #2e8b57`, i linje med basregelns `transition: ... border-bottom 0.3s` (2026-08-10).

Åtgärdat: CSS-selektorerna `.siteheader header img/span/a` i "En komplett stylesheet"-blocket (`header-med-logo-navbar.mdx`) matchade inte den stegvisa CSS:en och div-fixen i `validera-html.mdx` — bytt till `.siteheader img/span/a` (2026-08-10).

Åtgärdat: länken `./labbmiljo` → `/labbmiljo/` i `skapa-en-webbsida-med-html-css-och-javascript/index.mdx` (2026-08-10).

Åtgärdat: ogiltig CSS-kommentar `// style.css` → `/* style.css */` i `footer-i-tre-delar.mdx` (2026-08-10).

Åtgärdat: skräprad `kmom01/me.html` borttagen ur katalogträdet i `katalogstruktur.mdx` (2026-08-10).

Åtgärdat: krockande `sidebar.order` i övningskatalogen — alla ordervärden är nu unika (0000–0120) (2026-08-10).

Åtgärdat: floatande byline i `artikel-med-header-och-footer.mdx` — `.figure.right` (float: right) clearades aldrig, så `.article .byline` kunde hamna bredvid/ovanpå den floatande bilden på breda skärmar (paragraferna blir för korta i höjd för att passera floatens höjd). Lade till `clear: both` på `.article .byline`. Synkat till `public/css/article.css` i webtec-mos (2026-08-10).

Åtgärdat: vitt fält under footern på höga viewports i `footer-i-tre-delar.mdx` — varken `body` eller `html` hade någon `background-color`, så webbläsarens vita standardbakgrund syntes under `.sitefooter` när sidans innehåll var kortare än fönstret. Lade till `body { background-color: #2e2e2e; }` (matchar footerns färg) i grundstruktur-blocket. Synkat till `public/css/footer.css` i webtec-mos (2026-08-10).

Åtgärdat: kvarvarande vit 8px-ram runt hela sidan i `header-med-logo-navbar.mdx` — UA-standardens `margin: 8px` på `body` visade `html`-elementets (obakgrundssatta) yta genom marginalen, trots den nya mörka `body`-bakgrunden. Lade till `body { margin: 0; }` i normaliseringsblocket ("Enkel normalisering av en stylesheet"). Synkat till `public/css/normalize.css` i webtec-mos (2026-08-10).

---

Genomgång av nästa del: `js-builtin-types.mdx` (2026-08-10).

Åtgärdat: 9 av 10 MDN-länkar i `js-builtin-types.mdx` använde en föråldrad URL-form (saknade `/Web/`-segmentet och/eller använde lokalen `/en/` istället för `/en-US/`), t.ex. `developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math`. Länkarna fungerade via MDN:s redirect (verifierat med curl, alla gav 200) men var inkonsekventa med resten av dokumentationen. Uppdaterade samtliga till kanonisk form `developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/...`. Ingen `public/`-fil att synka — artikeln är en fristående JS-referens utan HTML/CSS/JS-steg för webtec-mos.

---

Genomgång av nästa del: `lab_01.md` (2026-08-10).

`lab_01.md` självt var korrekt — länken till `/studieguide/lab/` och `lab/download_lab.bash` fungerar båda. Två fynd i det delade skriptet `lab/download_lab.bash` (påverkar även lab_02–04, samma fil), åtgärdade av användaren och verifierade (bash -n OK, ny URL ger status 200):
- Stavfel `btth-webtec` (dubbel-t) och gammal sökväg (`website/.../laromaterial/lab/download_lab.bash`) i skriptets usage-kommentar, ersatt med korrekt `bth-webtec/bth-webtec.github.io/refs/heads/main/lab/download_lab.bash`.
- Missvisande "Locally"-instruktion (`mkdir lab_01 && cd lab_01 && bash download_lab.bash`) som skulle ge dubbelnästlade kataloger (`lab_01/lab/lab_01/...`) eftersom skriptet alltid skapar `lab/$LAB` relativt cwd. Blocket borttaget, endast den korrekta fjärranvändningen kvar.

Ej åtgärdat (avsiktligt lämnat): HTML-kommentaren med en riktig TODO-lista i `lab_01.md` (rader 13–20, planerade strängövningar `replaceSpaces`/`capitalizeWords`/`countCharacter`) — till skillnad från den tomma TODO-resten som togs bort i `lab_02.md` innehåller den här faktiska anteckningar och lämnas orörd.
