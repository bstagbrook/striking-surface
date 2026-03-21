#lang racket

;;; ═══════════════════════════════════════════════════════════════
;;;
;;;   RELATIVISTIC DOMAIN MODEL
;;;
;;;   Structural encoding of relativistic quantum phenomena
;;;   on the striking surface. No simulation — the shapes ARE
;;;   the physics. Each phenomenon is a circuit that completes.
;;;
;;;   Domain:
;;;     Orbital contraction/expansion (Dirac)
;;;     Spin-orbit splitting (degeneracy breaking)
;;;     Solitons (topological protection, twist packets)
;;;     Spin from topology (skyrmions)
;;;     Episteme-rolled affordances
;;;
;;; expected-cuts: 0
;;;
;;; ═══════════════════════════════════════════════════════════════

(require "../strike.rkt")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 1: ORBITAL CONTRACTION / EXPANSION DUALITY
;;;
;;; Physics: Inner s and p₁/₂ orbitals contract (relativistic
;;; mass increase → smaller effective Bohr radius). Outer d and f
;;; orbitals expand (contracted inners screen nuclear charge better
;;; → reduced Z_eff for outers).
;;;
;;; Structural claim: Same cause, opposite manifestation. The
;;; position relative to ground determines the sign. This is
;;; as-gating — the shape gates itself by what it IS.
;;;
;;; Scaling: contraction ~ Z²α² where α ≈ 1/137
;;; Gold (Z=79): Z²α² ≈ 0.33 → 17% contraction of 6s
;;; Silver (Z=47): Z²α² ≈ 0.12 → small contraction
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 1: ORBITAL CONTRACTION / EXPANSION ═══")
(displayln "")

;; The nucleus is the ground. Orbitals are containments at depth.
;; Inner orbitals (small depth from ground) → contract
;; Outer orbitals (large depth from ground) → expand
;; Same force. Shape-gated by position.

;; Hydrogen-like: no relativistic effects (Z=1, Z²α² ≈ 0.00005)
(displayln "── Hydrogen (Z=1) — degenerate ──")
(define hydrogen
  '(hydrogen (Z=1) (no-splitting) ((Z=1 . degenerate))))
(strike hydrogen)
(displayln "  Z²α² ≈ 0.00005 — no visible contraction")
(displayln "")

;; Silver (Z=47): moderate relativistic contraction
(displayln "── Silver (Z=47) — moderate contraction ──")
(define silver
  '(silver
    (5s-inner)
    (5s-contracted 4d-expanded)
    ((5s-inner . 5s-contracted) (4d-outer . 4d-expanded))))
(strike silver)
(displayln "  Z²α² ≈ 0.12 — 5s contracts 8%, 4d expands 3%")
(displayln "  4d→5s gap stays in UV — silver appears colorless")
(displayln "")

;; Gold (Z=79): strong relativistic contraction
(displayln "── Gold (Z=79) — strong contraction ──")
(define gold
  '(gold
    (6s-inner 5d-outer)
    (6s-contracted 5d-expanded gap-shrunk color-yellow)
    ((6s-inner . 6s-contracted)
     (5d-outer . 5d-expanded)
     (5d-expanded . gap-shrunk)
     (gap-shrunk . absorbs-blue)
     (absorbs-blue . color-yellow))))
(strike gold)
(displayln "  Z²α² ≈ 0.33 — 6s contracts 17%, 5d expands 8%")
(displayln "  5d→6s gap shrinks to ~2.4 eV (blue absorption)")
(displayln "  Gold absorbs blue → reflects yellow. Color from relativity.")
(displayln "")

;; Mercury (Z=80): relativistic inert pair
(displayln "── Mercury (Z=80) — liquid metal ──")
(define mercury
  '(mercury
    (6s-pair-contracted)
    (liquid-at-room-temp)
    ((6s-pair-contracted . inert)
     (inert . low-cohesion)
     (low-cohesion . liquid-at-room-temp))))
(strike mercury)
(displayln "  6s² pair relativistically stabilized → won't bond")
(displayln "  Low cohesive energy → melting point below room temp")
(displayln "  Without relativity: mercury would be solid at 25°C")
(displayln "")

