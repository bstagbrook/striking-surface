.PHONY: test lint audit clean

# Time budget per program (seconds). Anything slower is a CUT.
TIME_BUDGET := 30

# Lint: #lang strike programs must contain ZERO Racket keywords.
RACKET_KEYWORDS := define\|let\|let\*\|cond\|if\|lambda\|λ\|require\|provide\|begin\|set!\|for\|while\|do\b

lint:
	@echo "striking surface — lint"
	@fail=0; \
	for f in programs/*.rkt; do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then \
			echo "  FAIL $$f — not #lang strike (got: $$lang)"; fail=1; \
			continue; \
		fi; \
		hits=$$(grep -nE '\($(RACKET_KEYWORDS)' "$$f" | grep -v '^;' | grep -v '^[0-9]*:;' || true); \
		if [ -n "$$hits" ]; then \
			echo "  FAIL $$f — Racket keywords detected:"; \
			echo "$$hits" | while read line; do echo "    $$line"; done; \
			fail=1; \
		else \
			echo "  ok   $$f"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN — keywords or wrong #lang detected"; exit 1; \
	else echo "no keywords. pure s-expressions."; fi

# Audit: check for empty vacuum tubes (dead circuits).
# Programs may declare ;;; expected-empty-tubes: N to allow intentional empties.
# Default: 0 empty tubes allowed.
audit:
	@echo ""
	@echo "striking surface — audit (empty tube check)"
	@fail=0; \
	for f in programs/*.rkt; do \
		out=$$(timeout $(TIME_BUDGET) racket "$$f" 2>&1); \
		rc=$$?; \
		if [ $$rc -ne 0 ]; then continue; fi; \
		empties=$$(echo "$$out" | grep -oP ' \(\)\)' | wc -l); \
		expected=$$(grep -oP 'expected-empty-tubes:\s*\K[0-9]+' "$$f" || echo 0); \
		if [ "$$empties" -gt "$$expected" ]; then \
			echo "  WARN $$f — $$empties empty tubes (expected $$expected)"; \
			fail=1; \
		else \
			echo "  ok   $$f"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "DEAD CIRCUITS — empty tubes found"; exit 1; \
	else echo "all tubes full."; fi

test: lint audit
	@echo ""
	@echo "striking surface — test"
	@fail=0; \
	for f in programs/*.rkt; do \
		out=$$(timeout $(TIME_BUDGET) racket "$$f" 2>&1); \
		rc=$$?; \
		if [ $$rc -eq 124 ]; then \
			echo "  FAIL $$f (exceeded $(TIME_BUDGET)s time budget)"; fail=1; \
			continue; \
		fi; \
		if [ $$rc -ne 0 ]; then \
			echo "  FAIL $$f (exit code $$rc)"; fail=1; \
			continue; \
		fi; \
		echo "  ok   $$f"; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN"; exit 1; \
	else echo "all circuits complete."; fi

clean:
	find . -name '*.zo' -o -name '*.dep' | xargs rm -f 2>/dev/null || true
