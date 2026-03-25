#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Neuroscience
;;; LAYER: 13-neuroscience
;;; DEPENDS ON: 04-molecules (neurotransmitter chemistry),
;;;   05-amino-acids (receptor proteins), 09-electromagnetism (ion currents)
;;; DEPENDED ON BY: cognitive science, pharmacology, psychiatry,
;;;   brain-computer interfaces
;;;
;;; PURPOSE: The nervous system — neurons, signaling, brain
;;; organization, and the physical basis of behavior and cognition.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Kandel-6th] Kandel, Schwartz, Jessell, Siegelbaum, Hudspeth.
;;;   Principles of Neural Science, 6th ed. (2021).
;;; [Purves-6th] Purves, Augustine, Fitzpatrick, et al.
;;;   Neuroscience, 6th ed. (2018).
;;; [Bear-4th] Bear, Connors, Paradiso. Neuroscience: Exploring
;;;   the Brain, 4th ed. (2016).
;;; [Hodgkin-Huxley-1952] Hodgkin & Huxley, J. Physiol. 117:500-544.
;;; [Hebb-1949] Hebb, The Organization of Behavior (1949).
;;; [Rizzolatti-1996] Rizzolatti et al., Brain Res. 3(2):131-141.
;;; [Raichle-2001] Raichle et al., PNAS 98(2):676-682.
;;; [Tononi-2004] Tononi, BMC Neuroscience 5:42 (2004).
;;; [Dehaene-2011] Dehaene & Changeux, Neuron 70(2):200-227.
;;; [Thayer-2012] Thayer et al., Neurosci Biobehav Rev 36(2):747-756.
;;;
;;; UNITS: mV for membrane potentials. ms for time constants.
;;;   Hz for frequencies. m/s for conduction velocity.
;;;
;;; CALIBRATION: (pending) neuroscience.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-neuroscience

  ((Kandel-6th (Principles-of-Neural-Science-6th-ed-2021) (authoritative) ((Principles-of-Neural-Science-6th-ed-2021 . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEURON STRUCTURE
    ;;; The neuron is the fundamental signaling unit of the
    ;;; nervous system. ~86 billion neurons in the human brain.
    ;;; SOURCE: [Kandel-6th] Ch. 2; [Purves-6th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (neuron-soma
      (cell-body)
      (contains-nucleus-and-organelles)
      ((cell-body . metabolic-center-of-neuron)
       (metabolic-center-of-neuron . contains-nucleus)
       (contains-nucleus . protein-synthesis-occurs-here)
       (protein-synthesis-occurs-here . integrates-synaptic-inputs)
       (integrates-synaptic-inputs . diameter-10-to-50-micrometers)
       (diameter-10-to-50-micrometers . contains-nucleus-and-organelles)))

    (neuron-dendrites
      (branching-extensions-from-soma)
      (receive-synaptic-inputs)
      ((branching-extensions-from-soma . increase-receptive-surface-area)
       (increase-receptive-surface-area . contain-dendritic-spines)
       (contain-dendritic-spines . spines-are-postsynaptic-sites)
       (spines-are-postsynaptic-sites . graded-potentials-propagate-to-soma)
       (graded-potentials-propagate-to-soma . receive-synaptic-inputs)))

    (neuron-axon
      (single-long-projection-from-soma)
      (conducts-action-potentials)
      ((single-long-projection-from-soma . originates-at-axon-hillock)
       (originates-at-axon-hillock . axon-hillock-is-trigger-zone)
       (axon-hillock-is-trigger-zone . highest-density-of-Na-channels)
       (highest-density-of-Na-channels . can-extend-up-to-1-meter-in-humans)
       (can-extend-up-to-1-meter-in-humans . branches-into-axon-terminals)
       (branches-into-axon-terminals . conducts-action-potentials)))

    (myelin-sheath
      (insulating-lipid-wrapping-around-axon)
      (increases-conduction-velocity)
      ((insulating-lipid-wrapping-around-axon . formed-by-oligodendrocytes-in-CNS)
       (formed-by-oligodendrocytes-in-CNS . formed-by-Schwann-cells-in-PNS)
       (formed-by-Schwann-cells-in-PNS . interrupted-by-nodes-of-Ranvier)
       (interrupted-by-nodes-of-Ranvier . enables-saltatory-conduction)
       (enables-saltatory-conduction . velocity-up-to-120-m/s-myelinated)
       (velocity-up-to-120-m/s-myelinated . vs-0.5-to-10-m/s-unmyelinated)
       (vs-0.5-to-10-m/s-unmyelinated . increases-conduction-velocity)))

    (synaptic-terminals
      (axon-terminal-boutons)
      (release-neurotransmitters)
      ((axon-terminal-boutons . contain-synaptic-vesicles)
       (contain-synaptic-vesicles . vesicles-filled-with-neurotransmitter)
       (vesicles-filled-with-neurotransmitter . calcium-influx-triggers-exocytosis)
       (calcium-influx-triggers-exocytosis . neurotransmitter-released-into-synaptic-cleft)
       (neurotransmitter-released-into-synaptic-cleft . cleft-width-20-to-40-nm)
       (cleft-width-20-to-40-nm . release-neurotransmitters)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; ACTION POTENTIAL
    ;;; The all-or-none electrical signal that propagates along
    ;;; the axon. Described by Hodgkin & Huxley (1952).
    ;;; SOURCE: [Hodgkin-Huxley-1952]; [Kandel-6th] Ch. 7-9
    ;;; ═══════════════════════════════════════════════════════════

    (resting-potential
      (neuron-at-rest)
      (membrane-potential-minus-70-mV)
      ((neuron-at-rest . Na/K-ATPase-pumps-3-Na-out-2-K-in)
       (Na/K-ATPase-pumps-3-Na-out-2-K-in . K-leak-channels-open-at-rest)
       (K-leak-channels-open-at-rest . membrane-permeable-to-K-at-rest)
       (membrane-permeable-to-K-at-rest . K-equilibrium-potential-minus-80-mV)
       (K-equilibrium-potential-minus-80-mV . Na-equilibrium-potential-plus-60-mV)
       (Na-equilibrium-potential-plus-60-mV . resting-potential-near-E-K)
       (resting-potential-near-E-K . membrane-potential-minus-70-mV)))

    (action-potential-threshold
      (depolarization-from-synaptic-input)
      (threshold-at-minus-55-mV)
      ((depolarization-from-synaptic-input . graded-potentials-summate-at-axon-hillock)
       (graded-potentials-summate-at-axon-hillock . if-depolarization-reaches-threshold)
       (if-depolarization-reaches-threshold . voltage-gated-Na-channels-open)
       (voltage-gated-Na-channels-open . positive-feedback-loop)
       (positive-feedback-loop . all-or-none-response)
       (all-or-none-response . threshold-at-minus-55-mV)))

    (action-potential-depolarization
      (voltage-gated-Na-channels-open)
      (membrane-depolarizes-to-plus-30-mV)
      ((voltage-gated-Na-channels-open . Na-influx-down-electrochemical-gradient)
       (Na-influx-down-electrochemical-gradient . rapid-depolarization)
       (rapid-depolarization . overshoots-zero)
       (overshoots-zero . peaks-at-approximately-plus-30-mV)
       (peaks-at-approximately-plus-30-mV . Na-channels-inactivate-within-1-ms)
       (Na-channels-inactivate-within-1-ms . membrane-depolarizes-to-plus-30-mV)))

    (action-potential-repolarization
      (Na-channels-inactivate)
      (membrane-returns-to-resting-potential)
      ((Na-channels-inactivate . voltage-gated-K-channels-open-with-delay)
       (voltage-gated-K-channels-open-with-delay . K-efflux-repolarizes-membrane)
       (K-efflux-repolarizes-membrane . K-channels-slow-to-close)
       (K-channels-slow-to-close . transient-hyperpolarization-undershoot)
       (transient-hyperpolarization-undershoot . Na/K-ATPase-restores-ion-gradients)
       (Na/K-ATPase-restores-ion-gradients . membrane-returns-to-resting-potential)))

    (refractory-periods
      (after-action-potential)
      (limits-firing-frequency)
      ((after-action-potential . absolute-refractory-1-to-2-ms)
       (absolute-refractory-1-to-2-ms . Na-channels-inactivated-cannot-fire)
       (Na-channels-inactivated-cannot-fire . relative-refractory-3-to-4-ms)
       (relative-refractory-3-to-4-ms . stronger-stimulus-needed)
       (stronger-stimulus-needed . maximum-firing-rate-approximately-500-Hz)
       (maximum-firing-rate-approximately-500-Hz . limits-firing-frequency)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; SYNAPTIC TRANSMISSION
    ;;; Chemical and electrical communication between neurons.
    ;;; SOURCE: [Kandel-6th] Ch. 10-14; [Purves-6th] Ch. 5-6
    ;;; ═══════════════════════════════════════════════════════════

    (neurotransmitter-release
      (action-potential-arrives-at-terminal)
      (vesicle-fusion-and-exocytosis)
      ((action-potential-arrives-at-terminal . depolarizes-presynaptic-terminal)
       (depolarizes-presynaptic-terminal . voltage-gated-Ca-channels-open)
       (voltage-gated-Ca-channels-open . Ca-influx-into-terminal)
       (Ca-influx-into-terminal . Ca-binds-synaptotagmin)
       (Ca-binds-synaptotagmin . SNARE-complex-mediates-vesicle-fusion)
       (SNARE-complex-mediates-vesicle-fusion . vesicle-fusion-and-exocytosis)))

    (receptor-binding
      (neurotransmitter-in-synaptic-cleft)
      (postsynaptic-response)
      ((neurotransmitter-in-synaptic-cleft . binds-postsynaptic-receptors)
       (binds-postsynaptic-receptors . ionotropic-receptors-are-ligand-gated-channels)
       (ionotropic-receptors-are-ligand-gated-channels . metabotropic-receptors-activate-G-proteins)
       (metabotropic-receptors-activate-G-proteins . response-depends-on-receptor-type)
       (response-depends-on-receptor-type . terminated-by-reuptake-or-degradation)
       (terminated-by-reuptake-or-degradation . postsynaptic-response)))

    (excitatory-postsynaptic-potential
      (excitatory-neurotransmitter-binds)
      (EPSP-depolarizes-postsynaptic-membrane)
      ((excitatory-neurotransmitter-binds . Na-and-K-channels-open)
       (Na-and-K-channels-open . net-inward-current)
       (net-inward-current . local-depolarization)
       (local-depolarization . graded-response-1-to-20-mV)
       (graded-response-1-to-20-mV . summates-temporally-and-spatially)
       (summates-temporally-and-spatially . EPSP-depolarizes-postsynaptic-membrane)))

    (inhibitory-postsynaptic-potential
      (inhibitory-neurotransmitter-binds)
      (IPSP-hyperpolarizes-postsynaptic-membrane)
      ((inhibitory-neurotransmitter-binds . Cl-channels-or-K-channels-open)
       (Cl-channels-or-K-channels-open . net-outward-or-inward-negative-current)
       (net-outward-or-inward-negative-current . local-hyperpolarization)
       (local-hyperpolarization . moves-membrane-away-from-threshold)
       (moves-membrane-away-from-threshold . opposes-excitatory-inputs)
       (opposes-excitatory-inputs . IPSP-hyperpolarizes-postsynaptic-membrane)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; MAJOR NEUROTRANSMITTERS
    ;;; SOURCE: [Kandel-6th] Ch. 13-14; [Purves-6th] Ch. 6
    ;;; ═══════════════════════════════════════════════════════════

    (glutamate
      (primary-excitatory-neurotransmitter-in-CNS)
      (activates-AMPA-NMDA-and-mGlu-receptors)
      ((primary-excitatory-neurotransmitter-in-CNS . most-abundant-NT-in-brain)
       (most-abundant-NT-in-brain . amino-acid-neurotransmitter)
       (amino-acid-neurotransmitter . AMPA-receptors-mediate-fast-excitation)
       (AMPA-receptors-mediate-fast-excitation . NMDA-receptors-voltage-and-ligand-gated)
       (NMDA-receptors-voltage-and-ligand-gated . NMDA-requires-Mg-block-removal-by-depolarization)
       (NMDA-requires-Mg-block-removal-by-depolarization . NMDA-critical-for-synaptic-plasticity)
       (NMDA-critical-for-synaptic-plasticity . excess-glutamate-causes-excitotoxicity)
       (excess-glutamate-causes-excitotoxicity . activates-AMPA-NMDA-and-mGlu-receptors)))

    (GABA
      (primary-inhibitory-neurotransmitter-in-CNS)
      (activates-GABA-A-and-GABA-B-receptors)
      ((primary-inhibitory-neurotransmitter-in-CNS . gamma-aminobutyric-acid)
       (gamma-aminobutyric-acid . synthesized-from-glutamate-by-GAD)
       (synthesized-from-glutamate-by-GAD . GABA-A-is-ionotropic-Cl-channel)
       (GABA-A-is-ionotropic-Cl-channel . GABA-B-is-metabotropic-K-channel)
       (GABA-B-is-metabotropic-K-channel . benzodiazepines-enhance-GABA-A)
       (benzodiazepines-enhance-GABA-A . 20-pct-of-cortical-neurons-are-GABAergic)
       (20-pct-of-cortical-neurons-are-GABAergic . activates-GABA-A-and-GABA-B-receptors)))

    (dopamine
      (monoamine-neurotransmitter)
      (modulates-reward-motivation-and-motor-control)
      ((monoamine-neurotransmitter . synthesized-from-tyrosine)
       (synthesized-from-tyrosine . tyrosine-hydroxylase-is-rate-limiting)
       (tyrosine-hydroxylase-is-rate-limiting . mesolimbic-pathway-reward-and-motivation)
       (mesolimbic-pathway-reward-and-motivation . nigrostriatal-pathway-motor-control)
       (nigrostriatal-pathway-motor-control . loss-of-dopaminergic-neurons-in-substantia-nigra)
       (loss-of-dopaminergic-neurons-in-substantia-nigra . causes-Parkinson-disease)
       (causes-Parkinson-disease . five-receptor-subtypes-D1-through-D5)
       (five-receptor-subtypes-D1-through-D5 . modulates-reward-motivation-and-motor-control)))

    (serotonin
      (monoamine-neurotransmitter-5-HT)
      (modulates-mood-sleep-appetite)
      ((monoamine-neurotransmitter-5-HT . 5-hydroxytryptamine)
       (5-hydroxytryptamine . synthesized-from-tryptophan)
       (synthesized-from-tryptophan . tryptophan-hydroxylase-is-rate-limiting)
       (tryptophan-hydroxylase-is-rate-limiting . raphe-nuclei-are-primary-source)
       (raphe-nuclei-are-primary-source . projects-widely-throughout-brain)
       (projects-widely-throughout-brain . at-least-14-receptor-subtypes)
       (at-least-14-receptor-subtypes . SSRIs-block-serotonin-reuptake)
       (SSRIs-block-serotonin-reuptake . modulates-mood-sleep-appetite)))

    (acetylcholine
      (first-neurotransmitter-identified)
      (mediates-neuromuscular-and-autonomic-transmission)
      ((first-neurotransmitter-identified . discovered-by-Loewi-1921)
       (discovered-by-Loewi-1921 . synthesized-by-choline-acetyltransferase)
       (synthesized-by-choline-acetyltransferase . nicotinic-receptors-ionotropic)
       (nicotinic-receptors-ionotropic . muscarinic-receptors-metabotropic)
       (muscarinic-receptors-metabotropic . neuromuscular-junction-uses-nicotinic)
       (neuromuscular-junction-uses-nicotinic . parasympathetic-uses-muscarinic)
       (parasympathetic-uses-muscarinic . degraded-by-acetylcholinesterase)
       (degraded-by-acetylcholinesterase . basal-forebrain-cholinergic-loss-in-Alzheimer)
       (basal-forebrain-cholinergic-loss-in-Alzheimer . mediates-neuromuscular-and-autonomic-transmission)))

    (norepinephrine
      (monoamine-neurotransmitter-catecholamine)
      (modulates-arousal-attention-and-fight-or-flight)
      ((monoamine-neurotransmitter-catecholamine . synthesized-from-dopamine-by-DBH)
       (synthesized-from-dopamine-by-DBH . locus-coeruleus-is-primary-brain-source)
       (locus-coeruleus-is-primary-brain-source . projects-to-nearly-all-brain-regions)
       (projects-to-nearly-all-brain-regions . alpha-and-beta-adrenergic-receptors)
       (alpha-and-beta-adrenergic-receptors . enhances-signal-to-noise-ratio)
       (enhances-signal-to-noise-ratio . also-released-by-sympathetic-postganglionic-neurons)
       (also-released-by-sympathetic-postganglionic-neurons . modulates-arousal-attention-and-fight-or-flight)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; AUTONOMIC NERVOUS SYSTEM
    ;;; Two-division system controlling visceral functions.
    ;;; SOURCE: [Kandel-6th] Ch. 46; [Purves-6th] Ch. 21
    ;;; ═══════════════════════════════════════════════════════════

    (sympathetic-nervous-system
      (thoracolumbar-origin-T1-to-L2)
      (fight-or-flight-response)
      ((thoracolumbar-origin-T1-to-L2 . preganglionic-neurons-short)
       (preganglionic-neurons-short . synapse-in-paravertebral-or-prevertebral-ganglia)
       (synapse-in-paravertebral-or-prevertebral-ganglia . postganglionic-neurons-long)
       (postganglionic-neurons-long . postganglionic-releases-norepinephrine)
       (postganglionic-releases-norepinephrine . increases-heart-rate-and-contractility)
       (increases-heart-rate-and-contractility . dilates-pupils-mydriasis)
       (dilates-pupils-mydriasis . dilates-bronchioles)
       (dilates-bronchioles . inhibits-digestion)
       (inhibits-digestion . increases-blood-glucose)
       (increases-blood-glucose . redirects-blood-to-skeletal-muscle)
       (redirects-blood-to-skeletal-muscle . adrenal-medulla-releases-epinephrine)
       (adrenal-medulla-releases-epinephrine . fight-or-flight-response)))

    (parasympathetic-nervous-system
      (craniosacral-origin-CN-III-VII-IX-X-and-S2-S4)
      (rest-and-digest-response)
      ((craniosacral-origin-CN-III-VII-IX-X-and-S2-S4 . preganglionic-neurons-long)
       (preganglionic-neurons-long . synapse-in-ganglia-near-or-within-target-organ)
       (synapse-in-ganglia-near-or-within-target-organ . postganglionic-neurons-short)
       (postganglionic-neurons-short . postganglionic-releases-acetylcholine)
       (postganglionic-releases-acetylcholine . decreases-heart-rate)
       (decreases-heart-rate . constricts-pupils-miosis)
       (constricts-pupils-miosis . constricts-bronchioles)
       (constricts-bronchioles . stimulates-digestion-and-peristalsis)
       (stimulates-digestion-and-peristalsis . promotes-energy-storage)
       (promotes-energy-storage . vagus-nerve-CN-X-is-primary-parasympathetic)
       (vagus-nerve-CN-X-is-primary-parasympathetic . vagus-innervates-75-pct-of-parasympathetic-targets)
       (vagus-innervates-75-pct-of-parasympathetic-targets . rest-and-digest-response)))

    ;;; SOURCE: [Thayer-2012] Neurosci Biobehav Rev 36(2):747-756
    (parasympathetic-vagal-signature
      (individual-vagal-tone-pattern)
      (unique-per-person-like-fingerprint)
      ((individual-vagal-tone-pattern . measured-by-heart-rate-variability-HRV)
       (measured-by-heart-rate-variability-HRV . respiratory-sinus-arrhythmia-RSA)
       (respiratory-sinus-arrhythmia-RSA . high-frequency-HRV-0.15-to-0.4-Hz)
       (high-frequency-HRV-0.15-to-0.4-Hz . reflects-cardiac-vagal-control)
       (reflects-cardiac-vagal-control . stable-individual-differences-trait-like)
       (stable-individual-differences-trait-like . correlates-with-emotional-regulation-capacity)
       (correlates-with-emotional-regulation-capacity . higher-vagal-tone-predicts-better-stress-recovery)
       (higher-vagal-tone-predicts-better-stress-recovery . unique-per-person-like-fingerprint)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; CENTRAL NERVOUS SYSTEM
    ;;; Brain + spinal cord. Protected by meninges, CSF, BBB.
    ;;; SOURCE: [Kandel-6th] Ch. 15-17; [Purves-6th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (central-nervous-system
      (brain-and-spinal-cord)
      (integrative-center-of-nervous-system)
      ((brain-and-spinal-cord . protected-by-three-meninges)
       (protected-by-three-meninges . dura-mater-arachnoid-pia-mater)
       (dura-mater-arachnoid-pia-mater . bathed-in-cerebrospinal-fluid-CSF)
       (bathed-in-cerebrospinal-fluid-CSF . blood-brain-barrier-restricts-entry)
       (blood-brain-barrier-restricts-entry . brain-approximately-1400-g-in-adult)
       (brain-approximately-1400-g-in-adult . consumes-20-pct-of-body-oxygen)
       (consumes-20-pct-of-body-oxygen . spinal-cord-45-cm-length-in-adult)
       (spinal-cord-45-cm-length-in-adult . integrative-center-of-nervous-system)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; PERIPHERAL NERVOUS SYSTEM
    ;;; All neural tissue outside CNS: somatic + autonomic.
    ;;; SOURCE: [Kandel-6th] Ch. 46; [Purves-6th] Ch. 1
    ;;; ═══════════════════════════════════════════════════════════

    (peripheral-nervous-system
      (all-nerves-outside-brain-and-spinal-cord)
      (somatic-and-autonomic-divisions)
      ((all-nerves-outside-brain-and-spinal-cord . 12-pairs-of-cranial-nerves)
       (12-pairs-of-cranial-nerves . 31-pairs-of-spinal-nerves)
       (31-pairs-of-spinal-nerves . somatic-division-voluntary-motor-and-sensory)
       (somatic-division-voluntary-motor-and-sensory . autonomic-division-involuntary-visceral)
       (autonomic-division-involuntary-visceral . autonomic-has-sympathetic-and-parasympathetic)
       (autonomic-has-sympathetic-and-parasympathetic . sensory-afferent-motor-efferent)
       (sensory-afferent-motor-efferent . somatic-and-autonomic-divisions)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; BRAIN REGIONS
    ;;; Major functional areas and their roles.
    ;;; SOURCE: [Kandel-6th] Ch. 16-18, 48-67; [Purves-6th] Ch. 26-29
    ;;; ═══════════════════════════════════════════════════════════

    (cerebral-cortex
      (outermost-layer-of-cerebral-hemispheres)
      (higher-cognitive-functions)
      ((outermost-layer-of-cerebral-hemispheres . 2-to-4-mm-thick-gray-matter)
       (2-to-4-mm-thick-gray-matter . six-layers-in-neocortex)
       (six-layers-in-neocortex . approximately-16-billion-cortical-neurons)
       (approximately-16-billion-cortical-neurons . four-lobes-frontal-parietal-temporal-occipital)
       (four-lobes-frontal-parietal-temporal-occipital . frontal-lobe-executive-function-and-motor)
       (frontal-lobe-executive-function-and-motor . parietal-lobe-somatosensory-and-spatial)
       (parietal-lobe-somatosensory-and-spatial . temporal-lobe-auditory-and-language)
       (temporal-lobe-auditory-and-language . occipital-lobe-visual-processing)
       (occipital-lobe-visual-processing . higher-cognitive-functions)))

    (hippocampus
      (medial-temporal-lobe-structure)
      (essential-for-declarative-memory-formation)
      ((medial-temporal-lobe-structure . bilateral-seahorse-shaped)
       (bilateral-seahorse-shaped . three-layer-allocortex-not-six-layer)
       (three-layer-allocortex-not-six-layer . contains-place-cells)
       (contains-place-cells . place-cells-encode-spatial-location)
       (place-cells-encode-spatial-location . long-term-potentiation-first-described-here)
       (long-term-potentiation-first-described-here . lesion-causes-anterograde-amnesia)
       (lesion-causes-anterograde-amnesia . patient-HM-bilateral-resection-1953)
       (patient-HM-bilateral-resection-1953 . essential-for-declarative-memory-formation)))

    (amygdala
      (almond-shaped-nuclei-in-temporal-lobe)
      (processes-fear-and-emotional-memory)
      ((almond-shaped-nuclei-in-temporal-lobe . basolateral-and-central-nuclei)
       (basolateral-and-central-nuclei . receives-sensory-input-from-thalamus-and-cortex)
       (receives-sensory-input-from-thalamus-and-cortex . rapid-subcortical-fear-pathway-via-thalamus)
       (rapid-subcortical-fear-pathway-via-thalamus . slower-cortical-pathway-for-evaluation)
       (slower-cortical-pathway-for-evaluation . central-nucleus-outputs-to-hypothalamus-and-brainstem)
       (central-nucleus-outputs-to-hypothalamus-and-brainstem . mediates-fear-conditioning)
       (mediates-fear-conditioning . bilateral-lesion-causes-Kluver-Bucy-syndrome)
       (bilateral-lesion-causes-Kluver-Bucy-syndrome . processes-fear-and-emotional-memory)))

    (cerebellum
      (posterior-fossa-structure)
      (motor-coordination-and-learning)
      ((posterior-fossa-structure . contains-more-neurons-than-rest-of-brain)
       (contains-more-neurons-than-rest-of-brain . approximately-69-billion-granule-cells)
       (approximately-69-billion-granule-cells . three-layer-cortex-molecular-Purkinje-granular)
       (three-layer-cortex-molecular-Purkinje-granular . Purkinje-cells-are-sole-output)
       (Purkinje-cells-are-sole-output . Purkinje-cells-are-inhibitory-GABA)
       (Purkinje-cells-are-inhibitory-GABA . receives-mossy-and-climbing-fibers)
       (receives-mossy-and-climbing-fibers . damage-causes-ataxia-not-paralysis)
       (damage-causes-ataxia-not-paralysis . also-involved-in-cognitive-timing)
       (also-involved-in-cognitive-timing . motor-coordination-and-learning)))

    (brainstem
      (midbrain-pons-medulla-oblongata)
      (vital-autonomic-functions-and-cranial-nerve-nuclei)
      ((midbrain-pons-medulla-oblongata . connects-cerebrum-to-spinal-cord)
       (connects-cerebrum-to-spinal-cord . contains-10-of-12-cranial-nerve-nuclei)
       (contains-10-of-12-cranial-nerve-nuclei . medulla-controls-respiration-and-cardiovascular)
       (medulla-controls-respiration-and-cardiovascular . pons-relays-to-cerebellum)
       (pons-relays-to-cerebellum . midbrain-contains-superior-and-inferior-colliculi)
       (midbrain-contains-superior-and-inferior-colliculi . reticular-formation-regulates-arousal)
       (reticular-formation-regulates-arousal . damage-can-be-fatal)
       (damage-can-be-fatal . vital-autonomic-functions-and-cranial-nerve-nuclei)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEURAL CODING
    ;;; How information is represented in neural activity.
    ;;; SOURCE: [Kandel-6th] Ch. 21; [Purves-6th] Ch. 1, 10
    ;;; ═══════════════════════════════════════════════════════════

    (rate-coding
      (information-in-firing-rate)
      (mean-spike-count-over-time-window)
      ((information-in-firing-rate . Adrian-1926-first-demonstrated)
       (Adrian-1926-first-demonstrated . stronger-stimulus-higher-rate)
       (stronger-stimulus-higher-rate . averaged-over-100-ms-windows-typically)
       (averaged-over-100-ms-windows-typically . tuning-curves-describe-rate-vs-stimulus)
       (tuning-curves-describe-rate-vs-stimulus . robust-to-noise)
       (robust-to-noise . mean-spike-count-over-time-window)))

    (temporal-coding
      (information-in-precise-spike-timing)
      (millisecond-precision-timing-matters)
      ((information-in-precise-spike-timing . spike-timing-relative-to-oscillations)
       (spike-timing-relative-to-oscillations . phase-precession-in-hippocampal-place-cells)
       (phase-precession-in-hippocampal-place-cells . auditory-system-uses-sub-ms-timing)
       (auditory-system-uses-sub-ms-timing . interaural-time-difference-for-sound-localization)
       (interaural-time-difference-for-sound-localization . spike-timing-dependent-plasticity-STDP)
       (spike-timing-dependent-plasticity-STDP . millisecond-precision-timing-matters)))

    (population-coding
      (information-distributed-across-many-neurons)
      (population-vector-decodes-direction)
      ((information-distributed-across-many-neurons . Georgopoulos-1986-motor-cortex)
       (Georgopoulos-1986-motor-cortex . each-neuron-has-preferred-direction)
       (each-neuron-has-preferred-direction . vector-sum-of-population-predicts-movement)
       (vector-sum-of-population-predicts-movement . redundancy-increases-reliability)
       (redundancy-increases-reliability . noise-correlations-affect-information)
       (noise-correlations-affect-information . population-vector-decodes-direction)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; NEUROPLASTICITY
    ;;; Activity-dependent changes in synaptic strength.
    ;;; SOURCE: [Hebb-1949]; [Kandel-6th] Ch. 64-66
    ;;; ═══════════════════════════════════════════════════════════

    (hebbian-learning
      (correlated-pre-and-postsynaptic-activity)
      (strengthens-synaptic-connection)
      ((correlated-pre-and-postsynaptic-activity . cells-that-fire-together-wire-together)
       (cells-that-fire-together-wire-together . Hebb-1949-postulated)
       (Hebb-1949-postulated . cellular-basis-of-learning-and-memory)
       (cellular-basis-of-learning-and-memory . implemented-by-LTP-and-LTD)
       (implemented-by-LTP-and-LTD . NMDA-receptor-as-coincidence-detector)
       (NMDA-receptor-as-coincidence-detector . strengthens-synaptic-connection)))

    (long-term-potentiation
      (high-frequency-stimulation-of-pathway)
      (persistent-increase-in-synaptic-strength)
      ((high-frequency-stimulation-of-pathway . Bliss-and-Lomo-1973-hippocampus)
       (Bliss-and-Lomo-1973-hippocampus . NMDA-receptor-activation-required)
       (NMDA-receptor-activation-required . Ca-influx-triggers-CaMKII)
       (Ca-influx-triggers-CaMKII . AMPA-receptor-insertion-into-membrane)
       (AMPA-receptor-insertion-into-membrane . early-LTP-minutes-to-hours-protein-independent)
       (early-LTP-minutes-to-hours-protein-independent . late-LTP-hours-to-days-requires-protein-synthesis)
       (late-LTP-hours-to-days-requires-protein-synthesis . persistent-increase-in-synaptic-strength)))

    (long-term-depression
      (low-frequency-stimulation-of-pathway)
      (persistent-decrease-in-synaptic-strength)
      ((low-frequency-stimulation-of-pathway . 1-Hz-stimulation-for-10-to-15-minutes)
       (1-Hz-stimulation-for-10-to-15-minutes . moderate-Ca-influx)
       (moderate-Ca-influx . activates-protein-phosphatases)
       (activates-protein-phosphatases . AMPA-receptor-internalization)
       (AMPA-receptor-internalization . complementary-to-LTP)
       (complementary-to-LTP . essential-for-cerebellar-motor-learning)
       (essential-for-cerebellar-motor-learning . persistent-decrease-in-synaptic-strength)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; EEG FREQUENCY BANDS
    ;;; Extracellular field potentials recorded from scalp.
    ;;; SOURCE: [Kandel-6th] Ch. 50; [Purves-6th] Ch. 28;
    ;;; [Bear-4th] Ch. 19
    ;;; ═══════════════════════════════════════════════════════════

    (delta-waves
      (EEG-frequency-0.5-to-4-Hz)
      (deep-slow-wave-sleep-stage-3)
      ((EEG-frequency-0.5-to-4-Hz . highest-amplitude-EEG-rhythm)
       (highest-amplitude-EEG-rhythm . dominant-in-NREM-stage-3-sleep)
       (dominant-in-NREM-stage-3-sleep . generated-by-thalamocortical-circuits)
       (generated-by-thalamocortical-circuits . associated-with-memory-consolidation)
       (associated-with-memory-consolidation . pathological-if-present-in-waking-adult)
       (pathological-if-present-in-waking-adult . deep-slow-wave-sleep-stage-3)))

    (theta-waves
      (EEG-frequency-4-to-8-Hz)
      (hippocampal-activity-and-light-sleep)
      ((EEG-frequency-4-to-8-Hz . prominent-in-hippocampus-during-exploration)
       (prominent-in-hippocampus-during-exploration . associated-with-memory-encoding)
       (associated-with-memory-encoding . present-during-REM-sleep)
       (present-during-REM-sleep . present-during-drowsiness-stage-1-sleep)
       (present-during-drowsiness-stage-1-sleep . hippocampal-theta-coordinates-place-cells)
       (hippocampal-theta-coordinates-place-cells . hippocampal-activity-and-light-sleep)))

    (alpha-waves
      (EEG-frequency-8-to-13-Hz)
      (relaxed-wakefulness-eyes-closed)
      ((EEG-frequency-8-to-13-Hz . first-described-by-Berger-1929)
       (first-described-by-Berger-1929 . posterior-dominant-rhythm)
       (posterior-dominant-rhythm . most-prominent-over-occipital-cortex)
       (most-prominent-over-occipital-cortex . attenuates-with-eye-opening-or-mental-effort)
       (attenuates-with-eye-opening-or-mental-effort . alpha-blocking-or-desynchronization)
       (alpha-blocking-or-desynchronization . relaxed-wakefulness-eyes-closed)))

    (beta-waves
      (EEG-frequency-13-to-30-Hz)
      (active-thinking-and-concentration)
      ((EEG-frequency-13-to-30-Hz . low-amplitude-desynchronized)
       (low-amplitude-desynchronized . dominant-during-active-cognition)
       (dominant-during-active-cognition . present-during-alert-focused-attention)
       (present-during-alert-focused-attention . sensorimotor-beta-suppressed-during-movement)
       (sensorimotor-beta-suppressed-during-movement . beta-rebound-after-movement-completion)
       (beta-rebound-after-movement-completion . active-thinking-and-concentration)))

    (gamma-waves
      (EEG-frequency-30-to-100-Hz)
      (perceptual-binding-and-consciousness)
      ((EEG-frequency-30-to-100-Hz . typically-30-to-80-Hz-in-recordings)
       (typically-30-to-80-Hz-in-recordings . lowest-amplitude-EEG-rhythm)
       (lowest-amplitude-EEG-rhythm . associated-with-feature-binding)
       (associated-with-feature-binding . cross-modal-sensory-integration)
       (cross-modal-sensory-integration . increased-during-focused-attention)
       (increased-during-focused-attention . generated-by-fast-spiking-interneurons)
       (generated-by-fast-spiking-interneurons . proposed-correlate-of-conscious-awareness)
       (proposed-correlate-of-conscious-awareness . perceptual-binding-and-consciousness)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; CONSCIOUSNESS MARKERS
    ;;; Neural correlates and theoretical frameworks.
    ;;; SOURCE: [Dehaene-2011] Neuron 70(2):200-227;
    ;;; [Tononi-2004] BMC Neuroscience 5:42
    ;;; ═══════════════════════════════════════════════════════════

    (P300-component
      (event-related-potential-at-300-ms)
      (marker-of-conscious-detection)
      ((event-related-potential-at-300-ms . positive-deflection-300-to-600-ms-post-stimulus)
       (positive-deflection-300-to-600-ms-post-stimulus . maximal-over-parietal-cortex)
       (maximal-over-parietal-cortex . P3a-novelty-detection-frontocentral)
       (P3a-novelty-detection-frontocentral . P3b-target-detection-parietal)
       (P3b-target-detection-parietal . amplitude-correlates-with-stimulus-relevance)
       (amplitude-correlates-with-stimulus-relevance . absent-when-stimulus-is-not-consciously-perceived)
       (absent-when-stimulus-is-not-consciously-perceived . marker-of-conscious-detection)))

    (global-workspace-theory
      (Baars-1988-Dehaene-2011)
      (conscious-access-via-global-broadcast)
      ((Baars-1988-Dehaene-2011 . unconscious-processes-compete-for-access)
       (unconscious-processes-compete-for-access . winning-representation-enters-global-workspace)
       (winning-representation-enters-global-workspace . broadcast-to-widespread-cortical-areas)
       (broadcast-to-widespread-cortical-areas . ignition-of-prefrontal-parietal-network)
       (ignition-of-prefrontal-parietal-network . sustained-activity-after-stimulus-offset)
       (sustained-activity-after-stimulus-offset . all-or-none-transition-to-consciousness)
       (all-or-none-transition-to-consciousness . explains-attentional-blink-and-masking)
       (explains-attentional-blink-and-masking . conscious-access-via-global-broadcast)))

    (integrated-information-theory
      (Tononi-2004-IIT)
      (consciousness-equals-integrated-information-Phi)
      ((Tononi-2004-IIT . consciousness-is-identical-to-integrated-information)
       (consciousness-is-identical-to-integrated-information . Phi-measures-information-integration)
       (Phi-measures-information-integration . system-must-be-both-differentiated-and-integrated)
       (system-must-be-both-differentiated-and-integrated . maximum-Phi-identifies-complex)
       (maximum-Phi-identifies-complex . predicts-cerebellum-low-Phi-despite-many-neurons)
       (predicts-cerebellum-low-Phi-despite-many-neurons . predicts-cortex-high-Phi)
       (predicts-cortex-high-Phi . consciousness-equals-integrated-information-Phi)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; MIRROR NEURONS
    ;;; Neurons active during both action execution and observation.
    ;;; SOURCE: [Rizzolatti-1996] Brain Res. 3(2):131-141;
    ;;; [Kandel-6th] Ch. 38
    ;;; ═══════════════════════════════════════════════════════════

    (mirror-neurons
      (neurons-in-premotor-and-parietal-cortex)
      (fire-during-action-execution-and-observation)
      ((neurons-in-premotor-and-parietal-cortex . discovered-in-macaque-area-F5)
       (discovered-in-macaque-area-F5 . Rizzolatti-di-Pellegrino-et-al-1992)
       (Rizzolatti-di-Pellegrino-et-al-1992 . fire-when-monkey-grasps-object)
       (fire-when-monkey-grasps-object . also-fire-when-observing-another-grasping)
       (also-fire-when-observing-another-grasping . human-homolog-in-inferior-frontal-gyrus)
       (human-homolog-in-inferior-frontal-gyrus . proposed-role-in-action-understanding)
       (proposed-role-in-action-understanding . proposed-role-in-imitation-learning)
       (proposed-role-in-imitation-learning . proposed-link-to-empathy)
       (proposed-link-to-empathy . fire-during-action-execution-and-observation)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; DEFAULT MODE NETWORK
    ;;; Network active during rest, self-referential thought.
    ;;; SOURCE: [Raichle-2001] PNAS 98(2):676-682;
    ;;; [Kandel-6th] Ch. 19
    ;;; ═══════════════════════════════════════════════════════════

    (default-mode-network
      (set-of-brain-regions-active-at-rest)
      (self-referential-and-internally-directed-cognition)
      ((set-of-brain-regions-active-at-rest . Raichle-et-al-2001-identified)
       (Raichle-et-al-2001-identified . medial-prefrontal-cortex)
       (medial-prefrontal-cortex . posterior-cingulate-cortex-and-precuneus)
       (posterior-cingulate-cortex-and-precuneus . medial-temporal-lobe-including-hippocampus)
       (medial-temporal-lobe-including-hippocampus . angular-gyrus-lateral-parietal)
       (angular-gyrus-lateral-parietal . deactivates-during-goal-directed-tasks)
       (deactivates-during-goal-directed-tasks . active-during-mind-wandering-and-daydreaming)
       (active-during-mind-wandering-and-daydreaming . active-during-autobiographical-memory-retrieval)
       (active-during-autobiographical-memory-retrieval . active-during-future-planning-and-simulation)
       (active-during-future-planning-and-simulation . disrupted-in-Alzheimer-disease)
       (disrupted-in-Alzheimer-disease . anticorrelated-with-task-positive-networks)
       (anticorrelated-with-task-positive-networks . self-referential-and-internally-directed-cognition)))

  )

  ((Kandel-6th . neuroscience-registered)))
