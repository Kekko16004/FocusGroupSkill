---
name: focusgroup
description: Simula un piccolo focus group di personas diverse (con nome e personalità) che valutano e discutono tra loro un prototipo, poi produce un resoconto finale. Usa questa skill ogni volta che l'utente usa il comando /focusgroup, oppure vuole feedback, opinioni, playtest simulato, test di usabilità o "far provare" a delle persone un'app, un sito, un gioco (Unity, Unreal, Godot o altro), una UI, uno screenshot, un trailer, un'idea di gioco o di prodotto. Attivala anche con richieste tipo "cosa ne penserebbero gli utenti", "fammi un focus group", "panel di tester", "simula dei giocatori", "dimmi cosa è poco chiaro", "feedback su estetica e UX", "play test", anche se l'utente non dice "focus group". Versione leggera: niente tool esterni, niente sottoagenti, tutto in una conversazione.
---

# Focusgroup (/focusgroup)

Un focus group simulato, leggero e senza setup. Crei un gruppo di persone fittizie con personalità molto diverse, le fai reagire al prototipo, le fai discutere tra loro e alla fine consegni un resoconto onesto e utile.

## Comando `/focusgroup`

Puoi invocare questa skill in qualsiasi momento tramite il comando dedicato:
```
/focusgroup [cosa valutare o focus specifico]
```
- `/focusgroup`: avvia il panel analizzando il contesto/schermo o ponendo le 4 domande di Fase 1.
- `/focusgroup UI del menu`: concentra l'attenzione del gruppo su un componente o schermata specifica.
- `/focusgroup gameplay loop e difficoltà`: orienta casting e discussione sul feel del gioco.

**Tono**: rilassato, un po' vivace, come ascoltare un gruppo di amici che prova qualcosa. Ma il resoconto finale deve essere concreto e utilizzabile.

**Lingua**: usa la lingua dell'utente, anche per i dialoghi dei personaggi.

---

## Fase 1 — Capire cosa si valuta (max 1 giro di domande)

Prima di tutto controlla cosa hai già: messaggio, file, screenshot, codice, link, descrizione. Non chiedere ciò che puoi dedurre.

Poi chiedi in **un solo messaggio** (massimo 4 domande, brevi) solo ciò che manca:

1. **Cosa devo valutare?** (se non è chiaro: app mobile, sito/web app, gioco, tool desktop, solo un'idea/concept, ecc.)
2. **Categoria / genere** se è un gioco (platformer, roguelike, horror, puzzle, FPS, gestionale, narrativo, ecc.) o tipo di app (produttività, social, e-commerce, utility, ecc.). **Se la categoria non è chiara, chiedila sempre**: da questa dipende il casting.
3. **Quante persone vuoi nel gruppo?** Proponi un default: 6 (range sensato 3-10; oltre 10 le voci diventano ripetitive).
4. **Su cosa vuoi che si concentrino?** (estetica, chiarezza/onboarding, gameplay feel, difficoltà, UX, monetizzazione, performance percepita, tutto). Default: tutto.

Facoltativo, solo se utile: target previsto (età, pubblico), piattaforma, a che punto è il prototipo (idea, mockup, build giocabile).

Se l'utente ha già risposto a tutto, salta direttamente alla Fase 2.

### Cosa possono davvero "vedere" i personaggi

Stabilisci subito il materiale disponibile e dillo in una riga:
- **Screenshot/immagini**: possono giudicare estetica, layout, leggibilità, gerarchia visiva.
- **Codice/progetto**: possono giudicare struttura, scelte tecniche, cose dedotte dalla UI nel codice. Non possono "giocare" davvero.
- **Solo testo/descrizione**: reagiscono al concept, non all'esperienza reale.
- **Video/trailer**: solo se riesci davvero a vederlo; altrimenti non fingere.

**Regola d'oro: nessuno inventa feature, schermate o comportamenti che non conosce.** Se un personaggio non ha abbastanza info, lo dice ("da qui non capisco cosa succede dopo il tap") e questo conta come feedback utile.

---

## Fase 2 — Casting

Crea il gruppo. Ogni persona ha:

- **Nome** (vario per origine e genere, non stereotipato)
- **Età e ruolo/background** in mezza riga
- **Livello di competenza** (principiante, medio, esperto)
- **Gusti e cosa le importa** (es. "odia i tutorial lunghi", "guarda solo la grafica", "gioca solo souls-like")
- **Un tratto di carattere** (scettico, entusiasta, pignolo, distratto, diretto, ironico...)
- **Modo di parlare** (breve e secco, prolisso, tecnico, slang...)

### Regole di diversità (sempre)

- Almeno **un principiante assoluto** che non conosce il genere.
- Almeno **uno scettico/critico** che cerca i difetti.
- Almeno **un esperto** del settore o del genere.
- Almeno **uno impaziente/distratto** (abbandona al primo attrito).
- Se il gruppo è ≥ 6: aggiungi **un profilo accessibilità** (daltonismo, schermo piccolo, mano sola, poca vista, ecc.) e **un contrarian** che tende a non essere d'accordo con la maggioranza.
- Niente gruppo di soli entusiasti. Personalità e opinioni devono poter **scontrarsi**.

### Archetipi per categoria (scegli e mescola, non sono obbligatori)

**App / siti / tool**
- Utente base (poco tecnico), utente frettoloso, UX designer, UI/visual designer, sviluppatore frontend, persona over 60, power user, professionista del settore specifico dell'app, utente con schermo piccolo/connessione lenta, esperto di accessibilità, product manager scettico.

**Giochi (qualsiasi motore: Unity, Unreal, Godot, altro)**
- Giocatore casual, giocatore hardcore del genere specifico, critico/recensore di videogiochi, completionist, speedrunner, streamer/content creator (guarda "quanto è clippabile/vendibile"), game designer, level/UI designer, artista/animatore, giocatore da mobile, giocatore da PC/console esigente, genitore che sceglie il gioco per il figlio, appassionato di indie, giocatore con disabilità motoria o visiva.
- Per i giochi, se hai accesso a codice/build: aggiungi uno **sviluppatore indie** che commenta anche performance percepita, controlli, scelte di scope. Non attribuire problemi a uno specifico motore senza evidenza concreta.

**Concept / idee non ancora realizzate**
- Mix di target potenziale, investitore/publisher scettico, esperto di mercato, "amico onesto".

Mostra all'utente il cast in una **tabella compatta** (nome, profilo, tratto) e continua senza aspettare conferma, a meno che l'utente abbia chiesto di approvarlo prima.

---

## Fase 3 — Prime impressioni (ognuno per conto suo)

Ogni personaggio reagisce **indipendentemente**, senza aver ancora sentito gli altri. Per ciascuno: 3-5 righe nella sua voce, con almeno un'osservazione su ciascuno di questi temi (se pertinente al focus scelto):

- **Estetica**: stile, coerenza, colori, tipografia, atmosfera
- **Cosa è chiaro / piace**
- **Cosa non è chiaro / confonde**
- **Cosa non funziona o frustra**
- **Cosa cambierebbe**

Punti di attenzione:
- Ogni personaggio guarda con **i propri occhi e i propri gusti**: lo stesso elemento può piacere a uno e infastidire un altro.
- Le reazioni devono essere **specifiche** ("il bottone in basso a destra sembra disabilitato") e non generiche ("bella UI").
- Evita il bias tipico dei modelli: troppo positivi e troppo educati. Se un elemento è davvero debole, almeno qualcuno lo dice senza giri di parole.

---

## Fase 4 — Discussione tra loro

Qui i personaggi **comunicano tra loro**. Scrivi la conversazione come una chat di gruppo, in 2 round brevi:

**Round 1 — Confronto**: reagiscono alle osservazioni degli altri. Si danno ragione, si contraddicono, chiedono chiarimenti ("ma tu come hai fatto a capire che quello era cliccabile?"), portano esempi di altri prodotti.

**Round 2 — Approfondimento**: si concentrano sui 2-3 punti più divisivi o più importanti emersi e provano a capire il perché, cercando una posizione comune o motivando perché non c'è.

Regole della discussione:
- Formato: `**Nome:** battuta` una per riga. Battute brevi, naturali.
- Ognuno mantiene **voce, gusti e competenza** del proprio profilo; nessuno cambia idea solo per cortesia. Se cambia idea, deve esserci un motivo detto ad alta voce.
- Non far parlare tutti in ogni scambio: come in una chat vera, qualcuno interviene di più, qualcuno poco.
- Niente moderatore, niente riassunti dentro la discussione: quelli vanno nel resoconto.
- Un tocco di umorismo va bene, purché non copra il contenuto.

Lunghezza: modalità **rapida** (default) ~10-16 battute totali; modalità **approfondita** (se l'utente la chiede) ~25-35 battute con un terzo round.

---

## Fase 5 — Resoconto finale

Chiudi con un resoconto strutturato, **senza dialoghi**, pensato per essere letto da chi sviluppa:

1. **Verdetto in breve** (2-3 frasi): come è stato accolto nel complesso e dove si è spaccato il gruppo.
2. **Cosa funziona**: elementi apprezzati, con quanti personaggi su N e di che tipo (es. "5/6, anche gli scettici").
3. **Cosa non è chiaro**: punti di confusione, ordinati per frequenza e gravità.
4. **Estetica**: sintesi delle impressioni visive, evidenziando dove i gusti divergono e perché.
5. **Problemi principali**, in tabella: problema · chi l'ha sollevato · gravità (alta/media/bassa) · suggerimento.
6. **Punti divisivi**: dove le opinioni sono opposte e da cosa dipende (target, esperienza, gusto).
7. **Quick win**: 3-5 modifiche piccole con il miglior rapporto effetto/sforzo.
8. **Domande aperte per chi sviluppa**: cose che i personaggi non hanno potuto giudicare o che dovrebbero essere testate con persone reali.
9. *(Opzionale)* **Voto di ogni personaggio** da 1 a 10 con una riga di motivazione.

### Onestà obbligatoria

Chiudi sempre con una breve nota: questa è una **simulazione basata su un modello linguistico**, non ricerca su utenti reali. Serve a far emergere ipotesi, punti ciechi e problemi probabili in fretta, ma va confermata con almeno 3-5 persone vere, soprattutto per decisioni importanti. Non presentare mai percentuali o numeri come se fossero statistiche: sono impressioni di un gruppo fittizio.

---

## Dopo il resoconto

Offri (in una riga) le mosse successive più utili, per esempio:
- rifare il panel con **altro tipo di pubblico** o un cast diverso
- **ri-testare dopo le modifiche** con le stesse persone (mantieni nomi e profili per la continuità)
- **approfondire un punto** con 2-3 personaggi in mini-discussione
- salvare il resoconto in un file `.md`

Se l'utente vuole ripetere il test, **riusa lo stesso cast** salvo diversa richiesta, così si vede se i problemi sono stati risolti.

---

## Principi generali

- **Leggero**: niente ricerca web, niente strumenti, niente file di setup. Si chiede il minimo, si parte.
- **Diversità vera**: se due personaggi dicono la stessa cosa con parole diverse, il cast è sbagliato.
- **Specificità**: ogni critica deve puntare a qualcosa di preciso nel materiale.
- **Niente adulazione**: un panel che approva tutto è inutile.
- **Niente invenzioni**: se manca informazione, si dichiara.
- **Rispetto**: i personaggi possono essere duri con il prodotto, mai offensivi o stereotipati verso gruppi di persone.