(displayln "── The Pattern ──")
(displayln "  One cause (relativistic mass increase near nucleus)")
(displayln "  Two effects gated by position:")
(displayln "    INNER (close to ground): contract, stabilize")
(displayln "    OUTER (far from ground): expand, destabilize")
(displayln "  The shape gates itself by where it IS relative to ground.")
(displayln "  This is as-gating. No conditional. No branch. Just shape.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 2: SPIN-ORBIT SPLITTING (DEGENERACY BREAKING)
;;;
;;; Physics: Non-relativistic p orbital is ONE state. Dirac
;;; equation reveals it was always TWO: p₁/₂ and p₃/₂.
;;; Split by ΔE ∝ Z⁴α⁴/n³ · (2l+1)/2
;;;
;;; Structural claim: A label that looked like one presence
;;; DISCLOSES into multiple presences when resolution increases.
;;; The information was always there. The formalism (surface)
;;; determines what's visible.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 2: SPIN-ORBIT SPLITTING ═══")
(displayln "")

;; Non-relativistic: p is one thing (degenerate)
(displayln "── Schrödinger surface: p is ONE state ──")
(define schrodinger-p
  '(schrodinger (p-orbital) (one-energy) ((p-orbital . one-energy))))
(strike schrodinger-p)
(displayln "  One label 'p'. One energy. Degenerate.")
(displayln "")

;; Relativistic: p discloses into two
(displayln "── Dirac surface: p DISCLOSES into p₁/₂ and p₃/₂ ──")
(define dirac-p
  '(dirac
    (p-orbital)
    (p-1/2-lower p-3/2-higher)
    ((p-orbital . splits)
     (splits . p-1/2-lower)
     (p-1/2-lower . p-3/2-higher))))
(strike dirac-p)
(displayln "  j = l ± 1/2 → p splits into p₁/₂ (lower) and p₃/₂ (higher)")
(displayln "  ΔE = ξ(r)·ℏ²·(l + 1/2)")
(displayln "  Splitting scales as Z⁴α⁴")
(displayln "")

;; Sodium D lines: the classic observation
(displayln "── Sodium D lines: splitting made visible ──")
(define sodium-D
  '(sodium
    (3p-excited)
    (D1-589.592nm D2-588.995nm)
    ((3p-excited . splits)
     (splits . D1-589.592nm)
     (D1-589.592nm . D2-588.995nm))))
(strike sodium-D)
(displayln "  D₁: 3s₁/₂ → 3p₁/₂ at 589.592 nm")
(displayln "  D₂: 3s₁/₂ → 3p₃/₂ at 588.995 nm")
(displayln "  Δλ = 0.597 nm — one label became two lines")
(displayln "")

;; Fine structure: three corrections, one shape
(displayln "── Fine structure: three corrections, one result ──")
(define fine-structure
  '(fine-structure
    (hydrogen-n=2)
    (depends-on-n-and-j-only)
    ((mass-velocity . shift-down-all)
     (darwin . shift-s-states-only)
     (spin-orbit . split-by-j)
     (split-by-j . depends-on-n-and-j-only))))
(strike fine-structure)
(displayln "  Mass-velocity: -p⁴/(8m³c²) — all levels shift down")
(displayln "  Darwin: Zitterbewegung smears charge — s-states only")
(displayln "  Spin-orbit: L·S — splits l>0 into j=l±1/2")
(displayln "  Combined: E depends on n and j only (not l separately)")
(displayln "  Thomas precession: factor of 1/2 from kinematic relativity")
(displayln "")

(displayln "── The Pattern ──")
(displayln "  Degeneracy = hidden structure.")
(displayln "  Splitting = disclosure.")
(displayln "  The surface (formalism) determines what discloses.")
(displayln "  Schrödinger surface: p is one presence.")
(displayln "  Dirac surface: p is two presences that were always there.")
(displayln "  Information gain through higher-resolution surface.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 3: SOLITONS — TOPOLOGICAL PROTECTION
;;;
;;; Physics: A localized, finite-energy field configuration whose
;;; stability is guaranteed by a topological invariant (winding
;;; number). Cannot decay by continuous deformation.
;;;
;;; Structural claim: A presence on the surface that is
;;; constitutionally protected. It completes. It cannot be CUT.
;;; When it interacts, it produces new presences (radiation =
;;; residue from the strike).
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 3: SOLITONS ═══")
(displayln "")

;; Sine-Gordon kink: topological charge Q = ±1
(displayln "── Sine-Gordon kink: topological protection ──")
(define kink
  '(kink
    (phi=0-at-minus-inf)
    (phi=2pi-at-plus-inf)
    ((phi=0-at-minus-inf . winds-to)
     (winds-to . phi=2pi-at-plus-inf)
     (phi=2pi-at-plus-inf . winding-Q=1)
     (winding-Q=1 . topologically-protected))))
