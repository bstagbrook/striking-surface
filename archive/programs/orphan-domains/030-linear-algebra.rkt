#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; LINEAR ALGEBRA — MATRICES, EIGENVALUES, TRANSFORMS
;;;
;;; The math behind quantum mechanics, computer graphics,
;;; machine learning, signal processing — everything.
;;;
;;; 2x2 matrix operations computed by hand.
;;; Eigenvalues of standard matrices computed.
;;; Pauli matrices and their algebra registered.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-linear-algebra

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: linear algebra register
  (
    ;;; 2x2 determinants: det[[a,b],[c,d]] = ad - bc
    (det-identity (identity) (det=1) ((identity . det=1)))
    (det-pauli-X (pauli-X) (det=-1) ((pauli-X . det=-1)))
    (det-pauli-Z (pauli-Z) (det=-1) ((pauli-Z . det=-1)))
    (det-rotation-90 (rotation-90) (det=1) ((rotation-90 . det=1)))
    (det-scale-2 (scale-2) (det=4) ((scale-2 . det=4)))
    (det-shear (shear) (det=1) ((shear . det=1)))
    (det-singular (singular) (det=0) ((singular . det=0)))
    (det-reflection-x (reflection-x) (det=-1) ((reflection-x . det=-1)))
    (det-reflection-y (reflection-y) (det=-1) ((reflection-y . det=-1)))

    ;;; Eigenvalues of Pauli matrices
    (eigen-pauli-X (pauli-X) (eigenvalues-+1-and--1) ((pauli-X . eigenvalues-+1-and--1)))
    (eigen-pauli-Y (pauli-Y) (eigenvalues-+1-and--1) ((pauli-Y . eigenvalues-+1-and--1)))
    (eigen-pauli-Z (pauli-Z) (eigenvalues-+1-and--1) ((pauli-Z . eigenvalues-+1-and--1)))
    (eigen-identity (identity-2x2) (eigenvalues-+1-and-+1) ((identity-2x2 . eigenvalues-+1-and-+1)))

    ;;; Pauli algebra: commutation and anticommutation
    (pauli-XY (X-times-Y) (iZ) ((X-times-Y . iZ)))
    (pauli-YX (Y-times-X) (-iZ) ((Y-times-X . -iZ)))
    (pauli-YZ (Y-times-Z) (iX) ((Y-times-Z . iX)))
    (pauli-ZY (Z-times-Y) (-iX) ((Z-times-Y . -iX)))
    (pauli-ZX (Z-times-X) (iY) ((Z-times-X . iY)))
    (pauli-XZ (X-times-Z) (-iY) ((X-times-Z . -iY)))
    (pauli-XX (X-squared) (I) ((X-squared . I)))
    (pauli-YY (Y-squared) (I) ((Y-squared . I)))
    (pauli-ZZ (Z-squared) (I) ((Z-squared . I)))

    ;;; Vector space axioms (structural chain)
    (vector-space
      (set-with-addition-and-scaling)
      (vector-space-axioms-satisfied)
      ((set-with-addition-and-scaling . closure-under-addition)
       (closure-under-addition . closure-under-scaling)
       (closure-under-scaling . additive-identity-exists)
       (additive-identity-exists . additive-inverses-exist)
       (additive-inverses-exist . distributive-laws-hold)
       (distributive-laws-hold . vector-space-axioms-satisfied)))

    ;;; Key vector spaces and dimensions
    (dim-R1 (R1-real-line) (dimension-1) ((R1-real-line . dimension-1)))
    (dim-R2 (R2-plane) (dimension-2) ((R2-plane . dimension-2)))
    (dim-R3 (R3-3D-space) (dimension-3) ((R3-3D-space . dimension-3)))
    (dim-R4 (R4-spacetime) (dimension-4) ((R4-spacetime . dimension-4)))
    (dim-C2 (C2-qubit-Hilbert-space) (dimension-2) ((C2-qubit-Hilbert-space . dimension-2)))
    (dim-C4 (C4-two-qubit-space) (dimension-4) ((C4-two-qubit-space . dimension-4)))
    (dim-Cn (Cn-n-qubit-space) (dimension-2^n) ((Cn-n-qubit-space . dimension-2^n)))

    ;;; Rank-nullity: rank(A) + nullity(A) = n (columns)
    (rank-nullity (matrix-A-m-by-n) (rank+nullity=n) ((matrix-A-m-by-n . rank-of-A) (rank-of-A . nullity-of-A) (nullity-of-A . rank+nullity=n)))

  )

  ;;; Vacuum tube
  ((tesla . linear-algebra-registered)))
