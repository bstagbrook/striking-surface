# Domain Agent Prompt Template

EVERY agent dispatched to build a domain file MUST include this instruction:

---

CRITICAL — FOOTER PAIR RULE:

The footer (vacuum tube) pair's KEY must match the LABEL of the first entity inside the source block, NOT the word "source".

Example — if your source block is:
```
((Mankiw-9th (economics-textbook) (authoritative) ((economics-textbook . authoritative))))
```

Then the footer MUST be:
```
((Mankiw-9th . economics-registered)))
```

NOT:
```
((source . economics-registered)))  ← THIS WILL PRODUCE AN EMPTY TUBE
```

The trace engine extracts the seed from the source. The seed is the label of the inner transform (e.g., "Mankiw-9th"). The footer pair's key must match that seed or the trace returns ().

---

This rule exists because EVERY agent-built domain file has had this bug. The RCA is that the footer pattern looks like it should use "source" but the trace engine seeds from the inner label.
