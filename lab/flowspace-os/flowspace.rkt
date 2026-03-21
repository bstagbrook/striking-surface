#lang racket/base

;;; ═══════════════════════════════════════════════════════════════
;;; CONTINUOUS COLLAPSE FLOWSPACE OS — PROTOTYPE
;;;
;;; This IS the substrate for the OS. It uses Racket keywords
;;; because it IS the breadboard. The shapes it renders are pure.
;;;
;;; What it does:
;;; 1. Reads all .rkt files in programs/
;;; 2. Resolves each one (using the strike substrate)
;;; 3. Builds a cross-file label index
;;; 4. Outputs continuous flowing residue
;;; 5. Watches for changes and re-renders
;;;
;;; For now (prototype): no watcher. Just one-shot render of
;;; the entire surface with cross-file connections visible.
;;; ═══════════════════════════════════════════════════════════════

(require racket/list racket/string racket/file racket/port
         strike/main)

;;; ─── Read all programs ─────────────────────────────────────

(define (read-all-programs dir)
  (let ([files (sort (filter (λ (f) (regexp-match #rx"\\.rkt$" (path->string f)))
                             (directory-list dir #:build? #t))
                     string<? #:key path->string)])
    (map (λ (f)
           (let ([content (with-input-from-file f
                            (λ ()
                              (read-line) ;; skip #lang strike
                              (let loop ([exprs '()])
                                (let ([e (read)])
                                  (if (eof-object? e)
                                      (reverse exprs)
                                      (loop (cons e exprs)))))))])
             (cons (path->string f) content)))
         files)))

;;; ─── Resolve and collect labels ────────────────────────────

(define (extract-labels sexp)
  (cond
    [(symbol? sexp) (list (symbol->string sexp))]
    [(pair? sexp) (append (extract-labels (car sexp))
                          (extract-labels (cdr sexp)))]
    [else '()]))

;;; ─── Render the surface ────────────────────────────────────

(define (render-surface)
  (displayln "╔═══════════════════════════════════════════════════════╗")
  (displayln "║     CONTINUOUS COLLAPSE FLOWSPACE — SURFACE STATE    ║")
  (displayln "╚═══════════════════════════════════════════════════════╝")
  (displayln "")

  (let* ([programs (read-all-programs "programs")]
         [all-labels (make-hash)]
         [resolved-count 0]
         [total-pairs 0])

    ;; Resolve each program and collect labels
    (for-each
     (λ (prog)
       (let ([file (car prog)]
             [exprs (cdr prog)])
         (displayln (format "── ~a ──" (let ([p (string-split file "/")])
                                          (last p))))
         (for-each
          (λ (expr)
            (let ([result (quantum-resolve expr)])
              (set! resolved-count (+ resolved-count 1))
              ;; Count pairs in result
              (let ([pairs (extract-labels result)])
                (set! total-pairs (+ total-pairs (length pairs)))
                ;; Index labels to files
                (for-each
                 (λ (label)
                   (hash-update! all-labels label
                                 (λ (files) (if (member file files) files (cons file files)))
                                 (list file)))
                 pairs))
              ;; Print condensed result
              (let ([s (format "~a" result)])
                (displayln (if (> (string-length s) 120)
                               (string-append (substring s 0 117) "...")
                               s)))))
          exprs)
         (displayln "")))
     programs)

    ;; Cross-file connections
    (displayln "╔═══════════════════════════════════════════════════════╗")
    (displayln "║            CROSS-FILE CONNECTIONS                    ║")
    (displayln "╚═══════════════════════════════════════════════════════╝")
    (displayln "")

    (let ([connections 0])
      (hash-for-each
       all-labels
       (λ (label files)
         (when (> (length files) 1)
           (set! connections (+ connections 1))
           (displayln (format "  ~a → ~a files" label (length files))))))

      (displayln "")
      (displayln "╔═══════════════════════════════════════════════════════╗")
      (displayln "║                  SURFACE METRICS                     ║")
      (displayln "╚═══════════════════════════════════════════════════════╝")
      (displayln "")
      (displayln (format "  Programs:         ~a" (length programs)))
      (displayln (format "  Strike tables:    ~a" resolved-count))
      (displayln (format "  Total labels:     ~a" total-pairs))
      (displayln (format "  Cross-file wires: ~a" connections))
      (displayln (format "  Unique labels:    ~a" (hash-count all-labels)))
      (displayln ""))))

(render-surface)
