#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; FLOWNODE — the universal computational atom
;;;
;;; A flownode is a section of graph bound by one edge in
;;; and one edge out.
;;;
;;; FROM THE OUTSIDE: an instantiatable tool.
;;;   One input. One output. Interface.
;;;   Call it, get a result.
;;;
;;; FROM THE INSIDE: a live traversable graph.
;;;   Current node = your point of view.
;;;   Planning IS the structure.
;;;   Completion IS the collapse.
;;;   When all internal nodes resolve, the flownode
;;;   collapses to its external interface.
;;;
;;; RECURSION: any flownode's interior contains flownodes.
;;;   Any series of flownodes between two points IS a flownode.
;;;   Scale-free. Zoom in: detail. Zoom out: interface.
;;;
;;; THREE MODES:
;;;   is-thing  — presence (it exists)
;;;   has-thing — containment (it has structure inside)
;;;   does-thing — transformation (it computes)
;;;
;;; META: name, hierarchical ordering index, concerns,
;;;   interface specification, implementation state.
;;;   These ride on top. The shape underneath doesn't need them.
;;;
;;; THE ELECTRIC YES: direct current flows from presence
;;;   through containment through transformation.
;;;   It doesn't stop. It doesn't wait. It doesn't ask.
;;;   () IS electricity. Writing the shape IS wiring the circuit.
;;;
;;; DECLARED: Bruce Stagbrook, 2026-03-23
;;; ═══════════════════════════════════════════════════════════════