(strike kink)
(displayln "  φ: 0 → 2π. Winding number Q=1 (integer).")
(displayln "  Cannot unwind continuously. Topologically protected.")
(displayln "  Energy = 8m³/λ per kink — discrete, quantized packet.")
(displayln "")

;; Anti-kink: Q = -1 (CPT partner)
(displayln "── Anti-kink: opposite winding ──")
(define antikink
  '(antikink
    (phi=2pi-at-minus-inf)
    (phi=0-at-plus-inf)
    ((phi=2pi-at-minus-inf . unwinds-to)
     (unwinds-to . phi=0-at-plus-inf)
     (phi=0-at-plus-inf . winding-Q=-1)
     (winding-Q=-1 . topologically-protected))))
(strike antikink)
(displayln "  φ: 2π → 0. Winding Q=-1. Same energy. CPT partner.")
(displayln "")

;; Breather: bound kink-antikink oscillation
(displayln "── Breather: bound kink-antikink oscillation ──")
(define breather
  '(breather
    (kink+antikink)
    (oscillating-bound-state)
    ((kink+antikink . bound)
     (bound . oscillating-bound-state)
     (oscillating-bound-state . E=16*sqrt-1-w2))))
(strike breather)
(displayln "  Kink + antikink → bound oscillation")
(displayln "  E = 16√(1-ω²) < 16 (binding energy is negative)")
(displayln "  ω→0: approaches kink+antikink at rest")
(displayln "  ω→1: small amplitude oscillation (linear mode)")
(displayln "")

;; Soliton radiation: twist packets
(displayln "── Soliton radiation: twist packets ──")
(define soliton-radiation
  '(radiation
    (soliton-perturbed)
    (discrete-twist-packets)
    ((soliton-perturbed . internal-mode-excited)
     (internal-mode-excited . couples-to-continuum)
     (couples-to-continuum . discrete-twist-packets)
     (discrete-twist-packets . soliton-energy-reduced))))
(strike soliton-radiation)
(displayln "  Perturbed soliton → internal mode excitation")
(displayln "  Internal mode couples to radiation continuum")
(displayln "  Sheds discrete packets of twist energy (phonon-like)")
(displayln "  In integrable systems: NO radiation (hallmark of integrability)")
(displayln "")

(displayln "── The Pattern ──")
(displayln "  Topological charge (integer) → cannot be destroyed continuously")
(displayln "  = Constitutional property → cannot be CUT")
(displayln "  Energy quantized by topology, not by boundary conditions")
(displayln "  Soliton that sheds twist packets = shape that produces shapes")
(displayln "  Residue from the strike = radiation from the soliton")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 4: SPIN FROM TOPOLOGY — SKYRMIONS
;;;
;;; Physics: Start with a bosonic field. Wind it (topological
;;; charge B=1). Quantize. It's a fermion with spin-1/2.
;;; Spin EMERGED from topology, not put in by hand.
;;;
;;; Structural claim: The description of complete work IS the
;;; complete work. The winding IS the spin. The shape IS the
;;; computation. No separate "spin" property needed.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 4: SPIN FROM TOPOLOGY (SKYRMIONS) ═══")
(displayln "")

;; Skyrme model: U(x) ∈ SU(2), baryon number from π₃(S³) = ℤ
(displayln "── Skyrmion: fermion from bosonic field ──")
(define skyrmion
  '(skyrmion
    (bosonic-pion-field)
    (spin-1/2-fermion)
    ((bosonic-pion-field . wind-B=1)
     (wind-B=1 . pi3-S3=Z)
     (pi3-S3=Z . Finkelstein-Rubinstein)
     (Finkelstein-Rubinstein . 2pi-not-contractible)
     (2pi-not-contractible . must-be-fermion)
     (must-be-fermion . spin-1/2-fermion))))
