# focusgroup

A lightweight agent skill and slash command (`/focusgroup`) to simulate a focus group of distinct fictional personas who evaluate, test, and debate a prototype, web/mobile app, game, or user interface.

## Features

- **Zero dependencies**: Purely conversational workflow without external tools, background processes, or sub-agents.
- **Context-aware casting**: Automatically populates persona profiles matched to the target domain (SaaS apps, websites, game engines like Unity/Unreal/Godot, or early concepts).
- **Mandatory persona diversity**: Enforces conflicting perspectives by including beginners, genre veterans, skeptics, impatient users, and accessibility-focused profiles to prevent agreeable model bias.
- **5-Phase pipeline**:
  1. *Context intake*: Infers domain from current workspace or asks at most one concise round of questions.
  2. *Casting*: Generates distinct names, backgrounds, skill levels, preferences, and communication styles.
  3. *Independent impressions*: Individual reviews covering aesthetics, clarity, friction points, and requested changes.
  4. *Group debate*: Simulated multi-round conversation where personas compare notes and drill down on divisive points.
  5. *Structured report*: Developer-oriented summary featuring an issue/severity matrix, quick wins, and validation notes.

## Supported Environments

- Claude Code (`~/.claude`)
- Antigravity IDE (`~/.gemini/config`)
- Kilo / Kilocode (`~/.kilo`, `~/.config/kilo`, `~/.kilocode`)
- Agents Hub (`~/.agents/skills`)

## Installation (Windows)

### Interactive Installer
Run `install.bat` from the repository root:
```cmd
install.bat
```
The menu allows selecting a specific host environment or deploying to all supported platforms (`[5] All environments`).

The installer provisions NTFS directory junctions pointing directly to this repository. Local source edits are reflected immediately across all environments without reinstallation.

### CLI Parameters
Automated installation without interactive prompts:
```cmd
install.bat -All
install.bat -Claude
install.bat -Antigravity
install.bat -Kilo
install.bat -Uninstall
```

PowerShell execution:
```powershell
.\install.ps1 -All
```

To force standalone folder copies instead of NTFS junctions:
```powershell
.\install.ps1 -All -Mode copy
```

## Usage

### Slash Command
```text
/focusgroup [optional target or specific focus]
```

Examples:
```text
/focusgroup
/focusgroup main menu navigation and text hierarchy
/focusgroup combat pacing and tutorial difficulty
```

### Natural Language Invocation
The skill triggers automatically on user prompts such as:
- "Simulate a focus group for this dashboard"
- "Run a simulated playtest with diverse player types"
- "What would novice and veteran users think of this onboarding flow?"
- "Evaluate aesthetics and usability with a panel of tester personas"

## Repository Structure

```text
.
|-- SKILL.md                 # Full skill specifications and prompt guidelines
|-- commands/
|   `-- focusgroup.md        # Host command declaration for /focusgroup
|-- install.bat              # Windows batch runner
|-- install.ps1              # Deployment script (junction/copy engine)
`-- README.md                # Documentation
```

## License

MIT
