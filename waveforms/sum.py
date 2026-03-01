#!/usr/bin/env python3
"""Waveform: sum integers 1 to n.
Chain: n -> (n + n-1) -> (n + n-1 + n-2) -> ... -> total.
Current starts at the source and accumulates."""
import sys
n = int(sys.argv[1])
current = n
total = n
i = n - 1
while i >= 1:
    nxt = total + i
    print(f"{current} -> {nxt}")
    current = nxt
    total = nxt
    i -= 1
