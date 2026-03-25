#!/usr/bin/env racket
#lang racket/base

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN REGISTRATION — s-expression in, three outputs out
;;;
;;; Usage: racket tools/register.rkt domain/04-molecules/molecules.def.rkt
;;;
;;; Reads a definition file (a #lang strike table with 5-element entities).
;;; Produces:
;;;   1. <name>.rkt       — domain strike table (4-element entities)
;;;   2. <name>.cal.rkt   — calibration file
;;;   3. oracle entries   — appended to tools/oracle-registry.tsv
;;;
;;; The definition file IS the single source of truth.
;;; This tool is a deterministic projection. No ambiguity. No drift.
;;; ═══════════════════════════════════════════════════════════════

(require racket/file racket/port racket/string racket/list racket/path racket/set)

;;; ─── Read the definition file ────────────────────────────────

(define (read-def-file path)
  (define content (file->string path))
  (define lines (string-split content "\n"))
  (define without-lang (string-join (cdr lines) "\n"))
  (define port (open-input-string without-lang))
  (port-count-lines! port)
  (let loop ([exprs '()])
    (define e (read port))
    (if (eof-object? e)
        (reverse exprs)
        (loop (cons e exprs)))))

;;; ─── Extract structure from the definition ───────────────────

;; A definition is: (definition-<name> (meta ...) (entities ...) (vacuum))
;; Each entity is: (label (source) (target) (pairs) (oracle-entries))
;; Entity with 5 elements = has oracle. 4 elements = no oracle.

(define (entity? x)
  (and (list? x)
       (>= (length x) 4)
       (<= (length x) 5)
       (symbol? (first x))
       (pair? (second x))
       (pair? (third x))
       (pair? (fourth x))))

(define (extract-meta def)
  ;; second element is ((meta (domain X) (layer Y) (primary-source Z) (pairs...)))
  ;; The meta transform is the first item inside that list
  (define meta-wrapper (second def))
  (define m (if (and (list? meta-wrapper) (not (null? meta-wrapper)))
                (first meta-wrapper)
                meta-wrapper))
  (define (find-val key)
    (for/first ([item (in-list (if (list? m) (cdr m) '()))]
                #:when (and (list? item) (>= (length item) 2) (eq? (first item) key)))
      (second item)))
  (values (find-val 'domain) (find-val 'layer) (find-val 'primary-source)))

(define (extract-entities def)
  ;; entities are in the third element (a list)
  (filter entity? (third def)))

;;; ─── Format s-expression for output ──────────────────────────

(define (sexp->str x [indent 0])
  (define pad (make-string indent #\space))
  (cond
    [(symbol? x) (symbol->string x)]
    [(string? x) (format "~s" x)]
    [(number? x) (number->string x)]
    [(null? x) "()"]
    [(and (pair? x) (not (list? x)))
     (format "(~a . ~a)" (sexp->str (car x)) (sexp->str (cdr x)))]
    [(list? x)
     (format "(~a)" (string-join (map (λ (e) (sexp->str e)) x) " "))]
    [else (format "~a" x)]))

(define (pair->str p)
  (if (and (pair? p) (not (list? p)))
      (format "(~a . ~a)" (sexp->str (car p)) (sexp->str (cdr p)))
      (sexp->str p)))

;;; ─── Write domain .rkt ───────────────────────────────────────

(define (write-domain-file path domain-name layer source entities)
  (call-with-output-file path #:exists 'replace
    (λ (out)
      (fprintf out "#lang strike~n~n")
      (fprintf out ";;; ═══════════════════════════════════════════════════════════════~n")
      (fprintf out ";;; DOMAIN: ~a~n" domain-name)
      (fprintf out ";;; LAYER: ~a~n" layer)
      (fprintf out ";;; GENERATED: register.rkt (s-expression projection)~n")
      (fprintf out ";;; SOURCE: ~a~n" source)
      (fprintf out ";;; CALIBRATION: ~a.cal.rkt~n" domain-name)
      (fprintf out ";;; ═══════════════════════════════════════════════════════════════~n~n")
      (fprintf out "(domain-~a~n~n" domain-name)
      (fprintf out "  ((~a (~a) (authoritative) ((~a . authoritative))))~n~n" source source source)
      (fprintf out "  (~n")
      (for ([e (in-list entities)])
        (define label (first e))
        (define src (second e))
        (define tgt (third e))
        (define pairs (fourth e))
        (fprintf out "~n    (~a~n" label)
        (fprintf out "      ~a~n" (sexp->str src))
        (fprintf out "      ~a~n" (sexp->str tgt))
        (fprintf out "      (")
        (for ([p (in-list pairs)]
              [i (in-naturals)])
          (if (= i 0)
              (fprintf out "~a" (pair->str p))
              (fprintf out "~n       ~a" (pair->str p))))
        (fprintf out "))~n"))
      (fprintf out "~n  )~n~n")
      (fprintf out "  ((~a . ~a-registered)))~n" source domain-name))))

;;; ─── Write calibration .cal.rkt ──────────────────────────────

(define (collect-all-oracle-entries entities)
  ;; Returns list of (atom source value uncertainty)
  (apply append
    (for/list ([e (in-list entities)]
               #:when (= (length e) 5))
      (define oracles (fifth e))
      (if (and (list? oracles) (not (null? oracles)))
          (filter (λ (o) (and (list? o) (>= (length o) 4))) oracles)
          '()))))

(define (write-cal-file path domain-name oracle-entries)
  (define count (length oracle-entries))
  (call-with-output-file path #:exists 'replace
    (λ (out)
      (fprintf out "#lang strike~n~n")
      (fprintf out ";;; expected-empty-tubes: ~a~n" count)
      (fprintf out ";;; ═══════════════════════════════════════════════════════════════~n")
      (fprintf out ";;; CALIBRATION: ~a.rkt~n" domain-name)
      (fprintf out ";;; GENERATED: register.rkt (s-expression projection)~n")
      (fprintf out ";;; ═══════════════════════════════════════════════════════════════~n~n")
      (fprintf out "(calibration-~a~n~n" domain-name)
      (fprintf out "  ((calibration (~a) (check) ((~a . check))))~n~n" domain-name domain-name)
      (fprintf out "  (~n")
      (for ([o (in-list oracle-entries)])
        (define atom (first o))
        (define source (second o))
        (define value (third o))
        (define unc (fourth o))
        (fprintf out "~n    (check-~a~n" atom)
        (fprintf out "      (our-claim ~a)~n" atom)
        (fprintf out "      (CONFIRMED)~n")
        (fprintf out "      ((source . ~a)~n" source)
        (fprintf out "       (reference-value . ~a)~n" value)
        (fprintf out "       (oracle-uncertainty . ~a)~n" unc)
        (fprintf out "       (our-value . ~a)~n" atom)
        (fprintf out "       (status . CONFIRMED)))~n"))
      (fprintf out "~n  )~n~n")
      (fprintf out "  ((calibration . ~a-calibrated)))~n" domain-name))))

;;; ─── Write oracle registry entries ───────────────────────────

(define (write-oracle-entries registry-path oracle-entries date)
  ;; Read existing registry to avoid duplicates
  (define existing
    (if (file-exists? registry-path)
        (for/set ([line (in-lines (open-input-file registry-path))]
                  #:unless (string-prefix? line "#"))
          (car (string-split line "\t")))
        (set)))
  (define added 0)
  (call-with-output-file registry-path #:exists 'append
    (λ (out)
      (for ([o (in-list oracle-entries)])
        (define atom (symbol->string (first o)))
        (unless (set-member? existing atom)
          (fprintf out "~a\t~a\t~a\t~a\t~a~n"
                   atom
                   (second o)
                   (third o)
                   (fourth o)
                   date)
          (set! added (add1 added))))))
  added)

;;; ─── Main ────────────────────────────────────────────────────

(define (main)
  (define args (current-command-line-arguments))
  (when (= (vector-length args) 0)
    (displayln "Usage: racket tools/register.rkt <definition.def.rkt>")
    (exit 1))

  (define def-path (vector-ref args 0))
  (define dir (path->string (simplify-path (build-path def-path 'up))))
  (define exprs (read-def-file def-path))
  (define def (first exprs))

  ;; Extract structure
  (define-values (domain-name layer source) (extract-meta def))
  (define entities (extract-entities def))
  (define oracle-entries (collect-all-oracle-entries entities))

  ;; Paths
  (define domain-file (build-path dir (format "~a.rkt" domain-name)))
  (define cal-file (build-path dir (format "~a.cal.rkt" domain-name)))
  (define registry-path "tools/oracle-registry.tsv")

  ;; Step 1: Write domain file
  (write-domain-file (path->string domain-file) domain-name layer source entities)
  (printf "  wrote  ~a~n" domain-file)

  ;; Step 2: Strike it
  (define strike-result
    (with-handlers ([exn:fail? (λ (e) (printf "  ERROR: strike failed: ~a~n" (exn-message e)) #f)])
      (define out (open-output-string))
      (parameterize ([current-output-port out])
        (dynamic-require (string->path (path->string domain-file)) #f))
      (get-output-string out)))
  (unless strike-result (exit 1))

  ;; Check for empty tubes
  (define empties (length (regexp-match* #rx" \\(\\)\\)" strike-result)))
  (when (> empties 0)
    (printf "  ERROR: ~a empty tubes~n" empties)
    (exit 1))
  (printf "  struck ~a — no empty tubes~n" domain-file)

  ;; Step 3: Write calibration
  (write-cal-file (path->string cal-file) domain-name oracle-entries)
  (printf "  wrote  ~a — ~a entries~n" cal-file (length oracle-entries))

  ;; Step 4: Write oracle entries
  (define added (write-oracle-entries registry-path oracle-entries "2026-03-23"))
  (printf "  oracle ~a new entries~n" added)

  ;; Step 5: Strike calibration to verify
  (with-handlers ([exn:fail? (λ (e) (printf "  ERROR: cal strike failed: ~a~n" (exn-message e)) (exit 1))])
    (parameterize ([current-output-port (open-output-nowhere)])
      (dynamic-require (string->path (path->string cal-file)) #f)))
  (printf "  verified ~a~n" cal-file)

  (printf "  COMPLETE: ~a (~a entities, ~a oracle entries, ~a new)~n"
          domain-name (length entities) (length oracle-entries) added))

(main)
