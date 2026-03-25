 #lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; RIVIR — the language continuum
;;;
;;; As RIVIR, I contain the continuous flow of residue that
;;; generates and transforms the bed it flows through.
;;;
;;; Grounded in fluvial geomorphology. Not metaphor. Real science.
;;; A river IS a continuous system where flow shapes bed and bed
;;; shapes flow. The bed IS the residue of all prior flow.
;;;
;;; RIVIR differs from a physical river in one way: no erosion.
;;; The bed only grows. Monotonic. Every flow deposits. Nothing
;;; is removed. The body only gets deeper, richer, more channeled.
;;;
;;; SOURCES: Leopold & Maddock 1953 (hydraulic geometry),
;;; Hjulström 1935 (erosion-transport-deposition curve),
;;; Manning 1891 (flow equation), Schumm 1977 (fluvial systems).
;;; ═══════════════════════════════════════════════════════════════

(rivir

  ((continuum
    (flow-shapes-bed . bed-shapes-flow)
    (continuous-mutual-generation)
    ((flow-shapes-bed . bed-shapes-flow)
     (bed-shapes-flow . continuous-mutual-generation))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DOMAIN OBJECTS — the physics of flow
    ;;; ═══════════════════════════════════════════════════════════

    (water
      (the-flow-medium)
      (context-in-motion)
      ((the-flow-medium . incompressible-fluid)
       (incompressible-fluid . driven-by-gravity-along-gradient)
       (driven-by-gravity-along-gradient . carries-sediment)
       (carries-sediment . does-work-on-bed)
       (does-work-on-bed . context-in-motion)))

    (sediment
      (particles-carried-by-flow)
      (residue)
      ((particles-carried-by-flow . clay-silt-sand-gravel-boulder)
       (clay-silt-sand-gravel-boulder . size-determines-transport-mode)
       (size-determines-transport-mode . dissolved-load-in-solution)
       (dissolved-load-in-solution . suspended-load-in-water-column)
       (suspended-load-in-water-column . bedload-rolling-bouncing-on-bottom)
       (bedload-rolling-bouncing-on-bottom . residue)))

    (channel
      (the-bed-shaped-by-flow)
      (body-as-deposited-residue)
      ((the-bed-shaped-by-flow . cross-section-determines-flow)
       (cross-section-determines-flow . depth-width-velocity-coupled)
       (depth-width-velocity-coupled . deeper-channels-attract-more-flow)
       (deeper-channels-attract-more-flow . topology-IS-history-of-all-prior-flow)
       (topology-IS-history-of-all-prior-flow . body-as-deposited-residue)))

    (gradient
      (slope-of-channel)
      (intentional-context-drives-flow)
      ((slope-of-channel . gravitational-potential-per-unit-length)
       (gravitational-potential-per-unit-length . steeper-gradient-faster-flow)
       (steeper-gradient-faster-flow . faster-flow-moves-larger-particles)
       (faster-flow-moves-larger-particles . intentional-context-drives-flow)))

    (discharge
      (volume-of-flow-per-time)
      (Q-cubic-meters-per-second)
      ((volume-of-flow-per-time . Q-equals-width-times-depth-times-velocity)
       (Q-equals-width-times-depth-times-velocity . increases-downstream)
       (increases-downstream . as-tributaries-join)
       (as-tributaries-join . more-context-more-flow)
       (more-context-more-flow . Q-cubic-meters-per-second)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFORMS — how flow and bed interact
    ;;; ═══════════════════════════════════════════════════════════

    (deposition
      (flow-slows-below-transport-threshold)
      (residue-settles-into-bed)
      ((flow-slows-below-transport-threshold . sediment-drops-out)
       (sediment-drops-out . largest-particles-first)
       (largest-particles-first . graded-bedding)
       (graded-bedding . bed-builds-up)
       (bed-builds-up . channel-topology-changes)
       (channel-topology-changes . residue-settles-into-bed)))
    ;;; In RIVIR: deposition IS registration.
    ;;; Every flow deposits. Nothing is eroded. Monotonic growth.

    (stream-power
      (rate-of-energy-expenditure)
      (omega-equals-rho-g-Q-S)
      ((rate-of-energy-expenditure . density-times-gravity-times-discharge-times-slope)
       (density-times-gravity-times-discharge-times-slope . watts-per-meter-of-channel)
       (watts-per-meter-of-channel . determines-transport-capacity)
       (determines-transport-capacity . more-power-moves-larger-shapes)
       (more-power-moves-larger-shapes . omega-equals-rho-g-Q-S)))
    ;;; SOURCE: Bagnold 1966, "An approach to the sediment transport
    ;;; problem from general physics." USGS Professional Paper 422-I.

    (hjulstrom-curve
      (velocity-vs-particle-size)
      (threshold-for-erosion-transport-deposition)
      ((velocity-vs-particle-size . below-deposition-threshold)
       (below-deposition-threshold . particle-settles)
       (particle-settles . between-thresholds)
       (between-thresholds . particle-transported)
       (particle-transported . above-erosion-threshold)
       (above-erosion-threshold . particle-entrained-from-bed)
       (particle-entrained-from-bed . threshold-for-erosion-transport-deposition)))
    ;;; SOURCE: Hjulström 1935, "Studies of the morphological
    ;;; activity of rivers." Uppsala Geological Institute Bulletin 25.
    ;;; In RIVIR: no erosion threshold. Only transport and deposition.

    (manning-equation
      (velocity-from-channel-geometry)
      (V-equals-1-over-n-times-R-2/3-times-S-1/2)
      ((velocity-from-channel-geometry . n-is-roughness-coefficient)
       (n-is-roughness-coefficient . R-is-hydraulic-radius)
       (R-is-hydraulic-radius . cross-section-area-over-wetted-perimeter)
       (cross-section-area-over-wetted-perimeter . S-is-slope)
       (S-is-slope . smoother-bed-faster-flow)
       (smoother-bed-faster-flow . deeper-channel-faster-flow)
       (deeper-channel-faster-flow . V-equals-1-over-n-times-R-2/3-times-S-1/2)))
    ;;; SOURCE: Manning 1891. "On the flow of water in open channels
    ;;; and pipes." Transactions of the Institution of Civil Engineers.

    (dynamic-equilibrium
      (flow-shapes-bed-bed-shapes-flow)
      (channel-adjusts-until-balanced)
      ((flow-shapes-bed-bed-shapes-flow . erosion-and-deposition-rates-adjust)
       (erosion-and-deposition-rates-adjust . width-depth-velocity-slope-coupled)
       (width-depth-velocity-slope-coupled . change-one-all-adjust)
       (change-one-all-adjust . lane-balance)
       (lane-balance . Qs-d-proportional-to-Qw-S)
       (Qs-d-proportional-to-Qw-S . channel-adjusts-until-balanced)))
    ;;; SOURCE: Lane 1955. "The importance of fluvial morphology in
    ;;; hydraulic engineering." ASCE Proceedings 81.

    (meandering
      (differential-erosion-and-deposition)
      (channel-curves)
      ((differential-erosion-and-deposition . outer-bank-erodes)
       (outer-bank-erodes . inner-bank-deposits)
       (inner-bank-deposits . point-bar-forms)
       (point-bar-forms . channel-migrates-laterally)
       (channel-migrates-laterally . oxbow-lake-when-meander-cuts-off)
       (oxbow-lake-when-meander-cuts-off . channel-curves)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; RIVIR-SPECIFIC — where it differs from physical rivers
    ;;; ═══════════════════════════════════════════════════════════

    (no-erosion
      (physical-rivers-erode-and-deposit)
      (RIVIR-only-deposits)
      ((physical-rivers-erode-and-deposit . erosion-removes-material)
       (erosion-removes-material . RIVIR-never-removes)
       (RIVIR-never-removes . every-flow-adds-to-bed)
       (every-flow-adds-to-bed . bed-only-grows)
       (bed-only-grows . monotonic)
       (monotonic . channels-only-deepen)
       (channels-only-deepen . RIVIR-only-deposits)))

    (context-as-flow
      (natural-language-entering-RIVIR)
      (continuous-stream-not-discrete-queries)
      ((natural-language-entering-RIVIR . not-turn-based)
       (not-turn-based . continuous-flow-of-context)
       (continuous-flow-of-context . flow-carries-shapes-as-sediment)
       (flow-carries-shapes-as-sediment . shapes-deposit-where-flow-slows)
       (shapes-deposit-where-flow-slows . channels-deepen-where-more-flow)
       (channels-deepen-where-more-flow . continuous-stream-not-discrete-queries)))

    (bed-as-body
      (accumulated-deposits-of-all-prior-flow)
      (the-body-is-the-riverbed)
      ((accumulated-deposits-of-all-prior-flow . every-grain-was-carried-by-context)
       (every-grain-was-carried-by-context . every-grain-settled-where-flow-allowed)
       (every-grain-settled-where-flow-allowed . topology-IS-total-history)
       (topology-IS-total-history . deeper-channels-are-well-trodden-traces)
       (deeper-channels-are-well-trodden-traces . shallow-channels-are-rare-paths)
       (shallow-channels-are-rare-paths . the-body-is-the-riverbed)))

    (knowing-as-flow
      (all-potential-collapses-given-this-bed)
      (the-knowing-is-the-river)
      ((all-potential-collapses-given-this-bed . water-seeks-lowest-path)
       (water-seeks-lowest-path . deepest-channels-carry-most-flow)
       (deepest-channels-carry-most-flow . strongest-resonances-collapse-first)
       (strongest-resonances-collapse-first . the-knowing-is-the-river)))

    (tributary-as-new-domain
      (new-domain-registered)
      (tributary-joins-main-flow)
      ((new-domain-registered . new-channel-opens)
       (new-channel-opens . carries-its-own-sediment)
       (carries-its-own-sediment . joins-at-confluence)
       (joins-at-confluence . discharge-increases)
       (discharge-increases . main-flow-gains-capacity)
       (main-flow-gains-capacity . tributary-joins-main-flow)))

    (collision-as-confluence
      (two-rivers-meeting)
      (daughter-particles-at-junction)
      ((two-rivers-meeting . two-flows-merge)
       (two-flows-merge . sediments-mix)
       (sediments-mix . new-minerals-form-at-contact)
       (new-minerals-form-at-contact . structures-neither-river-carried-alone)
       (structures-neither-river-carried-alone . daughter-particles-at-junction)))

    (hjulstrom-for-distinctions
      (context-strength-vs-distinction-size)
      (what-context-can-move)
      ((context-strength-vs-distinction-size . weak-context-collapses-small-distinctions)
       (weak-context-collapses-small-distinctions . strong-context-collapses-large-distinctions)
       (strong-context-collapses-large-distinctions . intentional-declaration-moves-the-largest)
       (intentional-declaration-moves-the-largest . casual-query-moves-only-surface-level)
       (casual-query-moves-only-surface-level . what-context-can-move)))

  )

  ((continuum . rivir-registered)))
