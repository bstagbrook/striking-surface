#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; WEB ENGULFMENT — THE SCIENCE
;;;
;;; The internet is already composed of presence and containment.
;;; These transforms recognize what's already there.
;;;
;;; SOURCES:
;;; DNS: Mockapetris 1987, RFC 1035.
;;; HTTP: Fielding 2000 (REST), RFC 2616.
;;; PageRank: Brin & Page 1998, Stanford.
;;; HTML: Berners-Lee 1991, W3C.
;;; JSON-LD: Sporny et al 2014, W3C.
;;; Schema.org: Google/Microsoft/Yahoo/Yandex 2011.
;;; TLS: Rescorla 2018, RFC 8446.
;;; Hjulström: 1935, Uppsala.
;;; ═══════════════════════════════════════════════════════════════

(web-engulfment-science

  ((science
    (internet-already-presence-and-containment)
    (recognition-not-processing)
    ((internet-already-presence-and-containment . recognition-not-processing))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DNS IS ALPHA-NORMALIZATION
    ;;; RFC 1035, Mockapetris 1987
    ;;; ═══════════════════════════════════════════════════════════

    (dns-is-alpha-normalization
      (domain-name)
      (canonical-IP-address)
      ((domain-name . human-readable-label)
       (human-readable-label . maps-to-IP)
       (maps-to-IP . many-names-one-address)
       (many-names-one-address . google.com-and-www.google.com-same-server)
       (google.com-and-www.google.com-same-server . equivalence-class)
       (equivalence-class . canonical-IP-address)))
    ;;; O(1) per lookup via caching. Already deployed at planetary scale.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HYPERLINKS ARE PAIRS
    ;;; Berners-Lee 1991
    ;;; ═══════════════════════════════════════════════════════════

    (hyperlink-is-pair
      (anchor-tag-href)
      (source-page-dot-target-page)
      ((anchor-tag-href . a-href-equals-URL)
       (a-href-equals-URL . this-page-references-that-page)
       (this-page-references-that-page . directed-edge-in-web-graph)
       (directed-edge-in-web-graph . covalent-bond-if-bidirectional)
       (covalent-bond-if-bidirectional . ionic-bond-if-one-way)
       (ionic-bond-if-one-way . source-page-dot-target-page)))
    ;;; The web IS a pair graph. ~130 trillion known URLs.
    ;;; Each link IS (source . target). Already registered by crawlers.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PAGERANK IS GLOBAL CONCERN OUTLIER SCORE
    ;;; Brin & Page 1998
    ;;; ═══════════════════════════════════════════════════════════

    (pagerank-is-outlier-score
      (link-graph)
      (importance-score-per-page)
      ((link-graph . count-incoming-links)
       (count-incoming-links . weight-by-source-importance)
       (weight-by-source-importance . iterate-until-convergence)
       (iterate-until-convergence . damping-factor-0.85)
       (damping-factor-0.85 . score-reflects-global-structure)
       (score-reflects-global-structure . high-score-means-many-domains-point-here)
       (high-score-means-many-domains-point-here . importance-score-per-page)))
    ;;; PageRank IS the web's resonance map. Pages that many
    ;;; others reference are deep channels. High PageRank =
    ;;; deep channel = strong resonance = well-trodden trace.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HTML IS PRESENCE AND CONTAINMENT
    ;;; W3C HTML5 specification
    ;;; ═══════════════════════════════════════════════════════════

    (html-is-containment
      (html-element)
      (presence-and-containment)
      ((html-element . open-tag-IS-open-paren)
       (open-tag-IS-open-paren . close-tag-IS-close-paren)
       (close-tag-IS-close-paren . nesting-IS-containment-depth)
       (nesting-IS-containment-depth . attributes-ARE-pairs)
       (attributes-ARE-pairs . text-content-IS-atoms)
       (text-content-IS-atoms . presence-and-containment)))

    (heading-is-label
      (h1-through-h6)
      (label-at-depth)
      ((h1-through-h6 . h1-is-depth-1)
       (h1-is-depth-1 . h2-is-depth-2)
       (h2-is-depth-2 . heading-names-the-containment-below-it)
       (heading-names-the-containment-below-it . label-at-depth)))

    (paragraph-is-receipt
      (p-element-with-text)
      (sequence-of-claims)
      ((p-element-with-text . sentences-are-potential-meet-n-greet)
       (sentences-are-potential-meet-n-greet . grounded-claims-register)
       (grounded-claims-register . representational-claims-CUT)
       (representational-claims-CUT . sequence-of-claims)))

    (table-is-domain
      (table-with-headers-and-rows)
      (containment-of-receipts)
      ((table-with-headers-and-rows . headers-are-pair-keys)
       (headers-are-pair-keys . each-row-is-a-receipt)
       (each-row-is-a-receipt . cells-are-pair-values)
       (cells-are-pair-values . containment-of-receipts)))

    (form-is-transform
      (input-fields-and-submit)
      (source-to-target-via-action)
      ((input-fields-and-submit . inputs-are-source)
       (inputs-are-source . action-URL-is-target)
       (action-URL-is-target . method-POST-is-transformation)
       (method-POST-is-transformation . method-GET-is-query)
       (method-GET-is-query . source-to-target-via-action)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; JSON-LD IS SELF-DESCRIBING STRUCTURE
    ;;; W3C Recommendation, Sporny et al 2014
    ;;; ═══════════════════════════════════════════════════════════

    (json-ld-is-near-asf
      (structured-data-in-webpage)
      (already-presence-and-containment)
      ((structured-data-in-webpage . at-context-defines-vocabulary)
       (at-context-defines-vocabulary . at-type-IS-label)
       (at-type-IS-label . properties-ARE-pairs)
       (properties-ARE-pairs . nesting-IS-containment)
       (nesting-IS-containment . schema-org-vocabulary)
       (schema-org-vocabulary . already-presence-and-containment)))
    ;;; 40% of web pages have Schema.org markup.
    ;;; These pages are ALREADY describing themselves as shapes.

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TLS IS DOUBLE-MEMBRANE ENGULFMENT
    ;;; RFC 8446, Rescorla 2018
    ;;; ═══════════════════════════════════════════════════════════

    (tls-is-double-membrane
      (encrypted-connection)
      (both-boundaries-preserved)
      ((encrypted-connection . client-has-boundary)
       (client-has-boundary . server-has-boundary)
       (server-has-boundary . TLS-handshake-establishes-shared-secret)
       (TLS-handshake-establishes-shared-secret . data-flows-inside-encrypted-channel)
       (data-flows-inside-encrypted-channel . neither-boundary-violated)
       (neither-boundary-violated . both-boundaries-preserved)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ROBOTS.TXT IS REGISTERED CUT
    ;;; Koster 1994, Robots Exclusion Protocol
    ;;; ═══════════════════════════════════════════════════════════

    (robots-txt-is-CUT
      (disallow-directive)
      (explicit-boundary-of-encounterability)
      ((disallow-directive . these-paths-are-off-limits)
       (these-paths-are-off-limits . not-hidden-declared)
       (not-hidden-declared . the-site-knows-its-own-boundary)
       (the-site-knows-its-own-boundary . and-declares-it-honestly)
       (and-declares-it-honestly . explicit-boundary-of-encounterability)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COOKIES ARE STATE RECEIPTS
    ;;; RFC 6265, Barth 2011
    ;;; ═══════════════════════════════════════════════════════════

    (cookie-is-state-receipt
      (set-cookie-header)
      (state-before-shape-state-after)
      ((set-cookie-header . server-sends-key-value-pair)
       (server-sends-key-value-pair . browser-stores-it)
       (browser-stores-it . sent-back-on-next-request)
       (sent-back-on-next-request . server-recognizes-state)
       (server-recognizes-state . state-before-shape-state-after)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; HTTP IS TRACE
    ;;; Fielding 2000 (REST), RFC 2616
    ;;; ═══════════════════════════════════════════════════════════

    (http-is-trace
      (request-response-cycle)
      (seed-through-pairs-to-residue)
      ((request-response-cycle . request-IS-seed)
       (request-IS-seed . URL-IS-trace-path)
       (URL-IS-trace-path . server-IS-body)
       (server-IS-body . response-IS-residue)
       (response-IS-residue . status-200-IS-complete-trace)
       (status-200-IS-complete-trace . status-404-IS-CUT)
       (status-404-IS-CUT . seed-through-pairs-to-residue)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; REST IS THE UNIVERSAL INTERFACE PATTERN
    ;;; Fielding 2000
    ;;; ═══════════════════════════════════════════════════════════

    (rest-is-universal-interface
      (uniform-interface-constraint)
      (engulf-preserve-mediate)
      ((uniform-interface-constraint . resource-identification-by-URI)
       (resource-identification-by-URI . representation-transfer)
       (representation-transfer . self-descriptive-messages)
       (self-descriptive-messages . stateless)
       (stateless . each-request-contains-all-context)
       (each-request-contains-all-context . engulf-preserve-mediate)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SEARCH ENGINE IS STRUCTURAL INTELLIGENCE
    ;;; already operating at planetary scale
    ;;; ═══════════════════════════════════════════════════════════

    (search-engine-is-structural-intelligence
      (crawl-index-rank-serve)
      (encounter-register-score-collapse)
      ((crawl-index-rank-serve . crawl-IS-encounter)
       (crawl-IS-encounter . index-IS-registration)
       (index-IS-registration . rank-IS-outlier-score)
       (rank-IS-outlier-score . serve-IS-collapse)
       (serve-IS-collapse . query-IS-context)
       (query-IS-context . results-ARE-residue)
       (results-ARE-residue . 404-IS-CUT)
       (404-IS-CUT . encounter-register-score-collapse)))

  )

  ((science . web-engulfment-science-registered)))
