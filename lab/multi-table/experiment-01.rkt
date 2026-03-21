#lang strike

;;; Two strike tables in one file. One strike. Both resolve.

(tesla-circuit
  (spark)
  (arc)
  ((spark . resonance)
   (resonance . arc)))

(gold-from-tesla
  ((tesla-circuit
    (spark)
    (arc)
    ((spark . resonance)
     (resonance . arc))))
  (yellow)
  ((tesla-circuit . yellow)))
