#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Waves — the physics of oscillation and propagation
;;; LAYER: 07-waves
;;; DEPENDS ON: 01-particles (photon), 03-atoms (electron transitions)
;;; DEPENDED ON BY: 08-relativity, 09-electromagnetism, acoustics,
;;;   optics, signal processing, consciousness modeling
;;;
;;; PURPOSE: Foundational wave mechanics. Any periodic disturbance
;;; that propagates through a medium or through vacuum.
;;;
;;; SOURCES:
;;; [NIST-2022] CODATA 2022 fundamental constants
;;; [Hecht-2017] Hecht, Optics, 5th ed.
;;; [Halliday-2018] Halliday/Resnick, Fundamentals of Physics, 11th ed.
;;;
;;; CALIBRATION: waves.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-waves

  ((physics (wave-mechanics) (authoritative) ((wave-mechanics . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FUNDAMENTAL WAVE EQUATION
    ;;; v = fλ — velocity equals frequency times wavelength
    ;;; SOURCE: any physics textbook, foundational
    ;;; ═══════════════════════════════════════════════════════════

    (wave-equation
      (frequency . wavelength)
      (velocity)
      ((frequency . cycles-per-second-Hz)
       (wavelength . meters-per-cycle)
       (cycles-per-second-Hz . times-meters-per-cycle)
       (times-meters-per-cycle . meters-per-second)
       (meters-per-second . velocity)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SPEED OF LIGHT — exact, defined value
    ;;; SOURCE: [NIST-2022] defined constant since 1983
    ;;; ═══════════════════════════════════════════════════════════

    (speed-of-light
      (c)
      (exactly-299792458-m/s)
      ((c . defined-not-measured)
       (defined-not-measured . SI-definition-since-1983)
       (SI-definition-since-1983 . exactly-299792458-m/s)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELECTROMAGNETIC SPECTRUM — complete, by frequency
    ;;; All EM waves travel at c in vacuum.
    ;;; Classification by frequency/wavelength.
    ;;; SOURCE: [NIST-2022], IEEE, ITU standard bands
    ;;; ═══════════════════════════════════════════════════════════

    ;;; Radio waves: f < 300 GHz, λ > 1 mm
    (radio-waves
      (EM-wave)
      (frequency-below-300-GHz . wavelength-above-1-mm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-below-300-GHz)
       (frequency-below-300-GHz . wavelength-above-1-mm)
       (wavelength-above-1-mm . penetrates-atmosphere)
       (penetrates-atmosphere . used-for-communication)))

    ;;; Radio sub-bands (IEEE/ITU)
    (ELF (3-to-30-Hz) (wavelength-100000-to-10000-km)
      ((3-to-30-Hz . extremely-low-frequency)
       (extremely-low-frequency . submarine-communication)
       (submarine-communication . wavelength-100000-to-10000-km)))

    (VLF (3-to-30-kHz) (wavelength-100-to-10-km)
      ((3-to-30-kHz . very-low-frequency)
       (very-low-frequency . navigation-signals)
       (navigation-signals . wavelength-100-to-10-km)))

    (LF (30-to-300-kHz) (wavelength-10-to-1-km)
      ((30-to-300-kHz . low-frequency)
       (low-frequency . AM-longwave-radio)
       (AM-longwave-radio . wavelength-10-to-1-km)))

    (MF (300-kHz-to-3-MHz) (wavelength-1000-to-100-m)
      ((300-kHz-to-3-MHz . medium-frequency)
       (medium-frequency . AM-broadcast-radio)
       (AM-broadcast-radio . wavelength-1000-to-100-m)))

    (HF (3-to-30-MHz) (wavelength-100-to-10-m)
      ((3-to-30-MHz . high-frequency)
       (high-frequency . shortwave-radio-ionospheric-skip)
       (shortwave-radio-ionospheric-skip . wavelength-100-to-10-m)))

    (VHF (30-to-300-MHz) (wavelength-10-to-1-m)
      ((30-to-300-MHz . very-high-frequency)
       (very-high-frequency . FM-radio-and-TV)
       (FM-radio-and-TV . wavelength-10-to-1-m)))

    (UHF (300-MHz-to-3-GHz) (wavelength-1-m-to-100-mm)
      ((300-MHz-to-3-GHz . ultra-high-frequency)
       (ultra-high-frequency . cell-phones-WiFi-GPS)
       (cell-phones-WiFi-GPS . wavelength-1-m-to-100-mm)))

    (SHF (3-to-30-GHz) (wavelength-100-to-10-mm)
      ((3-to-30-GHz . super-high-frequency)
       (super-high-frequency . radar-satellite-5G)
       (radar-satellite-5G . wavelength-100-to-10-mm)))

    (EHF (30-to-300-GHz) (wavelength-10-to-1-mm)
      ((30-to-300-GHz . extremely-high-frequency)
       (extremely-high-frequency . millimeter-wave)
       (millimeter-wave . wavelength-10-to-1-mm)))

    ;;; Microwave: 300 MHz to 300 GHz (overlaps UHF-EHF)
    (microwaves
      (EM-wave)
      (frequency-300-MHz-to-300-GHz . wavelength-1-m-to-1-mm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-300-MHz-to-300-GHz)
       (frequency-300-MHz-to-300-GHz . wavelength-1-m-to-1-mm)
       (wavelength-1-m-to-1-mm . resonates-with-water-molecules)
       (resonates-with-water-molecules . microwave-heating)
       (microwave-heating . also-radar-and-communication)))

    ;;; Infrared: 300 GHz to 430 THz, λ 1 mm to 700 nm
    (infrared
      (EM-wave)
      (frequency-300-GHz-to-430-THz . wavelength-1-mm-to-700-nm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-300-GHz-to-430-THz)
       (frequency-300-GHz-to-430-THz . wavelength-1-mm-to-700-nm)
       (wavelength-1-mm-to-700-nm . thermal-radiation)
       (thermal-radiation . all-objects-above-absolute-zero-emit)))

    (near-infrared (wavelength-700-nm-to-1400-nm) (fiber-optic-communication)
      ((wavelength-700-nm-to-1400-nm . fiber-optic-communication)
       (fiber-optic-communication . near-infrared)))

    (mid-infrared (wavelength-1400-nm-to-3000-nm) (molecular-spectroscopy)
      ((wavelength-1400-nm-to-3000-nm . molecular-spectroscopy)
       (molecular-spectroscopy . mid-infrared)))

    (thermal-infrared (wavelength-3-to-15-um) (thermal-imaging)
      ((wavelength-3-to-15-um . body-heat-detection)
       (body-heat-detection . thermal-imaging)
       (thermal-imaging . thermal-infrared)))

    (far-infrared (wavelength-15-um-to-1-mm) (terahertz-gap)
      ((wavelength-15-um-to-1-mm . terahertz-gap)
       (terahertz-gap . far-infrared)))

    ;;; Visible light: 430 THz to 750 THz, λ 700 nm to 400 nm
    ;;; SOURCE: CIE standard observer
    (visible-light
      (EM-wave)
      (frequency-430-to-750-THz . wavelength-700-to-400-nm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-430-to-750-THz)
       (frequency-430-to-750-THz . wavelength-700-to-400-nm)
       (wavelength-700-to-400-nm . detectable-by-human-eye)
       (detectable-by-human-eye . photoreceptor-absorption)))

    (red (wavelength-620-to-700-nm) (lowest-visible-frequency)
      ((wavelength-620-to-700-nm . lowest-visible-frequency)
       (lowest-visible-frequency . red)))

    (orange (wavelength-590-to-620-nm) (between-red-and-yellow)
      ((wavelength-590-to-620-nm . orange)))

    (yellow (wavelength-570-to-590-nm) (sodium-D-line)
      ((wavelength-570-to-590-nm . yellow)))

    (green (wavelength-495-to-570-nm) (peak-human-sensitivity)
      ((wavelength-495-to-570-nm . peak-human-sensitivity)
       (peak-human-sensitivity . green)))

    (blue (wavelength-450-to-495-nm) (Rayleigh-scattering)
      ((wavelength-450-to-495-nm . blue)))

    (violet (wavelength-400-to-450-nm) (highest-visible-frequency)
      ((wavelength-400-to-450-nm . highest-visible-frequency)
       (highest-visible-frequency . violet)))

    ;;; Ultraviolet: 750 THz to 30 PHz, λ 400 nm to 10 nm
    (ultraviolet
      (EM-wave)
      (frequency-750-THz-to-30-PHz . wavelength-400-to-10-nm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-750-THz-to-30-PHz)
       (frequency-750-THz-to-30-PHz . wavelength-400-to-10-nm)
       (wavelength-400-to-10-nm . ionizing-at-short-wavelengths)
       (ionizing-at-short-wavelengths . causes-DNA-damage)))

    (UV-A (wavelength-315-to-400-nm) (causes-skin-aging)
      ((wavelength-315-to-400-nm . reaches-earths-surface)
       (reaches-earths-surface . causes-skin-aging)
       (causes-skin-aging . UV-A)))

    (UV-B (wavelength-280-to-315-nm) (causes-sunburn-and-vitamin-D)
      ((wavelength-280-to-315-nm . partially-absorbed-by-ozone)
       (partially-absorbed-by-ozone . causes-sunburn-and-vitamin-D)
       (causes-sunburn-and-vitamin-D . UV-B)))

    (UV-C (wavelength-100-to-280-nm) (germicidal)
      ((wavelength-100-to-280-nm . fully-absorbed-by-ozone)
       (fully-absorbed-by-ozone . germicidal)
       (germicidal . UV-C)))

    ;;; X-rays: 30 PHz to 30 EHz, λ 10 nm to 10 pm
    (x-rays
      (EM-wave)
      (frequency-30-PHz-to-30-EHz . wavelength-10-nm-to-10-pm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-30-PHz-to-30-EHz)
       (frequency-30-PHz-to-30-EHz . wavelength-10-nm-to-10-pm)
       (wavelength-10-nm-to-10-pm . ionizing-radiation)
       (ionizing-radiation . penetrates-soft-tissue)
       (penetrates-soft-tissue . medical-imaging-and-crystallography)))

    ;;; Gamma rays: f > 30 EHz, λ < 10 pm
    (gamma-rays
      (EM-wave)
      (frequency-above-30-EHz . wavelength-below-10-pm)
      ((EM-wave . travels-at-c)
       (travels-at-c . frequency-above-30-EHz)
       (frequency-above-30-EHz . wavelength-below-10-pm)
       (wavelength-below-10-pm . highest-energy-EM)
       (highest-energy-EM . nuclear-decay-and-cosmic-sources)
       (nuclear-decay-and-cosmic-sources . deeply-ionizing)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WAVE-PARTICLE DUALITY
    ;;; SOURCE: de Broglie 1924 (Nobel 1929), confirmed by
    ;;; Davisson-Germer 1927 (Nobel 1937)
    ;;; ═══════════════════════════════════════════════════════════

    (photon-energy
      (single-photon)
      (E-equals-hf)
      ((single-photon . energy-proportional-to-frequency)
       (energy-proportional-to-frequency . E-equals-hf)
       (E-equals-hf . h-is-Planck-constant)
       (h-is-Planck-constant . 6.62607015e-34-J-s-exact)))

    (de-Broglie-wavelength
      (any-particle-with-momentum-p)
      (lambda-equals-h-over-p)
      ((any-particle-with-momentum-p . has-wave-nature)
       (has-wave-nature . wavelength-inversely-proportional-to-momentum)
       (wavelength-inversely-proportional-to-momentum . lambda-equals-h-over-p)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SOUND WAVES — mechanical, require medium
    ;;; SOURCE: [Halliday-2018] standard acoustics
    ;;; ═══════════════════════════════════════════════════════════

    (sound-wave
      (mechanical-longitudinal-wave)
      (requires-medium)
      ((mechanical-longitudinal-wave . compression-and-rarefaction)
       (compression-and-rarefaction . propagates-through-matter)
       (propagates-through-matter . requires-medium)
       (requires-medium . cannot-travel-through-vacuum)))

    (speed-of-sound-air
      (in-dry-air-20C)
      (343-m/s)
      ((in-dry-air-20C . depends-on-temperature)
       (depends-on-temperature . 331-plus-0.6T)
       (331-plus-0.6T . at-20C-equals-343-m/s)
       (at-20C-equals-343-m/s . 343-m/s)))

    (speed-of-sound-water
      (in-water-25C)
      (1497-m/s)
      ((in-water-25C . denser-medium-faster-propagation)
       (denser-medium-faster-propagation . 1497-m/s)))

    (speed-of-sound-steel
      (in-steel)
      (5960-m/s)
      ((in-steel . solid-fastest-propagation)
       (solid-fastest-propagation . 5960-m/s)))

    (human-hearing
      (healthy-young-human)
      (20-Hz-to-20000-Hz)
      ((healthy-young-human . cochlear-hair-cells)
       (cochlear-hair-cells . mechanical-to-electrical-transduction)
       (mechanical-to-electrical-transduction . 20-Hz-to-20000-Hz)))

    (infrasound (below-20-Hz) (below-human-hearing)
      ((below-20-Hz . below-human-hearing)
       (below-human-hearing . elephants-and-whales-communicate)
       (elephants-and-whales-communicate . earthquake-precursors)
       (earthquake-precursors . infrasound)))

    (ultrasound (above-20000-Hz) (above-human-hearing)
      ((above-20000-Hz . above-human-hearing)
       (above-human-hearing . medical-imaging-sonar)
       (medical-imaging-sonar . bat-echolocation)
       (bat-echolocation . ultrasound)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WAVE PROPERTIES — universal
    ;;; ═══════════════════════════════════════════════════════════

    (superposition
      (two-or-more-waves-at-same-point)
      (amplitudes-add)
      ((two-or-more-waves-at-same-point . linear-superposition-principle)
       (linear-superposition-principle . constructive-when-in-phase)
       (constructive-when-in-phase . destructive-when-out-of-phase)
       (destructive-when-out-of-phase . amplitudes-add)))

    (interference
      (superposition-of-coherent-waves)
      (stable-pattern-of-maxima-and-minima)
      ((superposition-of-coherent-waves . same-frequency-constant-phase)
       (same-frequency-constant-phase . constructive-at-path-diff-n-lambda)
       (constructive-at-path-diff-n-lambda . destructive-at-path-diff-half-lambda)
       (destructive-at-path-diff-half-lambda . stable-pattern-of-maxima-and-minima)))

    (diffraction
      (wave-encountering-obstacle-or-aperture)
      (bending-around-edges)
      ((wave-encountering-obstacle-or-aperture . significant-when-lambda-comparable-to-obstacle)
       (significant-when-lambda-comparable-to-obstacle . bending-around-edges)))

    (reflection
      (wave-hitting-boundary)
      (angle-of-incidence-equals-angle-of-reflection)
      ((wave-hitting-boundary . some-energy-bounces-back)
       (some-energy-bounces-back . angle-of-incidence-equals-angle-of-reflection)))

    (refraction
      (wave-crossing-boundary-between-media)
      (direction-changes-per-Snell-law)
      ((wave-crossing-boundary-between-media . speed-changes)
       (speed-changes . wavelength-changes-frequency-stays-same)
       (wavelength-changes-frequency-stays-same . direction-changes-per-Snell-law)))

    (doppler-effect
      (relative-motion-between-source-and-observer)
      (observed-frequency-shifts)
      ((relative-motion-between-source-and-observer . approaching-increases-frequency)
       (approaching-increases-frequency . receding-decreases-frequency)
       (receding-decreases-frequency . observed-frequency-shifts)))

    (resonance
      (driving-frequency-matches-natural-frequency)
      (maximum-amplitude-transfer)
      ((driving-frequency-matches-natural-frequency . energy-builds-constructively)
       (energy-builds-constructively . amplitude-grows)
       (amplitude-grows . maximum-amplitude-transfer)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PLANCK'S CONSTANT — exact, defined
    ;;; SOURCE: [NIST-2022] defined since 2019 SI redefinition
    ;;; ═══════════════════════════════════════════════════════════

    (Planck-constant
      (h)
      (exactly-6.62607015e-34-J-s)
      ((h . defined-not-measured)
       (defined-not-measured . SI-definition-since-2019)
       (SI-definition-since-2019 . exactly-6.62607015e-34-J-s)))

    (reduced-Planck-constant
      (h-bar)
      (1.054571817e-34-J-s)
      ((h-bar . h-divided-by-2-pi)
       (h-divided-by-2-pi . 1.054571817e-34-J-s)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BLACKBODY RADIATION
    ;;; SOURCE: Planck 1900, standard thermodynamics
    ;;; ═══════════════════════════════════════════════════════════

    (blackbody-radiation
      (object-at-temperature-T)
      (emits-continuous-spectrum)
      ((object-at-temperature-T . thermal-equilibrium)
       (thermal-equilibrium . emits-all-frequencies)
       (emits-all-frequencies . peak-at-Wien-displacement)
       (peak-at-Wien-displacement . lambda-max-equals-b-over-T)
       (lambda-max-equals-b-over-T . b-equals-2897768-um-K)
       (b-equals-2897768-um-K . emits-continuous-spectrum)))

    (Stefan-Boltzmann
      (total-power-radiated)
      (proportional-to-T-to-fourth)
      ((total-power-radiated . P-equals-sigma-A-T4)
       (P-equals-sigma-A-T4 . sigma-equals-5.670374419e-8-W/m2K4)
       (sigma-equals-5.670374419e-8-W/m2K4 . proportional-to-T-to-fourth)))

  )

  ((physics . waves-registered)))
