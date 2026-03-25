.PHONY: test lint audit clean domain calibrate coverage oracle research all cross-check invariants

# Time budget per program (seconds). Anything slower is a CUT.
TIME_BUDGET := 30

# Lint: #lang strike programs must contain ZERO Racket keywords.
RACKET_KEYWORDS := define\|let\|let\*\|cond\|if\|lambda\|λ\|require\|provide\|begin\|set!\|for\|while\|do\b

# ═══════════════════════════════════════════════════════════════
# LINT — pure s-expressions, zero Racket keywords
# Applies to: programs/, domain/, research/
# ═══════════════════════════════════════════════════════════════

lint:
	@echo "striking surface — lint"
	@fail=0; \
	for f in $$(find programs domain research -name '*.rkt' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then \
			echo "  SKIP $$f — not #lang strike"; \
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

# ═══════════════════════════════════════════════════════════════
# AUDIT — no empty vacuum tubes (dead circuits)
# Applies to: programs/, domain/, research/
# ═══════════════════════════════════════════════════════════════

audit:
	@echo ""
	@echo "striking surface — audit (empty tube check)"
	@fail=0; \
	for f in $$(find programs domain research -name '*.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then continue; fi; \
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

# ═══════════════════════════════════════════════════════════════
# TEST — all strike tables must execute without error
# Applies to: programs/
# ═══════════════════════════════════════════════════════════════

test: lint audit
	@echo ""
	@echo "striking surface — test (programs)"
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

# ═══════════════════════════════════════════════════════════════
# INVARIANTS — structural invariants must hold, no empty tubes
# Strikes honesty-checks.rkt and cross-check.rkt.
# Fails if any empty tubes found in either.
# ═══════════════════════════════════════════════════════════════

invariants:
	@echo ""
	@echo "striking surface — invariants"
	@fail=0; \
	for f in domain/00-invariants/honesty-checks.rkt domain/00-invariants/cross-check.rkt; do \
		bn=$$(basename "$$f"); \
		out=$$(timeout $(TIME_BUDGET) racket "$$f" 2>&1); \
		rc=$$?; \
		if [ $$rc -ne 0 ]; then \
			echo "  FAIL $$bn (exit code $$rc)"; fail=1; \
			continue; \
		fi; \
		empties=$$(echo "$$out" | grep -oP ' \(\)\)' | wc -l); \
		if [ "$$empties" -gt 0 ]; then \
			echo "  FAIL $$bn — $$empties empty tubes"; fail=1; \
		else \
			echo "  ok   $$bn — no empty tubes"; \
		fi; \
	done; \
	if [ $$fail -eq 1 ]; then echo "INVARIANT VIOLATION — empty tubes in invariant files"; exit 1; \
	else echo "all invariants hold."; fi

# ═══════════════════════════════════════════════════════════════
# DOMAIN — all domain model tables must execute without error
# ═══════════════════════════════════════════════════════════════

domain:
	@echo ""
	@echo "striking surface — domain model"
	@fail=0; \
	count=0; \
	for f in $$(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then continue; fi; \
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
		count=$$((count + 1)); \
	done; \
	echo "  $$count domain tables verified."; \
	if [ $$fail -eq 1 ]; then echo "BROKEN — domain model has failures"; exit 1; \
	else echo "domain model intact."; fi

# ═══════════════════════════════════════════════════════════════
# CALIBRATE — all calibration labs must execute without error
# AND must contain no DISCREPANCY or UNCHECKED status entries
# ═══════════════════════════════════════════════════════════════

calibrate:
	@echo ""
	@echo "striking surface — calibration"
	@fail=0; \
	confirmed=0; \
	unchecked=0; \
	discrepancies=0; \
	for f in $$(find domain -name '*.cal.rkt' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then continue; fi; \
		out=$$(timeout $(TIME_BUDGET) racket "$$f" 2>&1); \
		rc=$$?; \
		if [ $$rc -ne 0 ]; then \
			echo "  FAIL $$f (exit code $$rc)"; fail=1; \
			continue; \
		fi; \
		c=$$(echo "$$out" | grep -o 'CONFIRMED' | wc -l); \
		u=$$(echo "$$out" | grep -o 'UNCHECKED' | wc -l); \
		d=$$(echo "$$out" | grep -o 'DISCREPANCY' | wc -l); \
		confirmed=$$((confirmed + c)); \
		unchecked=$$((unchecked + u)); \
		discrepancies=$$((discrepancies + d)); \
		if [ "$$d" -gt 0 ]; then \
			echo "  DISC $$f — $$d discrepancies"; fail=1; \
		elif [ "$$u" -gt 0 ]; then \
			echo "  UNCH $$f — $$u unchecked"; \
		else \
			echo "  ok   $$f — $$c confirmed"; \
		fi; \
	done; \
	echo "  confirmed: $$confirmed  unchecked: $$unchecked  discrepancies: $$discrepancies"; \
	if [ $$fail -eq 1 ]; then echo "CALIBRATION FAILURES — discrepancies found"; exit 1; \
	elif [ $$unchecked -gt 0 ]; then echo "CALIBRATION INCOMPLETE — unchecked entries remain"; \
	else echo "fully calibrated."; fi

# ═══════════════════════════════════════════════════════════════
# RESEARCH — all research tables must execute without error
# ═══════════════════════════════════════════════════════════════

research:
	@echo ""
	@echo "striking surface — research"
	@fail=0; \
	for f in $$(find research -name '*.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then continue; fi; \
		out=$$(timeout $(TIME_BUDGET) racket "$$f" 2>&1); \
		rc=$$?; \
		if [ $$rc -ne 0 ]; then \
			echo "  FAIL $$f (exit code $$rc)"; fail=1; \
			continue; \
		fi; \
		echo "  ok   $$f"; \
	done; \
	if [ $$fail -eq 1 ]; then echo "BROKEN — research has failures"; exit 1; \
	else echo "all research circuits complete."; fi

# ═══════════════════════════════════════════════════════════════
# COVERAGE — every measurement in a domain file must appear
# in its paired calibration file. No uncalibrated values.
# ═══════════════════════════════════════════════════════════════

coverage:
	@bash tools/coverage.sh domain $(TIME_BUDGET)

# ═══════════════════════════════════════════════════════════════
# ORACLE — independent auto-calibration against oracle registry
# No human in the loop. Oracle says CONFIRMED or it doesn't.
# ═══════════════════════════════════════════════════════════════

oracle:
	@echo ""
	@echo "striking surface — oracle verification"
	@fail=0; \
	confirmed=0; \
	discrepancies=0; \
	unregistered=0; \
	for f in $$(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*TEMPLATE*' ! -path '*/00-invariants/*' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" != "#lang strike" ]; then continue; fi; \
		result=$$(bash tools/auto-calibrate.sh "$$f" 2>/dev/null | grep 'SUMMARY' || echo "SUMMARY: error"); \
		c=$$(echo "$$result" | grep -oP 'confirmed=\K[0-9]+' || echo 0); \
		d=$$(echo "$$result" | grep -oP 'discrepancy=\K[0-9]+' || echo 0); \
		u=$$(echo "$$result" | grep -oP 'unregistered=\K[0-9]+' || echo 0); \
		confirmed=$$((confirmed + c)); \
		discrepancies=$$((discrepancies + d)); \
		unregistered=$$((unregistered + u)); \
		bn=$$(basename "$$f"); \
		if [ "$$d" -gt 0 ]; then \
			echo "  DISC $$bn — $$d discrepancies"; fail=1; \
		elif [ "$$u" -gt 0 ]; then \
			echo "  UNCH $$bn — $$u unregistered"; \
		else \
			echo "  ok   $$bn — $$c oracle-confirmed"; \
		fi; \
	done; \
	echo "  oracle-confirmed: $$confirmed  discrepancies: $$discrepancies  unregistered: $$unregistered"; \
	if [ $$fail -eq 1 ]; then echo "ORACLE FAILURE — discrepancies with independent sources"; exit 1; \
	elif [ $$unregistered -gt 0 ]; then echo "ORACLE INCOMPLETE — unregistered measurements"; exit 1; \
	else echo "oracle verification complete."; fi

# ═══════════════════════════════════════════════════════════════
# CROSS-CHECK — cross-domain consistency (label collisions,
# measurement conflicts across all domain files)
# ═══════════════════════════════════════════════════════════════

cross-check:
	@for f in $$(find domain -name '*.rkt' ! -name '*.cal.rkt' ! -name '*TEMPLATE*' 2>/dev/null | sort); do \
		lang=$$(head -1 "$$f"); \
		if [ "$$lang" = "#lang strike" ]; then \
			timeout $(TIME_BUDGET) racket "$$f" 2>/dev/null; \
		fi; \
	done | bash tools/cross-check.sh

# ═══════════════════════════════════════════════════════════════
# ALL — the full build: programs + domain + calibration + research + cross-check
# This is the international inspection target.
# ═══════════════════════════════════════════════════════════════

all: test invariants domain calibrate coverage oracle research cross-check
	@echo ""
	@echo "═══════════════════════════════════════════"
	@echo "  STRIKING SURFACE — ALL SYSTEMS VERIFIED"
	@echo "═══════════════════════════════════════════"

clean:
	find . -name '*.zo' -o -name '*.dep' | xargs rm -f 2>/dev/null || true
