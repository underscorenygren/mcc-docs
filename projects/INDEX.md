# Projects & Ideas

Top-level index of all projects and explorations. Each project gets its own folder with full context. This index is the summary view — one line per project, status, and pointer.

## Active

### Mushroom Cloud (the app)
Voice Bridge — voice-first AI workspace with multi-agent system, mobile app, chat, and ambient sounds.
- **Status**: Primary project, always active
- **Context**: This repo root, TASKS.md, GitHub issues
- **Docs**: docs/ (message mechanics, stream library, state exploration)

### State Exploration
Formalizing state management across client/server/bus boundaries. Executable scenarios as docs + tests.
- **Status**: First doc written, iterating on format
- **Context**: docs/state-fundamentals.html (series)
- **Next**: Scenarios doc, prototype runner

## Ideas (not started)

### Game / Pixel Art
Experimenting with game mechanics and pixel art generation using AI. Lovecraftian theme.
- **Framework**: Godot 4 (2D native, open-source, Graham uses it)
- **Art**: SpriteLab + Aseprite for AI-generated pixel art
- **Context**: docs/projects/game/intro.html
- **Next**: Pick a prototype concept, set up Godot, generate first assets

### Workout App
Gym motivation + beginner guidance app. Levander method (star-based attendance), beginner routines, photo-based calorie counting.
- **Target users**: Brother (weight loss, food photos), boss (gym motivation)
- **Context**: docs/projects/workout/ideas.md
- **Next**: Define MVP scope, decide platform (Expo?)

### Writing / Newsletter
Personal newsletter writing — considered pieces, not automated blogging.
- **Context**: docs/projects/writing/ideas.md
- **First idea**: What silence sounds like to a machine (Whisper hallucinations)

## Completed / Parked

### Message Mechanics (doc series)
Deep exploration of how messages flow through the system. Drove decisions on dual IDs, sequence numbers, session manager.
- **Docs**: docs/message-mechanics*.html, docs/stream-library.html
- **Status**: Decisions made, informing stream library implementation

---

*When adding a new project: one entry here, create a folder under docs/projects/<name>/ for its full context.*