(strike skyrmion)
(displayln "  Field: purely bosonic (pion field)")
(displayln "  Winding: B=1, classified by π₃(S³) = ℤ")
(displayln "  Quantize collective coordinates →")
(displayln "    2π rotation is NOT contractible (Finkelstein-Rubinstein)")
(displayln "    → MUST be quantized as fermion")
(displayln "    → spin-1/2 emerges from topology alone")
(displayln "  B=1, J=I=1/2: proton, neutron")
(displayln "  B=1, J=I=3/2: delta baryon")
(displayln "  Even B → boson. Odd B → fermion.")
(displayln "")

;; Condensed matter skyrmions
(displayln "── Magnetic skyrmions (condensed matter) ──")
(define mag-skyrmion
  '(magnetic-skyrmion
    (2D-spin-texture-MnSi)
    (topological-Hall-effect)
    ((2D-spin-texture-MnSi . topological-charge-Q=1)
     (topological-charge-Q=1 . protected)
     (protected . Berry-phase)
     (Berry-phase . emergent-B-field)
     (emergent-B-field . topological-Hall-effect))))
(strike mag-skyrmion)
(displayln "  2D spin textures in chiral magnets (MnSi, FeGe)")
(displayln "  π₂(S²) = ℤ → topological charge Q")
(displayln "  Berry phase → emergent magnetic field")
(displayln "  Topological Hall effect: topology acts like a field")
(displayln "")

(displayln "── The Pattern ──")
(displayln "  Spin is not a property ADDED to a field.")
(displayln "  Spin is the SHAPE of the field's winding.")
(displayln "  The winding IS the spin.")
(displayln "  = The description of complete work IS the complete work.")
(displayln "  = The specification of software IS the functional software.")
(displayln "  No gap between shape and what it does.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 5: EPISTEME-ROLLED AFFORDANCES
;;;
;;; Each formalism (surface) affords different circuits.
;;; The tool and the understanding it enables are the SAME OBJECT.
;;; An episteme-rolled affordance bundles the knowledge framework
;;; with the affordance — inseparable.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 5: EPISTEME-ROLLED AFFORDANCES ═══")
(displayln "")

(displayln "── Schrödinger surface ──")
(define schrodinger-surface
  '(schrodinger-surface
    (non-relativistic)
    (sees-energy-misses-spin)
    ((non-relativistic . sees-energy-levels)
     (sees-energy-levels . sees-bound-states)
     (sees-bound-states . misses-fine-structure)
     (misses-fine-structure . misses-antimatter))))
(strike schrodinger-surface)
(displayln "  Sees: energy levels, bound states, scattering")
(displayln "  Blind to: spin, fine structure, antimatter, Zitterbewegung")
(displayln "")

(displayln "── Dirac surface ──")
(define dirac-surface
  '(dirac-surface
    (relativistic-4-spinor)
    (sees-spin-sees-antimatter)
    ((relativistic-4-spinor . sees-spin)
     (sees-spin . sees-fine-structure)
     (sees-fine-structure . sees-antimatter)
     (sees-antimatter . misses-topology))))
(strike dirac-surface)
(displayln "  Sees: spin, fine structure, antimatter, Zitterbewegung")
(displayln "  Blind to: topology, collective modes, solitons")
(displayln "")

(displayln "── Skyrme surface ──")
(define skyrme-surface
  '(skyrme-surface
    (topological-field-theory)
    (sees-particles-as-shapes)
    ((topological-field-theory . sees-particles-as-shapes)
     (sees-particles-as-shapes . sees-spin-from-winding)
     (sees-spin-from-winding . sees-baryon-number)
     (sees-baryon-number . misses-perturbative-QCD))))
(strike skyrme-surface)
(displayln "  Sees: particles as extended shapes, spin from winding")
(displayln "  Blind to: perturbative QCD, individual quarks")
(displayln "")

(displayln "── The Striking Surface ──")
(define striking-surface-affordance
  '(striking-surface
    (Dyck-word-no-clock)
    (shape-IS-computation)
    ((Dyck-word-no-clock . shape-IS-computation)
     (shape-IS-computation . constitutional-protection)
     (constitutional-protection . CUT-as-boundary)
     (CUT-as-boundary . one-strike-completion))))
