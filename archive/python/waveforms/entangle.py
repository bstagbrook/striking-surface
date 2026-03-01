#!/usr/bin/env python3
"""Waveform: entanglement. Bell pair. Measure one, know the other."""
import sys, math
a = sys.argv[1] if len(sys.argv) > 1 else '0'
b = sys.argv[2] if len(sys.argv) > 2 else '0'
sqrt2 = 1/math.sqrt(2)
if a in ('0', '|0>') and b in ('0', '|0>', 'ground', 'e'):
    print(f"{a} -> H({a})x{b}")
    print(f"H({a})x{b} -> {sqrt2:.4f}|00>+{sqrt2:.4f}|11>")
else:
    print(f"{a} -> bell({a},{b})")
