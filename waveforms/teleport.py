#!/usr/bin/env python3
"""Waveform: teleportation. State transfer via entanglement + collapse."""
import sys
state = sys.argv[1]
print(f"{state} -> bell_pair+{state}")
print(f"bell_pair+{state} -> alice_measures")
print(f"alice_measures -> classical_bits(2)")
print(f"classical_bits(2) -> bob_corrects")
print(f"bob_corrects -> bob({state})")
