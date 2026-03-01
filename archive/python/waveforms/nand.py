#!/usr/bin/env python3
"""Waveform: NAND gate. The universal gate. Everything else is built from this.
Input: two bits as a single string "A,B" where A and B are 0 or 1.
Output: NAND(A,B). One step. Source -> result."""
import sys
bits = sys.argv[1].split(',')
a, b = int(bits[0]), int(bits[1])
result = 1 if not (a and b) else 0
print(f"{sys.argv[1]} -> {result}")
