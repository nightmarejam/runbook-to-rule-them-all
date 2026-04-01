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
  - Revenue: $6,759.40
  - COGS: $6,317.43
  - Operating expenses: (confirm from ledger)
  - Net loss: ~$9,499 (CPA to confirm)

---

## Step 1 — Log into FreshBooks and check account tier

- URL: https://my.freshbooks.com
- Confirm your plan supports CSV import (Lite plan may not — check Settings > Billing)
- **FreshBooks Lite:** Income cannot be bulk-imported from CSV; enter each line as an invoice + payment per Step 2. Expenses still support CSV import per Step 3.

---

## Step 2 — Import Income (Invoices/Payments)

FreshBooks Lite does not support direct CSV import of invoices.
Enter each income transaction manually as an invoice:

1. Clients → New Client (name only required)
2. Invoices → New Invoice
3. Set client, date, line item description, amount
4. Save → More Actions → Add Payment → enter date and method
5. Mark payment method as Venmo (service clients) or Reverb/Other (gear sales)

**CSV columns:** date, description, amount, client, category, notes

**Key setting:** Use accrual date range but verify with Cash-Based toggle if income shows $0

**Invoice numbering:** Deleted invoices leave gaps — skip duplicate warnings, use next number

---

## Step 3 — Import Expenses

FreshBooks supports CSV import for expenses via More Actions → Import.
If recurring expenses exist, use Make Recurring toggle on first entry.

**CSV columns:** date, description, amount, vendor, category, notes

**Category mappings used:**

- Allen-Vestments → Office Space (Rent or Lease)
- Still Water Insurance → Business Insurance
- Bizee LLC filing → Uncategorized (CPA to reclassify as organizational cost)

---

## Step 4 — Sessions requiring formal invoices

2024: Daniel Baker only (2 payments via Venmo — $800 on 2024-03-27, $200 on 2024-03-29)
Gear sales entered as product invoices — no formal invoice was issued at time of sale.
2025: Megan Milius, B. Auden active — invoice on completion of each session.

---

## Step 5 — Verify totals match audit

After import, confirm FreshBooks totals match:
- Income total: $6,759.40
- Expense total: (from ledger)

If they don't match, note discrepancy here and flag for CPA.

---

## Step 6 — Export FreshBooks P&L for CPA

Reports → Profit and Loss → set date Jan 1 YYYY – Dec 31 YYYY
Toggle to accrual view first, then verify Cash-Based in Old Report if income shows $0.
Export as PDF → save to `projects/tomcat-sound/02_financial/FreshBooks_PnL_YYYY.pdf`

**Known limitation:** COGS not tracked in FreshBooks — enter gear cost on each invoice
line item going forward (2025+). For 2024, COGS lives in ledger COGS_Matching sheet.

---

## Known issues / gotchas from first run

- Lite: no CSV import for invoices — manual Clients + Invoices + Add Payment path only.
- If P&L income is $0, switch accrual/cash (and Old Report cash view) before assuming data is missing.
- Invoice numbers: gaps after deletes are normal; FreshBooks may warn on duplicates — advance to next free number.
- Organizational costs (e.g. Bizee) may need CPA reclass; left Uncategorized in FreshBooks until reviewed.

---

## Proof artifact

- [ ] FreshBooks totals match verified figures
- [ ] CPA export saved to `projects/tomcat-sound/02_financial/`
- [ ] This runbook updated with actual menu paths and field mappings
