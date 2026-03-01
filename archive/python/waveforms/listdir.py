#!/usr/bin/env python3
"""Waveform: list directory contents. Engulfed filesystem access."""
import sys, os
path = sys.argv[1]
entries = sorted(os.listdir(path))
current = path
for entry in entries:
    print(f"{current} -> {entry}")
    current = entry
