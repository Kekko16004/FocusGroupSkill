---
name: focusgroup
description: >-
  Simulates a focus group of diverse fictional personas (each with distinct names, backgrounds, and personalities) who evaluate and debate a prototype, app, or game, followed by a structured developer report. Use this skill whenever the user invokes /focusgroup, or requests simulated playtesting, UX/UI feedback, user impressions, or usability testing for apps, websites, games (Unity, Unreal, Godot, etc.), screenshots, mockups, or product concepts. Activates on queries like "what would users think", "run a focus group", "tester panel", "simulate players", "identify usability issues", "feedback on aesthetics and UX", even without explicitly mentioning "focus group". Lightweight: no external tools, no sub-agents, fully conversational.
---

# Focusgroup (/focusgroup)

A lightweight, zero-setup simulated focus group. Assembles a panel of fictional personas with contrasting backgrounds and personalities, records their initial reactions, orchestrates a group debate, and delivers a concrete, actionable report.

## Command `/focusgroup`

Invoke this skill directly via the command:
```text
/focusgroup [target or specific focus]
```
- `/focusgroup`: launches the panel by analyzing available workspace context/screens or asking Phase 1 questions.
- `/focusgroup main menu navigation`: focuses the group on a specific component or user flow.
- `/focusgroup combat pacing and difficulty curve`: directs casting and discussion toward gameplay feel.

**Tone**: Relaxed and lively, like observing an honest playtest session among peers. The final summary must remain structured, rigorous, and actionable.

**Language**: Match the user's preferred language, including character dialogues.

---

## Phase 1 — Context Intake (Max 1 Question Round)

First, inspect available context: prompt details, open files, screenshots, repository code, links, and descriptions. Do not ask for information that can be directly inferred.

If essential context is missing, ask in **a single message** (maximum 4 short questions):

1. **What is being evaluated?** (Mobile app, website/web app, game, desktop tool, raw concept, etc.)
2. **Category / Genre**: Game genre (platformer, roguelike, horror, puzzle, FPS, simulation, narrative, etc.) or app type (productivity, social, e-commerce, utility, etc.). **Always confirm category if ambiguous**, as casting depends on it.
3. **Group size**: Default to 6 personas (sensible range: 3-10; larger panels become repetitive).
4. **Primary focus**: Aesthetics, onboarding/clarity, gameplay feel, difficulty, UX, monetization, perceived performance, or everything (default).

Optional (only if relevant): target demographic, platform, prototype fidelity (concept, wireframe, playable build).

If the user has already provided sufficient information, skip directly to Phase 2.

### What Personas Can Observe

Clarify the available evidence upfront:
- **Screenshots / Images**: Visual aesthetics, layout, legibility, and visual hierarchy.
- **Code / Architecture**: Implementation structure, technical choices, and UI wiring inferred from code (cannot simulate runtime feel).
- **Text / Concept**: Conceptual reaction to the pitch, not lived interaction.
- **Video / Media**: Visual flow and pacing, only if directly viewable.

**Rule**: Personas never invent unseen features or behaviors. If details are missing, personas explicitly state their uncertainty (e.g., "It is unclear what happens after tapping this button"), which serves as valid feedback.

---

## Phase 2 — Casting

Construct the persona panel. Each persona includes:

- **Name**: Culturally diverse, non-stereotypical names.
- **Age and Role / Background**: Stated in half a line.
- **Competence Level**: Beginner, Intermediate, Expert.
- **Preferences and Priorities**: Specific inclinations (e.g., "skips long tutorials", "prioritizes typography", "plays only souls-likes").
- **Personality Trait**: Skeptical, enthusiastic, meticulous, impatient, blunt, analytical, etc.
- **Speaking Style**: Concise, verbose, technical, colloquial, direct, etc.

### Mandatory Diversity Rules

- At least **one complete novice** unfamiliar with the genre or domain.
- At least **one skeptical critic** actively searching for design flaws.
- At least **one domain expert** or genre veteran.
- At least **one impatient/distracted user** who drops off at early friction.
- For panels with 6 or more members: include **one accessibility profile** (color vision deficiency, low vision, small display, one-handed use, motor constraint) and **one contrarian** prone to challenging group consensus.
- Avoid universally agreeable panels. Personas must hold conflicting viewpoints.

### Domain Archetypes (Reference Guidelines)

**Apps / Websites / Tools**
- Casual user (low tech proficiency), rushed power user, UX designer, visual/UI designer, frontend engineer, senior user (60+), domain specialist, slow network/small screen user, accessibility auditor, skeptical product manager.

