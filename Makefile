.PHONY: test clean

test:
	@echo "striking surface — test"
	@fail=0; \
	for f in programs/*.rkt; do \
		out=$$(racket "$$f" 2>&1); \
		if echo "$$out" | grep -q "CUT"; then \
			echo "  FAIL $$f"; fail=1; \
			echo "$$out" | grep "CUT"; \
		elif echo "$$out" | grep -q "✗"; then \
			echo "  FAIL $$f"; fail=1; \
			echo "$$out" | grep "✗"; \
		else \
			echo "  ok   $$f"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN"; exit 1; \
	else echo "all circuits complete."; fi

clean:
	find . -name '*.zo' -o -name '*.dep' | xargs rm -f 2>/dev/null || true
