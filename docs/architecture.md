# RunBook To Rule Them All — Architecture

## Purpose

A **living semantic knowledge base** for capturing, searching, replicating, and generating procedural knowledge. It serves personal use and AI-assisted system operation: humans and agents follow the same steps, verify the same signals, and record failure modes.

## Repository layout

```
runbook-to-rule-them-all/
├── .github/workflows/     # CI: validate (lint/link); search index TBD
├── .vscode/
├── config/search.yaml     # Semantic search config (future)
├── docs/
│   └── architecture.md    # This document
├── runbooks/
│   ├── index.md           # Table of contents (hand-maintained until automation)
│   ├── templates/
│   │   ├── standard.md
│   │   ├── sandbox.md
│   │   └── investigation.md
│   └── entries/           # YYYY-MM-DD_<slug>.md
├── sandbox/examples/      # Runnable code/config referenced by entries
├── scripts/
│   ├── new_runbook.sh     # Scaffold entry from standard template
│   ├── build_index.py     # (Planned) rebuild semantic index
│   └── validate.sh        # Lint + link check
├── tools/
│   └── search_cli.py      # (Planned) local semantic search CLI
├── CHANGELOG.md
├── CONTRIBUTING.md
├── README.md
└── MANIFEST.json
```

## Runbook entry schema

Every entry uses YAML frontmatter followed by fixed sections.

```yaml
---
id: YYYY-MM-DD-slug
title: ""
tags: []
status: draft | verified | deprecated
replicated_by: []       # who else has run this successfully
sandbox_ref: ""         # link to sandbox/examples if exists
created: YYYY-MM-DD
last_verified: YYYY-MM-DD
constella: false        # optional: true when documenting Constella-specific process
---
```

### Body sections

1. **Intent** — Why this process exists; what problem it solves.
2. **Prerequisites** — What must be true before starting.
3. **Steps** — Numbered steps; enough detail for a capable stranger.
4. **Verification** — Observable proof that it worked.
5. **Known failure modes** — What breaks and why.
6. **Notes** — Tacit knowledge, judgment calls, context.

## Semantic search (planned)

Start simple: **Python + sentence-transformers** to embed entry bodies, store vectors in **SQLite or a flat file**, query via `tools/search_cli.py`. Goals: offline-first, fast, no mandatory cloud. Upgrade path: dedicated vector DB if corpus or query patterns outgrow the simple store.

Configuration lives in `config/search.yaml` (stub until implementation).

## Constella integration

- Runbooks that document Constella processes may set `constella: true` and link to Constella docs.
- Constella may link back via **relative paths** between checkouts.
- **Neither repository owns the other**; RunBook stays sovereign as the procedural capture layer.

## CI

GitHub Actions runs `./scripts/validate.sh`. A future workflow step will rebuild the search index when `build_index.py` exists.
