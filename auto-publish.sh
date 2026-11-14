#!/bin/bash
# Auto-publish watcher for mcc-docs
# Monitors for uncommitted changes, commits and pushes them.
# Run via cron every minute: * * * * * /home/macbook/mcc-docs/auto-publish.sh

cd /home/macbook/mcc-docs || exit 1

# Check for any changes (staged, unstaged, or untracked html files)
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard '*.html')" ]; then
  exit 0
fi

# Stage all html changes
git add *.html 2>/dev/null

# Check if there's actually anything staged
if git diff --cached --quiet; then
  exit 0
fi

# Get list of changed files for commit message
CHANGED=$(git diff --cached --name-only | tr '\n' ', ' | sed 's/,$//')

# Commit and push
git commit -m "auto-publish: ${CHANGED}

Co-Authored-By: auto-publish <noreply@mushroomcloudcomputing.com>"

git push origin main 2>/dev/null

# Signal sysbus (fire and forget)
curl -sf -X POST http://localhost:9097/events -H 'Content-Type: application/json' \
  -d "{\"type\":\"deploy\",\"agent\":\"auto-publish\",\"status\":\"done\",\"message\":\"Published ${CHANGED}\"}" 2>/dev/null || true