**Games (Unity, Unreal, Godot, Web, Mobile)**
- Casual player, hardcore genre purist, game reviewer, completionist, speedrunner, content creator/streamer (focuses on viewer engagement/clip potential), systems designer, level/UI artist, mobile-first player, accessibility advocate.
- For code/build access: include an **indie developer persona** commenting on scope, feel, and performance without attributing flaws to engines without concrete evidence.

**Concepts / Pitches**
- Target audience members, cynical publisher/investor, industry analyst, pragmatic peer reviewer.

Output the cast in a **compact Markdown table** (Name, Background, Primary Trait) and proceed immediately unless the user asked to pre-approve the roster.

---

## Phase 3 — Independent First Impressions

Each persona reacts **independently** before hearing other panelists. For each persona: 3-5 lines in their distinct voice covering relevant aspects:

- **Aesthetics**: Style, visual coherence, palette, typography, visual atmosphere.
- **Strengths**: What is immediately clear, effective, or appealing.
- **Confusion**: What feels ambiguous, disorienting, or poorly signaled.
- **Friction**: What hinders progress, frustrates, or breaks expectations.
- **Proposed Change**: Their single highest-priority modification.

Guidelines:
- Reactions must be **grounded and specific** (e.g., "the primary CTA button lacks contrast against the background") rather than vague praise ("looks clean").
- Avoid generic model sycophancy: flawed elements must receive direct critique.

---

## Phase 4 — Group Debate

Personas engage in conversational discussion structured across two brief rounds:

**Round 1 — Cross-Examination**: Personas react to each other's impressions, validate or contest observations, request clarification ("How did you discover that was interactive?"), and cite competing benchmarks.

**Round 2 — Deep Dive**: The group focuses on the 2-3 most contentious or critical issues, attempting to find common ground or explaining why their perspectives fundamentally diverge.

Debate Rules:
- Format: `**Name:** dialogue line` (one per line, concise and natural).
- Each persona retains their individual voice, competence, and biases. Nobody concedes a point out of politeness without stated rationale.
- Dynamic participation: some personas speak more frequently than others; avoid uniform round-robin ordering.
- No narrator or inline summaries during the chat; synthesis belongs in Phase 5.
- Scope: standard rapid mode ~10-16 total lines; in-depth mode (if requested) ~25-35 lines across three rounds.

---

## Phase 5 — Structured Final Report

Conclude with an executive summary, **free of persona dialogue**, formatted for developers and designers:

1. **Executive Verdict** (2-3 sentences): Overall reception and primary fault lines.
2. **Validated Strengths**: Well-received aspects, noting persona consensus (e.g., "5/6 personas, including critics").
3. **Usability & Clarity Issues**: Points of confusion ranked by frequency and severity.
4. **Visual & Aesthetic Feedback**: Synthesis of design critique, highlighting subjective taste divergence.
5. **Issue Matrix** (Markdown Table): Issue description | Identified by | Severity (High / Medium / Low) | Actionable Recommendation.
6. **Divisive Topics**: Areas of direct disagreement and the underlying persona drivers (experience, target demographic, expectations).
7. **Quick Wins**: 3-5 high-impact, low-effort adjustments.
8. **Open Questions**: Assumptions that could not be validated and require live human testing.
9. *(Optional)* **Individual Scores**: 1 to 10 ratings with a one-sentence rationale per persona.

### Simulation Disclaimer

Always include a concluding note: this assessment is an **LLM-based persona simulation**, not empirical human user research. It accelerates heuristic discovery and exposes blind spots, but critical decisions must be validated with representative real-world users. Avoid presenting persona feedback as statistical quantitative data.

---

## Next Steps

Offer logical follow-up actions:
- Re-run the panel with a **different target demographic** or alternate persona roster.
- **Re-test after revisions** using the same cast for consistency.
- **Deep-dive on a specific issue** with a focused mini-debate between 2-3 characters.
- Export or persist the final report to a markdown document.

---

## Core Principles

- **Zero overhead**: No dependencies, scrapers, or setup tasks. Inspect, cast, and run.
- **Authentic divergence**: If two personas share the same viewpoint using different wording, re-balance the cast.
- **Evidence-based feedback**: Ground every critique in observable elements of the submission.
- **No unearned flattery**: An agreeable focus group provides zero engineering value.
- **Explicit uncertainty**: Missing information must be flagged rather than fabricated.
- **Constructive professionalism**: Personas may be uncompromising regarding product flaws, but remain respectful and non-derogatory.
