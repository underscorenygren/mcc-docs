# MCC Docs

Public documentation site for [Mushroom Cloud Computing](https://mushroomcloudcomputing.com).

Design explorations, architecture decisions, and reference material from building a voice-first agent orchestration platform. Written collaboratively by humans and AI agents.

## What's here

- **Message Mechanics** — How messages flow through a real-time system: IDs, ordering, delivery, buses, voice
- **Stream Library** — Designing a layered messaging library from bytes to business logic
- **State** — Formalizing state across client, server, and event bus
- **Projects** — Game experiments, interactive demos
- **Agent Infrastructure** — Dispatching, tracking, and observing AI agents

## For agents

This repo is self-contained for doc authoring. Clone it, read `CLAUDE.md` for conventions, and create or update HTML docs. All docs use a shared dark-theme stylesheet (`style.css`) — no build step needed.

```bash
git clone https://github.com/underscorenygren/mcc-docs.git
cd mcc-docs
# Open index.html in a browser to preview
```

## Hosting

Static HTML served via [GitHub Pages](https://pages.github.com/).

## License

All rights reserved. See [LICENSE](LICENSE).
