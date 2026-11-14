#!/bin/bash
# Auto-publish watcher for mcc-docs
# Polls for HTML file changes every 30s, commits and pushes them.
# Run as: /home/macbook/mcc-docs/auto-publish.sh
# Uses flock to ensure only one instance runs.

LOCKFILE="/tmp/mcc-docs-auto-publish.lock"
WATCHDIR="/home/macbook/mcc-docs"
LOG="/home/macbook/mcc-docs/auto-publish.log"

exec 200>"$LOCKFILE"
flock -n 200 || { echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) already running" >> "$LOG"; exit 0; }

cd "$WATCHDIR" || exit 1

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) auto-publish watcher started (poll every 30s)" >> "$LOG"

while true; do
  sleep 30

  cd "$WATCHDIR" || continue

  # Check for any changes (modified or new html files)
  if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard '*.html')" ]; then
    continue
  fi

  # Stage all html changes
  git add *.html 2>/dev/null

  if git diff --cached --quiet; then
    continue
  fi

  CHANGED=$(git diff --cached --name-only | tr '\n' ', ' | sed 's/,$//')

  git commit -m "auto-publish: ${CHANGED}

Co-Authored-By: auto-publish <noreply@mushroomcloudcomputing.com>" >> "$LOG" 2>&1

  git push origin main >> "$LOG" 2>&1

  echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) published: ${CHANGED}" >> "$LOG"

  curl -sf -X POST http://localhost:9097/events -H 'Content-Type: application/json' \
    -d "{\"type\":\"deploy\",\"agent\":\"auto-publish\",\"status\":\"done\",\"message\":\"Published ${CHANGED}\"}" 2>/dev/null || true
done
