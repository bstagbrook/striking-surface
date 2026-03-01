#!/usr/bin/env python3
"""Waveform: map a directory tree as a chain of shapes.
Current flows through the filesystem. Residue is the structure."""
import sys, os

path = sys.argv[1]
prev = path

for root, dirs, files in os.walk(path):
    # skip hidden dirs
    dirs[:] = [d for d in sorted(dirs) if not d.startswith('.')]
    rel = os.path.relpath(root, path)
    if rel == '.':
        rel = path
    for f in sorted(files):
        if f.startswith('.'):
            continue
        entry = os.path.join(rel, f)
        print(f"{prev} -> {entry}")
        prev = entry
