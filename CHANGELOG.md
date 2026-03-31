# Changelog

All notable changes to this project are documented in this file.

## [0.1.0] — 2026-03-31

### Added

- Initial repository layout: `runbooks/`, `sandbox/`, `scripts/`, `docs/`, `config/`.
- Three entry templates: `standard`, `sandbox`, `investigation`.
- `scripts/new_runbook.sh` to scaffold dated entries from the standard template.
- `scripts/validate.sh` for optional local link checking (lychee).
- GitHub Actions workflow for link validation.
- `MANIFEST.json` with required-file inventory (Constella-style).
- Architecture document describing schema, search plans, and Constella integration.
