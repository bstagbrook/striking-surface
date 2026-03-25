#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; NUCLEONS & NUCLEI — QUARKS CONTAINED IN HADRONS
;;;
;;; Quarks (051) are confined into hadrons by the strong force.
;;; Baryons = 3 quarks (color singlet: R+G+B).
;;; Mesons = quark + antiquark.
;;; Nuclei = protons + neutrons bound by residual strong force.
;;;
;;; SOURCE: PDG 2024, standard nuclear physics
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-nucleons-and-nuclei

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: nucleon and nuclear domain
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HADRON CLASSIFICATION
    ;;; SOURCE: standard particle physics
    ;;; ═══════════════════════════════════════════════════════════

    (baryon-definition
      (three-quarks)
      (color-singlet-RGB)
      ((three-quarks . one-red-one-green-one-blue)
       (one-red-one-green-one-blue . color-singlet-RGB)
       (color-singlet-RGB . half-integer-spin)))

    (meson-definition
      (quark-antiquark-pair)
      (color-singlet-R-antiR)
      ((quark-antiquark-pair . color-anticolor)
       (color-anticolor . color-singlet-R-antiR)
       (color-singlet-R-antiR . integer-spin)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PROTON — uud, stable, charge +1
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    (proton
      (up-up-down)
      (charge-plus-1 . mass-938.272-MeV)
      ((up-up-down . 2/3-plus-2/3-minus-1/3-equals-plus-1)
       (2/3-plus-2/3-minus-1/3-equals-plus-1 . charge-plus-1)
       (charge-plus-1 . stable)
       (stable . lifetime-greater-than-1e34-years)
       (lifetime-greater-than-1e34-years . mass-938.272-MeV)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEUTRON — udd, unstable when free, stable in nuclei
    ;;; SOURCE: PDG 2024
    ;;; ═══════════════════════════════════════════════════════════

    (neutron
      (up-down-down)
      (charge-0 . mass-939.565-MeV)
      ((up-down-down . 2/3-minus-1/3-minus-1/3-equals-0)
       (2/3-minus-1/3-minus-1/3-equals-0 . charge-0)
       (charge-0 . free-neutron-unstable)
       (free-neutron-unstable . half-life-611-seconds)
       (half-life-611-seconds . decays-to-proton-electron-antineutrino)
       (decays-to-proton-electron-antineutrino . mass-939.565-MeV)))

    ;;; Mass difference: neutron 1.293 MeV heavier than proton
    ;;; This drives beta decay
    ;;; SOURCE: PDG 2024
    (neutron-proton-mass-difference
      (mass-neutron-minus-mass-proton)
      (1.293-MeV)
      ((mass-neutron-minus-mass-proton . 1.293-MeV)
       (1.293-MeV . enables-beta-decay)
       (enables-beta-decay . down-quark-to-up-quark-via-W-minus)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NUCLEAR BINDING — residual strong force
    ;;; SOURCE: standard nuclear physics
    ;;; ═══════════════════════════════════════════════════════════

    ;;; The force binding nucleons is NOT the fundamental strong force.
    ;;; It is the RESIDUAL strong force (like van der Waals is residual EM).
    ;;; Mediated effectively by pion exchange.
    (nuclear-force
      (residual-strong-force)
      (binds-nucleons-in-nucleus)
      ((residual-strong-force . not-fundamental-strong-force)
       (not-fundamental-strong-force . analogous-to-van-der-Waals)
       (analogous-to-van-der-Waals . pion-exchange-effective-model)
       (pion-exchange-effective-model . range-1-to-3-femtometers)
       (range-1-to-3-femtometers . binds-nucleons-in-nucleus)))

    ;;; Binding energy per nucleon peaks at iron-56
    ;;; SOURCE: standard nuclear physics
    (binding-energy-curve
      (binding-energy-per-nucleon)
      (peaks-at-Fe-56-8.8-MeV)
      ((binding-energy-per-nucleon . increases-up-to-iron)
       (increases-up-to-iron . peaks-at-Fe-56-8.8-MeV)
       (peaks-at-Fe-56-8.8-MeV . decreases-for-heavier-nuclei)
       (decreases-for-heavier-nuclei . fusion-releases-energy-below-iron)
       (fusion-releases-energy-below-iron . fission-releases-energy-above-iron)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ISOTOPES — same Z, different N
    ;;; SOURCE: standard nuclear physics
    ;;; ═══════════════════════════════════════════════════════════

    (isotope-definition
      (same-proton-number-Z)
      (different-neutron-number-N)
      ((same-proton-number-Z . same-element-same-chemistry)
       (different-neutron-number-N . different-mass-number-A)
       (same-element-same-chemistry . different-mass-number-A)
       (different-mass-number-A . some-stable-some-radioactive)))

    ;;; Hydrogen isotopes — simplest example
    ;;; SOURCE: standard reference
    (hydrogen-1H
      (protium)
      (1-proton-0-neutrons)
      ((protium . stable)
       (stable . 1-proton-0-neutrons)))

    (hydrogen-2H
      (deuterium)
      (1-proton-1-neutron)
      ((deuterium . stable)
       (stable . 1-proton-1-neutron)))

    (hydrogen-3H
      (tritium)
      (1-proton-2-neutrons)
      ((tritium . unstable-half-life-12.3-years)
       (unstable-half-life-12.3-years . beta-decays-to-helium-3)
       (beta-decays-to-helium-3 . 1-proton-2-neutrons)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIOLOGICALLY RELEVANT NUCLEI
    ;;; The elements that matter for life
    ;;; SOURCE: standard biochemistry
    ;;; ═══════════════════════════════════════════════════════════

    ;;; CHONPS — the 6 elements of life (98.5% of body mass)
    (CHONPS
      (carbon-hydrogen-oxygen-nitrogen-phosphorus-sulfur)
      (98.5-pct-of-human-body-mass)
      ((carbon-hydrogen-oxygen-nitrogen-phosphorus-sulfur . the-6-elements-of-life)
       (the-6-elements-of-life . form-all-biological-macromolecules)
       (form-all-biological-macromolecules . 98.5-pct-of-human-body-mass)))

    ;;; Key nuclei and their role in biology
    (carbon-12
      (6-protons-6-neutrons)
      (backbone-of-organic-molecules)
      ((6-protons-6-neutrons . stable)
       (stable . 4-covalent-bonds)
       (4-covalent-bonds . backbone-of-organic-molecules)))

    (nitrogen-14
      (7-protons-7-neutrons)
      (amino-acids-and-nucleic-acids)
      ((7-protons-7-neutrons . stable)
       (stable . 3-covalent-bonds)
       (3-covalent-bonds . amino-acids-and-nucleic-acids)))

    (oxygen-16
      (8-protons-8-neutrons)
      (water-and-respiration)
      ((8-protons-8-neutrons . stable)
       (stable . 2-covalent-bonds)
       (2-covalent-bonds . highly-electronegative)
       (highly-electronegative . water-and-respiration)))

    (phosphorus-31
      (15-protons-16-neutrons)
      (ATP-DNA-backbone)
      ((15-protons-16-neutrons . stable)
       (stable . 5-covalent-bonds)
       (5-covalent-bonds . phosphodiester-bonds)
       (phosphodiester-bonds . ATP-DNA-backbone)))

  )

  ;;; Vacuum tube
  ((tesla . nucleons-and-nuclei-registered)))
