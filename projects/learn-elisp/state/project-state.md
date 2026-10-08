# project-state.md (learn-elisp)

## Mål och Scope
* **Projekt:** Repetition och konsolidering av Emacs Lisp-grunder.
* **Mål:** Förstå Emacs-specifik arkitektur, textmanipulation och buffertmutationer för att skriva egna redigeringsverktyg.

## Aktuell Learner Model
* **Status:** Mycket god framdrift inom buffertinteraktion.
* **Insikter:** Användaren har verifierat full förståelse för hur markören (`point`) rör sig över ord och hur man klipper ut strängar via positioner (Test 9.1 korrekt). 
* **Fryst tillstånd:** Sessionen pausad precis efter introduktion av sökfunktioner (`search-forward`) och sökminnesmekanismer (`match-beginning`/`match-end`).

## Etablerade Kunskapsankare (Semantic Anchors)
1. **Lisp-2 & Scoping:** Verifierat att användarens miljö (Emacs 29.3) kör med `lexical-binding: t` som standard i `*scratch*`. Skillnaden mot dynamisk räckvidd har demonstrerats live genom experiment.
2. **Buffertlokala variabler:** `setq-local` isolerar ändringar till den aktiva bufferten och är fundamentet för hur funktioner i `hooks` (t.ex. `prog-mode-hook`) konfigureras defensivt.
3. **Markörinteraktion:** `save-excursion` kapslar in sidoeffekter av markörrörelser och återställer `point` efter avslutat block.

## Öppna frågor / Aktuellt block (Att fortsätta med nästa session)
1. 🎯 **Diskriminerande test 10.1 är obesvarat.** (Frågan om hur `match-beginning` och `match-end` används för att dynamiskt ringa in sökresultat utan hårdkodad teckenräkning).
2. Expandera censureringskommandot med en `while`-loop för att mutera en hel buffert.

