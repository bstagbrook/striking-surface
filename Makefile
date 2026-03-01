.PHONY: test clean

# documentation.rkt has 3 deliberate CUTs (Discovery 3: three failure modes).
# All other programs must have zero CUTs.
EXPECTED_CUTS_documentation := 3

test:
	@echo "striking surface — test"
	@fail=0; \
	for f in programs/*.rkt; do \
		out=$$(racket "$$f" 2>&1); \
		base=$$(basename "$$f" .rkt); \
		cuts=$$(echo "$$out" | grep -c "CUT" || true); \
		expected=0; \
		if [ "$$base" = "documentation" ]; then expected=$(EXPECTED_CUTS_documentation); fi; \
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
