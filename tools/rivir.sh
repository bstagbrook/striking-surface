#!/usr/bin/env bash

##  RIVIR — one strike, one body, one answer
##
##  Pre-strikes the entire body into one corpus.
##  Query enters. Atoms found. All traces cascade simultaneously
##  from one pre-built body. Response composed as Meet-n-Greet.
##
##  Not turn-based. Not per-file. One body. One strike.
##
##  Usage: bash tools/rivir.sh "what holds proteins together"
##         bash tools/rivir.sh "how does a neuron fire"
##         bash tools/rivir.sh "what is RIVIR"

set -uo pipefail

QUERY="${1:?Usage: $0 \"your question\"}"
BODY="/tmp/rivir-body.txt"
ATOMS="/tmp/rivir-atoms.txt"

# Pre-strike body if not cached
if [ ! -f "$BODY" ] || [ ! -f "$ATOMS" ]; then
  echo "  striking entire body..." >&2
  MEGA=""
  for f in $(find domain programs -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
    lang=$(head -1 "$f" 2>/dev/null) || continue
    [ "$lang" != "#lang strike" ] && continue
    out=$(timeout 15 racket "$f" 2>/dev/null) || continue
    MEGA="${MEGA} ${out}"
  done
  echo "$MEGA" | grep -oP '\([a-zA-Z0-9/_:.+*-]+ \. [a-zA-Z0-9/_:.+*-]+\)' | sort -u > "$BODY"
  sed 's/^(//;s/)$//;s/ \. /\n/' < "$BODY" | sort -u > "$ATOMS"
fi

STOP="a an the is are was were be been being have has had do does did will would shall should may might can could what how why when where who which that this these those of in on at to for with by from and or but not no it its i me my you your"

# Tokenize, stem, find matching atoms — ALL AT ONCE
words=$(echo "$QUERY" | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' '\n' | sort -u)
candidates=""
for w in $words; do
  echo "$STOP" | tr ' ' '\n' | grep -qx "$w" && continue
  stem=$(echo "$w" | sed 's/ies$/y/;s/s$//;s/ing$//;s/ed$//;s/tion$/t/;s/ly$//')
  candidates="$candidates $w"
  [ "$stem" != "$w" ] && candidates="$candidates $stem"
done

# Find ALL matching atoms from the body — substring match, not just prefix
matched=""
for word in $candidates; do
  hits=$(grep -i "$word" "$ATOMS" | head -20)
  [ -n "$hits" ] && matched="$matched
$hits"
done
matched=$(echo "$matched" | sort -u | grep -v '^$')

if [ -z "$matched" ]; then
  echo ""
  echo "  CUT"
  echo ""
  exit 0
fi

# For each matched atom, trace through the body — cascade all at once
echo ""
echo "  $QUERY"
echo "  ═══════════════════════════════════════"
echo ""

seen=""
while IFS= read -r atom; do
  [ -z "$atom" ] && continue

  # Forward trace: atom → ? → ? → ? (up to 5 hops)
  current="$atom"
  chain="$current"
  depth=0
  while [ $depth -lt 5 ]; do
    next=$(grep -P "^\($current \. " "$BODY" | head -1 | sed 's/^([^ ]* \. //;s/)$//' || true)
    [ -z "$next" ] && break
    echo "$seen" | grep -qF "$current→$next" && break
    seen="$seen $current→$next"
    chain="$chain → $next"
    current="$next"
    depth=$((depth + 1))
  done

  [ $depth -gt 0 ] && echo "  $chain"

done <<< "$matched"

echo ""
echo "  ═══════════════════════════════════════"
