#!/usr/bin/env bash

##  ASK — the body speaks
##
##  Usage: bash tools/ask.sh "what is a proton made of"
##         bash tools/ask.sh "what holds proteins together"
##         bash tools/ask.sh "how does it learn"
##         bash tools/ask.sh "what connects quarks and protein"
##
##  Natural language in. Grounded response with trace chain out.
##  Alpha-normalization finds atoms. Body traces. Residue speaks.

set -uo pipefail

QUERY="${1:?Usage: $0 \"your question\"}"

# Step 1: Alpha-normalize — extract candidate atoms from the query
# Lowercase, split to words, remove stop words
STOP="a an the is are was were be been being have has had do does did will would shall should may might can could what how why when where who which that this these those of in on at to for with by from and or but not no"

words=$(echo "$QUERY" | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' '\n' | sort -u)
candidates=""
for w in $words; do
  echo "$STOP" | tr ' ' '\n' | grep -qx "$w" && continue
  # Basic stemming: strip trailing s, ing, ed, tion, ly
  stem=$(echo "$w" | sed 's/ies$/y/;s/s$//;s/ing$//;s/ed$//;s/tion$/t/;s/ly$//')
  candidates="$candidates $w"
  [ "$stem" != "$w" ] && candidates="$candidates $stem"
done

# Step 2: Strike the alpha-normalization receipts to find canonical atoms
NORM_OUTPUT=$(timeout 30 racket programs/062-alpha-norm.rkt 2>/dev/null)

# Step 3: For each candidate word, find matching atoms in the norm body
echo ""
echo "═══════════════════════════════════════════"
echo "  $QUERY"
echo "═══════════════════════════════════════════"
echo ""

matched_atoms=""
for word in $candidates; do
  # Find pairs where this word appears as a key
  matches=$(echo "$NORM_OUTPUT" | grep -oP "\($word[a-zA-Z0-9_-]* \. [^)]+\)" | head -5 || true)
  if [ -n "$matches" ]; then
    while IFS= read -r match; do
      canonical=$(echo "$match" | sed 's/.*\. //;s/)//')
      matched_atoms="$matched_atoms $canonical"
    done <<< "$matches"
  fi
  # Also check if the word itself appears as a value (reverse lookup)
  rev_matches=$(echo "$NORM_OUTPUT" | grep -oP "\([^(]+ \. [^)]*$word[^)]*\)" | head -3 || true)
  if [ -n "$rev_matches" ]; then
    while IFS= read -r match; do
      canonical=$(echo "$match" | sed 's/.*\. //;s/)//')
      matched_atoms="$matched_atoms $canonical"
    done <<< "$rev_matches"
  fi
done

# Deduplicate
matched_atoms=$(echo "$matched_atoms" | tr ' ' '\n' | sort -u | grep -v '^$')

if [ -z "$matched_atoms" ]; then
  echo "  CUT — no registered shapes resonate with this query."
  echo ""
  echo "  The body does not contain receipts for these terms."
  echo "  This is honest silence, not ignorance."
  echo ""
  echo "═══════════════════════════════════════════"
  exit 0
fi

echo "  atoms found:"
echo "$matched_atoms" | while read -r atom; do echo "    · $atom"; done
echo ""

# Step 4: Trace each matched atom through ALL domain files
echo "  traces:"
echo ""

for atom in $matched_atoms; do
  for f in $(find domain programs -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' ! -name '062-*' 2>/dev/null | sort); do
    lang=$(head -1 "$f" 2>/dev/null)
    [ "$lang" != "#lang strike" ] && continue
    out=$(timeout 10 racket "$f" 2>/dev/null) || continue

    # Find trace chains containing this atom
    chains=$(echo "$out" | grep -oP "\($atom \. [^)]+\)" | head -3 || true)
    if [ -n "$chains" ]; then
      domain=$(basename "$(dirname "$f")")/$(basename "$f" .rkt)
      while IFS= read -r chain; do
        target=$(echo "$chain" | sed 's/.*\. //;s/)//')
        # Follow the chain one more hop
        next=$(echo "$out" | grep -oP "\($target \. [^)]+\)" | head -1 || true)
        if [ -n "$next" ]; then
          next_target=$(echo "$next" | sed 's/.*\. //;s/)//')
          echo "  [$domain] $atom → $target → $next_target"
        else
          echo "  [$domain] $atom → $target"
        fi
      done <<< "$chains"
    fi
  done
done

echo ""

# Step 5: Format as Meet-n-Greet response
echo "  ─── response ───"
echo ""
first_atom=$(echo "$matched_atoms" | head -1)
echo "  As a response to \"$QUERY\":"
echo ""
for atom in $matched_atoms; do
  # Get the deepest trace chain for this atom
  for f in $(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*.def.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do
    lang=$(head -1 "$f" 2>/dev/null)
    [ "$lang" != "#lang strike" ] && continue
    out=$(timeout 10 racket "$f" 2>/dev/null) || continue
    chain=$(echo "$out" | grep -oP "\($atom \. [^)]+\)" | head -1 || true)
    if [ -n "$chain" ]; then
      target=$(echo "$chain" | sed 's/.*\. //;s/)//')
      source_file=$(basename "$(dirname "$f")")/$(basename "$f" .rkt)
      echo "  As $atom, I contain $target. [source: $source_file]"
      break
    fi
  done
done

echo ""
echo "═══════════════════════════════════════════"
