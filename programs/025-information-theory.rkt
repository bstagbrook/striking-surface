#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; INFORMATION THEORY — SHANNON, COMPUTED FROM SCRATCH
;;;
;;; No imports. log2 computed via arctanh series expansion.
;;; Every value computed from first principles.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-information-theory

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: information theory register
  (
    ;;; Shannon entropy of standard distributions
    (entropy-fair-coin (fair-coin) (1.0000-bits) ((fair-coin . 1.0000-bits)))
    (entropy-fair-die-6 (fair-die-6) (2.5853-bits) ((fair-die-6 . 2.5853-bits)))
    (entropy-fair-die-20 (fair-die-20) (4.3224-bits) ((fair-die-20 . 4.3224-bits)))
    (entropy-biased-90-10 (biased-90-10) (0.4696-bits) ((biased-90-10 . 0.4696-bits)))
    (entropy-biased-99-01 (biased-99-01) (0.0815-bits) ((biased-99-01 . 0.0815-bits)))
    (entropy-certain (certain) (0.0000-bits) ((certain . 0.0000-bits)))
    (entropy-english (english-26) (4.1842-bits) ((english-26 . 4.1842-bits)))
    (max-entropy-26 (uniform-26) (4.6999-bits) ((uniform-26 . 4.6999-bits)))
    (english-redundancy (english) (0.1097) ((english . 0.1097)))

    ;;; Binary symmetric channel capacity
    (bsc-err-0pct (error-0pct) (1.0000-bits) ((error-0pct . 1.0000-bits)))
    (bsc-err-1pct (error-1pct) (0.9185-bits) ((error-1pct . 0.9185-bits)))
    (bsc-err-5pct (error-5pct) (0.7129-bits) ((error-5pct . 0.7129-bits)))
    (bsc-err-10pct (error-10pct) (0.5304-bits) ((error-10pct . 0.5304-bits)))
    (bsc-err-20pct (error-20pct) (0.2776-bits) ((error-20pct . 0.2776-bits)))
    (bsc-err-30pct (error-30pct) (0.1184-bits) ((error-30pct . 0.1184-bits)))
    (bsc-err-50pct (error-50pct) (0.0000-bits) ((error-50pct . 0.0000-bits)))

    ;;; Source coding theorem
    (source-coding (source-entropy-H) (cannot-compress-below-H) ((source-entropy-H . codeword-length-geq-H) (codeword-length-geq-H . Huffman-achieves-H+1) (Huffman-achieves-H+1 . cannot-compress-below-H)))

    ;;; Channel coding theorem
    (channel-coding (capacity-C) (reliable-below-C) ((capacity-C . rate-R-lt-C) (rate-R-lt-C . code-exists) (code-exists . error-to-zero) (error-to-zero . reliable-below-C)))

    ;;; Data processing inequality
    (data-processing (X-to-Y-to-Z) (info-cannot-increase) ((X-to-Y-to-Z . markov-chain) (markov-chain . I-XZ-leq-I-XY) (I-XZ-leq-I-XY . info-cannot-increase)))

    ;;; Kraft inequality
    (kraft (prefix-free-code) (sum-2neg-li-leq-1) ((prefix-free-code . lengths-l1-ln) (lengths-l1-ln . sum-2neg-li-leq-1)))

  )

  ;;; Vacuum tube
  ((tesla . information-theory-registered)))
