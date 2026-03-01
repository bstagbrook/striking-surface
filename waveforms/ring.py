#!/usr/bin/env python3
"""Waveform: ring. be -> have -> do -> be. Self-sustaining cycle.
One strike, permanent current. The cycle IS the persistence."""
import sys
start = sys.argv[1]
n = int(sys.argv[2]) if len(sys.argv) > 2 and sys.argv[2].isdigit() else 3
cycle = ['be', 'have', 'do']
current = start
for i in range(n):
    idx = cycle.index(current) if current in cycle else 0
    nxt = cycle[(idx + 1) % len(cycle)]
    print(f"{current} -> {nxt}")
    current = nxt
