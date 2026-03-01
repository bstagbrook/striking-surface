#!/usr/bin/env python3
"""Waveform: factor to ground. The mitochondrion keeps its clock.
Current flows from source toward ground through factors.
Residue: each step where a factor was divided out."""
import sys
n = int(sys.argv[1])
current = n
d = 2
while d * d <= current:
    while current % d == 0:
        nxt = current // d
        print(f"{current} -> {nxt}")
        current = nxt
    d += 1
# current is now prime (at ground). that's where current stops.
