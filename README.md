# RunBook To Rule Them All

A living knowledge base for capturing, searching, replicating, and generating **procedural knowledge**: runbooks you (and agents) can follow, verify, and improve over time.

## What lives here

| Path | Purpose |
|------|---------|
| `runbooks/entries/` | Dated runbook entries (`YYYY-MM-DD_<slug>.md`) |
| `runbooks/templates/` | Scaffolds for new entries |
| `sandbox/examples/` | Runnable examples referenced by runbooks |
| `docs/architecture.md` | System design and conventions |
| `config/search.yaml` | Semantic search configuration (future) |

## Quick start

Create a new entry from the standard template:

```bash
./scripts/new_runbook.sh my-process-name
```

This writes `runbooks/entries/YYYY-MM-DD_my-process-name.md`. Edit the frontmatter and sections, then add a line to `runbooks/index.md` (TOC is maintained by hand until index automation lands).

## Validation

```bash
./scripts/validate.sh
```

Link checking uses [lychee](https://github.com/lycheeverse/lychee) when it is installed on your machine. CI runs the same checks in GitHub Actions.

## Roadmap (not in this repo yet)

- **Semantic search**: Python + sentence-transformers, local index, `tools/search_cli.py` (see `docs/architecture.md`).
- **Constella**: Entries that document Constella workflows may use `constella: true` in frontmatter and cross-link from Constella’s `docs/` via relative paths. Neither repo owns the other.

## License

Add a `LICENSE` file when you publish this as its own repository.
