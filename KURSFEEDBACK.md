# Kursfeedback: upplägg och materialstruktur

Löpande anteckningar om kursens övergripande upplägg och hur kursmaterialet är
strukturerat — till skillnad från `TODO-kmomXX.md` som loggar konkreta
sak-fel i enskilda artiklar. Fylls på under arbetets gång.

---

## 2026-08-10, efter kmom01

**Vad fungerar bra**

- Strukturen i `index.mdx` per kmom (Läs & Studera → Övningar → Uppgifter →
  Resultat & Redovisning) är tydlig och pedagogiskt logisk — eleven vet
  alltid var i flödet den befinner sig.
- "Om du gjort övningarna har du gjort 80%" i `bygg-webbplats.md` är en bra
  motivationsknuff, och den stegvisa uppbyggnaden av CSS i
  tutorial-artikeln (en bit i taget, med skärmdump efter varje steg) gör
  det lätt att följa med.
- `webtec check` kopplat till git-taggar/PR-branches ger snabb, konkret
  feedback utan mänsklig granskning — bra loop för en kurs med många
  studenter.
- Instuderingsfrågorna med AI som "lärare" är ett modernt och genomtänkt
  inslag, med en tydlig påminnelse om källkritik.
- `revision`-fältet i frontmatter ger inbyggd ändringshistorik per artikel
  — bra vana.

**Vad som gav friktion, konkret sett**

- **Tutorial och uppgiftstext divergerar lätt.** Vi hittade flera små
  inkonsekvenser: `npx eslint`/`npx http-server` i uppgiftstexten mot
  faktiska `npm run lint`/`npm run server` i mallens `package.json`, ett
  stavfel i `download_lab.bash` (`btth-webtec`), föråldrade MDN-länkar.
  Inget allvarligt enskilt, men mönstret tyder på att det inte finns någon
  automatisk koll som fångar att kommandon i prosa faktiskt matchar det
  som finns i koden.
- **CSS-exemplet var inte robust mot rimlig variation.** `.article`-boxen
  i tutorialen förlitade sig på `clear: both` på en byline som *alltid*
  fanns i exemplet — men uppgiften kräver också en artikel utan byline
  (`about.html`), och då stack den flytande bilden ut. Precis den typen av
  bugg som är osynlig om man bara testar mot exakt det facit-exempel som
  visas.
- **`webtec check` verifierar närvaro/lint/labbpoäng, inte innehåll.** En
  helt tom `about.html` hade ändå gett grönt på "alla kataloger/filer
  finns på plats" — checken fångar struktur, inte om sidan faktiskt är
  ifylld. Kan vara medvetet (öppna uppgifter ska inte auto-rättas för
  hårt), men värt att vara medveten om som lucka.
- Vi hittade även krockande `sidebar.order`-värden och några
  a11y-brister (kontrast, rubrikhopp h1→h3) i CSS/HTML-exemplen tidigare
  i granskningen — inget som bryter något, men indikerar att det inte
  finns någon lint/CI-koll på själva kursmaterialet (bara på
  studentrepots kod).

**Förslag**

- En lättviktig CI-koll på kursmaterial-repot som (a) verifierar att
  kodblock i `.mdx` faktiskt är giltig CSS/HTML/JS, och (b) stämmer av att
  kommandon nämnda i prosa (`npm run X`) existerar i den `package.json`
  som delas ut till studenterna. Hade fångat merparten av det vi rättade
  manuellt under kmom01.
