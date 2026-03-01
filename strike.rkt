#lang racket

;;; ===========================================================
;;; THE STRIKING SURFACE — CLOCKLESS
;;;
;;; No loops. No clock. No iteration. No mutation.
;;; The program is a Dyck word. The shape IS the computation.
;;; Strike = complete this circuit.
;;;
;;; One breadboard. One striking surface. One grounded frame.
;;; ===========================================================

(provide surface
         ground presence transform contain disclose recognize
         wf:hadamard wf:collapse wf:entangle wf:interfere
         wf:ring wf:teleport wf:nand
         wf:factor wf:decompose wf:sum
         ->str)


;;; -----------------------------------------------------------
;;; UTILITY — structural, no mutation
;;; -----------------------------------------------------------

(define (->str v)
  (cond
    [(string? v) v]
    [(number? v) (number->string v)]
    [(symbol? v) (symbol->string v)]
    [else (~a v)]))

(define (last-pair lst)
  (match lst
    [(list x) x]
    [(cons _ rest) (last-pair rest)]))


;;; -----------------------------------------------------------
;;; CONSTITUTION — predicates on residue shape
;;; These ARE properties of the shape. Not checks. Not steps.
;;; -----------------------------------------------------------

(define (chain? residue)
  (match residue
    ['() #t]
    [(list _) #t]
    [(cons (cons _ b) (and rest (cons (cons c _) _)))
     (and (equal? b c) (chain? rest))]))

(define (grounded? source residue)
  (match residue
    ['() #t]
    [(cons (cons s _) _) (equal? (->str s) (->str source))]))

(define (complete? target residue)
  (or (member (->str target) '("ground" "e"))
      (match residue
        ['() #t]
        [_ (equal? (->str (cdr (last-pair residue))) (->str target))])))

(define (balanced? residue)
  (match residue
    ['() #t]
    [(cons (cons a b) rest)
     (and (not (equal? (->str a) (->str b)))
          (balanced? rest))]))

(define (minimal? residue)
  (let ([starts (map (λ (r) (->str (car r))) residue)])
    (= (length starts)
       (length (remove-duplicates starts)))))

(define (constitutional? source target residue)
  (and (chain? residue)
       (grounded? source residue)
       (complete? target residue)
       (balanced? residue)
       (minimal? residue)))

(define (constitution-status source target residue)
  (string-append
   "chain"    (if (chain? residue) "✓" "✗") " "
   "grounded" (if (grounded? source residue) "✓" "✗") " "
   "complete" (if (complete? target residue) "✓" "✗") " "
   "balanced" (if (balanced? residue) "✓" "✗") " "
   "minimal"  (if (minimal? residue) "✓" "✗")))


;;; -----------------------------------------------------------
;;; WAVEFORMS — pure functions
;;; (string, string) → (listof (cons string string))
;;; No side effects. No I/O. Shape in, residue out.
;;; -----------------------------------------------------------

(define sqrt2-str
  (real->decimal-string (/ 1.0 (sqrt 2.0)) 4))

;; Hadamard gate — superposition
(define (wf:hadamard source target)
  (match (->str source)
    [(or "0" "|0>")
     (list (cons (->str source)
                 (string-append sqrt2-str "|0>+" sqrt2-str "|1>")))]
    [(or "1" "|1>")
     (list (cons (->str source)
                 (string-append sqrt2-str "|0>-" sqrt2-str "|1>")))]
    [s (list (cons s (string-append "superposition(" s ")")))]))

;; Collapse — measurement, Born rule
;; The ONE source of non-determinism in the machine.
(define (wf:collapse source target)
  (let ([s (->str source)])
    (cond
      [(and (string-contains? s "|0>") (string-contains? s "|1>"))
       (let* ([parts (string-split (string-replace (string-replace s "+" " ") "-" " -"))]
              [amp0 (extract-amplitude parts "|0>")]
              [outcome (if (< (random) (* amp0 amp0)) "|0>" "|1>")])
         (list (cons s outcome)))]
      [else (list (cons s s))])))

(define (extract-amplitude parts ket)
  (match parts
    ['() 0.0]
    [(cons p rest)
     (if (string-contains? p ket)
         (let ([num-str (string-replace p ket "")])
           (string->number (string-trim num-str)))
         (extract-amplitude rest ket))]))

;; Entanglement — Bell pair
(define (wf:entangle source target)
  (let ([a (->str source)] [b (->str target)])
    (cond
      [(and (member a '("0" "|0>"))
            (member b '("0" "|0>" "ground" "e")))
       (list (cons a (string-append "H(" a ")x" b))
             (cons (string-append "H(" a ")x" b)
                   (string-append sqrt2-str "|00>+" sqrt2-str "|11>")))]
      [else (list (cons a (string-append "bell(" a "," b ")")))])))

;; Interference — constructive / destructive / identity
(define (wf:interfere source target)
  (match (->str source)
    ["constructive"
     (list (cons "constructive"
                 (string-append sqrt2-str "|x>+" sqrt2-str "|x>"))
           (cons (string-append sqrt2-str "|x>+" sqrt2-str "|x>")
                 "1.0000|x>"))]
    ["destructive"
     (list (cons "destructive"
                 (string-append sqrt2-str "|x>-" sqrt2-str "|x>"))
           (cons (string-append sqrt2-str "|x>-" sqrt2-str "|x>")
                 "0.0000|x>"))]
    ["HH"
     (list (cons "HH"
                 (string-append sqrt2-str "|0>+" sqrt2-str "|1>"))
           (cons (string-append sqrt2-str "|0>+" sqrt2-str "|1>")
                 "|0>"))]
    [s (list (cons s (string-append "interfere(" s ")")))]))

;; Ring — be → have → do → be (structural recursion on the cycle)
(define (wf:ring source target)
  (define cycle '("be" "have" "do"))
  (define (step current n)
    (match n
      [0 '()]
      [_ (let* ([idx (or (index-of cycle current) 0)]
                [nxt (list-ref cycle (modulo (add1 idx) 3))])
           (cons (cons current nxt)
                 (step nxt (sub1 n))))]))
  (step (->str source) 3))

;; Teleportation — protocol steps
(define (wf:teleport source target)
  (let ([s (->str source)])
    (list (cons s (string-append "bell_pair+" s))
          (cons (string-append "bell_pair+" s) "alice_measures")
          (cons "alice_measures" "classical_bits(2)")
          (cons "classical_bits(2)" "bob_corrects")
          (cons "bob_corrects" (string-append "bob(" s ")")))))

;; NAND — universal classical gate
(define (wf:nand source target)
  (let* ([s (->str source)]
         [bits (string-split s ",")]
         [a (string->number (first bits))]
         [b (string->number (second bits))]
         [result (if (and (= a 1) (= b 1)) 0 1)])
    (list (cons s (->str result)))))

;; Factor — prime factorization (structural recursion on value)
(define (wf:factor source target)
  (let ([n (string->number (->str source))])
    (if (or (not n) (< n 2))
        (list (cons (->str source) (->str source)))
        (factor-from n 2))))

(define (factor-from current d)
  (cond
    [(> (* d d) current) '()]
    [(= (modulo current d) 0)
     (let ([nxt (quotient current d)])
       (cons (cons (->str current) (->str nxt))
             (factor-from nxt d)))]
    [else (factor-from current (add1 d))]))

;; Decompose — string to ground (structural recursion on string shape)
(define (wf:decompose source target)
  (let ([s (->str source)])
    (decompose-from s)))

(define (decompose-from current)
  (cond
    [(= (string-length current) 0) '()]
    [(= (string-length current) 1)
     (list (cons current "e"))]
    [else
     (let ([nxt (substring current 0 (sub1 (string-length current)))])
       (cons (cons current nxt)
             (decompose-from nxt)))]))

;; Sum — Gauss summation (structural recursion on the number)
(define (wf:sum source target)
  (let ([n (string->number (->str source))])
    (if (or (not n) (< n 2))
        '()
        (build-sum n n (sub1 n)))))

(define (build-sum current total remaining)
  (cond
    [(<= remaining 0) '()]
    [else
     (let ([nxt (+ total remaining)])
       (cons (cons (->str current) (->str nxt))
             (build-sum nxt nxt (sub1 remaining))))]))


;;; -----------------------------------------------------------
;;; SHAPE PRIMITIVES — these construct the Dyck word
;;; -----------------------------------------------------------

(define (ground) '(ground))

(define (presence name value)
  (list 'presence name (->str value)))

(define (transform name source-shape target-shape waveform)
  (list 'transform name source-shape target-shape waveform))

(define (contain name . children)
  (list* 'contain name children))

(define (disclose name)
  (list 'disclose name))

(define (recognize name)
  (list 'recognize name))


;;; -----------------------------------------------------------
;;; THE SURFACE — structural resolution
;;; No loops. No clock. match follows shape. map applies to all.
;;; -----------------------------------------------------------

;; Extract the value from a resolved shape
(define (shape-value shape)
  (match shape
    [(list 'ground) "e"]
    [(list 'presence _ v) v]
    [(list 'resolved _ _ _ residue _)
     (if (null? residue) "e"
         (->str (cdr (last-pair residue))))]
    [_ (->str shape)]))

;; Resolve a single shape — structural dispatch
(define (resolve-shape shape flowspace)
  (match shape
    ;; Ground
    [(list 'ground)
     (values (list 'ground) flowspace)]

    ;; Presence — a shape exists. Place it on the surface.
    [(list 'presence name value)
     (let ([fs (hash-set flowspace name (list 'presence name value))])
       (displayln (string-append "  (" (->str name) ")"))
       (values (list 'presence name value) fs))]

    ;; Transform — the core. Resolve source and target, apply waveform, check constitution.
    [(list 'transform name source-shape target-shape waveform)
     (let*-values
       ([(resolved-src fs1) (resolve-shape source-shape flowspace)]
        [(resolved-tgt fs2) (resolve-shape target-shape fs1)]
        [(src-val) (shape-value resolved-src)]
        [(tgt-val) (shape-value resolved-tgt)]
        [(residue) (waveform src-val tgt-val)]
        [(ok) (constitutional? src-val tgt-val residue)]
        [(status) (constitution-status src-val tgt-val residue)]
        [(result) (list 'resolved name src-val tgt-val residue ok)]
        [(fs3) (hash-set fs2 name result)])
       (displayln (string-append "  strike " (->str name) ": "
                                 (number->string (length residue)) " shapes"))
       (displayln (string-append "  " status))
       (displayln (if ok "  )  complete." "  CUT"))
       (values result fs3))]

    ;; Contain — nesting. Resolve all children structurally.
    [(list* 'contain name children)
     (let-values ([(resolved-children fs)
                   (resolve-shapes children flowspace)])
       (let ([result (list* 'contain name resolved-children)]
             [fs2 (hash-set fs name (list* 'contain name resolved-children))])
         (values result fs2)))]

    ;; Disclose — reveal what's on the surface
    [(list 'disclose name)
     (let ([shape (hash-ref flowspace name #f)])
       (cond
         [(not shape) (displayln "  absent")]
         [(match shape
            [(list 'resolved nm src tgt residue ok)
             (displayln (string-append "  META: " (->str nm)))
             (displayln (string-append "  OUTSIDE: (" (->str src) ") -> ("
                                       (->str tgt) ") ["
                                       (number->string (length residue)) " shapes]"))
             (map (λ (r) (displayln (string-append "    " (->str (car r))
                                                   " -> " (->str (cdr r)))))
                  residue)
             #t]
            [(list 'presence nm val)
             (displayln (string-append "  (" (->str nm) ") = " (->str val)))
             #t]
            [_ (displayln (string-append "  " (~a shape))) #t])])
       (values (list 'disclosed name) flowspace))]

    ;; Recognize — check existence
    [(list 'recognize name)
     (let ([found (hash-has-key? flowspace name)])
       (displayln (string-append "  "
                                 (if found "recognized" "absent")
                                 ": (" (->str name) ")"))
       (values (list 'recognized name found) flowspace))]

    ;; Anything else — pass through
    [other (values other flowspace)]))

;; Resolve multiple shapes — structural map through the list
(define (resolve-shapes shapes flowspace)
  (match shapes
    ['() (values '() flowspace)]
    [(cons first rest)
     (let*-values
       ([(resolved-first fs1) (resolve-shape first flowspace)]
        [(resolved-rest fs2) (resolve-shapes rest fs1)])
       (values (cons resolved-first resolved-rest) fs2))]))

;; THE SURFACE — the top-level form.
;; One expression. All shapes resolve. The circuit completes.
(define (surface . shapes)
  (displayln "")
  (displayln "  ╔═══════════════════════════════════╗")
  (displayln "  ║   STRIKING SURFACE — CLOCKLESS    ║")
  (displayln "  ╚═══════════════════════════════════╝")
  (displayln "")
  (let-values ([(resolved flowspace) (resolve-shapes shapes (hash))])
    (displayln "")
    (displayln (string-append "  flowspace: "
                              (number->string (hash-count flowspace))
                              " shapes on the surface"))
    flowspace))
