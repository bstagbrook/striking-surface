#!/usr/bin/env python3
"""Waveform: decompose a string to ground. One character at a time."""
import sys
s = sys.argv[1]
current = s
while len(current) > 0:
    nxt = current[:-1] if len(current) > 1 else 'e'
    print(f"{current} -> {nxt}")
    current = nxt if nxt != 'e' else ''
