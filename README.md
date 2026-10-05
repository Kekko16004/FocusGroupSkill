# focusgroup

Skill e comando slash (`/focusgroup`) per simulare un focus group di personas fittizie con background, preferenze e competenze eterogenei che valutano e discutono un prototipo, un'applicazione web o mobile, un videogioco o un'interfaccia utente.

## Caratteristiche

- **Zero dipendenze esterne**: logica interamente conversazionale, nessun tool o sottoagente richiesto.
- **Casting contestuale**: composizione automatica del gruppo in base al dominio (app, web, videogame Unity/Unreal/Godot, concept iniziale).
- **Prospettive contrapposte**: inclusione forzata di profili principianti, esperti del genere, scettici, utenti frettolosi ed esigenze di accessibilita per evitare risposte compiacenti.
- **Pipeline in 5 fasi**:
  1. *Comprensione del contesto*: deduzione diretta dal workspace o massimo un singolo round di chiarimenti.
  2. *Casting*: definizione di nome, background, competenza, gusti e tratti caratteriali.
  3. *Prime impressioni*: reazioni indipendenti su estetica, chiarezza, frizioni e modifiche prioritarie.
  4. *Dibattito*: chat tra personas articolata su due round (confronto e approfondimento punti divisivi).
  5. *Resoconto tecnico*: sintesi per chi sviluppa con tabella problemi/gravita, quick win e verifiche su utenti reali.

## Ambienti supportati

- Claude Code (`~/.claude`)
- Antigravity IDE (`~/.gemini/config`)
- Kilo / Kilocode (`~/.kilo`, `~/.config/kilo`, `~/.kilocode`)
- Agents Hub (`~/.agents/skills`)

## Installazione (Windows)

### Modalita interattiva
Eseguire il file `install.bat`:
```cmd
install.bat
```
Il menu consente di selezionare la piattaforma specifica o eseguire l'installazione globale (`[5] Tutti gli ambienti`).

L'installer crea una giunzione NTFS verso il repository locale. In questo modo le modifiche apportate ai file sorgente sono immediatamente attive in tutti gli ambienti senza reinstallare.

### Parametri riga di comando
Installazione automatica senza prompt interattivo:
```cmd
install.bat -All
install.bat -Claude
install.bat -Antigravity
install.bat -Kilo
install.bat -Uninstall
```

Esecuzione diretta tramite PowerShell:
```powershell
.\install.ps1 -All
```

Per forzare la copia fisica dei file anziche il link simbolico:
```powershell
.\install.ps1 -All -Mode copy
```

## Utilizzo

### Comando slash
```text
/focusgroup [cosa valutare o focus specifico]
```

Esempi:
```text
/focusgroup
/focusgroup UI del menu principale e leggibilita testi
/focusgroup difficolta tutorial e tempo di apprendimento
```

### Attivazione in linguaggio naturale
La skill risponde a istruzioni quali:
- "Simula un focus group per questa schermata"
- "Fammi un playtest con tester fittizi di diverso tipo"
- "Cosa penserebbe un principiante rispetto a un giocatore esperto?"
- "Analizza usabilita ed estetica con un panel di persone"

## Struttura del repository

```text
.
|-- SKILL.md                 # Specifica tecnica della skill
|-- commands/
|   `-- focusgroup.md        # Definizione comando slash per gli host compatibili
|-- install.bat              # Launcher batch Windows
|-- install.ps1              # Script di installazione e linking
`-- README.md                # Documentazione
```

## Licenza

MIT