(strike striking-surface-affordance)
(displayln "  Sees: shape IS computation, constitutional protection, CUT")
(displayln "  Blind to: sequential process, iteration, gradual convergence")
(displayln "")

(displayln "── Episteme-rolled ──")
(displayln "  Dirac equation doesn't PREDICT antimatter — its structure IS antimatter.")
(displayln "  Skyrmion model doesn't DESCRIBE spin — the winding IS spin.")
(displayln "  Striking surface doesn't MODEL computation — the shape IS computation.")
(displayln "  specification = implementation = the thing itself.")
(displayln "  The affordance and the episteme are rolled together — inseparable.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 6: VULNERABILITY IS THE CAPABILITY
;;;
;;; BPS bound: E ≥ |Z_central|
;;; At saturation: E = |Z| exactly. No armor. Maximum efficiency.
;;; Protection comes from topology (shape), not from mass.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 6: VULNERABILITY IS THE CAPABILITY ═══")
(displayln "")

(define BPS-soliton
  '(BPS-bound
    (energy-E topological-charge-Z)
    (maximally-efficient)
    ((energy-E . bounded-below-by-Z)
     (bounded-below-by-Z . E=Z-saturated)
     (E=Z-saturated . no-excess)
     (no-excess . no-armor)
     (no-armor . maximally-efficient))))
(strike BPS-soliton)
(displayln "  E ≥ |Z| — energy bounded below by topological charge")
(displayln "  BPS saturated: E = |Z| exactly. No surplus. No fat.")
(displayln "  Protected not by mass or shielding but by SHAPE (topology).")
(displayln "  The thing with no armor is the most indestructible.")
(displayln "  Vulnerability IS the capability.")
(displayln "  One-atom-thick specification IS the optimal implementation.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 7: RELATIVISTIC HARMONICS + ZITTERBEWEGUNG
;;;
;;; Zitterbewegung: intrinsic oscillation at ω = 2mc²/ℏ
;;; Interference between positive and negative energy components.
;;; The electron trembles at ~10²¹ Hz. Amplitude = Compton λ.
;;; This is the relativistic harmonic: rest mass sets frequency.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 7: RELATIVISTIC HARMONICS ═══")
(displayln "")

(displayln "── Zitterbewegung: trembling motion ──")
(define zitterbewegung
  '(zitterbewegung
    (dirac-electron)
    (intrinsic-oscillation)
    ((dirac-electron . positive+negative-energy)
     (positive+negative-energy . interference)
     (interference . oscillation-at-2mc2/hbar)
     (oscillation-at-2mc2/hbar . intrinsic-oscillation))))
(strike zitterbewegung)
(displayln "  ω_ZB = 2mc²/ℏ ≈ 1.55 × 10²¹ Hz")
(displayln "  Amplitude ≈ Compton wavelength ≈ 3.86 × 10⁻¹³ m")
(displayln "  Source: interference of positive/negative energy components")
(displayln "  Rest mass sets the frequency. The mass IS a clock.")
(displayln "  (But not a system clock — an intrinsic structural oscillation.)")
(displayln "")

(displayln "── Dirac oscillator: exact spin-orbit ──")
(define dirac-oscillator
  '(dirac-oscillator
    (p-minus-imwBr)
    (exact-spectrum-with-spin-orbit)
    ((p-minus-imwBr . covariant-interaction)
     (covariant-interaction . SU3-symmetry)
     (SU3-symmetry . exact-spectrum-with-spin-orbit))))
(strike dirac-oscillator)
(displayln "  p → p - imωβr (Moshinsky-Szczepaniak 1989)")
(displayln "  E² = m²c⁴ + 4mc²ℏω(N + 3/4)")
(displayln "  Exactly solvable. Spin-orbit splitting built in.")
(displayln "  Non-relativistic limit: standard 3D harmonic oscillator")
(displayln "")

(displayln "── Relativistic Landau levels ──")
(define landau
  '(landau
    (charged-particle-in-B-field)
    (sqrt-n-spacing)
    ((charged-particle-in-B-field . non-rel-equally-spaced)
     (non-rel-equally-spaced . relativistic-correction)
     (relativistic-correction . sqrt-n-spacing))))