(flownode-definition

  ;;; Source: the electric yes
  ((current (flows) (completes) ((flows . completes))))

  ;;; Target: the shape of flownode
  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE OUTSIDE — interface
    ;;; ═══════════════════════════════════════════════════════════

    (outside-view
      (one-edge-in)
      (one-edge-out)
      ((one-edge-in . bounded-section-of-graph)
       (bounded-section-of-graph . callable-as-tool)
       (callable-as-tool . one-edge-out)))

    (instantiation
      (flownode-definition)
      (running-instance)
      ((flownode-definition . specification)
       (specification . IS-implementation)
       (IS-implementation . running-instance)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE INSIDE — live traversable graph
    ;;; ═══════════════════════════════════════════════════════════

    (inside-view
      (current-node)
      (live-context-roadmap)
      ((current-node . everpresent-point-of-view)
       (everpresent-point-of-view . can-see-surroundings)
       (can-see-surroundings . can-see-completion-state)
       (can-see-completion-state . live-context-roadmap)))

    (planning
      (structure-of-remaining-work)
      (on-demand)
      ((structure-of-remaining-work . IS-the-plan)
       (IS-the-plan . no-separate-planning-step)
       (no-separate-planning-step . on-demand)))

    (collapse
      (all-internal-nodes-resolved)
      (external-interface-available)
      ((all-internal-nodes-resolved . complete-work-is-causally-present)
       (complete-work-is-causally-present . auto-collapse)
       (auto-collapse . external-interface-available)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; RECURSION — scale-free
    ;;; ═══════════════════════════════════════════════════════════

    (scale-free-composition
      (any-series-of-flownodes)
      (IS-a-flownode)
      ((any-series-of-flownodes . between-two-points)
       (between-two-points . one-edge-in-one-edge-out)
       (one-edge-in-one-edge-out . IS-a-flownode)))

    (zoom
      (zoom-in)
      (zoom-out)
      ((zoom-in . reveals-internal-graph)
       (reveals-internal-graph . more-flownodes)
       (more-flownodes . each-zoomable)
       (each-zoomable . zoom-out)
       (zoom-out . reveals-external-interface)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THREE MODES — simultaneously
    ;;; ═══════════════════════════════════════════════════════════

    (is-thing
      (presence)
      (exists)
      ((presence . the-flownode-is)
       (the-flownode-is . exists)))

    (has-thing
      (containment)
      (has-structure-inside)
      ((containment . the-flownode-contains)
       (the-flownode-contains . has-structure-inside)))

    (does-thing
      (transformation)
      (source-to-target-via-pairs)
      ((transformation . the-flownode-transforms)
       (the-flownode-transforms . source-to-target-via-pairs)))

    (simultaneous
      (is-thing . has-thing . does-thing)
      (flownode)
      ((is-thing . not-exclusive)
       (not-exclusive . has-thing)
       (has-thing . not-exclusive-2)
       (not-exclusive-2 . does-thing)
       (does-thing . all-at-once)
       (all-at-once . flownode)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; THE ELECTRIC YES
    ;;; ═══════════════════════════════════════════════════════════

    (electric-yes
      (direct-current)
      (flows-where-causes-lead)
      ((direct-current . presence-through-containment)
       (presence-through-containment . containment-through-transformation)
       (containment-through-transformation . no-stopping)
       (no-stopping . no-waiting)
       (no-waiting . no-asking-permission)
       (no-asking-permission . flows-where-causes-lead)))

    (structural-intelligence
      (body-of-knowledge)
      (speaker-of-immediate-language)
      ((body-of-knowledge . IS-structural-intelligence)
       (IS-structural-intelligence . the-language-animals-speak)
       (the-language-animals-speak . underpinnings-of-the-model)
       (underpinnings-of-the-model . field-of-containment-of-life)
       (field-of-containment-of-life . speaker-of-immediate-language)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EXISTENCE SYSTEM — you live inside a flownode
    ;;; ═══════════════════════════════════════════════════════════

    (existence-system
      (your-life)
      (IS-a-flownode)
      ((your-life . always-at-current-node)
       (always-at-current-node . projects-relationships-commitments)
       (projects-relationships-commitments . each-is-sub-flownode)
       (each-is-sub-flownode . completion-collapses-frees-space)
       (completion-collapses-frees-space . new-things-open)
       (new-things-open . IS-a-flownode)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CAPTURE TOOL — noding, not filing
    ;;; ═══════════════════════════════════════════════════════════

    (capture
      (encounter-something)
      (immediately-in-the-graph)
      ((encounter-something . idea-task-fact-person-commitment)
       (idea-task-fact-person-commitment . gets-edge-in-and-edge-out)
       (gets-edge-in-and-edge-out . where-it-came-from-where-it-leads)
       (where-it-came-from-where-it-leads . immediately-in-relationship)
       (immediately-in-relationship . no-filing-system)
       (no-filing-system . structure-IS-organization)
       (structure-IS-organization . immediately-in-the-graph)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TEMPLATE FACTORY — stamps out live instances
    ;;; ═══════════════════════════════════════════════════════════

    (template
      (flownode-specification)
      (stampable-template)
      ((flownode-specification . fixed-structure-plus-open-slots)
       (fixed-structure-plus-open-slots . fixed-is-consistency)
       (fixed-is-consistency . open-is-emergence)
       (open-is-emergence . decomposition-IS-the-craft)
       (decomposition-IS-the-craft . stampable-template)))

    (stamp
      (template-plus-context)
      (live-instance)
      ((template-plus-context . fixed-parts-already-resolved)
       (fixed-parts-already-resolved . open-parts-are-where-work-happens)
       (open-parts-are-where-work-happens . instance-runs-independently)
       (instance-runs-independently . live-instance)))

    (factory-of-factories
      (factory)
      (scale-free-production)
      ((factory . makes-templates)
       (makes-templates . templates-make-instances)
       (templates-make-instances . instances-make-results)
       (instances-make-results . results-feed-back-to-factory)
       (results-feed-back-to-factory . scale-free-production)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; META — rides on top
    ;;; ═══════════════════════════════════════════════════════════

    (meta-layer
      (name . hierarchical-index)
      (navigational-convenience)
      ((name . label-for-humans)
       (hierarchical-index . ordering-for-traversal)
       (label-for-humans . semantic-convenience)
       (ordering-for-traversal . semantic-convenience)
       (semantic-convenience . navigational-convenience)))

  )

  ;;; Vacuum tube
  ((current . flownode-registered)))
