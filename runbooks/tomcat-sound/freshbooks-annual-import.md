# Runbook: FreshBooks Annual Import — Tom Cat Sound LLC

**Purpose:** Import verified income and expense CSVs into FreshBooks at tax season.  
**Trigger:** After financial audit is complete and CPA package is ready.  
**Last run:** 2026-04-01 (first run — establishing baseline)  
**Owner:** Jonathan Morales  
**Est. time:** 45–90 min first time, 20 min subsequent years

---

## Prerequisites

- [ ] FreshBooks account active and accessible
- [ ] Income CSV ready: `projects/tomcat-sound/02_financial/FreshBooks_Income_2024.csv`
- [ ] Expenses CSV ready: `projects/tomcat-sound/02_financial/FreshBooks_Expenses_2024.csv`
- [ ] Verified financial totals on hand:
  - Revenue: $6,834.30
  - COGS: $6,317.43
  - Operating expenses: (confirm from ledger)
  - Net loss: ~$9,499 (CPA to confirm)

---

## Step 1 — Log into FreshBooks and check account tier

- URL: https://my.freshbooks.com
- Confirm your plan supports CSV import (Lite plan may not — check Settings > Billing)
- If import is not available on your tier: [note workaround here after first run]

---

## Step 2 — Import Income (Invoices/Payments)

[FILL IN after first run — note exact menu path, field mappings, any gotchas]

**CSV columns in FreshBooks_Income_2024.csv:**

```
date,description,amount,client,category,notes
```

---

## Step 3 — Import Expenses

[FILL IN after first run]

**CSV columns in FreshBooks_Expenses_2024.csv:**

```
date,description,amount,vendor,category,notes
```

---

## Step 4 — Create invoices for sessions without formal invoices

[FILL IN — this is the manual step Jonathan flagged as potentially needed]

Known sessions needing invoices: [list after audit]

---

## Step 5 — Verify totals match audit

After import, confirm FreshBooks totals match:
- Income total: $6,834.30
- Expense total: (from ledger)

If they don't match, note discrepancy here and flag for CPA.

---

## Step 6 — Export FreshBooks report for CPA package

[FILL IN — menu path to export P&L or transaction report]

---

## Known issues / gotchas from first run

[Fill in as you go]

---

## Proof artifact

- [ ] FreshBooks totals match verified figures
- [ ] CPA export saved to `projects/tomcat-sound/02_financial/`
- [ ] This runbook updated with actual menu paths and field mappings
