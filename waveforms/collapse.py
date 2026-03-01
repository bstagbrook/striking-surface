#!/usr/bin/env python3
"""Waveform: measurement/collapse. Superposition resolves to a definite state.
Born rule: probability proportional to |amplitude|^2."""
import sys, random, math
state = sys.argv[1]
# parse superposition notation: coeff|0>+coeff|1>
if '|0>' in state and '|1>' in state:
    # extract amplitudes
    parts = state.replace('+', ' ').replace('-', ' -').split()
    amp0, amp1 = 0, 0
    for p in parts:
        if '|0>' in p:
            amp0 = float(p.replace('|0>', ''))
        elif '|1>' in p:
            amp1 = float(p.replace('|1>', ''))
    prob0 = amp0**2
    prob1 = amp1**2
    outcome = '|0>' if random.random() < prob0 else '|1>'
    print(f"{state} -> {outcome}")
else:
    # already collapsed or unrecognized
    print(f"{state} -> {state}")
