#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Information Theory
;;; LAYER: 12-information
;;; DEPENDS ON: 07-waves (signal processing), 09-electromagnetism (channels)
;;; DEPENDED ON BY: coding theory, cryptography, data compression,
;;;   communications engineering, statistical mechanics, machine learning
;;;
;;; PURPOSE: The mathematical theory of communication — quantifying
;;; information, channel capacity, and the fundamental limits of
;;; data compression and reliable transmission.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Shannon-1948] C.E. Shannon, "A Mathematical Theory of Communication",
;;;   Bell System Technical Journal, 27(3):379-423, July 1948.
;;;   DOI: 10.1002/j.1538-7305.1948.tb01338.x
;;; [Cover-Thomas-2006] T.M. Cover & J.A. Thomas, "Elements of
;;;   Information Theory", 2nd ed., Wiley-Interscience, 2006.
;;; [Landauer-1961] R. Landauer, "Irreversibility and Heat Generation
;;;   in the Computing Process", IBM J. Res. Dev. 5(3):183-191, 1961.
;;;   DOI: 10.1147/rd.53.0183
;;; [Hamming-1950] R.W. Hamming, "Error Detecting and Error Correcting
;;;   Codes", Bell System Technical Journal, 29(2):147-160, 1950.
;;; [Kolmogorov-1965] A.N. Kolmogorov, "Three Approaches to the
;;;   Quantitative Definition of Information", Problems of Information
;;;   Transmission, 1(1):1-7, 1965.
;;; [Shannon-1949] C.E. Shannon, "Communication in the Presence of Noise",
;;;   Proc. IRE 37(1):10-21, 1949. DOI: 10.1109/JRPROC.1949.232969
;;;
;;; CALIBRATION: information-theory.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-information-theory

  ((Shannon (mathematical-theory-of-communication) (authoritative)
    ((mathematical-theory-of-communication . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIT — fundamental unit of information
    ;;; SOURCE: [Shannon-1948] Section 1, p.380
    ;;; The choice between two equally likely alternatives.
    ;;; ═══════════════════════════════════════════════════════════

    (bit
      (unit-of-information)
      (one-binary-digit)
      ((unit-of-information . choice-between-two-equally-likely-alternatives)
       (choice-between-two-equally-likely-alternatives . log2-of-2-equals-1)
       (log2-of-2-equals-1 . one-binary-digit)
       (one-binary-digit . coined-by-Tukey-used-by-Shannon)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INFORMATION CONTENT OF A SYMBOL
    ;;; SOURCE: [Shannon-1948] Section 2
    ;;; Self-information: I(x) = -log2(p(x))
    ;;; Less probable events carry more information.
    ;;; ═══════════════════════════════════════════════════════════

    (self-information
      (symbol-with-probability-p)
      (I-equals-minus-log2-p)
      ((symbol-with-probability-p . rare-events-carry-more-information)
       (rare-events-carry-more-information . certain-event-carries-zero-information)
       (certain-event-carries-zero-information . impossible-event-carries-infinite-information)
       (impossible-event-carries-infinite-information . measured-in-bits-when-base-2)
       (measured-in-bits-when-base-2 . I-equals-minus-log2-p)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SHANNON ENTROPY
    ;;; SOURCE: [Shannon-1948] Theorem 2, Section 6
    ;;; H(X) = -sum_x p(x) log2 p(x)
    ;;; Average information content per symbol.
    ;;; ═══════════════════════════════════════════════════════════

    (Shannon-entropy
      (discrete-random-variable-X-with-pmf-p)
      (H-equals-minus-sum-p-log2-p)
      ((discrete-random-variable-X-with-pmf-p . expected-value-of-self-information)
       (expected-value-of-self-information . H-equals-minus-sum-p-log2-p)
       (H-equals-minus-sum-p-log2-p . measured-in-bits)
       (measured-in-bits . non-negative)
       (non-negative . zero-iff-one-outcome-certain)
       (zero-iff-one-outcome-certain . maximized-by-uniform-distribution)
       (maximized-by-uniform-distribution . H-max-equals-log2-n-for-n-outcomes)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; JOINT ENTROPY
    ;;; SOURCE: [Shannon-1948] Section 7; [Cover-Thomas-2006] Ch.2
    ;;; H(X,Y) = -sum_{x,y} p(x,y) log2 p(x,y)
    ;;; ═══════════════════════════════════════════════════════════

    (joint-entropy
      (pair-of-random-variables-X-Y)
      (H-XY-equals-minus-sum-pxy-log2-pxy)
      ((pair-of-random-variables-X-Y . joint-distribution-p-x-y)
       (joint-distribution-p-x-y . H-XY-equals-minus-sum-pxy-log2-pxy)
       (H-XY-equals-minus-sum-pxy-log2-pxy . H-XY-le-H-X-plus-H-Y)
       (H-XY-le-H-X-plus-H-Y . equality-iff-X-Y-independent)
       (equality-iff-X-Y-independent . chain-rule-H-XY-equals-H-X-plus-H-Y-given-X)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CONDITIONAL ENTROPY
    ;;; SOURCE: [Shannon-1948] Section 7; [Cover-Thomas-2006] Ch.2
    ;;; H(Y|X) = -sum_{x,y} p(x,y) log2 p(y|x)
    ;;; Remaining uncertainty in Y after observing X.
    ;;; ═══════════════════════════════════════════════════════════

    (conditional-entropy
      (Y-given-X)
      (H-Y-given-X)
      ((Y-given-X . average-entropy-of-Y-for-each-value-of-X)
       (average-entropy-of-Y-for-each-value-of-X . H-Y-given-X)
       (H-Y-given-X . equals-H-XY-minus-H-X)
       (equals-H-XY-minus-H-X . non-negative)
       (non-negative . zero-iff-Y-determined-by-X)
       (zero-iff-Y-determined-by-X . at-most-H-Y)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MUTUAL INFORMATION
    ;;; SOURCE: [Shannon-1948] Section 8; [Cover-Thomas-2006] Ch.2
    ;;; I(X;Y) = H(X) - H(X|Y) = H(Y) - H(Y|X) = H(X) + H(Y) - H(X,Y)
    ;;; ═══════════════════════════════════════════════════════════

    (mutual-information
      (pair-of-random-variables-X-Y)
      (I-XY-equals-H-X-minus-H-X-given-Y)
      ((pair-of-random-variables-X-Y . shared-information-between-X-and-Y)
       (shared-information-between-X-and-Y . I-XY-equals-H-X-minus-H-X-given-Y)
       (I-XY-equals-H-X-minus-H-X-given-Y . also-equals-H-Y-minus-H-Y-given-X)
       (also-equals-H-Y-minus-H-Y-given-X . also-equals-H-X-plus-H-Y-minus-H-XY)
       (also-equals-H-X-plus-H-Y-minus-H-XY . symmetric-I-XY-equals-I-YX)
       (symmetric-I-XY-equals-I-YX . non-negative)
       (non-negative . zero-iff-X-Y-independent)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; KL DIVERGENCE (relative entropy)
    ;;; SOURCE: [Cover-Thomas-2006] Ch.2; Kullback & Leibler 1951
    ;;; D_KL(P||Q) = sum_x p(x) log2(p(x)/q(x))
    ;;; ═══════════════════════════════════════════════════════════

    (KL-divergence
      (two-distributions-P-and-Q)
      (D-KL-P-Q-equals-sum-p-log-p-over-q)
      ((two-distributions-P-and-Q . measures-difference-between-distributions)
       (measures-difference-between-distributions . D-KL-P-Q-equals-sum-p-log-p-over-q)
       (D-KL-P-Q-equals-sum-p-log-p-over-q . non-negative-Gibbs-inequality)
       (non-negative-Gibbs-inequality . zero-iff-P-equals-Q)
       (zero-iff-P-equals-Q . not-symmetric-in-general)
       (not-symmetric-in-general . not-a-true-metric)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHANNEL CAPACITY — Shannon-Hartley theorem
    ;;; SOURCE: [Shannon-1948] Theorem 17; [Shannon-1949]
    ;;; C = B log2(1 + S/N) for AWGN channel
    ;;; Maximum rate of reliable communication.
    ;;; ═══════════════════════════════════════════════════════════

    (channel-capacity
      (discrete-memoryless-channel)
      (C-equals-max-I-XY-over-input-distributions)
      ((discrete-memoryless-channel . characterized-by-transition-probabilities)
       (characterized-by-transition-probabilities . C-equals-max-I-XY-over-input-distributions)
       (C-equals-max-I-XY-over-input-distributions . maximum-mutual-information)
       (maximum-mutual-information . bits-per-channel-use)
       (bits-per-channel-use . achievable-with-vanishing-error-probability)))

    (Shannon-Hartley-theorem
      (band-limited-AWGN-channel)
      (C-equals-B-log2-1-plus-S-over-N)
      ((band-limited-AWGN-channel . bandwidth-B-Hz)
       (bandwidth-B-Hz . signal-power-S-watts)
       (signal-power-S-watts . noise-power-N-watts)
       (noise-power-N-watts . additive-white-Gaussian-noise)
       (additive-white-Gaussian-noise . C-equals-B-log2-1-plus-S-over-N)
       (C-equals-B-log2-1-plus-S-over-N . measured-in-bits-per-second)
       (measured-in-bits-per-second . fundamental-limit-of-channel)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NOISY CHANNEL CODING THEOREM
    ;;; SOURCE: [Shannon-1948] Theorem 11
    ;;; Reliable communication possible at any rate below capacity.
    ;;; ═══════════════════════════════════════════════════════════

    (noisy-channel-coding-theorem
      (channel-with-capacity-C)
      (reliable-communication-at-rates-below-C)
      ((channel-with-capacity-C . for-any-rate-R-less-than-C)
       (for-any-rate-R-less-than-C . there-exists-a-code)
       (there-exists-a-code . with-arbitrarily-small-error-probability)
       (with-arbitrarily-small-error-probability . requires-sufficiently-long-block-length)
       (requires-sufficiently-long-block-length . reliable-communication-at-rates-below-C)
       (reliable-communication-at-rates-below-C . converse-above-C-error-bounded-away-from-zero)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SOURCE CODING THEOREM (data compression limit)
    ;;; SOURCE: [Shannon-1948] Theorem 5
    ;;; Entropy is the limit of lossless compression.
    ;;; ═══════════════════════════════════════════════════════════

    (source-coding-theorem
      (iid-source-with-entropy-H)
      (cannot-compress-below-H-bits-per-symbol)
      ((iid-source-with-entropy-H . lossless-compression)
       (lossless-compression . average-code-length-ge-H)
       (average-code-length-ge-H . achievable-within-H-plus-1-bits)
       (achievable-within-H-plus-1-bits . block-coding-approaches-H)
       (block-coding-approaches-H . cannot-compress-below-H-bits-per-symbol)
       (cannot-compress-below-H-bits-per-symbol . entropy-IS-the-compression-limit)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; REDUNDANCY
    ;;; SOURCE: [Shannon-1948] Section 8; [Cover-Thomas-2006] Ch.5
    ;;; R = 1 - H/H_max
    ;;; ═══════════════════════════════════════════════════════════

    (redundancy
      (source-with-entropy-H-and-alphabet-size-n)
      (R-equals-1-minus-H-over-log2-n)
      ((source-with-entropy-H-and-alphabet-size-n . maximum-entropy-log2-n)
       (maximum-entropy-log2-n . actual-entropy-H-le-log2-n)
       (actual-entropy-H-le-log2-n . R-equals-1-minus-H-over-log2-n)
       (R-equals-1-minus-H-over-log2-n . fraction-of-structure-that-is-predictable)
       (fraction-of-structure-that-is-predictable . exploited-by-compression)
       (exploited-by-compression . English-text-approximately-75-pct-redundant)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ERROR-CORRECTING CODES (Hamming)
    ;;; SOURCE: [Hamming-1950]
    ;;; ═══════════════════════════════════════════════════════════

    (Hamming-codes
      (linear-error-correcting-code)
      (corrects-single-bit-errors)
      ((linear-error-correcting-code . adds-parity-check-bits)
       (adds-parity-check-bits . Hamming-7-4-code)
       (Hamming-7-4-code . 4-data-bits-plus-3-parity-bits)
       (4-data-bits-plus-3-parity-bits . detects-and-corrects-single-bit-errors)
       (detects-and-corrects-single-bit-errors . corrects-single-bit-errors)
       (corrects-single-bit-errors . Hamming-distance-determines-error-capability)))

    (Hamming-distance
      (two-binary-strings-of-equal-length)
      (number-of-positions-where-they-differ)
      ((two-binary-strings-of-equal-length . count-differing-positions)
       (count-differing-positions . number-of-positions-where-they-differ)
       (number-of-positions-where-they-differ . code-with-min-distance-d)
       (code-with-min-distance-d . detects-up-to-d-minus-1-errors)
       (detects-up-to-d-minus-1-errors . corrects-up-to-floor-d-minus-1-over-2-errors)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; KOLMOGOROV COMPLEXITY
    ;;; SOURCE: [Kolmogorov-1965]; also Solomonoff 1964, Chaitin 1966
    ;;; K(x) = length of shortest program that produces x
    ;;; ═══════════════════════════════════════════════════════════

    (Kolmogorov-complexity
      (finite-binary-string-x)
      (K-x-equals-length-of-shortest-program-producing-x)
      ((finite-binary-string-x . given-universal-Turing-machine-U)
       (given-universal-Turing-machine-U . shortest-program-p-such-that-U-p-equals-x)
       (shortest-program-p-such-that-U-p-equals-x . K-x-equals-length-of-shortest-program-producing-x)
       (K-x-equals-length-of-shortest-program-producing-x . not-computable)
       (not-computable . invariance-theorem-machine-independent-up-to-constant)
       (invariance-theorem-machine-independent-up-to-constant . incompressible-strings-are-random)
       (incompressible-strings-are-random . most-strings-are-incompressible)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FISHER INFORMATION
    ;;; SOURCE: R.A. Fisher 1925; [Cover-Thomas-2006] Ch.12
    ;;; I(theta) = E[(d/dtheta log f(X;theta))^2]
    ;;; ═══════════════════════════════════════════════════════════

    (Fisher-information
      (parametric-family-f-x-theta)
      (I-theta-equals-E-score-squared)
      ((parametric-family-f-x-theta . score-function-d-log-f-over-d-theta)
       (score-function-d-log-f-over-d-theta . I-theta-equals-E-score-squared)
       (I-theta-equals-E-score-squared . measures-curvature-of-log-likelihood)
       (measures-curvature-of-log-likelihood . Cramer-Rao-bound)
       (Cramer-Rao-bound . var-estimator-ge-1-over-nI-theta)
       (var-estimator-ge-1-over-nI-theta . higher-Fisher-info-means-more-precise-estimation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ENTROPY RATE OF A STOCHASTIC PROCESS
    ;;; SOURCE: [Shannon-1948] Section 4; [Cover-Thomas-2006] Ch.4
    ;;; H_rate = lim (1/n) H(X1, X2, ..., Xn)
    ;;; ═══════════════════════════════════════════════════════════

    (entropy-rate
      (stationary-stochastic-process)
      (H-rate-equals-lim-1-over-n-H-X1-to-Xn)
      ((stationary-stochastic-process . sequence-of-random-variables)
       (sequence-of-random-variables . H-rate-equals-lim-1-over-n-H-X1-to-Xn)
       (H-rate-equals-lim-1-over-n-H-X1-to-Xn . per-symbol-entropy-in-the-limit)
       (per-symbol-entropy-in-the-limit . for-stationary-Markov-H-rate-equals-H-Xn-given-Xn-minus-1)
       (for-stationary-Markov-H-rate-equals-H-Xn-given-Xn-minus-1 . determines-compressibility-of-process)
       (determines-compressibility-of-process . le-entropy-of-marginal-distribution)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LANDAUER'S PRINCIPLE — information meets thermodynamics
    ;;; SOURCE: [Landauer-1961]
    ;;; Erasing 1 bit of information dissipates at least kT ln 2
    ;;; joules of energy as heat.
    ;;; ═══════════════════════════════════════════════════════════

    (Landauer-principle
      (erasure-of-one-bit-of-information)
      (minimum-energy-dissipation-kT-ln-2)
      ((erasure-of-one-bit-of-information . logically-irreversible-operation)
       (logically-irreversible-operation . maps-two-states-to-one)
       (maps-two-states-to-one . entropy-of-environment-must-increase)
       (entropy-of-environment-must-increase . minimum-heat-dissipated-kT-ln-2)
       (minimum-heat-dissipated-kT-ln-2 . at-300K-equals-2.85e-21-joules)
       (at-300K-equals-2.85e-21-joules . minimum-energy-dissipation-kT-ln-2)
       (minimum-energy-dissipation-kT-ln-2 . confirmed-experimentally-Berut-et-al-2012)))

    (Landauer-constants
      (Boltzmann-constant-k)
      (k-equals-1.380649e-23-J/K-exact)
      ((Boltzmann-constant-k . defined-exact-since-2019-SI)
       (defined-exact-since-2019-SI . k-equals-1.380649e-23-J/K-exact)
       (k-equals-1.380649e-23-J/K-exact . kT-at-300K-equals-4.14e-21-J)
       (kT-at-300K-equals-4.14e-21-J . kT-ln-2-at-300K-equals-2.87e-21-J)
       (kT-ln-2-at-300K-equals-2.87e-21-J . Landauer-limit-per-bit-erased)))

  )

  ((Shannon . information-theory-registered)))
