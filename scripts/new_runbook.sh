#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SLUG="${1:-}"

usage() {
  echo "Usage: $(basename "$0") <slug>" >&2
  echo "  Creates runbooks/entries/YYYY-MM-DD_<slug>.md from templates/standard.md" >&2
  exit 1
}

[[ -n "$SLUG" ]] || usage

if [[ ! "$SLUG" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Slug must be lowercase letters, digits, and single hyphens between words (e.g. restore-database)." >&2
  exit 1
fi

DATE="$(date +%Y-%m-%d)"
DEST="${ROOT}/runbooks/entries/${DATE}_${SLUG}.md"

if [[ -f "$DEST" ]]; then
  echo "Refusing to overwrite existing file: $DEST" >&2
  exit 1
fi

TITLE="${SLUG//-/ }"
TITLE="${TITLE^}"

sed -e "s/YYYY-MM-DD-slug/${DATE}-${SLUG}/g" \
  -e "s/^title: \"\"/title: \"${TITLE}\"/" \
  -e "s/^created: YYYY-MM-DD/created: ${DATE}/" \
  -e "s/^last_verified: YYYY-MM-DD/last_verified: ${DATE}/" \
  "${ROOT}/runbooks/templates/standard.md" >"$DEST"

echo "Created ${DEST}"
