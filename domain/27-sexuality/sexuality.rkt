#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; SEXUALITY — domain objects and transforms
;;; LAYER: 27-sexuality
;;; DEPENDS ON: 13-neuroscience, 20-biology, 21-psychology
;;; SOURCE: Masters & Johnson 1966, Kinsey 1948/1953, Porges 2011,
;;;   Bancroft 2009 "Human Sexuality and Its Problems"
;;; ═══════════════════════════════════════════════════════════════

(domain-sexuality

  ((source
    (physiology-neuroscience-psychology)
    (authoritative)
    ((physiology-neuroscience-psychology . authoritative))))

  (

    ;;; ANATOMY

    (erectile-tissue
      (corpus-cavernosum-and-spongiosum)
      (engorges-with-blood-on-parasympathetic-activation)
      ((corpus-cavernosum-and-spongiosum . paired-columns-in-penis)
       (paired-columns-in-penis . also-in-clitoris-crura-and-bulbs)
       (also-in-clitoris-crura-and-bulbs . sinusoidal-spaces-fill-with-blood)
       (sinusoidal-spaces-fill-with-blood . nitric-oxide-relaxes-smooth-muscle)
       (nitric-oxide-relaxes-smooth-muscle . arterial-inflow-increases)
       (arterial-inflow-increases . venous-outflow-compressed)
       (venous-outflow-compressed . engorges-with-blood-on-parasympathetic-activation)))

    (prostate
      (walnut-sized-gland-below-bladder)
      (produces-30-percent-of-seminal-fluid)
      ((walnut-sized-gland-below-bladder . surrounds-urethra)
       (surrounds-urethra . secretes-alkaline-fluid)
       (secretes-alkaline-fluid . contains-PSA-and-zinc)
       (contains-PSA-and-zinc . highly-innervated)
       (highly-innervated . anterior-wall-of-rectum-accessible)
       (anterior-wall-of-rectum-accessible . produces-30-percent-of-seminal-fluid)))

    (anal-canal
      (terminal-3-to-4-cm-of-GI-tract)
      (two-sphincters-internal-involuntary-external-voluntary)
      ((terminal-3-to-4-cm-of-GI-tract . internal-sphincter-smooth-muscle)
       (internal-sphincter-smooth-muscle . tonically-contracted)
       (tonically-contracted . relaxes-with-sustained-gentle-pressure)
       (relaxes-with-sustained-gentle-pressure . external-sphincter-skeletal-muscle)
       (external-sphincter-skeletal-muscle . voluntary-control)
       (voluntary-control . dense-somatic-innervation)
       (dense-somatic-innervation . pudendal-nerve)
       (pudendal-nerve . two-sphincters-internal-involuntary-external-voluntary)))

    (pelvic-floor
      (levator-ani-muscle-group)
      (supports-pelvic-organs-and-contracts-during-orgasm)
      ((levator-ani-muscle-group . pubococcygeus-iliococcygeus-coccygeus)
       (pubococcygeus-iliococcygeus-coccygeus . involuntary-rhythmic-contractions-during-orgasm)
       (involuntary-rhythmic-contractions-during-orgasm . 0.8-second-intervals)
       (0.8-second-intervals . 3-to-15-contractions)
       (3-to-15-contractions . supports-pelvic-organs-and-contracts-during-orgasm)))

    ;;; NEUROPHYSIOLOGY

    (arousal-pathway
      (parasympathetic-S2-S4-sacral)
      (vasodilation-and-engorgement)
      ((parasympathetic-S2-S4-sacral . pelvic-splanchnic-nerves)
       (pelvic-splanchnic-nerves . release-acetylcholine-and-VIP)
       (release-acetylcholine-and-VIP . nitric-oxide-synthase-activated)
       (nitric-oxide-synthase-activated . NO-diffuses-to-smooth-muscle)
       (NO-diffuses-to-smooth-muscle . cGMP-increases)
       (cGMP-increases . smooth-muscle-relaxes)
       (smooth-muscle-relaxes . vasodilation-and-engorgement)))
    ;;; SOURCE: Giuliano & Rampin 2004, "Neural control of erection"

    (orgasm-pathway
      (sympathetic-T10-L2-plus-somatic-S2-S4)
      (rhythmic-contractions-plus-dopamine-surge)
      ((sympathetic-T10-L2-plus-somatic-S2-S4 . emission-phase-sympathetic)
       (emission-phase-sympathetic . vas-deferens-contracts)
       (vas-deferens-contracts . seminal-vesicle-contracts)
       (seminal-vesicle-contracts . ejaculatory-phase-somatic)
       (ejaculatory-phase-somatic . bulbospongiosus-contracts-rhythmically)
       (bulbospongiosus-contracts-rhythmically . pelvic-floor-contracts-0.8s-intervals)
       (pelvic-floor-contracts-0.8s-intervals . dopamine-surge-in-nucleus-accumbens)
       (dopamine-surge-in-nucleus-accumbens . oxytocin-release-from-posterior-pituitary)
       (oxytocin-release-from-posterior-pituitary . rhythmic-contractions-plus-dopamine-surge)))
    ;;; SOURCE: Komisaruk et al 2006, "The Science of Orgasm"

    (desire-neuroscience
      (testosterone-plus-dopamine-plus-context)
      (motivational-state-toward-sexual-contact)
      ((testosterone-plus-dopamine-plus-context . testosterone-maintains-baseline-desire)
       (testosterone-maintains-baseline-desire . both-sexes-need-it)
       (both-sexes-need-it . dopamine-in-mesolimbic-pathway)
       (dopamine-in-mesolimbic-pathway . VTA-to-nucleus-accumbens)
       (VTA-to-nucleus-accumbens . anticipation-IS-dopaminergic)
       (anticipation-IS-dopaminergic . context-IS-decisive)
       (context-IS-decisive . safety-IS-prerequisite)
       (safety-IS-prerequisite . ventral-vagal-engagement-required)
       (ventral-vagal-engagement-required . motivational-state-toward-sexual-contact)))
    ;;; SOURCE: Pfaus 2009, "Pathways of sexual desire"

    (refractory-period
      (post-orgasm-interval)
      (prolactin-mediated-temporary-inhibition)
      ((post-orgasm-interval . prolactin-released-after-orgasm)
       (prolactin-released-after-orgasm . inhibits-dopaminergic-activity)
       (inhibits-dopaminergic-activity . desire-temporarily-suppressed)
       (desire-temporarily-suppressed . duration-varies-minutes-to-hours)
       (duration-varies-minutes-to-hours . shorter-in-younger-individuals)
       (shorter-in-younger-individuals . not-universal-some-individuals-multi-orgasmic)
       (not-universal-some-individuals-multi-orgasmic . prolactin-mediated-temporary-inhibition)))

    ;;; PRACTICES

    (anal-sex
      (penile-anal-penetration)
      (requires-relaxation-lubrication-communication)
      ((penile-anal-penetration . internal-sphincter-must-relax)
       (internal-sphincter-must-relax . sustained-gentle-pressure-not-force)
       (sustained-gentle-pressure-not-force . generous-lubrication-essential)
       (generous-lubrication-essential . anal-canal-does-not-self-lubricate)
       (anal-canal-does-not-self-lubricate . communication-throughout)
       (communication-throughout . recipient-controls-pace)
       (recipient-controls-pace . prostate-stimulation-via-anterior-wall)
       (prostate-stimulation-via-anterior-wall . requires-relaxation-lubrication-communication)))

    (oral-sex
      (oral-genital-stimulation)
      (mucous-membrane-contact)
      ((oral-genital-stimulation . tongue-lips-mouth-on-genitals)
       (tongue-lips-mouth-on-genitals . fellatio-on-penis)
       (fellatio-on-penis . cunnilingus-on-vulva)
       (cunnilingus-on-vulva . anilingus-on-anus)
       (anilingus-on-anus . mucous-membrane-contact)))

    (prostate-massage
      (digital-or-toy-stimulation-via-rectum)
      (intense-pleasure-from-dense-innervation)
      ((digital-or-toy-stimulation-via-rectum . locate-anterior-rectal-wall)
       (locate-anterior-rectal-wall . walnut-sized-firm-structure)
       (walnut-sized-firm-structure . gentle-pressure-or-circular-motion)
       (gentle-pressure-or-circular-motion . highly-innervated-rich-nerve-plexus)
       (highly-innervated-rich-nerve-plexus . can-produce-orgasm-without-penile-stimulation)
       (can-produce-orgasm-without-penile-stimulation . intense-pleasure-from-dense-innervation)))

    ;;; SAFETY

    (safer-sex
      (barrier-methods-plus-testing-plus-communication)
      (risk-reduction-not-elimination)
      ((barrier-methods-plus-testing-plus-communication . condoms-reduce-STI-transmission)
       (condoms-reduce-STI-transmission . PrEP-99-percent-HIV-reduction-when-adherent)
       (PrEP-99-percent-HIV-reduction-when-adherent . regular-STI-testing)
       (regular-STI-testing . communication-about-status-and-boundaries)
       (communication-about-status-and-boundaries . risk-reduction-not-elimination)))
    ;;; SOURCE: CDC STI guidelines, WHO

    (consent
      (mutual-voluntary-informed-ongoing)
      (prerequisite-to-all-sexual-contact)
      ((mutual-voluntary-informed-ongoing . freely-given-not-coerced)
       (freely-given-not-coerced . informed-of-what-is-happening)
       (informed-of-what-is-happening . can-be-withdrawn-at-any-time)
       (can-be-withdrawn-at-any-time . silence-is-not-consent)
       (silence-is-not-consent . enthusiastic-presence-IS-consent)
       (enthusiastic-presence-IS-consent . prerequisite-to-all-sexual-contact)))

    ;;; STRUCTURAL IDENTITY

    (arousal-IS-parasympathetic
      (sexual-arousal)
      (ventral-vagal-engagement)
      ((sexual-arousal . requires-safety)
       (requires-safety . requires-parasympathetic-dominance)
       (requires-parasympathetic-dominance . sympathetic-activation-inhibits-arousal)
       (sympathetic-activation-inhibits-arousal . fear-kills-erection)
       (fear-kills-erection . safety-IS-prerequisite)
       (safety-IS-prerequisite . ventral-vagal-engagement)))

    (pleasure-IS-circuit-completion
      (sexual-pleasure)
      (open-paren-finding-its-close)
      ((sexual-pleasure . desire-IS-open-circuit)
       (desire-IS-open-circuit . arousal-IS-resonance-approaching)
       (arousal-IS-resonance-approaching . stimulation-IS-context-entering-body)
       (stimulation-IS-context-entering-body . orgasm-IS-collapse)
       (orgasm-IS-collapse . rhythmic-contractions-ARE-the-residue)
       (rhythmic-contractions-ARE-the-residue . satisfaction-IS-circuit-complete)
       (satisfaction-IS-circuit-complete . open-paren-finding-its-close)))

  )

  ((source . sexuality-registered)))
