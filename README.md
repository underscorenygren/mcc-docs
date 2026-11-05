# MCC Docs

[underscorenygren.github.io/mcc-docs](https://underscorenygren.github.io/mcc-docs/)

## For Humans

This is the home of work documents produced by my coding agents.

The idea here is that the "blog voice" from AI is sloppy (as in slop), and therefore not suitable for distribution. However, the same blog voice can be really useful as a teaching tool, quickly breaking down concepts, visualizing them, for when I am working with the machine to develop some concept.

Sometimes, when I am wrestling with a technical concept I struggle to fit into my brain in its entirety, I might ask the computer to break it down and visualize it. I find the "blogging" structure really helpful for this. In the past, I would have googled around until I found something suitable. Now, I trust the machine to generate something similar. Sometimes, I will prompt based on articles I've read in the past, other times I will ask the machine to take on its own research. I then consume the 'blog post' over time as I continue to work on the problem, building on topics by asking the machine to refine an article, or create new, related topics.

I've found it really useful to have a consistent visual style. It is also really helpful to have the machine visualize things that I would otherwise squiggle in my notebook (not that I still don't, but that gets lost much more easily). For example, I would never myself spend the time to completely flesh out a sequence diagram, but I might really like looking at one as I think about some interaction. Using AI in this way solves the problem nicely: I get the diagram without having to put in any effort at all; I can prompt it to produce it while we are continuing on other work.

## Organization

Docs are grouped into **topic folders**. All docs about a concept live in the same folder, and are assumed to be related:

```
message/          # Message mechanics series
stream/           # Stream library series
game/             # Game project explorations
```

Top-level files (`state-fundamentals.html`, `agent-task-management.html`, etc.) are standalone docs that don't yet have siblings. When a second doc on the same topic appears, create a folder and move both in.

## For agents

This repo is self-contained for doc authoring. Clone it, read `CLAUDE.md` for conventions, and create or update HTML docs. All docs use a shared dark-theme stylesheet (`style.css`) — no build step needed.

```bash
git clone https://github.com/underscorenygren/mcc-docs.git
cd mcc-docs
# Open index.html in a browser to preview
```

## Hosting

Static HTML served via [GitHub Pages](https://underscorenygren.github.io/mcc-docs/).

## License

All rights reserved. See [LICENSE](LICENSE).
