#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Engineering — signals, systems, control, digital,
;;;   networking, cryptography, compression, error correction,
;;;   antennas, and power systems
;;; LAYER: 22-engineering
;;; DEPENDS ON: 07-waves (signal processing), 09-electromagnetism
;;;   (circuits, antennas, power), 12-information (entropy, channel
;;;   capacity, coding), 15-computation (algorithms, complexity),
;;;   16-mathematics (transforms, linear algebra)
;;; DEPENDED ON BY: communications engineering, embedded systems,
;;;   aerospace, biomedical engineering, robotics
;;;
;;; PURPOSE: The applied mathematical and physical foundations of
;;; engineering systems — transforms, feedback, digital conversion,
;;; networking protocols, cryptographic primitives, compression,
;;; error correction, antenna radiation, and power delivery.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Oppenheim-Willsky-1997] A.V. Oppenheim & A.S. Willsky,
;;;   Signals and Systems, 2nd ed., Prentice Hall, 1997.
;;; [Haykin-2014] S. Haykin, Communication Systems, 5th ed.,
;;;   Wiley, 2014.
;;; [Stallings-2017] W. Stallings, Data and Computer Communications,
;;;   10th ed., Pearson, 2017.
;;; [Ogata-2010] K. Ogata, Modern Control Engineering, 5th ed.,
;;;   Prentice Hall, 2010.
;;; [Proakis-Salehi-2008] J.G. Proakis & M. Salehi, Digital
;;;   Communications, 5th ed., McGraw-Hill, 2008.
;;; [Stinson-2006] D.R. Stinson, Cryptography: Theory and Practice,
;;;   3rd ed., CRC Press, 2006.
;;; [Balanis-2016] C.A. Balanis, Antenna Theory: Analysis and Design,
;;;   4th ed., Wiley, 2016.
;;; [Shannon-1948] C.E. Shannon, "A Mathematical Theory of
;;;   Communication," Bell System Technical Journal 27, 379-423, 1948.
;;; [Nyquist-1928] H. Nyquist, "Certain Topics in Telegraph
;;;   Transmission Theory," Trans. AIEE 47(2):617-644, 1928.
;;; [Diffie-Hellman-1976] W. Diffie & M.E. Hellman, "New Directions
;;;   in Cryptography," IEEE Trans. Inf. Theory 22(6):644-654, 1976.
;;; [Rivest-Shamir-Adleman-1978] R. Rivest, A. Shamir, L. Adleman,
;;;   "A Method for Obtaining Digital Signatures and Public-Key
;;;   Cryptosystems," Commun. ACM 21(2):120-126, 1978.
;;; [Berrou-1993] C. Berrou, A. Glavieux, P. Thitimajshima,
;;;   "Near Shannon Limit Error-Correcting Coding and Decoding:
;;;   Turbo-Codes," Proc. ICC 1993, pp. 1064-1070.
;;; [Gallager-1962] R.G. Gallager, "Low-Density Parity-Check Codes,"
;;;   IRE Trans. Inf. Theory 8(1):21-28, 1962.
;;; [Reed-Solomon-1960] I.S. Reed & G. Solomon, "Polynomial Codes
;;;   Over Certain Finite Fields," J. SIAM 8(2):300-304, 1960.
;;; [Zimmermann-1980] H. Zimmermann, "OSI Reference Model,"
;;;   IEEE Trans. Commun. 28(4):425-432, 1980.
;;; [NIST-FIPS-197] NIST, "AES," FIPS PUB 197, 2001.
;;; [NIST-FIPS-180-4] NIST, "SHA-2," FIPS PUB 180-4, 2015.
;;; [Huffman-1952] D.A. Huffman, "A Method for the Construction of
;;;   Minimum-Redundancy Codes," Proc. IRE 40(9):1098-1101, 1952.
;;;
;;; CALIBRATION: engineering.cal.rkt (not yet created)
;;; ═══════════════════════════════════════════════════════════════

