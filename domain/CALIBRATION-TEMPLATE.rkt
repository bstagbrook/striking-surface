#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CALIBRATION: [domain file being calibrated]
;;; LAYER: [number and name]
;;;
;;; PURPOSE: Verify every claim in the paired domain file.
;;;
;;; STRUCTURE: Each calibration entry is a transformation:
;;;   (check-[name]
;;;     (claim-from-domain-file)      ;;; what we registered
;;;     (authoritative-value)         ;;; what the source says
;;;     ((source . [specific citation])
;;;      (retrieved . [date])
;;;      (claim . [our value])
;;;      (reference . [source value])
;;;      (status . [CONFIRMED or DISCREPANCY or NEEDS-UPDATE])))
;;;
;;; STATUS VALUES:
;;;   CONFIRMED    — our value matches the source within stated uncertainty
;;;   DISCREPANCY  — our value differs from the source; domain file needs update
;;;   NEEDS-UPDATE — source has been superseded; newer data available
;;;   UNCHECKED    — not yet verified against primary source
;;;
;;; PROCESS:
;;;   1. For each fact in the domain file, create a check entry
;;;   2. Look up the primary source (not Wikipedia, not memory)
;;;   3. Record exactly what the source says
;;;   4. Compare to what we registered
;;;   5. Mark status
;;;   6. If DISCREPANCY: fix the domain file, re-run calibration
;;;
;;; A domain file is NOT TRUSTED until all calibration entries
;;; are CONFIRMED.
;;; ═══════════════════════════════════════════════════════════════

;;; (calibration entries here)
