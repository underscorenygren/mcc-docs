# MCC Docs

Public documentation site. Static HTML hosted on GitHub Pages.

## Writing docs

All docs are standalone HTML files that link to `style.css` for consistent styling. No build step, no framework.

### File structure

```
index.html          # Landing page with card links to all docs
style.css           # Shared dark-theme stylesheet
*.html              # Top-level docs
projects/           # Project-specific docs in subdirectories
  game/             # Game project docs
  workout/          # Workout project docs
```

### Creating a new doc

1. Create a new `.html` file at the root (or in a `projects/<name>/` subdirectory for project-specific docs)
2. Use this template:

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doc Title</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Doc Title</h1>
<p class="subtitle">One-line description.</p>

<!-- Content here. Use h2 for sections, .card for callouts, .tag for labels -->

</body>
</html>
```

For docs in subdirectories, adjust the stylesheet path: `href="../../style.css"`.

3. Add a card entry to `index.html` under the appropriate section:

```html
<div class="card">
  <div class="title"><a href="your-doc.html">Title</a></div>
  <div class="desc">
    <span class="tag new">New</span>
    One-line description of what the doc covers.
  </div>
</div>
```

### Tag types

- `<span class="tag series">Series</span>` — Part of a multi-doc series
- `<span class="tag standalone">Research</span>` — Independent research or reference
- `<span class="tag new">New</span>` — Recently added

### Style rules

- Dark theme only (CSS variables in style.css)
- No inline styles except minor layout adjustments
- No JavaScript unless essential for the doc's purpose (e.g., interactive demos)
- Self-contained — each doc must work when opened directly, no build tooling
- No project-specific secrets, API keys, or internal infrastructure details

### Content guidelines

- Focus on design decisions, patterns, and explorations — not implementation details tied to a specific codebase
- Include diagrams (ASCII or embedded SVG) where they clarify flow
- Attribute quotes and decisions to their source
- Docs should be useful to someone who has never seen the codebase

## Validation

```bash
# Check all HTML files parse correctly
for f in *.html projects/**/*.html; do python3 -c "from html.parser import HTMLParser; HTMLParser().feed(open('$f').read())" 2>&1 && echo "OK: $f" || echo "FAIL: $f"; done
```

## Deploy

Push to `main`. GitHub Pages serves from the root of the `main` branch automatically.
