#!/usr/bin/env python3
"""Waveform: count items in a directory matching a pattern."""
import sys, os, fnmatch
path = sys.argv[1]
pattern = sys.argv[2] if len(sys.argv) > 2 and sys.argv[2] not in ('ground', 'e') else '*'
matches = []
for root, dirs, files in os.walk(path):
    dirs[:] = [d for d in dirs if not d.startswith('.')]
    for f in files:
        if fnmatch.fnmatch(f, pattern):
            matches.append(os.path.join(root, f))
current = path
for m in sorted(matches):
    print(f"{current} -> {m}")
    current = m
