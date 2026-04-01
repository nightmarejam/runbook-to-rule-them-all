---
id: 2026-04-01-alife-governance-experiment-execution
title: "ALife governance experiment execution"
tags:
  - alife
  - governance
  - constella
  - experiment
status: verified
replicated_by: []
sandbox_ref: ""
created: 2026-04-01
last_verified: 2026-04-01
constella: true
---

## Intent

Run one generation of the ALife governance seeding experiment and log results to ChromaDB.

## Prerequisites

FAITHH pointing at Gen8 ChromaDB, `alife_lineage` collection writable, experiment spec reviewed.

**Spec:** Constella Framework — `docs/experiments/alife_governance_seeding_v0.1.md` (in monorepo: `projects/constella-framework/...`).

## Steps

1. Verify prerequisites — confirm Gen8 ChromaDB reachable and `alife_lineage` writable (see prerequisite check script).

2. Run generation zero script:

   ```bash
   cd /home/jonat/ai-stack && source venv/bin/activate
   python3 projects/alife/experiments/generation_zero_band1.py
   ```

3. Verify count increase:

   ```bash
   python3 - << 'EOF'
   import chromadb
   client = chromadb.HttpClient(host="100.79.85.32", port=8000)
   col = client.get_collection("alife_lineage")
   print(f"alife_lineage count: {col.count()}")
   EOF
   ```

4. Check generation summary in `reports/alife/`.

## Verification

- `alife_lineage` document count increases.
- At least one norm candidate written to `faithh_knowledge_base`.

## Run history

- 2026-04-01 — outcome: pass — artifacts: `projects/alife/experiments/generation_zero_band1.py`, `reports/alife/generation_zero_band1_20260401_162822.json` — notes: all 50 agents survived all 10 ticks (Band 1 too permissive — resource acquisition consistently outpaces loss). Count: 50,450 → 50,950. Mean fitness 6.224, max 9.174. Band 1 parameters need tightening before generation 1 to create meaningful selection pressure.

## Known failure modes

What breaks and why.

## Notes

Tacit knowledge, judgment calls, context.
