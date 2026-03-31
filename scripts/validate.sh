#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "RunBook validate (capture layer)"
echo "Repository root: $ROOT"

if command -v lychee >/dev/null 2>&1; then
  lychee --config lychee.toml .
else
  echo "Note: lychee not in PATH; skipping link check. Install: https://github.com/lycheeverse/lychee"
fi

echo "Done."
