#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: [name]
;;; LAYER: [number and name, e.g., "01-particles"]
;;; DEPENDS ON: [which domain files this builds upon]
;;; DEPENDED ON BY: [which domain files build upon this]
;;;
;;; PURPOSE: [one sentence — what aspect of reality this models]
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES: Every factual claim cites a specific source.
;;; Acceptable source types:
;;;   - Authoritative database with version (e.g., PDG 2024)
;;;   - Peer-reviewed paper with DOI or PMID
;;;   - Textbook with edition and page (e.g., Lehninger 8th ed. p.75)
;;;   - Named measurement with uncertainty
;;; "Standard reference" is NOT acceptable. Name it.
;;;
;;; UNITS: Stated explicitly. No ambiguous values.
;;;
;;; CALIBRATION: Paired with [filename].cal.rkt which checks
;;; every numerical value and structural claim against sources.
;;; ═══════════════════════════════════════════════════════════════

;;; (domain strike table here)
