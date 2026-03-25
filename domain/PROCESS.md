# Domain Layer Registration Process

## The Transform

```
Signal: "Register [domain] at layer [N]"
   ↓
Compose: Write [domain].def with entities, properties, oracle sources
   ↓
Strike: ./tools/register-domain.sh [domain].def
   ↓
Verify: make all
   ↓
Residue: Domain layer complete, verified, oracle-confirmed
```

## The .def Format (Single Source of Truth)

```
DOMAIN <name> <layer> <primary-source>
<label> | <source-atoms> | <target> | <pairs> | <oracle-source> <oracle-value> <oracle-uncertainty>
```

## Rules

1. One .def file per domain layer
2. Every measurement atom in the .def must have an oracle column
3. register-domain.sh generates ALL outputs — no hand-editing
4. make all must pass before the layer is considered registered
5. If make all fails, fix the .def and re-register — never patch outputs
## Known Issue (2026-03-23)

The oracle column maps to ALL measurement atoms per line.
When a line has multiple measurements (e.g., bond energy AND length),
only the target measurement should be oracle-mapped.
FIX NEEDED: per-atom oracle mapping in the .def format.

## Proposed Fix

Change .def format to support per-atom oracle:
```
<label> | <source> | <target> | <pairs> | <oracle-entries-semicolon-separated>
```
Where each oracle entry is: `<atom> <source> <value> <uncertainty>`
This allows multiple oracle mappings per entity line.
