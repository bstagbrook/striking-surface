#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Medicine
;;; LAYER: 24-medicine
;;; DEPENDS ON: 03-atoms (elements, ions), 04-molecules (biochemistry),
;;;   05-amino-acids (protein components), 06-protein (structure/folding),
;;;   13-neuroscience (nervous system), 20-biology (cell biology)
;;; DEPENDED ON BY: clinical research, pharmacogenomics, epidemiology,
;;;   bespoke medicine
;;;
;;; PURPOSE: The practice of human medicine — anatomy, physiology,
;;; diagnostics, pharmacology, pathology, and emergency intervention.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Grays-42nd] Drake, Vogl, Mitchell. Gray's Anatomy for Students,
;;;   42nd ed. (2020). — anatomical structures and relationships.
;;; [Harrison-21st] Loscalzo, Fauci, Kasper, Hauser, Longo, Jameson.
;;;   Harrison's Principles of Internal Medicine, 21st ed. (2022).
;;;   — pathophysiology, diagnostics, clinical medicine.
;;; [Guyton-14th] Hall, Hall. Guyton and Hall Textbook of Medical
;;;   Physiology, 14th ed. (2021). — organ system physiology,
;;;   vital signs, hemodynamics, renal physiology.
;;; [Goodman-Gilman-14th] Brunton, Hilal-Dandan, Knollmann.
;;;   Goodman & Gilman's The Pharmacological Basis of Therapeutics,
;;;   14th ed. (2023). — pharmacokinetics, pharmacodynamics.
;;; [ACLS-2020] American Heart Association. ACLS Provider Manual (2020).
;;;   — CPR, advanced cardiac life support, shock management.
;;; [AHA-2023] American Heart Association. Heart Disease and Stroke
;;;   Statistics — 2023 Update. Circulation 147(8):e93-e621.
;;; [AJCC-8th] Amin et al. AJCC Cancer Staging Manual, 8th ed. (2017).
;;;   — TNM staging system.
;;; [Harris-Benedict-1918] Harris & Benedict. A Biometric Study of
;;;   Human Basal Metabolism. PNAS 4(12):370-373 (1918).
;;;
;;; UNITS: bpm for heart rate. mmHg for blood pressure. breaths/min
;;;   for respiratory rate. degrees-C for temperature. percent for SpO2.
;;;   g/dL for hemoglobin. cal/g for energy density. kg/m2 for BMI.
;;;
;;; CALIBRATION: (pending) medicine.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-medicine

  ((Grays-42nd-Harrison-21st-Guyton-14th (medical-reference-texts) (authoritative) ((medical-reference-texts . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SKELETAL SYSTEM
    ;;; 206 bones in the adult human skeleton.
    ;;; SOURCE: [Grays-42nd] Part I; [Guyton-14th] Ch. 80
    ;;; ═══════════════════════════════════════════════════════════

    (skeletal-system
      (organ-system)
      (structural-support-and-protection)
      ((organ-system . 206-bones-in-adult-human)
       (206-bones-in-adult-human . axial-skeleton-80-bones)
       (axial-skeleton-80-bones . appendicular-skeleton-126-bones)
       (appendicular-skeleton-126-bones . bone-types-long-short-flat-irregular-sesamoid)
       (bone-types-long-short-flat-irregular-sesamoid . functions-support-protection-movement-mineral-storage)
       (functions-support-protection-movement-mineral-storage . red-marrow-produces-blood-cells-hematopoiesis)
       (red-marrow-produces-blood-cells-hematopoiesis . calcium-and-phosphate-reservoir)
       (calcium-and-phosphate-reservoir . structural-support-and-protection)))

    (axial-skeleton
      (skull-vertebral-column-ribcage)
      (protects-brain-spinal-cord-thoracic-organs)
      ((skull-vertebral-column-ribcage . skull-22-bones-cranial-8-facial-14)
       (skull-22-bones-cranial-8-facial-14 . vertebral-column-33-vertebrae)
       (vertebral-column-33-vertebrae . cervical-7-thoracic-12-lumbar-5-sacral-5-fused-coccygeal-4-fused)
       (cervical-7-thoracic-12-lumbar-5-sacral-5-fused-coccygeal-4-fused . ribcage-12-pairs-of-ribs-plus-sternum)
       (ribcage-12-pairs-of-ribs-plus-sternum . true-ribs-1-to-7-false-ribs-8-to-12)
       (true-ribs-1-to-7-false-ribs-8-to-12 . floating-ribs-11-and-12)
       (floating-ribs-11-and-12 . protects-brain-spinal-cord-thoracic-organs)))

    (appendicular-skeleton
      (limbs-and-girdles)
      (facilitates-locomotion-and-manipulation)
      ((limbs-and-girdles . pectoral-girdle-clavicle-and-scapula)
       (pectoral-girdle-clavicle-and-scapula . upper-limb-humerus-radius-ulna-carpals-metacarpals-phalanges)
       (upper-limb-humerus-radius-ulna-carpals-metacarpals-phalanges . hand-27-bones-per-hand)
       (hand-27-bones-per-hand . pelvic-girdle-ilium-ischium-pubis-fused-as-os-coxae)
       (pelvic-girdle-ilium-ischium-pubis-fused-as-os-coxae . lower-limb-femur-patella-tibia-fibula-tarsals-metatarsals-phalanges)
       (lower-limb-femur-patella-tibia-fibula-tarsals-metatarsals-phalanges . foot-26-bones-per-foot)
       (foot-26-bones-per-foot . facilitates-locomotion-and-manipulation)))

    (joints
      (articulations-between-bones)
      (permit-movement-and-stability)
      ((articulations-between-bones . synarthroses-immovable-eg-skull-sutures)
       (synarthroses-immovable-eg-skull-sutures . amphiarthroses-slightly-movable-eg-intervertebral-discs)
       (amphiarthroses-slightly-movable-eg-intervertebral-discs . diarthroses-freely-movable-synovial-joints)
       (diarthroses-freely-movable-synovial-joints . synovial-joint-types-hinge-ball-and-socket-pivot-saddle-gliding-condyloid)
       (synovial-joint-types-hinge-ball-and-socket-pivot-saddle-gliding-condyloid . synovial-fluid-lubricates-and-nourishes-cartilage)
       (synovial-fluid-lubricates-and-nourishes-cartilage . permit-movement-and-stability)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; MUSCULAR SYSTEM
    ;;; Over 600 named skeletal muscles in the human body.
    ;;; SOURCE: [Grays-42nd] Part II; [Guyton-14th] Ch. 6-8
    ;;; ═══════════════════════════════════════════════════════════

    (muscular-system
      (organ-system)
      (movement-posture-heat-production)
      ((organ-system . over-600-named-skeletal-muscles)
       (over-600-named-skeletal-muscles . three-types-skeletal-cardiac-smooth)
       (three-types-skeletal-cardiac-smooth . skeletal-voluntary-striated-multinucleated)
       (skeletal-voluntary-striated-multinucleated . cardiac-involuntary-striated-intercalated-discs)
       (cardiac-involuntary-striated-intercalated-discs . smooth-involuntary-non-striated-visceral-walls)
       (smooth-involuntary-non-striated-visceral-walls . skeletal-muscle-40-percent-of-body-mass)
       (skeletal-muscle-40-percent-of-body-mass . movement-posture-heat-production)))

    (muscle-contraction
      (sliding-filament-mechanism)
      (actin-and-myosin-interaction)
      ((sliding-filament-mechanism . Huxley-and-Niedergerke-1954)
       (Huxley-and-Niedergerke-1954 . sarcomere-is-functional-unit)
       (sarcomere-is-functional-unit . thick-filaments-myosin-thin-filaments-actin)
       (thick-filaments-myosin-thin-filaments-actin . calcium-release-from-sarcoplasmic-reticulum)
       (calcium-release-from-sarcoplasmic-reticulum . calcium-binds-troponin-exposes-binding-sites)
       (calcium-binds-troponin-exposes-binding-sites . myosin-heads-bind-actin-power-stroke)
       (myosin-heads-bind-actin-power-stroke . ATP-required-for-detachment-and-re-cocking)
       (ATP-required-for-detachment-and-re-cocking . actin-and-myosin-interaction)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; CARDIOVASCULAR SYSTEM
    ;;; Heart: 4 chambers, dual circulation.
    ;;; SOURCE: [Guyton-14th] Ch. 9-14, 20; [Grays-42nd] Part III
    ;;; ═══════════════════════════════════════════════════════════

    (cardiovascular-system
      (organ-system)
      (circulates-blood-throughout-body)
      ((organ-system . heart-blood-vessels-blood)
       (heart-blood-vessels-blood . heart-four-chambers)
       (heart-four-chambers . right-atrium-right-ventricle-left-atrium-left-ventricle)
       (right-atrium-right-ventricle-left-atrium-left-ventricle . pulmonary-circulation-right-heart-to-lungs)
       (pulmonary-circulation-right-heart-to-lungs . systemic-circulation-left-heart-to-body)
       (systemic-circulation-left-heart-to-body . arteries-carry-blood-away-from-heart)
       (arteries-carry-blood-away-from-heart . veins-return-blood-to-heart)
       (veins-return-blood-to-heart . capillaries-site-of-gas-and-nutrient-exchange)
       (capillaries-site-of-gas-and-nutrient-exchange . circulates-blood-throughout-body)))

    (cardiac-cycle
      (systole-and-diastole)
      (pumps-approximately-5-L-per-minute-at-rest)
      ((systole-and-diastole . SA-node-pacemaker-60-to-100-bpm)
       (SA-node-pacemaker-60-to-100-bpm . electrical-conduction-SA-AV-Bundle-of-His-Purkinje)
       (electrical-conduction-SA-AV-Bundle-of-His-Purkinje . atrial-systole-then-ventricular-systole)
       (atrial-systole-then-ventricular-systole . stroke-volume-approximately-70-mL)
       (stroke-volume-approximately-70-mL . cardiac-output-equals-heart-rate-times-stroke-volume)
       (cardiac-output-equals-heart-rate-times-stroke-volume . valves-prevent-backflow-mitral-tricuspid-aortic-pulmonic)
       (valves-prevent-backflow-mitral-tricuspid-aortic-pulmonic . pumps-approximately-5-L-per-minute-at-rest)))

    (cardiac-conduction
      (intrinsic-electrical-system)
      (coordinates-rhythmic-contraction)
      ((intrinsic-electrical-system . SA-node-right-atrium-primary-pacemaker)
       (SA-node-right-atrium-primary-pacemaker . intrinsic-rate-60-to-100-bpm)
       (intrinsic-rate-60-to-100-bpm . AV-node-delays-signal-0.1-seconds)
       (AV-node-delays-signal-0.1-seconds . Bundle-of-His-through-interventricular-septum)
       (Bundle-of-His-through-interventricular-septum . left-and-right-bundle-branches)
       (left-and-right-bundle-branches . Purkinje-fibers-rapid-ventricular-depolarization)
       (Purkinje-fibers-rapid-ventricular-depolarization . coordinates-rhythmic-contraction)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; RESPIRATORY SYSTEM
    ;;; Gas exchange: O2 in, CO2 out, via alveoli.
    ;;; SOURCE: [Guyton-14th] Ch. 38-42; [Grays-42nd] Part IV
    ;;; ═══════════════════════════════════════════════════════════

    (respiratory-system
      (organ-system)
      (gas-exchange-O2-in-CO2-out)
      ((organ-system . upper-tract-nose-pharynx-larynx)
       (upper-tract-nose-pharynx-larynx . lower-tract-trachea-bronchi-lungs)
       (lower-tract-trachea-bronchi-lungs . trachea-branches-into-right-and-left-main-bronchi)
       (trachea-branches-into-right-and-left-main-bronchi . bronchi-subdivide-to-bronchioles-to-alveolar-ducts)
       (bronchi-subdivide-to-bronchioles-to-alveolar-ducts . approximately-300-million-alveoli-per-lung-pair)
       (approximately-300-million-alveoli-per-lung-pair . alveolar-surface-area-approximately-70-square-meters)
       (alveolar-surface-area-approximately-70-square-meters . gas-exchange-across-respiratory-membrane-0.5-micrometer-thick)
       (gas-exchange-across-respiratory-membrane-0.5-micrometer-thick . gas-exchange-O2-in-CO2-out)))

    (gas-exchange
      (diffusion-across-alveolar-capillary-membrane)
      (driven-by-partial-pressure-gradients)
      ((diffusion-across-alveolar-capillary-membrane . alveolar-PO2-approximately-104-mmHg)
       (alveolar-PO2-approximately-104-mmHg . venous-blood-PO2-approximately-40-mmHg)
       (venous-blood-PO2-approximately-40-mmHg . O2-diffuses-from-alveolus-to-blood)
       (O2-diffuses-from-alveolus-to-blood . alveolar-PCO2-approximately-40-mmHg)
       (alveolar-PCO2-approximately-40-mmHg . venous-blood-PCO2-approximately-45-mmHg)
       (venous-blood-PCO2-approximately-45-mmHg . CO2-diffuses-from-blood-to-alveolus)
       (CO2-diffuses-from-blood-to-alveolus . driven-by-partial-pressure-gradients)))

    (lung-mechanics
      (ventilation-by-diaphragm-and-intercostals)
      (tidal-volume-approximately-500-mL)
      ((ventilation-by-diaphragm-and-intercostals . inspiration-diaphragm-contracts-descends)
       (inspiration-diaphragm-contracts-descends . negative-intrapleural-pressure-draws-air-in)
       (negative-intrapleural-pressure-draws-air-in . expiration-passive-at-rest-elastic-recoil)
       (expiration-passive-at-rest-elastic-recoil . tidal-volume-approximately-500-mL)
       (tidal-volume-approximately-500-mL . minute-ventilation-equals-tidal-volume-times-respiratory-rate)
       (minute-ventilation-equals-tidal-volume-times-respiratory-rate . total-lung-capacity-approximately-6-L)
       (total-lung-capacity-approximately-6-L . residual-volume-approximately-1.2-L)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIGESTIVE SYSTEM
    ;;; Alimentary canal from mouth to anus.
    ;;; SOURCE: [Guyton-14th] Ch. 63-67; [Grays-42nd] Part V
    ;;; ═══════════════════════════════════════════════════════════

    (digestive-system
      (organ-system)
      (ingestion-digestion-absorption-elimination)
      ((organ-system . alimentary-canal-mouth-to-anus-approximately-9-meters)
       (alimentary-canal-mouth-to-anus-approximately-9-meters . mouth-mechanical-digestion-salivary-amylase)
       (mouth-mechanical-digestion-salivary-amylase . esophagus-peristalsis-to-stomach)
       (esophagus-peristalsis-to-stomach . stomach-HCl-pH-1.5-to-3.5-pepsin-protein-digestion)
       (stomach-HCl-pH-1.5-to-3.5-pepsin-protein-digestion . small-intestine-duodenum-jejunum-ileum)
       (small-intestine-duodenum-jejunum-ileum . small-intestine-primary-site-of-absorption)
       (small-intestine-primary-site-of-absorption . villi-and-microvilli-increase-surface-area-200-square-meters)
       (villi-and-microvilli-increase-surface-area-200-square-meters . large-intestine-water-reabsorption-and-feces-formation)
       (large-intestine-water-reabsorption-and-feces-formation . ingestion-digestion-absorption-elimination)))

    (accessory-digestive-organs
      (liver-gallbladder-pancreas)
      (secrete-bile-and-enzymes-for-digestion)
      ((liver-gallbladder-pancreas . liver-largest-internal-organ-approximately-1.5-kg)
       (liver-largest-internal-organ-approximately-1.5-kg . liver-produces-bile-for-fat-emulsification)
       (liver-produces-bile-for-fat-emulsification . liver-metabolizes-drugs-and-toxins)
       (liver-metabolizes-drugs-and-toxins . gallbladder-stores-and-concentrates-bile)
       (gallbladder-stores-and-concentrates-bile . pancreas-exocrine-secretes-digestive-enzymes)
       (pancreas-exocrine-secretes-digestive-enzymes . pancreatic-lipase-amylase-trypsin-chymotrypsin)
       (pancreatic-lipase-amylase-trypsin-chymotrypsin . pancreas-endocrine-secretes-insulin-and-glucagon)
       (pancreas-endocrine-secretes-insulin-and-glucagon . secrete-bile-and-enzymes-for-digestion)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; NERVOUS SYSTEM
    ;;; CNS (brain + spinal cord) and PNS (cranial + spinal nerves).
    ;;; SOURCE: [Guyton-14th] Ch. 45-61; [Grays-42nd] Part VIII
    ;;; ═══════════════════════════════════════════════════════════

    (nervous-system
      (organ-system)
      (sensation-integration-motor-response)
      ((organ-system . central-nervous-system-brain-and-spinal-cord)
       (central-nervous-system-brain-and-spinal-cord . peripheral-nervous-system-cranial-and-spinal-nerves)
       (peripheral-nervous-system-cranial-and-spinal-nerves . somatic-nervous-system-voluntary-skeletal-muscle)
       (somatic-nervous-system-voluntary-skeletal-muscle . autonomic-nervous-system-involuntary)
       (autonomic-nervous-system-involuntary . sympathetic-division-fight-or-flight)
       (sympathetic-division-fight-or-flight . parasympathetic-division-rest-and-digest)
       (parasympathetic-division-rest-and-digest . 12-pairs-cranial-nerves-31-pairs-spinal-nerves)
       (12-pairs-cranial-nerves-31-pairs-spinal-nerves . sensation-integration-motor-response)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; ENDOCRINE SYSTEM
    ;;; Hormones and feedback loops.
    ;;; SOURCE: [Guyton-14th] Ch. 76-83; [Harrison-21st] Part 16
    ;;; ═══════════════════════════════════════════════════════════

    (endocrine-system
      (organ-system)
      (hormonal-regulation-via-feedback-loops)
      ((organ-system . glands-secrete-hormones-into-bloodstream)
       (glands-secrete-hormones-into-bloodstream . hypothalamus-master-regulator-links-nervous-and-endocrine)
       (hypothalamus-master-regulator-links-nervous-and-endocrine . pituitary-anterior-GH-TSH-ACTH-FSH-LH-prolactin)
       (pituitary-anterior-GH-TSH-ACTH-FSH-LH-prolactin . pituitary-posterior-stores-ADH-and-oxytocin)
       (pituitary-posterior-stores-ADH-and-oxytocin . thyroid-T3-T4-regulate-metabolism-calcitonin)
       (thyroid-T3-T4-regulate-metabolism-calcitonin . parathyroid-PTH-raises-blood-calcium)
       (parathyroid-PTH-raises-blood-calcium . adrenal-cortex-cortisol-aldosterone-adrenal-medulla-epinephrine)
       (adrenal-cortex-cortisol-aldosterone-adrenal-medulla-epinephrine . pancreatic-islets-insulin-lowers-glucose-glucagon-raises-glucose)
       (pancreatic-islets-insulin-lowers-glucose-glucagon-raises-glucose . hormonal-regulation-via-feedback-loops)))

    (endocrine-feedback
      (negative-feedback-predominates)
      (maintains-hormonal-homeostasis)
      ((negative-feedback-predominates . hormone-level-rises-above-set-point)
       (hormone-level-rises-above-set-point . hypothalamus-or-gland-detects-excess)
       (hypothalamus-or-gland-detects-excess . releasing-hormone-secretion-decreases)
       (releasing-hormone-secretion-decreases . target-gland-output-decreases)
       (target-gland-output-decreases . positive-feedback-rare-eg-oxytocin-in-labor-LH-surge)
       (positive-feedback-rare-eg-oxytocin-in-labor-LH-surge . maintains-hormonal-homeostasis)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; URINARY SYSTEM
    ;;; Kidneys, nephron filtration, acid-base balance.
    ;;; SOURCE: [Guyton-14th] Ch. 26-31; [Grays-42nd] Part X
    ;;; ═══════════════════════════════════════════════════════════

    (urinary-system
      (organ-system)
      (filtration-reabsorption-excretion)
      ((organ-system . kidneys-ureters-bladder-urethra)
       (kidneys-ureters-bladder-urethra . two-kidneys-retroperitoneal)
       (two-kidneys-retroperitoneal . each-kidney-approximately-1-million-nephrons)
       (each-kidney-approximately-1-million-nephrons . nephron-is-functional-unit)
       (nephron-is-functional-unit . glomerulus-filters-blood-approximately-180-L-per-day)
       (glomerulus-filters-blood-approximately-180-L-per-day . tubular-reabsorption-recovers-99-percent)
       (tubular-reabsorption-recovers-99-percent . final-urine-output-approximately-1-to-2-L-per-day)
       (final-urine-output-approximately-1-to-2-L-per-day . filtration-reabsorption-excretion)))

    (nephron
      (functional-unit-of-kidney)
      (filters-reabsorbs-secretes-concentrates)
      ((functional-unit-of-kidney . glomerulus-Bowmans-capsule-filtration)
       (glomerulus-Bowmans-capsule-filtration . proximal-convoluted-tubule-reabsorbs-65-percent-of-filtrate)
       (proximal-convoluted-tubule-reabsorbs-65-percent-of-filtrate . loop-of-Henle-concentrating-mechanism)
       (loop-of-Henle-concentrating-mechanism . descending-limb-permeable-to-water)
       (descending-limb-permeable-to-water . ascending-limb-impermeable-to-water-pumps-NaCl)
       (ascending-limb-impermeable-to-water-pumps-NaCl . distal-convoluted-tubule-fine-tuning)
       (distal-convoluted-tubule-fine-tuning . collecting-duct-ADH-regulated-water-reabsorption)
       (collecting-duct-ADH-regulated-water-reabsorption . filters-reabsorbs-secretes-concentrates)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; REPRODUCTIVE SYSTEM
    ;;; Male and female reproductive anatomy and physiology.
    ;;; SOURCE: [Guyton-14th] Ch. 81-83; [Grays-42nd] Part XI
    ;;; ═══════════════════════════════════════════════════════════

    (male-reproductive-system
      (testes-and-accessory-structures)
      (spermatogenesis-and-testosterone-production)
      ((testes-and-accessory-structures . testes-produce-sperm-and-testosterone)
       (testes-produce-sperm-and-testosterone . spermatogenesis-in-seminiferous-tubules-74-days)
       (spermatogenesis-in-seminiferous-tubules-74-days . Leydig-cells-produce-testosterone)
       (Leydig-cells-produce-testosterone . epididymis-sperm-maturation-and-storage)
       (epididymis-sperm-maturation-and-storage . vas-deferens-transports-sperm)
       (vas-deferens-transports-sperm . seminal-vesicles-prostate-bulbourethral-glands-contribute-seminal-fluid)
       (seminal-vesicles-prostate-bulbourethral-glands-contribute-seminal-fluid . spermatogenesis-and-testosterone-production)))

    (female-reproductive-system
      (ovaries-uterus-and-accessory-structures)
      (oogenesis-menstruation-gestation)
      ((ovaries-uterus-and-accessory-structures . ovaries-produce-oocytes-estrogen-progesterone)
       (ovaries-produce-oocytes-estrogen-progesterone . ovarian-cycle-follicular-phase-ovulation-luteal-phase)
       (ovarian-cycle-follicular-phase-ovulation-luteal-phase . menstrual-cycle-approximately-28-days)
       (menstrual-cycle-approximately-28-days . uterine-cycle-menstrual-proliferative-secretory-phases)
       (uterine-cycle-menstrual-proliferative-secretory-phases . fallopian-tubes-site-of-fertilization)
       (fallopian-tubes-site-of-fertilization . uterus-site-of-implantation-and-gestation)
       (uterus-site-of-implantation-and-gestation . oogenesis-menstruation-gestation)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; INTEGUMENTARY SYSTEM
    ;;; Skin: 3 layers, largest organ by surface area.
    ;;; SOURCE: [Grays-42nd] Part I; [Guyton-14th] Ch. 74
    ;;; ═══════════════════════════════════════════════════════════

    (integumentary-system
      (organ-system)
      (protection-thermoregulation-sensation)
      ((organ-system . skin-largest-organ-approximately-1.5-to-2-square-meters)
       (skin-largest-organ-approximately-1.5-to-2-square-meters . three-layers-epidermis-dermis-hypodermis)
       (three-layers-epidermis-dermis-hypodermis . epidermis-keratinized-stratified-squamous-epithelium)
       (epidermis-keratinized-stratified-squamous-epithelium . dermis-connective-tissue-blood-vessels-nerves)
       (dermis-connective-tissue-blood-vessels-nerves . hypodermis-subcutaneous-fat-insulation-energy-storage)
       (hypodermis-subcutaneous-fat-insulation-energy-storage . appendages-hair-nails-sweat-glands-sebaceous-glands)
       (appendages-hair-nails-sweat-glands-sebaceous-glands . melanocytes-produce-melanin-UV-protection)
       (melanocytes-produce-melanin-UV-protection . protection-thermoregulation-sensation)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; LYMPHATIC SYSTEM
    ;;; Immune defense and fluid return.
    ;;; SOURCE: [Guyton-14th] Ch. 34-35; [Harrison-21st] Part 2
    ;;; ═══════════════════════════════════════════════════════════

    (lymphatic-system
      (organ-system)
      (immune-defense-and-fluid-homeostasis)
      ((organ-system . lymph-vessels-nodes-spleen-thymus-tonsils)
       (lymph-vessels-nodes-spleen-thymus-tonsils . lymph-vessels-return-interstitial-fluid-to-blood)
       (lymph-vessels-return-interstitial-fluid-to-blood . approximately-3-L-lymph-returned-per-day)
       (approximately-3-L-lymph-returned-per-day . lymph-nodes-filter-lymph-house-lymphocytes)
       (lymph-nodes-filter-lymph-house-lymphocytes . spleen-filters-blood-recycles-old-RBCs)
       (spleen-filters-blood-recycles-old-RBCs . thymus-T-cell-maturation-and-selection)
       (thymus-T-cell-maturation-and-selection . innate-immunity-barriers-phagocytes-complement-NK-cells)
       (innate-immunity-barriers-phagocytes-complement-NK-cells . adaptive-immunity-B-cells-antibodies-T-cells-cell-mediated)
       (adaptive-immunity-B-cells-antibodies-T-cells-cell-mediated . immune-defense-and-fluid-homeostasis)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; VITAL SIGNS
    ;;; Normal adult ranges at rest.
    ;;; SOURCE: [Guyton-14th] Ch. 9, 14, 42, 74;
    ;;; [Harrison-21st] Ch. 2
    ;;; ═══════════════════════════════════════════════════════════

    (heart-rate
      (vital-sign)
      (normal-adult-60-to-100-bpm)
      ((vital-sign . measured-by-pulse-palpation-or-ECG)
       (measured-by-pulse-palpation-or-ECG . normal-adult-resting-60-to-100-bpm)
       (normal-adult-resting-60-to-100-bpm . bradycardia-below-60-bpm)
       (bradycardia-below-60-bpm . tachycardia-above-100-bpm)
       (tachycardia-above-100-bpm . influenced-by-autonomic-nervous-system)
       (influenced-by-autonomic-nervous-system . sympathetic-increases-parasympathetic-decreases)
       (sympathetic-increases-parasympathetic-decreases . normal-adult-60-to-100-bpm)))

    (blood-pressure
      (vital-sign)
      (normal-adult-120-over-80-mmHg)
      ((vital-sign . measured-by-sphygmomanometer)
       (measured-by-sphygmomanometer . systolic-pressure-peak-ventricular-contraction)
       (systolic-pressure-peak-ventricular-contraction . diastolic-pressure-ventricular-relaxation)
       (diastolic-pressure-ventricular-relaxation . normal-adult-systolic-less-than-120-mmHg)
       (normal-adult-systolic-less-than-120-mmHg . normal-adult-diastolic-less-than-80-mmHg)
       (normal-adult-diastolic-less-than-80-mmHg . mean-arterial-pressure-equals-diastolic-plus-one-third-pulse-pressure)
       (mean-arterial-pressure-equals-diastolic-plus-one-third-pulse-pressure . regulated-by-baroreceptors-RAAS-ANS)
       (regulated-by-baroreceptors-RAAS-ANS . normal-adult-120-over-80-mmHg)))

    (respiratory-rate
      (vital-sign)
      (normal-adult-12-to-20-breaths-per-minute)
      ((vital-sign . measured-by-observation-of-chest-rise)
       (measured-by-observation-of-chest-rise . normal-adult-resting-12-to-20-breaths-per-minute)
       (normal-adult-resting-12-to-20-breaths-per-minute . bradypnea-below-12-breaths-per-minute)
       (bradypnea-below-12-breaths-per-minute . tachypnea-above-20-breaths-per-minute)
       (tachypnea-above-20-breaths-per-minute . regulated-by-medullary-respiratory-centers)
       (regulated-by-medullary-respiratory-centers . central-chemoreceptors-respond-to-CO2-and-pH)
       (central-chemoreceptors-respond-to-CO2-and-pH . peripheral-chemoreceptors-respond-to-O2-carotid-aortic-bodies)
       (peripheral-chemoreceptors-respond-to-O2-carotid-aortic-bodies . normal-adult-12-to-20-breaths-per-minute)))

    (body-temperature
      (vital-sign)
      (normal-core-37-degrees-C-98.6-degrees-F)
      ((vital-sign . measured-orally-rectally-tympanically-axillary)
       (measured-orally-rectally-tympanically-axillary . normal-core-approximately-37-degrees-C)
       (normal-core-approximately-37-degrees-C . normal-range-36.1-to-37.2-degrees-C)
       (normal-range-36.1-to-37.2-degrees-C . hypothermia-below-35-degrees-C)
       (hypothermia-below-35-degrees-C . fever-pyrexia-above-38-degrees-C)
       (fever-pyrexia-above-38-degrees-C . hypothalamic-thermoregulatory-center)
       (hypothalamic-thermoregulatory-center . heat-loss-radiation-convection-evaporation-conduction)
       (heat-loss-radiation-convection-evaporation-conduction . normal-core-37-degrees-C-98.6-degrees-F)))

    (oxygen-saturation
      (vital-sign)
      (normal-SpO2-95-to-100-percent)
      ((vital-sign . measured-by-pulse-oximetry)
       (measured-by-pulse-oximetry . SpO2-percentage-of-hemoglobin-saturated-with-O2)
       (SpO2-percentage-of-hemoglobin-saturated-with-O2 . normal-range-95-to-100-percent)
       (normal-range-95-to-100-percent . hypoxemia-below-90-percent)
       (hypoxemia-below-90-percent . corresponds-to-PaO2-approximately-60-mmHg-on-oxyhemoglobin-curve)
       (corresponds-to-PaO2-approximately-60-mmHg-on-oxyhemoglobin-curve . sigmoid-oxyhemoglobin-dissociation-curve)
       (sigmoid-oxyhemoglobin-dissociation-curve . right-shift-increased-O2-unloading-Bohr-effect)
       (right-shift-increased-O2-unloading-Bohr-effect . normal-SpO2-95-to-100-percent)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; BLOOD
    ;;; Composition, cell types, typing, oxygen transport.
    ;;; SOURCE: [Guyton-14th] Ch. 33-36; [Harrison-21st] Part 7
    ;;; ═══════════════════════════════════════════════════════════

    (blood-composition
      (connective-tissue-in-fluid-form)
      (approximately-5-L-in-adult)
      ((connective-tissue-in-fluid-form . plasma-55-percent-of-blood-volume)
       (plasma-55-percent-of-blood-volume . plasma-is-water-proteins-electrolytes-nutrients-wastes)
       (plasma-is-water-proteins-electrolytes-nutrients-wastes . formed-elements-45-percent-hematocrit)
       (formed-elements-45-percent-hematocrit . normal-hematocrit-male-40-to-54-percent)
       (normal-hematocrit-male-40-to-54-percent . normal-hematocrit-female-36-to-48-percent)
       (normal-hematocrit-female-36-to-48-percent . pH-7.35-to-7.45)
       (pH-7.35-to-7.45 . approximately-5-L-in-adult)))

    (red-blood-cells
      (erythrocytes)
      (oxygen-transport-via-hemoglobin)
      ((erythrocytes . biconcave-disc-no-nucleus-in-mature-form)
       (biconcave-disc-no-nucleus-in-mature-form . approximately-4.5-to-5.5-million-per-microliter)
       (approximately-4.5-to-5.5-million-per-microliter . lifespan-approximately-120-days)
       (lifespan-approximately-120-days . produced-in-bone-marrow-erythropoiesis)
       (produced-in-bone-marrow-erythropoiesis . erythropoietin-from-kidneys-stimulates-production)
       (erythropoietin-from-kidneys-stimulates-production . hemoglobin-carries-O2)
       (hemoglobin-carries-O2 . oxygen-transport-via-hemoglobin)))

    (hemoglobin
      (oxygen-carrying-protein-in-RBCs)
      (4-heme-groups-each-binds-one-O2)
      ((oxygen-carrying-protein-in-RBCs . tetramer-2-alpha-2-beta-globin-chains)
       (tetramer-2-alpha-2-beta-globin-chains . each-chain-contains-one-heme-group)
       (each-chain-contains-one-heme-group . heme-contains-iron-Fe2plus-in-center)
       (heme-contains-iron-Fe2plus-in-center . each-Fe2plus-binds-one-O2-molecule)
       (each-Fe2plus-binds-one-O2-molecule . cooperative-binding-sigmoid-curve)
       (cooperative-binding-sigmoid-curve . normal-hemoglobin-male-14-to-18-g-per-dL)
       (normal-hemoglobin-male-14-to-18-g-per-dL . normal-hemoglobin-female-12-to-16-g-per-dL)
       (normal-hemoglobin-female-12-to-16-g-per-dL . 4-heme-groups-each-binds-one-O2)))

    (white-blood-cells
      (leukocytes)
      (immune-defense)
      ((leukocytes . approximately-4500-to-11000-per-microliter)
       (approximately-4500-to-11000-per-microliter . neutrophils-60-to-70-percent-phagocytosis)
       (neutrophils-60-to-70-percent-phagocytosis . lymphocytes-20-to-25-percent-B-cells-T-cells-NK-cells)
       (lymphocytes-20-to-25-percent-B-cells-T-cells-NK-cells . monocytes-3-to-8-percent-become-macrophages)
       (monocytes-3-to-8-percent-become-macrophages . eosinophils-2-to-4-percent-parasites-and-allergies)
       (eosinophils-2-to-4-percent-parasites-and-allergies . basophils-less-than-1-percent-histamine-release)
       (basophils-less-than-1-percent-histamine-release . immune-defense)))

    (platelets
      (thrombocytes)
      (hemostasis-and-clot-formation)
      ((thrombocytes . fragments-of-megakaryocytes)
       (fragments-of-megakaryocytes . approximately-150000-to-400000-per-microliter)
       (approximately-150000-to-400000-per-microliter . lifespan-8-to-10-days)
       (lifespan-8-to-10-days . adhere-to-damaged-vessel-wall)
       (adhere-to-damaged-vessel-wall . aggregate-to-form-platelet-plug)
       (aggregate-to-form-platelet-plug . release-clotting-factors-activate-coagulation-cascade)
       (release-clotting-factors-activate-coagulation-cascade . hemostasis-and-clot-formation)))

    (blood-typing
      (ABO-and-Rh-antigen-systems)
      (determines-transfusion-compatibility)
      ((ABO-and-Rh-antigen-systems . type-A-has-A-antigens-anti-B-antibodies)
       (type-A-has-A-antigens-anti-B-antibodies . type-B-has-B-antigens-anti-A-antibodies)
       (type-B-has-B-antigens-anti-A-antibodies . type-AB-has-both-antigens-no-ABO-antibodies-universal-recipient)
       (type-AB-has-both-antigens-no-ABO-antibodies-universal-recipient . type-O-has-no-antigens-both-antibodies-universal-donor)
       (type-O-has-no-antigens-both-antibodies-universal-donor . Rh-positive-has-D-antigen-Rh-negative-lacks-D-antigen)
       (Rh-positive-has-D-antigen-Rh-negative-lacks-D-antigen . Rh-incompatibility-hemolytic-disease-of-newborn)
       (Rh-incompatibility-hemolytic-disease-of-newborn . ABO-mismatch-causes-transfusion-reaction-hemolysis)
       (ABO-mismatch-causes-transfusion-reaction-hemolysis . determines-transfusion-compatibility)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; PHARMACOLOGY
    ;;; Pharmacokinetics (ADME) and pharmacodynamics.
    ;;; SOURCE: [Goodman-Gilman-14th] Ch. 1-3;
    ;;; [Harrison-21st] Ch. 67-69
    ;;; ═══════════════════════════════════════════════════════════

    (pharmacokinetics
      (what-the-body-does-to-the-drug)
      (ADME-absorption-distribution-metabolism-excretion)
      ((what-the-body-does-to-the-drug . absorption-drug-enters-systemic-circulation)
       (absorption-drug-enters-systemic-circulation . bioavailability-fraction-reaching-circulation-IV-is-100-percent)
       (bioavailability-fraction-reaching-circulation-IV-is-100-percent . distribution-drug-distributes-to-tissues)
       (distribution-drug-distributes-to-tissues . volume-of-distribution-Vd-relates-dose-to-plasma-concentration)
       (volume-of-distribution-Vd-relates-dose-to-plasma-concentration . metabolism-primarily-hepatic-cytochrome-P450-enzymes)
       (metabolism-primarily-hepatic-cytochrome-P450-enzymes . phase-I-oxidation-reduction-hydrolysis)
       (phase-I-oxidation-reduction-hydrolysis . phase-II-conjugation-glucuronidation-sulfation)
       (phase-II-conjugation-glucuronidation-sulfation . excretion-primarily-renal-also-biliary-pulmonary)
       (excretion-primarily-renal-also-biliary-pulmonary . ADME-absorption-distribution-metabolism-excretion)))

    (pharmacodynamics
      (what-the-drug-does-to-the-body)
      (drug-receptor-interactions)
      ((what-the-drug-does-to-the-body . agonist-binds-receptor-and-activates-response)
       (agonist-binds-receptor-and-activates-response . antagonist-binds-receptor-and-blocks-response)
       (antagonist-binds-receptor-and-blocks-response . partial-agonist-submaximal-activation)
       (partial-agonist-submaximal-activation . dose-response-curve-sigmoidal-log-dose-vs-effect)
       (dose-response-curve-sigmoidal-log-dose-vs-effect . ED50-dose-producing-50-percent-maximal-effect)
       (ED50-dose-producing-50-percent-maximal-effect . Emax-maximum-achievable-effect)
       (Emax-maximum-achievable-effect . potency-relates-to-ED50-efficacy-relates-to-Emax)
       (potency-relates-to-ED50-efficacy-relates-to-Emax . drug-receptor-interactions)))

    (therapeutic-index
      (ratio-of-toxic-to-therapeutic-dose)
      (TD50-divided-by-ED50)
      ((ratio-of-toxic-to-therapeutic-dose . therapeutic-index-equals-TD50-over-ED50)
       (therapeutic-index-equals-TD50-over-ED50 . high-TI-means-wide-safety-margin)
       (high-TI-means-wide-safety-margin . low-TI-means-narrow-safety-margin-requires-monitoring)
       (low-TI-means-narrow-safety-margin-requires-monitoring . example-low-TI-warfarin-digoxin-lithium-theophylline)
       (example-low-TI-warfarin-digoxin-lithium-theophylline . therapeutic-drug-monitoring-for-narrow-TI-drugs)
       (therapeutic-drug-monitoring-for-narrow-TI-drugs . TD50-divided-by-ED50)))

    (drug-half-life
      (time-for-plasma-concentration-to-decrease-by-50-percent)
      (determines-dosing-interval)
      ((time-for-plasma-concentration-to-decrease-by-50-percent . first-order-elimination-most-drugs)
       (first-order-elimination-most-drugs . constant-fraction-eliminated-per-unit-time)
       (constant-fraction-eliminated-per-unit-time . approximately-4-to-5-half-lives-to-reach-steady-state)
       (approximately-4-to-5-half-lives-to-reach-steady-state . approximately-4-to-5-half-lives-for-elimination)
       (approximately-4-to-5-half-lives-for-elimination . half-life-equals-0.693-times-Vd-divided-by-clearance)
       (half-life-equals-0.693-times-Vd-divided-by-clearance . determines-dosing-interval)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; DIAGNOSTICS
    ;;; Blood tests, imaging, ECG, biopsy.
    ;;; SOURCE: [Harrison-21st] Ch. 418-423, Appendix;
    ;;; [Guyton-14th] Ch. 12
    ;;; ═══════════════════════════════════════════════════════════

    (complete-blood-count
      (CBC)
      (quantifies-blood-cell-populations)
      ((CBC . RBC-count-WBC-count-platelet-count)
       (RBC-count-WBC-count-platelet-count . hemoglobin-and-hematocrit)
       (hemoglobin-and-hematocrit . WBC-differential-neutrophils-lymphocytes-monocytes-eosinophils-basophils)
       (WBC-differential-neutrophils-lymphocytes-monocytes-eosinophils-basophils . MCV-mean-corpuscular-volume-80-to-100-fL)
       (MCV-mean-corpuscular-volume-80-to-100-fL . MCH-MCHC-RDW)
       (MCH-MCHC-RDW . detects-anemia-infection-leukemia-thrombocytopenia)
       (detects-anemia-infection-leukemia-thrombocytopenia . quantifies-blood-cell-populations)))

    (comprehensive-metabolic-panel
      (CMP)
      (assesses-metabolic-and-organ-function)
      ((CMP . glucose-normal-fasting-70-to-100-mg-per-dL)
       (glucose-normal-fasting-70-to-100-mg-per-dL . BUN-and-creatinine-renal-function)
       (BUN-and-creatinine-renal-function . sodium-potassium-chloride-bicarbonate-electrolytes)
       (sodium-potassium-chloride-bicarbonate-electrolytes . calcium-8.5-to-10.5-mg-per-dL)
       (calcium-8.5-to-10.5-mg-per-dL . albumin-total-protein)
       (albumin-total-protein . AST-ALT-ALP-bilirubin-liver-function)
       (AST-ALT-ALP-bilirubin-liver-function . assesses-metabolic-and-organ-function)))

    (medical-imaging
      (non-invasive-visualization-of-internal-structures)
      (X-ray-CT-MRI-ultrasound-PET)
      ((non-invasive-visualization-of-internal-structures . X-ray-projectional-radiography-uses-ionizing-radiation)
       (X-ray-projectional-radiography-uses-ionizing-radiation . dense-structures-appear-white-eg-bone)
       (dense-structures-appear-white-eg-bone . CT-computed-tomography-cross-sectional-X-ray-images)
       (CT-computed-tomography-cross-sectional-X-ray-images . CT-excellent-for-bone-bleeding-lung-pathology)
       (CT-excellent-for-bone-bleeding-lung-pathology . MRI-magnetic-resonance-imaging-uses-magnetic-fields-no-radiation)
       (MRI-magnetic-resonance-imaging-uses-magnetic-fields-no-radiation . MRI-superior-soft-tissue-contrast-brain-spine-joints)
       (MRI-superior-soft-tissue-contrast-brain-spine-joints . ultrasound-uses-sound-waves-no-radiation-real-time)
       (ultrasound-uses-sound-waves-no-radiation-real-time . ultrasound-pregnancy-abdominal-cardiac-echocardiogram)
       (ultrasound-pregnancy-abdominal-cardiac-echocardiogram . PET-positron-emission-tomography-metabolic-activity-FDG)
       (PET-positron-emission-tomography-metabolic-activity-FDG . PET-cancer-staging-neurological-cardiac-assessment)
       (PET-cancer-staging-neurological-cardiac-assessment . X-ray-CT-MRI-ultrasound-PET)))

    (electrocardiogram
      (ECG-or-EKG)
      (records-electrical-activity-of-heart)
      ((ECG-or-EKG . 12-lead-standard-clinical-recording)
       (12-lead-standard-clinical-recording . P-wave-atrial-depolarization)
       (P-wave-atrial-depolarization . PR-interval-conduction-through-AV-node-0.12-to-0.20-seconds)
       (PR-interval-conduction-through-AV-node-0.12-to-0.20-seconds . QRS-complex-ventricular-depolarization-less-than-0.12-seconds)
       (QRS-complex-ventricular-depolarization-less-than-0.12-seconds . ST-segment-ventricular-plateau-phase)
       (ST-segment-ventricular-plateau-phase . T-wave-ventricular-repolarization)
       (T-wave-ventricular-repolarization . ST-elevation-suggests-acute-MI)
       (ST-elevation-suggests-acute-MI . records-electrical-activity-of-heart)))

    (biopsy
      (tissue-sampling-for-histological-examination)
      (definitive-diagnosis-of-cancer-and-tissue-pathology)
      ((tissue-sampling-for-histological-examination . types-excisional-incisional-needle-core-fine-needle-aspiration)
       (types-excisional-incisional-needle-core-fine-needle-aspiration . specimen-fixed-in-formalin-embedded-in-paraffin)
       (specimen-fixed-in-formalin-embedded-in-paraffin . sectioned-stained-H-and-E-examined-microscopically)
       (sectioned-stained-H-and-E-examined-microscopically . pathologist-assesses-cell-morphology-architecture-margins)
       (pathologist-assesses-cell-morphology-architecture-margins . immunohistochemistry-for-specific-markers)
       (immunohistochemistry-for-specific-markers . molecular-testing-for-mutations-eg-EGFR-HER2-BRAF)
       (molecular-testing-for-mutations-eg-EGFR-HER2-BRAF . definitive-diagnosis-of-cancer-and-tissue-pathology)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; COMMON CONDITIONS
    ;;; Hypertension, diabetes, asthma, depression, cancer staging.
    ;;; SOURCE: [Harrison-21st] Parts 8-11;
    ;;; [AJCC-8th] for TNM staging
    ;;; ═══════════════════════════════════════════════════════════

    (hypertension
      (sustained-elevated-blood-pressure)
      (systolic-130-or-greater-or-diastolic-80-or-greater-mmHg)
      ((sustained-elevated-blood-pressure . stage-1-systolic-130-to-139-or-diastolic-80-to-89)
       (stage-1-systolic-130-to-139-or-diastolic-80-to-89 . stage-2-systolic-140-or-greater-or-diastolic-90-or-greater)
       (stage-2-systolic-140-or-greater-or-diastolic-90-or-greater . hypertensive-crisis-systolic-over-180-or-diastolic-over-120)
       (hypertensive-crisis-systolic-over-180-or-diastolic-over-120 . primary-essential-90-to-95-percent-no-identifiable-cause)
       (primary-essential-90-to-95-percent-no-identifiable-cause . secondary-5-to-10-percent-renal-endocrine-vascular)
       (secondary-5-to-10-percent-renal-endocrine-vascular . risk-factor-for-stroke-MI-heart-failure-CKD)
       (risk-factor-for-stroke-MI-heart-failure-CKD . treatment-lifestyle-modification-plus-antihypertensives)
       (treatment-lifestyle-modification-plus-antihypertensives . systolic-130-or-greater-or-diastolic-80-or-greater-mmHg)))

    (diabetes-type-1
      (autoimmune-destruction-of-pancreatic-beta-cells)
      (absolute-insulin-deficiency)
      ((autoimmune-destruction-of-pancreatic-beta-cells . typically-onset-in-childhood-or-adolescence)
       (typically-onset-in-childhood-or-adolescence . 5-to-10-percent-of-all-diabetes-cases)
       (5-to-10-percent-of-all-diabetes-cases . autoantibodies-against-GAD65-IA-2-insulin)
       (autoantibodies-against-GAD65-IA-2-insulin . presents-with-polyuria-polydipsia-weight-loss)
       (presents-with-polyuria-polydipsia-weight-loss . risk-of-diabetic-ketoacidosis-DKA)
       (risk-of-diabetic-ketoacidosis-DKA . requires-lifelong-exogenous-insulin-therapy)
       (requires-lifelong-exogenous-insulin-therapy . absolute-insulin-deficiency)))

    (diabetes-type-2
      (insulin-resistance-with-relative-insulin-deficiency)
      (90-to-95-percent-of-all-diabetes-cases)
      ((insulin-resistance-with-relative-insulin-deficiency . typically-onset-in-adulthood-increasing-in-youth)
       (typically-onset-in-adulthood-increasing-in-youth . strong-genetic-and-lifestyle-risk-factors)
       (strong-genetic-and-lifestyle-risk-factors . obesity-physical-inactivity-family-history)
       (obesity-physical-inactivity-family-history . peripheral-tissues-resistant-to-insulin-action)
       (peripheral-tissues-resistant-to-insulin-action . progressive-beta-cell-dysfunction-over-time)
       (progressive-beta-cell-dysfunction-over-time . fasting-glucose-126-or-greater-or-HbA1c-6.5-percent-or-greater)
       (fasting-glucose-126-or-greater-or-HbA1c-6.5-percent-or-greater . complications-retinopathy-nephropathy-neuropathy-cardiovascular)
       (complications-retinopathy-nephropathy-neuropathy-cardiovascular . treatment-lifestyle-plus-metformin-plus-additional-agents)
       (treatment-lifestyle-plus-metformin-plus-additional-agents . 90-to-95-percent-of-all-diabetes-cases)))

    (asthma
      (chronic-inflammatory-airway-disease)
      (reversible-bronchoconstriction-and-airway-hyperreactivity)
      ((chronic-inflammatory-airway-disease . eosinophilic-inflammation-and-mucus-hypersecretion)
       (eosinophilic-inflammation-and-mucus-hypersecretion . airway-smooth-muscle-contraction-bronchoconstriction)
       (airway-smooth-muscle-contraction-bronchoconstriction . triggers-allergens-exercise-cold-air-infections-irritants)
       (triggers-allergens-exercise-cold-air-infections-irritants . symptoms-wheezing-dyspnea-chest-tightness-cough)
       (symptoms-wheezing-dyspnea-chest-tightness-cough . diagnosis-spirometry-FEV1-FVC-ratio-less-than-0.70-reversible)
       (diagnosis-spirometry-FEV1-FVC-ratio-less-than-0.70-reversible . treatment-inhaled-corticosteroids-plus-beta-2-agonists)
       (treatment-inhaled-corticosteroids-plus-beta-2-agonists . reversible-bronchoconstriction-and-airway-hyperreactivity)))

    (major-depressive-disorder
      (persistent-depressed-mood-or-anhedonia)
      (at-least-5-of-9-DSM-5-criteria-for-2-or-more-weeks)
      ((persistent-depressed-mood-or-anhedonia . criteria-depressed-mood-anhedonia-weight-change-sleep-change)
       (criteria-depressed-mood-anhedonia-weight-change-sleep-change . psychomotor-agitation-or-retardation-fatigue)
       (psychomotor-agitation-or-retardation-fatigue . worthlessness-or-guilt-impaired-concentration-suicidal-ideation)
       (worthlessness-or-guilt-impaired-concentration-suicidal-ideation . monoamine-hypothesis-serotonin-norepinephrine-dopamine)
       (monoamine-hypothesis-serotonin-norepinephrine-dopamine . treatment-SSRIs-SNRIs-psychotherapy-CBT)
       (treatment-SSRIs-SNRIs-psychotherapy-CBT . lifetime-prevalence-approximately-15-to-20-percent)
       (lifetime-prevalence-approximately-15-to-20-percent . at-least-5-of-9-DSM-5-criteria-for-2-or-more-weeks)))

    (cancer-staging-TNM
      (tumor-node-metastasis-classification)
      (determines-extent-of-disease-and-prognosis)
      ((tumor-node-metastasis-classification . AJCC-8th-edition-2017-standard)
       (AJCC-8th-edition-2017-standard . T-primary-tumor-size-and-local-extent)
       (T-primary-tumor-size-and-local-extent . T0-no-primary-tumor-Tis-carcinoma-in-situ-T1-to-T4-increasing-size-invasion)
       (T0-no-primary-tumor-Tis-carcinoma-in-situ-T1-to-T4-increasing-size-invasion . N-regional-lymph-node-involvement)
       (N-regional-lymph-node-involvement . N0-no-nodal-involvement-N1-to-N3-increasing-nodal-burden)
       (N0-no-nodal-involvement-N1-to-N3-increasing-nodal-burden . M-distant-metastasis)
       (M-distant-metastasis . M0-no-distant-metastasis-M1-distant-metastasis-present)
       (M0-no-distant-metastasis-M1-distant-metastasis-present . stage-grouping-I-II-III-IV-from-TNM-combinations)
       (stage-grouping-I-II-III-IV-from-TNM-combinations . determines-extent-of-disease-and-prognosis)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; EMERGENCY MEDICINE
    ;;; CPR, ACLS, shock types.
    ;;; SOURCE: [ACLS-2020]; [AHA-2023]; [Harrison-21st] Ch. 298
    ;;; ═══════════════════════════════════════════════════════════

    (cardiopulmonary-resuscitation
      (CPR)
      (basic-life-support-for-cardiac-arrest)
      ((CPR . check-responsiveness-call-for-help-activate-EMS)
       (check-responsiveness-call-for-help-activate-EMS . CAB-compressions-airway-breathing)
       (CAB-compressions-airway-breathing . chest-compressions-rate-100-to-120-per-minute)
       (chest-compressions-rate-100-to-120-per-minute . compression-depth-at-least-5-cm-in-adults)
       (compression-depth-at-least-5-cm-in-adults . allow-full-chest-recoil-between-compressions)
       (allow-full-chest-recoil-between-compressions . compression-to-ventilation-ratio-30-to-2-without-advanced-airway)
       (compression-to-ventilation-ratio-30-to-2-without-advanced-airway . early-defibrillation-for-VF-pVT)
       (early-defibrillation-for-VF-pVT . basic-life-support-for-cardiac-arrest)))

    (advanced-cardiac-life-support
      (ACLS)
      (systematic-approach-to-cardiac-arrest-and-arrhythmias)
      ((ACLS . shockable-rhythms-VF-pulseless-VT)
       (shockable-rhythms-VF-pulseless-VT . defibrillation-plus-epinephrine-every-3-to-5-minutes)
       (defibrillation-plus-epinephrine-every-3-to-5-minutes . amiodarone-or-lidocaine-for-refractory-VF-pVT)
       (amiodarone-or-lidocaine-for-refractory-VF-pVT . non-shockable-rhythms-asystole-PEA)
       (non-shockable-rhythms-asystole-PEA . epinephrine-every-3-to-5-minutes-no-defibrillation)
       (epinephrine-every-3-to-5-minutes-no-defibrillation . identify-and-treat-reversible-causes-Hs-and-Ts)
       (identify-and-treat-reversible-causes-Hs-and-Ts . Hs-hypovolemia-hypoxia-hydrogen-ion-hypo-hyperkalemia-hypothermia)
       (Hs-hypovolemia-hypoxia-hydrogen-ion-hypo-hyperkalemia-hypothermia . Ts-tension-pneumothorax-tamponade-toxins-thrombosis-PE-MI)
       (Ts-tension-pneumothorax-tamponade-toxins-thrombosis-PE-MI . systematic-approach-to-cardiac-arrest-and-arrhythmias)))

    (shock-hypovolemic
      (inadequate-circulating-volume)
      (most-common-type-of-shock)
      ((inadequate-circulating-volume . causes-hemorrhage-dehydration-burns-third-spacing)
       (causes-hemorrhage-dehydration-burns-third-spacing . decreased-preload-decreased-cardiac-output)
       (decreased-preload-decreased-cardiac-output . tachycardia-hypotension-cold-clammy-skin)
       (tachycardia-hypotension-cold-clammy-skin . low-CVP-low-PCWP)
       (low-CVP-low-PCWP . treatment-IV-fluid-resuscitation-and-blood-products)
       (treatment-IV-fluid-resuscitation-and-blood-products . most-common-type-of-shock)))

    (shock-cardiogenic
      (pump-failure)
      (heart-cannot-generate-adequate-cardiac-output)
      ((pump-failure . causes-acute-MI-cardiomyopathy-valve-failure-arrhythmia)
       (causes-acute-MI-cardiomyopathy-valve-failure-arrhythmia . decreased-cardiac-output-despite-adequate-volume)
       (decreased-cardiac-output-despite-adequate-volume . elevated-CVP-elevated-PCWP)
       (elevated-CVP-elevated-PCWP . pulmonary-edema-jugular-venous-distension)
       (pulmonary-edema-jugular-venous-distension . treatment-inotropes-vasopressors-mechanical-support-treat-cause)
       (treatment-inotropes-vasopressors-mechanical-support-treat-cause . heart-cannot-generate-adequate-cardiac-output)))

    (shock-septic
      (systemic-inflammatory-response-to-infection)
      (distributive-shock-with-vasodilation)
      ((systemic-inflammatory-response-to-infection . cytokine-storm-TNF-alpha-IL-1-IL-6)
       (cytokine-storm-TNF-alpha-IL-1-IL-6 . pathologic-vasodilation-and-capillary-leak)
       (pathologic-vasodilation-and-capillary-leak . warm-flushed-skin-initially-then-cold-and-mottled)
       (warm-flushed-skin-initially-then-cold-and-mottled . low-SVR-high-cardiac-output-initially)
       (low-SVR-high-cardiac-output-initially . treatment-fluids-vasopressors-norepinephrine-first-line-antibiotics)
       (treatment-fluids-vasopressors-norepinephrine-first-line-antibiotics . sepsis-3-criteria-SOFA-score-2-or-greater-with-suspected-infection)
       (sepsis-3-criteria-SOFA-score-2-or-greater-with-suspected-infection . distributive-shock-with-vasodilation)))

    (shock-anaphylactic
      (severe-type-I-hypersensitivity-reaction)
      (distributive-shock-with-rapid-onset)
      ((severe-type-I-hypersensitivity-reaction . IgE-mediated-mast-cell-degranulation)
       (IgE-mediated-mast-cell-degranulation . massive-histamine-release)
       (massive-histamine-release . vasodilation-bronchoconstriction-laryngeal-edema)
       (vasodilation-bronchoconstriction-laryngeal-edema . urticaria-angioedema-hypotension-within-minutes)
       (urticaria-angioedema-hypotension-within-minutes . triggers-foods-drugs-insect-stings-latex)
       (triggers-foods-drugs-insect-stings-latex . treatment-epinephrine-IM-0.3-to-0.5-mg-first-line)
       (treatment-epinephrine-IM-0.3-to-0.5-mg-first-line . adjuncts-IV-fluids-antihistamines-corticosteroids-albuterol)
       (adjuncts-IV-fluids-antihistamines-corticosteroids-albuterol . distributive-shock-with-rapid-onset)))


    ;;; ═══════════════════════════════════════════════════════════
    ;;; NUTRITION
    ;;; Macronutrients, micronutrients, BMR.
    ;;; SOURCE: [Guyton-14th] Ch. 72-73;
    ;;; [Harrison-21st] Ch. 330;
    ;;; [Harris-Benedict-1918]
    ;;; ═══════════════════════════════════════════════════════════

    (macronutrients
      (energy-yielding-nutrients)
      (protein-carbohydrates-fat)
      ((energy-yielding-nutrients . protein-4-kcal-per-gram)
       (protein-4-kcal-per-gram . composed-of-amino-acids-essential-and-nonessential)
       (composed-of-amino-acids-essential-and-nonessential . functions-structural-enzymatic-immunological)
       (functions-structural-enzymatic-immunological . carbohydrates-4-kcal-per-gram)
       (carbohydrates-4-kcal-per-gram . primary-energy-source-glucose-for-brain-and-RBCs)
       (primary-energy-source-glucose-for-brain-and-RBCs . fat-9-kcal-per-gram)
       (fat-9-kcal-per-gram . most-energy-dense-macronutrient)
       (most-energy-dense-macronutrient . essential-fatty-acids-linoleic-and-alpha-linolenic)
       (essential-fatty-acids-linoleic-and-alpha-linolenic . protein-carbohydrates-fat)))

    (micronutrients
      (vitamins-and-minerals)
      (required-in-small-amounts-for-metabolic-functions)
      ((vitamins-and-minerals . fat-soluble-vitamins-A-D-E-K)
       (fat-soluble-vitamins-A-D-E-K . water-soluble-vitamins-C-B-complex)
       (water-soluble-vitamins-C-B-complex . vitamin-A-vision-immune-function)
       (vitamin-A-vision-immune-function . vitamin-D-calcium-absorption-bone-health)
       (vitamin-D-calcium-absorption-bone-health . vitamin-K-coagulation-factor-synthesis)
       (vitamin-K-coagulation-factor-synthesis . minerals-calcium-iron-zinc-magnesium-sodium-potassium)
       (minerals-calcium-iron-zinc-magnesium-sodium-potassium . iron-hemoglobin-synthesis-deficiency-causes-anemia)
       (iron-hemoglobin-synthesis-deficiency-causes-anemia . required-in-small-amounts-for-metabolic-functions)))

    (basal-metabolic-rate
      (BMR)
      (minimum-energy-expenditure-at-rest)
      ((BMR . Harris-Benedict-equation-1918)
       (Harris-Benedict-equation-1918 . male-BMR-equals-88.362-plus-13.397-times-weight-kg-plus-4.799-times-height-cm-minus-5.677-times-age-years)
       (male-BMR-equals-88.362-plus-13.397-times-weight-kg-plus-4.799-times-height-cm-minus-5.677-times-age-years . female-BMR-equals-447.593-plus-9.247-times-weight-kg-plus-3.098-times-height-cm-minus-4.330-times-age-years)
       (female-BMR-equals-447.593-plus-9.247-times-weight-kg-plus-3.098-times-height-cm-minus-4.330-times-age-years . accounts-for-60-to-75-percent-of-total-daily-energy-expenditure)
       (accounts-for-60-to-75-percent-of-total-daily-energy-expenditure . influenced-by-age-sex-lean-body-mass-thyroid-status)
       (influenced-by-age-sex-lean-body-mass-thyroid-status . total-energy-expenditure-equals-BMR-plus-activity-plus-thermic-effect-of-food)
       (total-energy-expenditure-equals-BMR-plus-activity-plus-thermic-effect-of-food . minimum-energy-expenditure-at-rest)))

  )

  ((Grays-42nd-Harrison-21st-Guyton-14th . medicine-registered)))
