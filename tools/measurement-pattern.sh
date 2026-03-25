#!/usr/bin/env bash

##  MEASUREMENT ATOM PATTERN — single source of truth
##
##  Every tool that extracts measurement atoms from struck output
##  sources this file. One pattern. One place. No drift.
##
##  A measurement atom is any symbol containing digits and a
##  unit suffix (MeV, eV, GeV, s, m, pct, etc), optionally
##  prefixed with mass-, less-, than-.
##
##  Usage:
##    source "$(dirname "$0")/measurement-pattern.sh"
##    echo "$output" | grep -oP "$MEASUREMENT_ATOM_RE" | sort -u

export MEASUREMENT_ATOM_RE='(?:mass-)?(?:less-)?(?:than-)?[a-zA-Z]*-?[0-9][0-9.e+-]*-(?:MeV|eV|GeV|keV|s|m|kg|K|fm|pm|pct|Da|u|A|degrees)\b'
