# Contributing

## Runbook entries

1. Prefer `./scripts/new_runbook.sh <slug>` so filenames stay `YYYY-MM-DD_<slug>.md`.
2. Fill in YAML frontmatter per `docs/architecture.md` (schema).
3. Write steps for a capable stranger: explicit commands, paths, and expected outcomes.
4. Update `runbooks/index.md` with a link to your entry.
5. Run `./scripts/validate.sh` before opening a PR (install [lychee](https://github.com/lycheeverse/lychee) for link checks).

## Templates

- **standard.md** — Linear procedures with verification.
- **sandbox.md** — Replicable environments (inputs, tooling pins, teardown).
- **investigation.md** — Open-ended debugging or discovery with a paper trail.

## Constella cross-links

When a runbook is specific to Constella governance or tooling, set `constella: true` in frontmatter and add reciprocal links in Constella’s documentation using relative paths between sibling checkouts.