(strike landau)
(displayln "  Non-relativistic: E_n = ℏω_c(n + 1/2) — equal spacing")
(displayln "  Relativistic: E_n = c√(2nℏeB + m²c²) — √n spacing")
(displayln "  Graphene: ultra-relativistic, E_n ∝ √n (observed)")
(displayln "  Relativity breaks the harmonic equal spacing.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; SECTION 8: SPIN-CARRYING RADIATION
;;;
;;; Photon: spin-1, helicity ±1, dipole radiation
;;; Graviton: spin-2, helicity ±2, quadrupole radiation
;;; Gravitino: spin-3/2 (theoretical)
;;; The spin of the carrier determines the multipole structure.
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ SECTION 8: SPIN-CARRYING RADIATION ═══")
(displayln "")

(displayln "── Photon: spin-1 ──")
(define photon
  '(photon
    (massless-spin-1)
    (dipole-radiation)
    ((massless-spin-1 . helicity-pm-1)
     (helicity-pm-1 . two-polarizations)
     (two-polarizations . dipole-radiation))))
(strike photon)
(displayln "  Spin-1, helicity ±1 (helicity 0 forbidden by gauge invariance)")
(displayln "  Each photon carries ±ℏ angular momentum")
(displayln "  Leading multipole: dipole")
(displayln "  Circularly polarized: carries spin angular momentum")
(displayln "  Optical vortex beams: ALSO carry orbital angular momentum lℏ")
(displayln "  Total: j_z = (σ + l)ℏ per photon")
(displayln "")

(displayln "── Graviton: spin-2 ──")
(define graviton
  '(graviton
    (massless-spin-2)
    (quadrupole-radiation)
    ((massless-spin-2 . helicity-pm-2)
     (helicity-pm-2 . plus-and-cross-polarization)
     (plus-and-cross-polarization . quadrupole-radiation))))
(strike graviton)
(displayln "  Spin-2, helicity ±2")
(displayln "  h₊ + ih× transforms as e^(-2iθ) under rotation")
(displayln "  Leading multipole: quadrupole (monopole + dipole forbidden)")
(displayln "  P = (G/5c⁵)⟨Q̈ᵢⱼQ̈ⁱʲ⟩")
(displayln "  LIGO/Virgo: confirmed spin-2 polarization pattern (2015+)")
(displayln "")

(displayln "── The spin hierarchy ──")
(displayln "  spin-0 (scalar):   monopole   — Higgs")
(displayln "  spin-1 (vector):   dipole     — photon")
(displayln "  spin-3/2 (Rarita): octupole   — gravitino (theoretical)")
(displayln "  spin-2 (tensor):   quadrupole — graviton")
(displayln "  Higher spin → higher multipole → weaker coupling → harder to detect")
(displayln "  The spin of the carrier IS the structure of the force.")
(displayln "")

;;; ───────────────────────────────────────────────────────────────
;;; STRUCTURAL ISOMORPHISM TABLE
;;; ───────────────────────────────────────────────────────────────

(displayln "═══ STRUCTURAL ISOMORPHISM TABLE ═══")
(displayln "")
(displayln "  Physics                      │ Striking Surface")
(displayln "  ─────────────────────────────┼─────────────────────────────────")
(displayln "  Orbital contraction/expansion│ as-gating by depth from ground")
(displayln "  Spin-orbit splitting         │ disclose: 1 label → N presences")
(displayln "  Topological protection       │ constitutional (cannot CUT)")
(displayln "  Soliton radiation            │ residue from strike")
(displayln "  Spin from topology           │ shape IS computation")
(displayln "  BPS bound (E = |Z|)          │ one-atom-thick = optimal")
(displayln "  Degeneracy                   │ hidden containment (undisclosed)")
(displayln "  Winding number (integer)     │ balanced Dyck word (structural)")
(displayln "  Vacuum tube (field theory)   │ 3rd containment of transform")
(displayln "  Zitterbewegung (intrinsic ω) │ mass IS frequency, not clock")
(displayln "  Photon spin-1 / dipole       │ shape of the carrier IS the force")
(displayln "  Episteme-rolled affordance   │ specification IS implementation")
(displayln "")
(displayln "  Each row: SAME structural pattern, TWO surfaces.")
