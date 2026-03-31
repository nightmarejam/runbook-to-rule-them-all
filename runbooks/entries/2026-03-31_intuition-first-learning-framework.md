---
id: 2026-03-31-intuition-first-learning-framework
title: "Intuition-first learning framework for Constella and RunBook"
tags: [constella, pedagogy, alife, learning, framing]
status: verified
replicated_by: []
sandbox_ref: ""
created: 2026-03-31
last_verified: 2026-03-31
constella: true
---

## Intent

Capture and operationalize the "intuition-first learning" model so it can be taught in Constella and repeatedly applied in RunBook entries.
This process turns a felt intuition into a named, reusable framework linked across both repositories.

## Prerequisites

- Access to both repositories:
  - `/home/jonat/ai-stack/projects/constella-framework/`
  - `/home/jonat/ai-stack/runbook-to-rule-them-all/`
- A concrete conversational thread where intuitions were discussed before formal naming.
- Permission to edit docs in both repos.
- Ability to run git commands in each repo.

## Steps

1. Start from the raw intuition.
   - In this case, the starting question was about ant/insect sensing, whether hairs act like RF antennas, and whether sensory systems "detect probability."
   - Do not force formal vocabulary yet. Preserve the original language and curiosity.

2. Extract the stable pattern from the conversation.
   - Distill repeated themes:
     - sensing before naming,
     - noisy/probabilistic environments,
     - emergent understanding,
     - embodied intelligence.
   - Convert this into a 3-stage arc:
     - Sense -> Pattern -> Name.

3. Anchor the pattern in Constella's mission language.
   - Position the method as dignity-aligned learning:
     - learner experience first,
     - formal terminology as confirmation,
     - cross-domain pattern literacy.
   - Write this as a governance/pedagogy document in Constella:
     - `docs/pedagogy/intuition-first-learning.md`

4. Cross-link the framework into Constella's doc surface.
   - Add a quick link from Constella docs index (`docs/README.md`) to the pedagogy file.
   - Add the pedagogy doc into Constella's required inventory (`MANIFEST.json`) so it stays part of the project's canonical set.

5. Encode the same idea as a reusable RunBook capture primitive.
   - Update RunBook `runbooks/templates/investigation.md` frontmatter with:
     - `intuition: ""`
   - Add a first body section:
     - `## Intuition`
     - prompt text that invites pre-formal free writing.

6. Record this exact process as a runbook entry.
   - Create entry via:
     - `./scripts/new_runbook.sh intuition-first-learning-framework`
   - Fill all sections with concrete repo paths and outcomes.
   - Mark `constella: true` in frontmatter.

7. Add the entry to RunBook index.
   - Update `runbooks/index.md` with dated row and relative link.

8. (Optional planning step) inspect current ChromaDB integration.
   - Confirm where semantic indexing currently lives so RunBook search can align to existing infrastructure instead of duplicating patterns.

## Verification

- `projects/constella-framework/docs/pedagogy/intuition-first-learning.md` exists and is linked from Constella docs index.
- `projects/constella-framework/MANIFEST.json` includes the pedagogy file path.
- `runbook-to-rule-them-all/runbooks/templates/investigation.md` includes both:
  - `intuition: ""` in frontmatter
  - `## Intuition` section before `## Intent`
- This runbook file exists at:
  - `runbook-to-rule-them-all/runbooks/entries/2026-03-31_intuition-first-learning-framework.md`
- `runbooks/index.md` includes a row linking this entry.

## Known failure modes

- "Name-first drift": jumping straight to academic terms and losing original intuition quality.
- Overfitting one conversation: treating one thread as universal instead of a pattern candidate.
- Missing cross-links: framework exists in one repo only, so teams cannot discover it from the other repo.
- Template mismatch: adding concept in prose but not in template schema, causing future entries to skip intuition capture.

## Notes

This framework emerged from a real exchange that moved from insect sensing questions to ALife emergence and then to learning design.
The strongest signal was that intuitive "almost-right" pulls can be systematically converted into durable knowledge when captured before formal naming.
RunBook is the capture mechanism; Constella is the teaching and governance context where the mechanism is applied.
