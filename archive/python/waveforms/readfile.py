#!/usr/bin/env python3
"""Waveform: read a file's contents. Engulfed I/O."""
import sys
path = sys.argv[1]
content = open(path).read()
lines = content.split('\n')
current = path
for i, line in enumerate(lines[:20]):
    summary = line[:80] if line else '(empty)'
    nxt = f"line{i+1}"
    print(f"{current} -> {nxt}")
    current = nxt
