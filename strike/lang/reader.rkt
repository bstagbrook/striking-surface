#lang racket/base

;;; ═══════════════════════════════════════════════════════════════
;;; THE STRIKING SURFACE — READER
;;;
;;; Reads a #lang strike file. The file contains pure
;;; s-expressions. No keywords. No syntax. Just shapes.
;;; The reader wraps them in a module that the expander resolves.
;;; ═══════════════════════════════════════════════════════════════

(require syntax/strip-context)

(provide (rename-out [strike-read read]
                     [strike-read-syntax read-syntax]))

(define (strike-read in)
  (syntax->datum (strike-read-syntax #f in)))

(define (strike-read-syntax src in)
  ;; Read all s-expressions from the file
  (let loop ([exprs '()])
    (let ([expr (read-syntax src in)])
      (if (eof-object? expr)
          (strip-context
           #`(module strike-program strike/main
               #,@(reverse exprs)))
          (loop (cons expr exprs))))))
