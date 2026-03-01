#!/usr/bin/env python3
"""Waveform: superposition. Hadamard — equal superposition."""
import sys, math
state = sys.argv[1]
sqrt2 = 1/math.sqrt(2)
if state in ('0', '|0>'):
    print(f"{state} -> {sqrt2:.4f}|0>+{sqrt2:.4f}|1>")
elif state in ('1', '|1>'):
    print(f"{state} -> {sqrt2:.4f}|0>-{sqrt2:.4f}|1>")
else:
    print(f"{state} -> superposition({state})")
