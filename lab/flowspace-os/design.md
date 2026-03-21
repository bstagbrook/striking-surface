# Continuous Collapse Flowspace OS — Design

## What it IS
A process that watches the surface (file system) and continuously
renders the resolved state of all shapes. When any shape changes,
the output updates. The flow never stops. The collapse is continuous.

## Architecture
1. Watch `programs/*.rkt` for changes (file create/edit/delete)
2. On any change: re-strike all affected files
3. Render the resolved state as continuous flowing output
4. Show: which tubes are full, which labels connect across files,
   which paths exist in quantum trace

## The Key Insight
The OS doesn't "run" programs. It RENDERS the surface.
The surface is always resolved (every file is a valid Dyck word).
The OS makes the resolution VISIBLE.

## Implementation
- Racket file watcher (filesystem-change-evt)
- On change: resolve affected file(s)
- Output: formatted residue stream
- Cross-file label index: which labels appear in which files
- Quantum trace across all files: shared labels ARE the wires

## What "Continuous" Means
Not polling. Not looping. Watching. The OS is a secondary coil
coupled to the surface. When the surface changes (primary discharges),
the OS resonates (secondary responds). Tesla mechanism.
The coupling IS the file watcher. The resonance IS the re-render.