(domain-engineering

  ((engineering
    (Oppenheim-Willsky-1997 Haykin-2014 Stallings-2017 Ogata-2010
     Proakis-Salehi-2008 Stinson-2006 Balanis-2016)
    (authoritative)
    ((Oppenheim-Willsky-1997 . authoritative)
     (Haykin-2014 . authoritative)
     (Stallings-2017 . authoritative)
     (Ogata-2010 . authoritative)
     (Proakis-Salehi-2008 . authoritative)
     (Stinson-2006 . authoritative)
     (Balanis-2016 . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 1: SIGNALS AND SYSTEMS
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FOURIER TRANSFORM
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 4
    ;;; Decomposes a time-domain signal into its constituent
    ;;; frequencies. X(w) = integral x(t) e^{-jwt} dt.
    ;;; ═══════════════════════════════════════════════════════════

    (Fourier-transform
      (time-domain-signal-x-of-t)
      (frequency-domain-representation-X-of-omega)
      ((time-domain-signal-x-of-t . decompose-into-complex-exponentials)
       (decompose-into-complex-exponentials . X-omega-equals-integral-x-t-e-minus-j-omega-t-dt)
       (X-omega-equals-integral-x-t-e-minus-j-omega-t-dt . inverse-x-t-equals-1-over-2pi-integral-X-omega-e-j-omega-t-d-omega)
       (inverse-x-t-equals-1-over-2pi-integral-X-omega-e-j-omega-t-d-omega . linear-transform)
       (linear-transform . convolution-in-time-equals-multiplication-in-frequency)
       (convolution-in-time-equals-multiplication-in-frequency . multiplication-in-time-equals-convolution-in-frequency)
       (multiplication-in-time-equals-convolution-in-frequency . Parsevals-theorem-energy-preserved)
       (Parsevals-theorem-energy-preserved . frequency-domain-representation-X-of-omega)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LAPLACE TRANSFORM
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 9
    ;;; Generalizes Fourier to complex frequency s = sigma + j*omega.
    ;;; X(s) = integral x(t) e^{-st} dt.
    ;;; ═══════════════════════════════════════════════════════════

    (Laplace-transform
      (time-domain-signal-x-of-t)
      (complex-frequency-domain-X-of-s)
      ((time-domain-signal-x-of-t . generalization-of-Fourier-transform)
       (generalization-of-Fourier-transform . s-equals-sigma-plus-j-omega)
       (s-equals-sigma-plus-j-omega . X-s-equals-integral-x-t-e-minus-st-dt)
       (X-s-equals-integral-x-t-e-minus-st-dt . region-of-convergence-determines-uniqueness)
       (region-of-convergence-determines-uniqueness . poles-and-zeros-characterize-system)
       (poles-and-zeros-characterize-system . Fourier-transform-is-Laplace-evaluated-on-j-omega-axis)
       (Fourier-transform-is-Laplace-evaluated-on-j-omega-axis . converts-differential-equations-to-algebraic)
       (converts-differential-equations-to-algebraic . complex-frequency-domain-X-of-s)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; Z-TRANSFORM
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 10
    ;;; Discrete-time analog of Laplace transform.
    ;;; X(z) = sum x[n] z^{-n}.
    ;;; ═══════════════════════════════════════════════════════════

    (Z-transform
      (discrete-time-signal-x-of-n)
      (complex-plane-representation-X-of-z)
      ((discrete-time-signal-x-of-n . sum-over-all-n-of-x-n-z-to-minus-n)
       (sum-over-all-n-of-x-n-z-to-minus-n . discrete-time-analog-of-Laplace-transform)
       (discrete-time-analog-of-Laplace-transform . z-equals-e-to-sT-maps-s-plane-to-z-plane)
       (z-equals-e-to-sT-maps-s-plane-to-z-plane . unit-circle-corresponds-to-j-omega-axis)
       (unit-circle-corresponds-to-j-omega-axis . ROC-determines-stability-and-causality)
       (ROC-determines-stability-and-causality . converts-difference-equations-to-algebraic)
       (converts-difference-equations-to-algebraic . complex-plane-representation-X-of-z)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CONVOLUTION
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 2, 3
    ;;; Output of LTI system: y(t) = x(t) * h(t).
    ;;; ═══════════════════════════════════════════════════════════

    (convolution
      (input-signal-and-impulse-response)
      (output-of-LTI-system)
      ((input-signal-and-impulse-response . y-t-equals-integral-x-tau-h-t-minus-tau-d-tau)
       (y-t-equals-integral-x-tau-h-t-minus-tau-d-tau . continuous-time-convolution)
       (continuous-time-convolution . discrete-y-n-equals-sum-x-k-h-n-minus-k)
       (discrete-y-n-equals-sum-x-k-h-n-minus-k . commutative-x-star-h-equals-h-star-x)
       (commutative-x-star-h-equals-h-star-x . associative-and-distributive)
       (associative-and-distributive . equivalent-to-multiplication-in-frequency-domain)
       (equivalent-to-multiplication-in-frequency-domain . output-of-LTI-system)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IMPULSE RESPONSE
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 2
    ;;; h(t) = system output when input is delta(t).
    ;;; Completely characterizes an LTI system.
    ;;; ═══════════════════════════════════════════════════════════

    (impulse-response
      (linear-time-invariant-system)
      (h-t-output-to-unit-impulse)
      ((linear-time-invariant-system . input-is-Dirac-delta-function)
       (input-is-Dirac-delta-function . output-is-h-t)
       (output-is-h-t . completely-characterizes-LTI-system)
       (completely-characterizes-LTI-system . any-output-via-convolution-with-input)
       (any-output-via-convolution-with-input . causal-system-iff-h-t-equals-0-for-t-less-than-0)
       (causal-system-iff-h-t-equals-0-for-t-less-than-0 . stable-iff-h-t-absolutely-integrable)
       (stable-iff-h-t-absolutely-integrable . h-t-output-to-unit-impulse)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFER FUNCTION
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 9; [Ogata-2010] Ch. 2
    ;;; H(s) = Y(s)/X(s) — Laplace transform of impulse response.
    ;;; ═══════════════════════════════════════════════════════════

    (transfer-function
      (LTI-system-with-impulse-response-h)
      (H-s-equals-Laplace-of-h-t)
      ((LTI-system-with-impulse-response-h . H-s-equals-Y-s-over-X-s)
       (H-s-equals-Y-s-over-X-s . ratio-of-output-to-input-in-s-domain)
       (ratio-of-output-to-input-in-s-domain . poles-are-roots-of-denominator)
       (poles-are-roots-of-denominator . zeros-are-roots-of-numerator)
       (zeros-are-roots-of-numerator . BIBO-stable-iff-all-poles-in-left-half-plane)
       (BIBO-stable-iff-all-poles-in-left-half-plane . discrete-time-H-z-equals-Y-z-over-X-z)
       (discrete-time-H-z-equals-Y-z-over-X-z . H-s-equals-Laplace-of-h-t)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FREQUENCY RESPONSE
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 6
    ;;; H(j*omega) = |H| * e^{j*phi} — magnitude and phase vs frequency.
    ;;; ═══════════════════════════════════════════════════════════

    (frequency-response
      (LTI-system-driven-by-sinusoids)
      (H-j-omega-magnitude-and-phase-vs-frequency)
      ((LTI-system-driven-by-sinusoids . sinusoidal-input-produces-sinusoidal-output)
       (sinusoidal-input-produces-sinusoidal-output . same-frequency-different-amplitude-and-phase)
       (same-frequency-different-amplitude-and-phase . H-j-omega-equals-transfer-function-on-j-omega-axis)
       (H-j-omega-equals-transfer-function-on-j-omega-axis . magnitude-response-abs-H-j-omega)
       (magnitude-response-abs-H-j-omega . phase-response-angle-H-j-omega)
       (phase-response-angle-H-j-omega . group-delay-minus-d-phi-over-d-omega)
       (group-delay-minus-d-phi-over-d-omega . H-j-omega-magnitude-and-phase-vs-frequency)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NYQUIST SAMPLING THEOREM
    ;;; SOURCE: [Nyquist-1928]; [Oppenheim-Willsky-1997] Ch. 7
    ;;; [Shannon-1948] sampling theorem
    ;;; A bandlimited signal with maximum frequency f_max is
    ;;; completely determined by samples taken at rate >= 2*f_max.
    ;;; ═══════════════════════════════════════════════════════════

    (Nyquist-sampling-theorem
      (bandlimited-signal-with-max-frequency-f-max)
      (perfectly-reconstructed-from-samples-at-2-times-f-max)
      ((bandlimited-signal-with-max-frequency-f-max . no-energy-above-f-max)
       (no-energy-above-f-max . sample-at-f-s-ge-2-f-max)
       (sample-at-f-s-ge-2-f-max . 2-f-max-is-the-Nyquist-rate)
       (2-f-max-is-the-Nyquist-rate . f-s-over-2-is-the-Nyquist-frequency)
       (f-s-over-2-is-the-Nyquist-frequency . below-Nyquist-rate-causes-aliasing)
       (below-Nyquist-rate-causes-aliasing . aliased-frequencies-fold-back-into-baseband)
       (aliased-frequencies-fold-back-into-baseband . reconstruction-via-ideal-lowpass-sinc-interpolation)
       (reconstruction-via-ideal-lowpass-sinc-interpolation . perfectly-reconstructed-from-samples-at-2-times-f-max)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 2: CONTROL THEORY
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FEEDBACK LOOPS
    ;;; SOURCE: [Ogata-2010] Ch. 1, 3
    ;;; Negative feedback reduces gain but improves stability,
    ;;; linearity, and bandwidth. Positive feedback increases gain
    ;;; and can cause instability (oscillation, saturation).
    ;;; ═══════════════════════════════════════════════════════════

    (negative-feedback
      (output-subtracted-from-input)
      (reduces-gain-improves-stability)
      ((output-subtracted-from-input . error-signal-equals-reference-minus-output)
       (error-signal-equals-reference-minus-output . closed-loop-gain-G-over-1-plus-GH)
       (closed-loop-gain-G-over-1-plus-GH . reduces-sensitivity-to-parameter-variations)
       (reduces-sensitivity-to-parameter-variations . improves-linearity)
       (improves-linearity . extends-bandwidth)
       (extends-bandwidth . reduces-distortion)
       (reduces-distortion . reduces-gain-improves-stability)))

    (positive-feedback
      (output-added-to-input)
      (increases-gain-can-cause-instability)
      ((output-added-to-input . reinforces-input-signal)
       (reinforces-input-signal . closed-loop-gain-G-over-1-minus-GH)
       (closed-loop-gain-G-over-1-minus-GH . gain-increases-toward-infinity-as-GH-approaches-1)
       (gain-increases-toward-infinity-as-GH-approaches-1 . used-in-oscillators-and-latches)
       (used-in-oscillators-and-latches . Barkhausen-criterion-loop-gain-equals-1-for-oscillation)
       (Barkhausen-criterion-loop-gain-equals-1-for-oscillation . increases-gain-can-cause-instability)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PID CONTROLLER
    ;;; SOURCE: [Ogata-2010] Ch. 8
    ;;; u(t) = Kp*e(t) + Ki*integral(e) + Kd*de/dt
    ;;; Three-term controller: proportional, integral, derivative.
    ;;; ═══════════════════════════════════════════════════════════

    (PID-controller
      (error-signal-e-of-t)
      (control-output-u-of-t)
      ((error-signal-e-of-t . proportional-term-Kp-times-e)
       (proportional-term-Kp-times-e . reduces-error-proportionally)
       (reduces-error-proportionally . integral-term-Ki-times-integral-e-dt)
       (integral-term-Ki-times-integral-e-dt . eliminates-steady-state-error)
       (eliminates-steady-state-error . derivative-term-Kd-times-de-over-dt)
       (derivative-term-Kd-times-de-over-dt . anticipates-future-error-reduces-overshoot)
       (anticipates-future-error-reduces-overshoot . u-equals-Kp-e-plus-Ki-integral-e-plus-Kd-de-dt)
       (u-equals-Kp-e-plus-Ki-integral-e-plus-Kd-de-dt . control-output-u-of-t)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STABILITY
    ;;; SOURCE: [Ogata-2010] Ch. 5, 6
    ;;; BIBO stability: bounded input produces bounded output.
    ;;; Continuous: all poles in open left half of s-plane.
    ;;; Discrete: all poles inside unit circle in z-plane.
    ;;; ═══════════════════════════════════════════════════════════

    (stability-criterion
      (LTI-system-with-transfer-function)
      (BIBO-stable-iff-poles-in-left-half-plane)
      ((LTI-system-with-transfer-function . bounded-input-bounded-output)
       (bounded-input-bounded-output . continuous-time-all-poles-Re-s-less-than-0)
       (continuous-time-all-poles-Re-s-less-than-0 . discrete-time-all-poles-inside-unit-circle)
       (discrete-time-all-poles-inside-unit-circle . Routh-Hurwitz-algebraic-test-for-pole-locations)
       (Routh-Hurwitz-algebraic-test-for-pole-locations . poles-on-j-omega-axis-marginally-stable)
       (poles-on-j-omega-axis-marginally-stable . poles-in-right-half-plane-unstable)
       (poles-in-right-half-plane-unstable . BIBO-stable-iff-poles-in-left-half-plane)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BODE PLOTS
    ;;; SOURCE: [Ogata-2010] Ch. 7
    ;;; Magnitude (dB) and phase (degrees) vs log frequency.
    ;;; Gain margin and phase margin determine relative stability.
    ;;; ═══════════════════════════════════════════════════════════

    (Bode-plots
      (transfer-function-H-j-omega)
      (magnitude-dB-and-phase-vs-log-frequency)
      ((transfer-function-H-j-omega . plot-20-log10-abs-H-vs-log-omega)
       (plot-20-log10-abs-H-vs-log-omega . plot-angle-H-vs-log-omega)
       (plot-angle-H-vs-log-omega . gain-crossover-frequency-where-magnitude-equals-0-dB)
       (gain-crossover-frequency-where-magnitude-equals-0-dB . phase-crossover-frequency-where-phase-equals-minus-180)
       (phase-crossover-frequency-where-phase-equals-minus-180 . gain-margin-dB-below-0-at-phase-crossover)
       (gain-margin-dB-below-0-at-phase-crossover . phase-margin-degrees-above-minus-180-at-gain-crossover)
       (phase-margin-degrees-above-minus-180-at-gain-crossover . positive-margins-indicate-stability)
       (positive-margins-indicate-stability . magnitude-dB-and-phase-vs-log-frequency)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 3: DIGITAL SYSTEMS
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ANALOG-TO-DIGITAL CONVERSION (ADC)
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 7; [Haykin-2014] Ch. 5
    ;;; Converts continuous-time continuous-amplitude signal to
    ;;; discrete-time discrete-amplitude (digital) signal.
    ;;; ═══════════════════════════════════════════════════════════

    (analog-to-digital-conversion
      (continuous-analog-signal)
      (discrete-digital-representation)
      ((continuous-analog-signal . anti-aliasing-lowpass-filter)
       (anti-aliasing-lowpass-filter . sample-at-rate-ge-Nyquist)
       (sample-at-rate-ge-Nyquist . sample-and-hold-circuit)
       (sample-and-hold-circuit . quantize-to-discrete-levels)
       (quantize-to-discrete-levels . encode-as-binary-word)
       (encode-as-binary-word . discrete-digital-representation)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIGITAL-TO-ANALOG CONVERSION (DAC)
    ;;; SOURCE: [Oppenheim-Willsky-1997] Ch. 7; [Haykin-2014] Ch. 5
    ;;; Converts digital samples back to continuous analog signal.
    ;;; ═══════════════════════════════════════════════════════════

    (digital-to-analog-conversion
      (discrete-digital-samples)
      (reconstructed-analog-signal)
      ((discrete-digital-samples . decode-binary-to-amplitude-levels)
       (decode-binary-to-amplitude-levels . hold-each-sample-value)
       (hold-each-sample-value . produces-staircase-approximation)
       (produces-staircase-approximation . reconstruction-lowpass-filter)
       (reconstruction-lowpass-filter . smooths-to-continuous-waveform)
       (smooths-to-continuous-waveform . reconstructed-analog-signal)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUANTIZATION
    ;;; SOURCE: [Haykin-2014] Ch. 5; [Oppenheim-Willsky-1997] Ch. 7
    ;;; Maps continuous amplitude to nearest discrete level.
    ;;; Introduces irreversible quantization error (noise).
    ;;; ═══════════════════════════════════════════════════════════

    (quantization
      (continuous-amplitude-sample)
      (nearest-discrete-level)
      ((continuous-amplitude-sample . map-to-one-of-2-to-N-levels)
       (map-to-one-of-2-to-N-levels . N-is-bit-depth)
       (N-is-bit-depth . quantization-step-size-delta-equals-full-range-over-2-to-N)
       (quantization-step-size-delta-equals-full-range-over-2-to-N . quantization-error-between-minus-delta-over-2-and-plus-delta-over-2)
       (quantization-error-between-minus-delta-over-2-and-plus-delta-over-2 . modeled-as-uniform-noise)
       (modeled-as-uniform-noise . irreversible-information-loss)
       (irreversible-information-loss . nearest-discrete-level)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIT DEPTH
    ;;; SOURCE: [Haykin-2014] Ch. 5
    ;;; Number of bits per sample. Determines dynamic range.
    ;;; Each additional bit adds ~6.02 dB of dynamic range.
    ;;; ═══════════════════════════════════════════════════════════

    (bit-depth
      (number-of-bits-per-sample-N)
      (determines-quantization-resolution)
      ((number-of-bits-per-sample-N . 2-to-N-discrete-levels)
       (2-to-N-discrete-levels . dynamic-range-approximately-6.02-times-N-dB)
       (dynamic-range-approximately-6.02-times-N-dB . 16-bit-gives-96-dB-dynamic-range)
       (16-bit-gives-96-dB-dynamic-range . 24-bit-gives-144-dB-dynamic-range)
       (24-bit-gives-144-dB-dynamic-range . higher-bit-depth-finer-resolution)
       (higher-bit-depth-finer-resolution . determines-quantization-resolution)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SIGNAL-TO-NOISE RATIO (SNR)
    ;;; SOURCE: [Haykin-2014] Ch. 1; [Oppenheim-Willsky-1997] Ch. 7
    ;;; For quantization: SNR_dB ~ 6.02N + 1.76 dB.
    ;;; ═══════════════════════════════════════════════════════════

    (signal-to-noise-ratio
      (signal-power-and-noise-power)
      (SNR-equals-P-signal-over-P-noise)
      ((signal-power-and-noise-power . SNR-equals-P-signal-over-P-noise)
       (SNR-equals-P-signal-over-P-noise . SNR-dB-equals-10-log10-P-signal-over-P-noise)
       (SNR-dB-equals-10-log10-P-signal-over-P-noise . for-quantization-SNR-dB-approx-6.02N-plus-1.76)
       (for-quantization-SNR-dB-approx-6.02N-plus-1.76 . higher-SNR-means-cleaner-signal)
       (higher-SNR-means-cleaner-signal . fundamental-limit-on-information-capacity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 4: NETWORKING
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; OSI MODEL — 7 layers
    ;;; SOURCE: [Zimmermann-1980]; [Stallings-2017] Ch. 2
    ;;; ISO/IEC 7498-1. The reference model for network architecture.
    ;;; ═══════════════════════════════════════════════════════════

    (OSI-model
      (network-communication-architecture)
      (seven-layer-reference-model)
      ((network-communication-architecture . layer-1-physical)
       (layer-1-physical . bit-transmission-over-physical-medium)
       (bit-transmission-over-physical-medium . layer-2-data-link)
       (layer-2-data-link . framing-error-detection-MAC-addressing)
       (framing-error-detection-MAC-addressing . layer-3-network)
       (layer-3-network . logical-addressing-routing-IP)
       (logical-addressing-routing-IP . layer-4-transport)
       (layer-4-transport . end-to-end-reliability-flow-control-TCP-UDP)
       (end-to-end-reliability-flow-control-TCP-UDP . layer-5-session)
       (layer-5-session . session-management-synchronization)
       (session-management-synchronization . layer-6-presentation)
       (layer-6-presentation . data-format-translation-encryption-compression)
       (data-format-translation-encryption-compression . layer-7-application)
       (layer-7-application . user-facing-protocols-HTTP-DNS-SMTP)
       (user-facing-protocols-HTTP-DNS-SMTP . seven-layer-reference-model)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TCP/IP
    ;;; SOURCE: [Stallings-2017] Ch. 2, 20; RFC 793 (TCP), RFC 791 (IP)
    ;;; The practical protocol suite — 4 layers.
    ;;; ═══════════════════════════════════════════════════════════

    (TCP-IP
      (internet-protocol-suite)
      (four-layer-model)
      ((internet-protocol-suite . link-layer-physical-and-data-link)
       (link-layer-physical-and-data-link . internet-layer-IP-addressing-and-routing)
       (internet-layer-IP-addressing-and-routing . transport-layer-TCP-reliable-UDP-unreliable)
       (transport-layer-TCP-reliable-UDP-unreliable . application-layer-HTTP-DNS-SMTP-FTP)
       (application-layer-HTTP-DNS-SMTP-FTP . TCP-connection-oriented-three-way-handshake)
       (TCP-connection-oriented-three-way-handshake . reliable-ordered-error-checked-delivery)
       (reliable-ordered-error-checked-delivery . flow-control-via-sliding-window)
       (flow-control-via-sliding-window . congestion-control-slow-start-congestion-avoidance)
       (congestion-control-slow-start-congestion-avoidance . four-layer-model)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HTTP
    ;;; SOURCE: [Stallings-2017] Ch. 25; RFC 7230-7235 (HTTP/1.1)
    ;;; Application-layer request-response protocol for the web.
    ;;; ═══════════════════════════════════════════════════════════

    (HTTP
      (hypertext-transfer-protocol)
      (request-response-stateless-protocol)
      ((hypertext-transfer-protocol . application-layer-protocol)
       (application-layer-protocol . client-sends-request-server-sends-response)
       (client-sends-request-server-sends-response . methods-GET-POST-PUT-DELETE-HEAD-etc)
       (methods-GET-POST-PUT-DELETE-HEAD-etc . status-codes-200-OK-404-not-found-500-server-error)
       (status-codes-200-OK-404-not-found-500-server-error . stateless-each-request-independent)
       (stateless-each-request-independent . runs-over-TCP-port-80-or-TLS-port-443)
       (runs-over-TCP-port-80-or-TLS-port-443 . request-response-stateless-protocol)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DNS
    ;;; SOURCE: [Stallings-2017] Ch. 25; RFC 1035
    ;;; Translates human-readable domain names to IP addresses.
    ;;; ═══════════════════════════════════════════════════════════

    (DNS
      (domain-name-system)
      (maps-domain-names-to-IP-addresses)
      ((domain-name-system . hierarchical-distributed-database)
       (hierarchical-distributed-database . root-servers-TLD-servers-authoritative-servers)
       (root-servers-TLD-servers-authoritative-servers . recursive-and-iterative-query-resolution)
       (recursive-and-iterative-query-resolution . A-record-maps-name-to-IPv4)
       (A-record-maps-name-to-IPv4 . AAAA-record-maps-name-to-IPv6)
       (AAAA-record-maps-name-to-IPv6 . caching-with-TTL-reduces-lookup-time)
       (caching-with-TTL-reduces-lookup-time . maps-domain-names-to-IP-addresses)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ROUTING
    ;;; SOURCE: [Stallings-2017] Ch. 22
    ;;; Determining the path packets take through a network.
    ;;; ═══════════════════════════════════════════════════════════

    (routing
      (packet-forwarding-through-network)
      (determines-path-from-source-to-destination)
      ((packet-forwarding-through-network . routing-table-maps-destination-to-next-hop)
       (routing-table-maps-destination-to-next-hop . distance-vector-protocols-RIP-exchange-tables)
       (distance-vector-protocols-RIP-exchange-tables . link-state-protocols-OSPF-flood-topology)
       (link-state-protocols-OSPF-flood-topology . Dijkstra-shortest-path-for-link-state)
       (Dijkstra-shortest-path-for-link-state . BGP-for-inter-domain-routing)
       (BGP-for-inter-domain-routing . determines-path-from-source-to-destination)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BANDWIDTH AND LATENCY
    ;;; SOURCE: [Stallings-2017] Ch. 2; [Haykin-2014] Ch. 1
    ;;; Bandwidth: maximum data rate of a channel.
    ;;; Latency: time delay from source to destination.
    ;;; ═══════════════════════════════════════════════════════════

    (bandwidth-and-latency
      (communication-channel-properties)
      (data-rate-and-delay-characterize-performance)
      ((communication-channel-properties . bandwidth-maximum-bits-per-second)
       (bandwidth-maximum-bits-per-second . analog-bandwidth-measured-in-Hz)
       (analog-bandwidth-measured-in-Hz . digital-bandwidth-measured-in-bps)
       (digital-bandwidth-measured-in-bps . latency-equals-propagation-plus-transmission-plus-queuing-plus-processing)
       (latency-equals-propagation-plus-transmission-plus-queuing-plus-processing . propagation-delay-distance-over-speed)
       (propagation-delay-distance-over-speed . transmission-delay-packet-size-over-bandwidth)
       (transmission-delay-packet-size-over-bandwidth . bandwidth-delay-product-equals-capacity-in-flight)
       (bandwidth-delay-product-equals-capacity-in-flight . data-rate-and-delay-characterize-performance)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PACKETS
    ;;; SOURCE: [Stallings-2017] Ch. 10
    ;;; Data divided into discrete units for transmission.
    ;;; ═══════════════════════════════════════════════════════════

    (packets
      (data-divided-into-discrete-units)
      (independent-routable-units-of-data)
      ((data-divided-into-discrete-units . header-contains-source-destination-metadata)
       (header-contains-source-destination-metadata . payload-contains-user-data)
       (payload-contains-user-data . packet-switching-vs-circuit-switching)
       (packet-switching-vs-circuit-switching . statistical-multiplexing-shares-links)
       (statistical-multiplexing-shares-links . store-and-forward-at-each-router)
       (store-and-forward-at-each-router . independent-routable-units-of-data)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 5: CRYPTOGRAPHY
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SYMMETRIC ENCRYPTION — AES
    ;;; SOURCE: [NIST-FIPS-197]; [Stinson-2006] Ch. 3
    ;;; Same key encrypts and decrypts. AES: 128/192/256-bit keys,
    ;;; 128-bit block. Rijndael cipher standardized by NIST 2001.
    ;;; ═══════════════════════════════════════════════════════════

    (symmetric-encryption-AES
      (plaintext-and-shared-secret-key)
      (ciphertext)
      ((plaintext-and-shared-secret-key . same-key-for-encryption-and-decryption)
       (same-key-for-encryption-and-decryption . AES-Advanced-Encryption-Standard)
       (AES-Advanced-Encryption-Standard . Rijndael-cipher-selected-by-NIST-2001)
       (Rijndael-cipher-selected-by-NIST-2001 . block-size-128-bits)
       (block-size-128-bits . key-sizes-128-or-192-or-256-bits)
       (key-sizes-128-or-192-or-256-bits . substitution-permutation-network)
       (substitution-permutation-network . 10-or-12-or-14-rounds-depending-on-key-size)
       (10-or-12-or-14-rounds-depending-on-key-size . ciphertext)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ASYMMETRIC ENCRYPTION — RSA
    ;;; SOURCE: [Rivest-Shamir-Adleman-1978]; [Stinson-2006] Ch. 5
    ;;; Public key encrypts, private key decrypts.
    ;;; Security rests on difficulty of factoring large semiprimes.
    ;;; ═══════════════════════════════════════════════════════════

    (asymmetric-encryption-RSA
      (plaintext-and-public-key)
      (ciphertext-decryptable-only-with-private-key)
      ((plaintext-and-public-key . public-key-pair-n-e)
       (public-key-pair-n-e . n-equals-p-times-q-product-of-two-large-primes)
       (n-equals-p-times-q-product-of-two-large-primes . e-is-public-exponent)
       (e-is-public-exponent . encrypt-c-equals-m-to-e-mod-n)
       (encrypt-c-equals-m-to-e-mod-n . private-key-d-is-modular-inverse-of-e-mod-phi-n)
       (private-key-d-is-modular-inverse-of-e-mod-phi-n . decrypt-m-equals-c-to-d-mod-n)
       (decrypt-m-equals-c-to-d-mod-n . security-relies-on-integer-factorization-hardness)
       (security-relies-on-integer-factorization-hardness . ciphertext-decryptable-only-with-private-key)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HASH FUNCTIONS — SHA-256
    ;;; SOURCE: [NIST-FIPS-180-4]; [Stinson-2006] Ch. 8
    ;;; Maps arbitrary-length input to fixed-length digest.
    ;;; SHA-256: 256-bit output, member of SHA-2 family.
    ;;; ═══════════════════════════════════════════════════════════

    (hash-function-SHA-256
      (arbitrary-length-input-message)
      (fixed-256-bit-digest)
      ((arbitrary-length-input-message . deterministic-same-input-same-output)
       (deterministic-same-input-same-output . one-way-infeasible-to-reverse)
       (one-way-infeasible-to-reverse . collision-resistant-hard-to-find-two-inputs-same-hash)
       (collision-resistant-hard-to-find-two-inputs-same-hash . avalanche-effect-small-change-large-output-difference)
       (avalanche-effect-small-change-large-output-difference . SHA-256-is-SHA-2-family-NIST-standard)
       (SHA-256-is-SHA-2-family-NIST-standard . 64-rounds-of-compression)
       (64-rounds-of-compression . Merkle-Damgard-construction)
       (Merkle-Damgard-construction . fixed-256-bit-digest)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIGITAL SIGNATURES
    ;;; SOURCE: [Stinson-2006] Ch. 7; [Diffie-Hellman-1976]
    ;;; Sign with private key, verify with public key.
    ;;; Provides authentication, integrity, non-repudiation.
    ;;; ═══════════════════════════════════════════════════════════

    (digital-signatures
      (message-and-signers-private-key)
      (verifiable-signature)
      ((message-and-signers-private-key . hash-the-message)
       (hash-the-message . sign-hash-with-private-key)
       (sign-hash-with-private-key . signature-attached-to-message)
       (signature-attached-to-message . verifier-uses-signers-public-key)
       (verifier-uses-signers-public-key . provides-authentication-who-signed)
       (provides-authentication-who-signed . provides-integrity-message-not-altered)
       (provides-integrity-message-not-altered . provides-non-repudiation-signer-cannot-deny)
       (provides-non-repudiation-signer-cannot-deny . verifiable-signature)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIFFIE-HELLMAN KEY EXCHANGE
    ;;; SOURCE: [Diffie-Hellman-1976]; [Stinson-2006] Ch. 5
    ;;; Two parties establish shared secret over insecure channel.
    ;;; Security rests on discrete logarithm problem.
    ;;; ═══════════════════════════════════════════════════════════

    (Diffie-Hellman-key-exchange
      (two-parties-over-insecure-channel)
      (shared-secret-established)
      ((two-parties-over-insecure-channel . agree-on-public-prime-p-and-generator-g)
       (agree-on-public-prime-p-and-generator-g . Alice-chooses-secret-a-sends-g-to-a-mod-p)
       (Alice-chooses-secret-a-sends-g-to-a-mod-p . Bob-chooses-secret-b-sends-g-to-b-mod-p)
       (Bob-chooses-secret-b-sends-g-to-b-mod-p . Alice-computes-g-to-b-to-a-mod-p)
       (Alice-computes-g-to-b-to-a-mod-p . Bob-computes-g-to-a-to-b-mod-p)
       (Bob-computes-g-to-a-to-b-mod-p . both-have-g-to-ab-mod-p-as-shared-secret)
       (both-have-g-to-ab-mod-p-as-shared-secret . security-relies-on-discrete-logarithm-hardness)
       (security-relies-on-discrete-logarithm-hardness . shared-secret-established)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PUBLIC KEY INFRASTRUCTURE (PKI)
    ;;; SOURCE: [Stinson-2006] Ch. 7; [Stallings-2017] Ch. 23
    ;;; Framework for managing digital certificates and public keys.
    ;;; ═══════════════════════════════════════════════════════════

    (public-key-infrastructure
      (framework-for-managing-public-keys)
      (trusted-binding-of-identity-to-public-key)
      ((framework-for-managing-public-keys . certificate-authority-CA-issues-certificates)
       (certificate-authority-CA-issues-certificates . digital-certificate-binds-identity-to-public-key)
       (digital-certificate-binds-identity-to-public-key . X509-standard-certificate-format)
       (X509-standard-certificate-format . chain-of-trust-root-CA-intermediate-CA-end-entity)
       (chain-of-trust-root-CA-intermediate-CA-end-entity . certificate-revocation-via-CRL-or-OCSP)
       (certificate-revocation-via-CRL-or-OCSP . enables-TLS-HTTPS-secure-email)
       (enables-TLS-HTTPS-secure-email . trusted-binding-of-identity-to-public-key)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 6: COMPRESSION
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSLESS COMPRESSION — Huffman coding
    ;;; SOURCE: [Huffman-1952]; [Shannon-1948] source coding theorem
    ;;; Optimal prefix-free code for known symbol probabilities.
    ;;; ═══════════════════════════════════════════════════════════

    (Huffman-coding
      (source-with-known-symbol-probabilities)
      (optimal-prefix-free-variable-length-code)
      ((source-with-known-symbol-probabilities . build-binary-tree-bottom-up)
       (build-binary-tree-bottom-up . merge-two-lowest-probability-nodes)
       (merge-two-lowest-probability-nodes . assign-0-and-1-to-branches)
       (assign-0-and-1-to-branches . codeword-length-inversely-related-to-probability)
       (codeword-length-inversely-related-to-probability . prefix-free-no-codeword-is-prefix-of-another)
       (prefix-free-no-codeword-is-prefix-of-another . optimal-among-prefix-codes-for-symbol-by-symbol)
       (optimal-among-prefix-codes-for-symbol-by-symbol . average-length-between-H-and-H-plus-1)
       (average-length-between-H-and-H-plus-1 . optimal-prefix-free-variable-length-code)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSLESS COMPRESSION — LZW
    ;;; SOURCE: Ziv-Lempel 1977/1978; Welch 1984
    ;;; Dictionary-based compression. Builds dictionary adaptively.
    ;;; Used in GIF, early TIFF, Unix compress.
    ;;; ═══════════════════════════════════════════════════════════

    (LZW-compression
      (input-stream-of-symbols)
      (compressed-stream-of-dictionary-indices)
      ((input-stream-of-symbols . initialize-dictionary-with-single-symbols)
       (initialize-dictionary-with-single-symbols . find-longest-match-in-dictionary)
       (find-longest-match-in-dictionary . output-index-of-match)
       (output-index-of-match . add-match-plus-next-symbol-to-dictionary)
       (add-match-plus-next-symbol-to-dictionary . dictionary-grows-adaptively)
       (dictionary-grows-adaptively . universal-no-prior-probability-model-needed)
       (universal-no-prior-probability-model-needed . compressed-stream-of-dictionary-indices)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSLESS COMPRESSION — gzip (DEFLATE)
    ;;; SOURCE: RFC 1951 (DEFLATE); RFC 1952 (gzip)
    ;;; Combines LZ77 + Huffman coding.
    ;;; ═══════════════════════════════════════════════════════════

    (gzip-compression
      (input-data-stream)
      (DEFLATE-compressed-output)
      ((input-data-stream . LZ77-sliding-window-finds-repeated-sequences)
       (LZ77-sliding-window-finds-repeated-sequences . replaces-repeats-with-length-distance-pairs)
       (replaces-repeats-with-length-distance-pairs . Huffman-codes-the-LZ77-output)
       (Huffman-codes-the-LZ77-output . two-stage-compression-LZ77-then-Huffman)
       (two-stage-compression-LZ77-then-Huffman . widely-used-HTTP-file-compression)
       (widely-used-HTTP-file-compression . DEFLATE-compressed-output)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSY COMPRESSION — JPEG
    ;;; SOURCE: ITU-T T.81 (JPEG standard); Wallace 1991
    ;;; Exploits human visual system limitations.
    ;;; Discrete cosine transform + quantization + entropy coding.
    ;;; ═══════════════════════════════════════════════════════════

    (JPEG-compression
      (input-image)
      (compressed-image-with-controlled-quality-loss)
      ((input-image . color-space-conversion-RGB-to-YCbCr)
       (color-space-conversion-RGB-to-YCbCr . chroma-subsampling-exploits-lower-color-acuity)
       (chroma-subsampling-exploits-lower-color-acuity . divide-into-8x8-blocks)
       (divide-into-8x8-blocks . discrete-cosine-transform-DCT-on-each-block)
       (discrete-cosine-transform-DCT-on-each-block . quantization-discards-high-frequency-detail)
       (quantization-discards-high-frequency-detail . quantization-table-controls-quality-vs-size)
       (quantization-table-controls-quality-vs-size . entropy-coding-Huffman-on-quantized-coefficients)
       (entropy-coding-Huffman-on-quantized-coefficients . compressed-image-with-controlled-quality-loss)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSY COMPRESSION — MP3 (MPEG-1 Audio Layer III)
    ;;; SOURCE: ISO/IEC 11172-3; Brandenburg et al. 1994
    ;;; Psychoacoustic model determines masking thresholds.
    ;;; ═══════════════════════════════════════════════════════════

    (MP3-compression
      (input-audio-signal)
      (perceptually-coded-compressed-audio)
      ((input-audio-signal . divide-into-frequency-subbands)
       (divide-into-frequency-subbands . psychoacoustic-model-computes-masking-thresholds)
       (psychoacoustic-model-computes-masking-thresholds . simultaneous-and-temporal-masking)
       (simultaneous-and-temporal-masking . quantize-subbands-below-masking-threshold-coarsely)
       (quantize-subbands-below-masking-threshold-coarsely . bit-allocation-based-on-masking)
       (bit-allocation-based-on-masking . Huffman-coding-of-quantized-coefficients)
       (Huffman-coding-of-quantized-coefficients . perceptually-coded-compressed-audio)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LOSSY COMPRESSION — H.264 (MPEG-4 AVC)
    ;;; SOURCE: ITU-T H.264; Wiegand et al. 2003
    ;;; Video codec: intra prediction, inter prediction (motion
    ;;; compensation), transform, quantize, entropy code.
    ;;; ═══════════════════════════════════════════════════════════

    (H264-compression
      (input-video-sequence)
      (compressed-video-stream)
      ((input-video-sequence . divide-frames-into-macroblocks)
       (divide-frames-into-macroblocks . intra-prediction-exploits-spatial-redundancy)
       (intra-prediction-exploits-spatial-redundancy . inter-prediction-motion-compensation-temporal-redundancy)
       (inter-prediction-motion-compensation-temporal-redundancy . residual-transform-integer-DCT)
       (residual-transform-integer-DCT . quantize-transform-coefficients)
       (quantize-transform-coefficients . entropy-coding-CABAC-or-CAVLC)
       (entropy-coding-CABAC-or-CAVLC . I-frames-P-frames-B-frames)
       (I-frames-P-frames-B-frames . compressed-video-stream)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SHANNON ENTROPY AS COMPRESSION LIMIT
    ;;; SOURCE: [Shannon-1948] Theorem 5; [Huffman-1952]
    ;;; No lossless compression can go below entropy.
    ;;; ═══════════════════════════════════════════════════════════

    (Shannon-entropy-compression-limit
      (source-with-entropy-H-bits-per-symbol)
      (H-is-absolute-lower-bound-on-average-code-length)
      ((source-with-entropy-H-bits-per-symbol . lossless-coding-cannot-average-below-H)
       (lossless-coding-cannot-average-below-H . Huffman-achieves-between-H-and-H-plus-1)
       (Huffman-achieves-between-H-and-H-plus-1 . arithmetic-coding-approaches-H-closely)
       (arithmetic-coding-approaches-H-closely . block-coding-approaches-H-in-limit)
       (block-coding-approaches-H-in-limit . lossy-can-go-below-H-by-discarding-information)
       (lossy-can-go-below-H-by-discarding-information . rate-distortion-theory-governs-lossy-limit)
       (rate-distortion-theory-governs-lossy-limit . H-is-absolute-lower-bound-on-average-code-length)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 7: ERROR CORRECTION
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HAMMING CODES
    ;;; SOURCE: Hamming 1950; [Proakis-Salehi-2008] Ch. 8
    ;;; Linear block codes. (7,4) code: 4 data + 3 parity bits.
    ;;; Single-error-correcting, double-error-detecting.
    ;;; ═══════════════════════════════════════════════════════════

    (Hamming-codes
      (linear-block-error-correcting-code)
      (single-error-correcting)
      ((linear-block-error-correcting-code . n-k-code-n-total-bits-k-data-bits)
       (n-k-code-n-total-bits-k-data-bits . Hamming-7-4-encodes-4-data-in-7-bits)
       (Hamming-7-4-encodes-4-data-in-7-bits . parity-check-matrix-H-defines-code)
       (parity-check-matrix-H-defines-code . syndrome-s-equals-H-times-received-word)
       (syndrome-s-equals-H-times-received-word . nonzero-syndrome-locates-error-position)
       (nonzero-syndrome-locates-error-position . corrects-1-bit-error-detects-2-bit-errors)
       (corrects-1-bit-error-detects-2-bit-errors . minimum-distance-3)
       (minimum-distance-3 . single-error-correcting)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; REED-SOLOMON CODES
    ;;; SOURCE: [Reed-Solomon-1960]; [Proakis-Salehi-2008] Ch. 8
    ;;; Non-binary BCH codes over GF(2^m). Corrects burst errors.
    ;;; Used in CDs, DVDs, QR codes, deep space communication.
    ;;; ═══════════════════════════════════════════════════════════

    (Reed-Solomon-codes
      (non-binary-block-code-over-Galois-field)
      (corrects-up-to-t-symbol-errors)
      ((non-binary-block-code-over-Galois-field . symbols-from-GF-2-to-m)
       (symbols-from-GF-2-to-m . n-k-code-with-n-equals-2-to-m-minus-1)
       (n-k-code-with-n-equals-2-to-m-minus-1 . minimum-distance-d-equals-n-minus-k-plus-1)
       (minimum-distance-d-equals-n-minus-k-plus-1 . MDS-code-achieves-Singleton-bound)
       (MDS-code-achieves-Singleton-bound . corrects-t-equals-n-minus-k-over-2-symbol-errors)
       (corrects-t-equals-n-minus-k-over-2-symbol-errors . excellent-for-burst-error-correction)
       (excellent-for-burst-error-correction . used-in-CD-DVD-QR-deep-space)
       (used-in-CD-DVD-QR-deep-space . corrects-up-to-t-symbol-errors)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TURBO CODES
    ;;; SOURCE: [Berrou-1993]; [Proakis-Salehi-2008] Ch. 8
    ;;; Near-Shannon-limit performance via iterative decoding of
    ;;; parallel concatenated convolutional codes.
    ;;; ═══════════════════════════════════════════════════════════

    (turbo-codes
      (parallel-concatenated-convolutional-codes)
      (near-Shannon-limit-error-correction)
      ((parallel-concatenated-convolutional-codes . two-RSC-encoders-with-interleaver)
       (two-RSC-encoders-with-interleaver . interleaver-permutes-input-bits)
       (interleaver-permutes-input-bits . iterative-decoding-with-soft-information-exchange)
       (iterative-decoding-with-soft-information-exchange . MAP-or-SOVA-component-decoders)
       (MAP-or-SOVA-component-decoders . performance-within-0.5-dB-of-Shannon-limit)
       (performance-within-0.5-dB-of-Shannon-limit . used-in-3G-4G-deep-space)
       (used-in-3G-4G-deep-space . near-Shannon-limit-error-correction)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; LDPC CODES (Low-Density Parity-Check)
    ;;; SOURCE: [Gallager-1962]; Richardson & Urbanke 2001
    ;;; Sparse parity-check matrix. Iterative belief-propagation
    ;;; decoding. Capacity-approaching on many channels.
    ;;; ═══════════════════════════════════════════════════════════

    (LDPC-codes
      (low-density-parity-check-code)
      (capacity-approaching-error-correction)
      ((low-density-parity-check-code . sparse-parity-check-matrix-H)
       (sparse-parity-check-matrix-H . Tanner-graph-bipartite-representation)
       (Tanner-graph-bipartite-representation . belief-propagation-message-passing-decoding)
       (belief-propagation-message-passing-decoding . iterative-soft-decision-decoding)
       (iterative-soft-decision-decoding . invented-by-Gallager-1962-rediscovered-1990s)
       (invented-by-Gallager-1962-rediscovered-1990s . capacity-approaching-on-AWGN-and-BEC)
       (capacity-approaching-on-AWGN-and-BEC . used-in-5G-NR-WiFi-6-DVB-S2)
       (used-in-5G-NR-WiFi-6-DVB-S2 . capacity-approaching-error-correction)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SHANNON LIMIT FOR ERROR CORRECTION
    ;;; SOURCE: [Shannon-1948] Theorem 11; [Proakis-Salehi-2008] Ch. 8
    ;;; The channel capacity C sets the maximum rate for
    ;;; reliable communication. No code can exceed C.
    ;;; ═══════════════════════════════════════════════════════════

    (Shannon-limit-error-correction
      (channel-with-capacity-C)
      (reliable-transmission-only-at-rate-below-C)
      ((channel-with-capacity-C . for-AWGN-C-equals-B-log2-1-plus-SNR)
       (for-AWGN-C-equals-B-log2-1-plus-SNR . Eb-over-N0-limit-of-minus-1.59-dB)
       (Eb-over-N0-limit-of-minus-1.59-dB . equals-ln-2-or-0.693-in-linear)
       (equals-ln-2-or-0.693-in-linear . below-this-SNR-no-code-achieves-zero-error)
       (below-this-SNR-no-code-achieves-zero-error . turbo-and-LDPC-approach-within-fractions-of-dB)
       (turbo-and-LDPC-approach-within-fractions-of-dB . reliable-transmission-only-at-rate-below-C)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 8: ANTENNA THEORY
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIPOLE ANTENNA
    ;;; SOURCE: [Balanis-2016] Ch. 4
    ;;; Fundamental antenna element. Half-wave dipole:
    ;;; length = lambda/2, impedance ~ 73 ohms, gain 2.15 dBi.
    ;;; ═══════════════════════════════════════════════════════════

    (dipole-antenna
      (two-conductor-elements-fed-at-center)
      (fundamental-radiating-element)
      ((two-conductor-elements-fed-at-center . current-distribution-approximately-sinusoidal)
       (current-distribution-approximately-sinusoidal . half-wave-dipole-length-equals-lambda-over-2)
       (half-wave-dipole-length-equals-lambda-over-2 . input-impedance-approximately-73-plus-j42-ohms)
       (input-impedance-approximately-73-plus-j42-ohms . resonant-when-slightly-shortened)
       (resonant-when-slightly-shortened . gain-2.15-dBi)
       (gain-2.15-dBi . omnidirectional-in-plane-perpendicular-to-axis)
       (omnidirectional-in-plane-perpendicular-to-axis . fundamental-radiating-element)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ANTENNA GAIN
    ;;; SOURCE: [Balanis-2016] Ch. 2
    ;;; Ratio of radiation intensity in a given direction to that
    ;;; of an isotropic radiator with same total power.
    ;;; ═══════════════════════════════════════════════════════════

    (antenna-gain
      (antenna-radiating-power)
      (ratio-of-intensity-to-isotropic-reference)
      ((antenna-radiating-power . radiation-intensity-U-watts-per-steradian)
       (radiation-intensity-U-watts-per-steradian . isotropic-radiator-U0-equals-P-over-4pi)
       (isotropic-radiator-U0-equals-P-over-4pi . gain-G-equals-4pi-U-over-P-input)
       (gain-G-equals-4pi-U-over-P-input . directivity-uses-radiated-power-gain-uses-input-power)
       (directivity-uses-radiated-power-gain-uses-input-power . G-equals-efficiency-times-directivity)
       (G-equals-efficiency-times-directivity . measured-in-dBi-relative-to-isotropic)
       (measured-in-dBi-relative-to-isotropic . ratio-of-intensity-to-isotropic-reference)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIRECTIVITY
    ;;; SOURCE: [Balanis-2016] Ch. 2
    ;;; Ratio of maximum radiation intensity to average.
    ;;; D = 4*pi*U_max / P_rad.
    ;;; ═══════════════════════════════════════════════════════════

    (directivity
      (antenna-radiation-pattern)
      (D-equals-4pi-U-max-over-P-rad)
      ((antenna-radiation-pattern . maximum-radiation-intensity-U-max)
       (maximum-radiation-intensity-U-max . total-radiated-power-P-rad)
       (total-radiated-power-P-rad . D-equals-4pi-U-max-over-P-rad)
       (D-equals-4pi-U-max-over-P-rad . always-ge-1)
       (always-ge-1 . isotropic-antenna-D-equals-1)
       (isotropic-antenna-D-equals-1 . higher-D-means-narrower-beam)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; RADIATION PATTERN
    ;;; SOURCE: [Balanis-2016] Ch. 2
    ;;; Graphical representation of radiation properties as a
    ;;; function of direction (theta, phi).
    ;;; ═══════════════════════════════════════════════════════════

    (radiation-pattern
      (antenna-far-field-radiation)
      (spatial-distribution-of-radiated-power)
      ((antenna-far-field-radiation . function-of-theta-and-phi)
       (function-of-theta-and-phi . main-lobe-direction-of-maximum-radiation)
       (main-lobe-direction-of-maximum-radiation . side-lobes-secondary-maxima)
       (side-lobes-secondary-maxima . null-directions-of-zero-radiation)
       (null-directions-of-zero-radiation . half-power-beamwidth-HPBW-3dB-width-of-main-lobe)
       (half-power-beamwidth-HPBW-3dB-width-of-main-lobe . front-to-back-ratio)
       (front-to-back-ratio . spatial-distribution-of-radiated-power)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EFFECTIVE APERTURE
    ;;; SOURCE: [Balanis-2016] Ch. 2
    ;;; A_e = (lambda^2 / 4*pi) * G — area that captures power.
    ;;; Relates gain to physical collecting area.
    ;;; ═══════════════════════════════════════════════════════════

    (effective-aperture
      (receiving-antenna)
      (A-e-equals-lambda-squared-over-4pi-times-G)
      ((receiving-antenna . captures-power-from-incident-wave)
       (captures-power-from-incident-wave . equivalent-collecting-area)
       (equivalent-collecting-area . A-e-equals-lambda-squared-over-4pi-times-G)
       (A-e-equals-lambda-squared-over-4pi-times-G . relates-gain-to-wavelength)
       (relates-gain-to-wavelength . Friis-transmission-Pr-over-Pt-equals-Gt-Gr-lambda-over-4pi-R-squared)
       (Friis-transmission-Pr-over-Pt-equals-Gt-Gr-lambda-over-4pi-R-squared . larger-aperture-more-collected-power)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SECTION 9: POWER SYSTEMS
    ;;; ═══════════════════════════════════════════════════════════

    ;;; ═══════════════════════════════════════════════════════════
    ;;; AC vs DC
    ;;; SOURCE: [Haykin-2014] Ch. 1; standard electrical engineering
    ;;; AC: time-varying sinusoidal current/voltage.
    ;;; DC: constant current/voltage.
    ;;; ═══════════════════════════════════════════════════════════

    (AC-and-DC
      (electric-current-types)
      (alternating-current-and-direct-current)
      ((electric-current-types . DC-constant-magnitude-and-direction)
       (DC-constant-magnitude-and-direction . AC-sinusoidal-magnitude-varies-with-time)
       (AC-sinusoidal-magnitude-varies-with-time . AC-characterized-by-amplitude-frequency-phase)
       (AC-characterized-by-amplitude-frequency-phase . RMS-value-equals-peak-over-sqrt-2)
       (RMS-value-equals-peak-over-sqrt-2 . AC-transmits-efficiently-over-long-distances)
       (AC-transmits-efficiently-over-long-distances . voltage-easily-transformed-up-or-down)
       (voltage-easily-transformed-up-or-down . DC-used-in-electronics-batteries-solar)
       (DC-used-in-electronics-batteries-solar . alternating-current-and-direct-current)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFORMERS
    ;;; SOURCE: [Balanis-2016] (EM basis); standard EE textbooks;
    ;;; Faraday's law of induction
    ;;; Mutual induction between primary and secondary coils.
    ;;; V2/V1 = N2/N1 (turns ratio). Steps voltage up or down.
    ;;; ═══════════════════════════════════════════════════════════

    (transformers
      (two-magnetically-coupled-coils)
      (voltage-transformation-by-turns-ratio)
      ((two-magnetically-coupled-coils . primary-and-secondary-windings)
       (primary-and-secondary-windings . shared-magnetic-flux-through-core)
       (shared-magnetic-flux-through-core . Faraday-induction-changing-flux-induces-EMF)
       (Faraday-induction-changing-flux-induces-EMF . V2-over-V1-equals-N2-over-N1)
       (V2-over-V1-equals-N2-over-N1 . ideal-transformer-P-in-equals-P-out)
       (ideal-transformer-P-in-equals-P-out . step-up-N2-greater-N1-increases-voltage)
       (step-up-N2-greater-N1-increases-voltage . step-down-N2-less-N1-decreases-voltage)
       (step-down-N2-less-N1-decreases-voltage . enables-efficient-long-distance-AC-transmission)
       (enables-efficient-long-distance-AC-transmission . voltage-transformation-by-turns-ratio)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; IMPEDANCE MATCHING
    ;;; SOURCE: [Balanis-2016] Ch. 2; [Haykin-2014] Ch. 1
    ;;; Maximum power transfer when source impedance equals
    ;;; conjugate of load impedance: Z_source = Z_load*.
    ;;; ═══════════════════════════════════════════════════════════

    (impedance-matching
      (source-impedance-and-load-impedance)
      (maximum-power-transfer-when-conjugate-matched)
      ((source-impedance-and-load-impedance . Z-source-equals-R-plus-jX)
       (Z-source-equals-R-plus-jX . Z-load-equals-R-minus-jX-for-conjugate-match)
       (Z-load-equals-R-minus-jX-for-conjugate-match . maximum-power-transfer-theorem)
       (maximum-power-transfer-theorem . mismatch-causes-reflections)
       (mismatch-causes-reflections . reflection-coefficient-Gamma-equals-ZL-minus-Z0-over-ZL-plus-Z0)
       (reflection-coefficient-Gamma-equals-ZL-minus-Z0-over-ZL-plus-Z0 . VSWR-equals-1-plus-abs-Gamma-over-1-minus-abs-Gamma)
       (VSWR-equals-1-plus-abs-Gamma-over-1-minus-abs-Gamma . matching-networks-L-pi-T-sections)
       (matching-networks-L-pi-T-sections . maximum-power-transfer-when-conjugate-matched)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; POWER FACTOR
    ;;; SOURCE: Standard EE; Hayt & Kemmerly, Engineering Circuit
    ;;; Analysis, 8th ed.
    ;;; PF = cos(phi) = P_real / P_apparent.
    ;;; Ratio of real power to apparent power in AC circuit.
    ;;; ═══════════════════════════════════════════════════════════

    (power-factor
      (AC-circuit-with-reactive-load)
      (PF-equals-cos-phi-real-over-apparent-power)
      ((AC-circuit-with-reactive-load . real-power-P-watts-does-useful-work)
       (real-power-P-watts-does-useful-work . reactive-power-Q-VAR-stored-and-returned)
       (reactive-power-Q-VAR-stored-and-returned . apparent-power-S-VA-equals-V-rms-times-I-rms)
       (apparent-power-S-VA-equals-V-rms-times-I-rms . S-squared-equals-P-squared-plus-Q-squared)
       (S-squared-equals-P-squared-plus-Q-squared . power-factor-equals-P-over-S-equals-cos-phi)
       (power-factor-equals-P-over-S-equals-cos-phi . unity-PF-purely-resistive-no-reactive)
       (unity-PF-purely-resistive-no-reactive . low-PF-means-wasted-current-capacity)
       (low-PF-means-wasted-current-capacity . corrected-by-adding-capacitors-or-inductors)
       (corrected-by-adding-capacitors-or-inductors . PF-equals-cos-phi-real-over-apparent-power)))

  )

  ((engineering . engineering-registered)))
