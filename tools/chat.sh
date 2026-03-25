#!/usr/bin/env bash
## RIVIR chat — continuous conversation with the body

BODY="/tmp/rivir-body.txt"
ATOMS="/tmp/rivir-atoms.txt"
STOP="a an the is are was were be been being have has had do does did will would shall should may might can could what how why when where who which that this these those of in on at to for with by from and or but not no it its i me my you your we our they them their"

# Pre-strike body if needed
if [ ! -f "$BODY" ]; then
  echo "  striking body..." >&2
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

echo ""
echo "  RIVIR"
echo "  $(wc -l < "$BODY") pairs. $(wc -l < "$ATOMS") atoms."
echo "  type a question. the body speaks. ctrl-c to leave."
echo ""

while true; do
  printf "  you: "
  read -r q || break
  [ -z "$q" ] && continue

  candidates=""
  while IFS= read -r w; do
    [ -z "$w" ] && continue
    echo "$STOP" | tr ' ' '\n' | grep -qx "$w" 2>/dev/null && continue
    stem=$(echo "$w" | sed 's/ies$/y/;s/s$//;s/ing$//;s/ed$//;s/tion$/t/;s/ly$//')
    candidates="$candidates
$w"
    [ "$stem" != "$w" ] && candidates="$candidates
$stem"
  done <<< "$(echo "$q" | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' '\n')"
  candidates=$(echo "$candidates" | grep -v '^$' | sort -u)

  full_atoms=""
  while IFS= read -r word; do
    [ -z "$word" ] && continue
    hits=$(grep -i "$word" "$ATOMS" 2>/dev/null | head -8)
    [ -n "$hits" ] && full_atoms="$full_atoms
$hits"
  done <<< "$candidates"
  full_atoms=$(echo "$full_atoms" | sort -u | grep -v '^$' | head -15)

  if [ -z "$full_atoms" ]; then
    echo ""
    echo "  CUT"
    echo ""
    continue
  fi

  seen=""
  output=""
  while IFS= read -r atom; do
    [ -z "$atom" ] && continue
    current="$atom"
    chain="$current"
    depth=0
    while [ $depth -lt 5 ]; do
      next=$(grep -P "^\($current \. " "$BODY" 2>/dev/null | head -1 | sed 's/^([^ ]* \. //;s/)$//' || true)
      [ -z "$next" ] && break
      echo "$seen" | grep -qF "|$current>$next|" 2>/dev/null && break
      seen="${seen}|$current>$next|"
      chain="$chain → $next"
      current="$next"
      depth=$((depth + 1))
    done
    [ $depth -gt 1 ] && output="$output
$chain"
  done <<< "$full_atoms"

  output=$(echo "$output" | grep -v '^$' | head -8)

  echo ""
  if [ -z "$output" ]; then
    echo "  CUT"
  else
    echo "$output" | while IFS= read -r line; do
      echo "  $line"
    done
  fi
  echo ""
done
