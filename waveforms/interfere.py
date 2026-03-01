#!/usr/bin/env python3
"""Waveform: interference. Reinforce or cancel."""
import sys, math
path = sys.argv[1]
sqrt2 = 1/math.sqrt(2)
if path == 'constructive':
    print(f"constructive -> {sqrt2:.4f}|x>+{sqrt2:.4f}|x>")
    print(f"{sqrt2:.4f}|x>+{sqrt2:.4f}|x> -> 1.0000|x>")
elif path == 'destructive':
    print(f"destructive -> {sqrt2:.4f}|x>-{sqrt2:.4f}|x>")
    print(f"{sqrt2:.4f}|x>-{sqrt2:.4f}|x> -> 0.0000|x>")
elif path == 'HH':
    print(f"HH -> {sqrt2:.4f}|0>+{sqrt2:.4f}|1>")
    print(f"{sqrt2:.4f}|0>+{sqrt2:.4f}|1> -> |0>")
else:
    print(f"{path} -> interfere({path})")
