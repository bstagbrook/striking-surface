.PHONY: test lint clean

# Time budget per program (seconds). Anything slower is a CUT.
TIME_BUDGET := 30

# Forbidden constructs — no iteration, no mutation.
FORBIDDEN := for-each\|for/list\|for/fold\|for\b\|while\|do\b\|set!

lint:
	@echo "striking surface — lint"
	@fail=0; \
	for f in programs/*.rkt; do \
		hits=$$(grep -nE '^\s*\(($(FORBIDDEN))' "$$f" | grep -v '^;' || true); \
		if [ -n "$$hits" ]; then \
			echo "  FAIL $$f — forbidden constructs:"; \
			echo "$$hits" | while read line; do echo "    $$line"; done; \
			fail=1; \
		else \
			echo "  ok   $$f"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN — iteration or mutation detected"; exit 1; \
	else echo "no forbidden constructs."; fi

test: lint
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
		cuts=$$(echo "$$out" | grep -c '^  CUT$$' || true); \
		expected=$$(grep -oP 'expected-cuts:\s*\K[0-9]+' "$$f" || echo 0); \
		if [ "$$cuts" -ne "$$expected" ]; then \
			echo "  FAIL $$f ($$cuts CUTs, expected $$expected)"; fail=1; \
		else \
			echo "  ok   $$f"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN"; exit 1; \
	else echo "all circuits complete."; fi

clean:
	find . -name '*.zo' -o -name '*.dep' | xargs rm -f 2>/dev/null || true
