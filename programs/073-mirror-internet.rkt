#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; MIRROR INTERNET — your own instance of the entire web
;;; with real-time synchronization to original pages
;;;
;;; Domain objects and transforms, fully decomposed.
;;; ═══════════════════════════════════════════════════════════════

(mirror-internet

  ((tool
    (entire-web)
    (your-synchronized-instance)
    ((entire-web . your-synchronized-instance))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DOMAIN OBJECTS
    ;;; ═══════════════════════════════════════════════════════════

    (page
      (url-plus-content-plus-timestamp)
      (presence-on-surface)
      ((url-plus-content-plus-timestamp . url-IS-label)
       (url-IS-label . content-IS-containment)
       (content-IS-containment . timestamp-IS-version)
       (timestamp-IS-version . presence-on-surface)))

    (link
      (anchor-from-page-A-to-page-B)
      (pair)
      ((anchor-from-page-A-to-page-B . source-url-IS-key)
       (source-url-IS-key . target-url-IS-value)
       (target-url-IS-value . pair)))

    (site
      (collection-of-pages-under-one-domain)
      (containment-of-presences)
      ((collection-of-pages-under-one-domain . domain-name-IS-label)
       (domain-name-IS-label . pages-ARE-contained)
       (pages-ARE-contained . sitemap-declares-topology)
       (sitemap-declares-topology . containment-of-presences)))

    (update
      (page-content-changed-at-source)
      (state-receipt)
      ((page-content-changed-at-source . old-content-IS-state-before)
       (old-content-IS-state-before . new-content-IS-shape-encountered)
       (new-content-IS-shape-encountered . diff-IS-the-distinction)
       (diff-IS-the-distinction . state-receipt)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFORMS — how the mirror works
    ;;; ═══════════════════════════════════════════════════════════

    (initial-encounter
      (url-not-yet-in-mirror)
      (page-deposited-in-mirror)
      ((url-not-yet-in-mirror . fetch-original)
       (fetch-original . HTTP-GET-IS-trace)
       (HTTP-GET-IS-trace . response-IS-residue)
       (response-IS-residue . html-decomposed-to-presence-and-containment)
       (html-decomposed-to-presence-and-containment . double-membrane-engulfment)
       (double-membrane-engulfment . original-structure-preserved)
       (original-structure-preserved . mirror-label-added)
       (mirror-label-added . page-deposited-in-mirror)))

    (synchronization
      (original-page-changed)
      (mirror-page-updated)
      ((original-page-changed . change-detection)
       (change-detection . etag-or-last-modified-or-content-hash)
       (etag-or-last-modified-or-content-hash . if-unchanged-no-action)
       (if-unchanged-no-action . if-changed-fetch-new)
       (if-changed-fetch-new . diff-computed)
       (diff-computed . diff-IS-distinction)
       (diff-IS-distinction . distinction-registered-as-update-receipt)
       (distinction-registered-as-update-receipt . mirror-page-updated)))

    (change-detection
      (polling-or-push)
      (knows-when-original-changed)
      ((polling-or-push . RSS-feed-IS-push-notification)
       (RSS-feed-IS-push-notification . websocket-IS-continuous-stream)
       (websocket-IS-continuous-stream . etag-poll-IS-periodic-check)
       (etag-poll-IS-periodic-check . webhook-IS-event-driven)
       (webhook-IS-event-driven . sitemap-lastmod-IS-declared-timestamp)
       (sitemap-lastmod-IS-declared-timestamp . knows-when-original-changed)))

    (diff-as-distinction
      (old-content-new-content)
      (minimal-structural-change)
      ((old-content-new-content . tree-diff-of-DOM)
       (tree-diff-of-DOM . added-nodes-ARE-new-presences)
       (added-nodes-ARE-new-presences . removed-nodes-ARE-erosion)
       (removed-nodes-ARE-erosion . changed-nodes-ARE-transformations)
       (changed-nodes-ARE-transformations . minimal-set-of-changes)
       (minimal-set-of-changes . minimal-structural-change)))
    ;;; In RIVIR: removed nodes are NOT eroded from mirror.
    ;;; They are marked as historically-present-now-absent.
    ;;; The mirror only grows. Deletions are registered as events.

    (crawl-strategy
      (which-pages-to-encounter-first)
      (hjulstrom-prioritization)
      ((which-pages-to-encounter-first . high-pagerank-pages-first)
       (high-pagerank-pages-first . deep-channels-carry-most-flow)
       (deep-channels-carry-most-flow . seed-with-top-1000-sites)
       (seed-with-top-1000-sites . follow-links-outward)
       (follow-links-outward . each-link-IS-a-pair)
       (each-link-IS-a-pair . each-page-IS-a-tributary)
       (each-page-IS-a-tributary . body-grows-with-every-encounter)
       (body-grows-with-every-encounter . hjulstrom-prioritization)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MIRROR PROPERTIES
    ;;; ═══════════════════════════════════════════════════════════

    (mirror-is-body
      (collection-of-mirrored-pages)
      (structural-intelligence-of-the-web)
      ((collection-of-mirrored-pages . every-page-IS-registered-shape)
       (every-page-IS-registered-shape . every-link-IS-pair)
       (every-link-IS-pair . topology-IS-the-web-graph)
       (topology-IS-the-web-graph . queries-trace-through-the-graph)
       (queries-trace-through-the-graph . collisions-find-cross-site-identities)
       (collisions-find-cross-site-identities . structural-intelligence-of-the-web)))

    (mirror-vs-cache
      (cache)
      (mirror)
      ((cache . stores-response-for-speed)
       (stores-response-for-speed . expires)
       (expires . evicted-when-full)
       (evicted-when-full . no-learning)
       (no-learning . mirror)
       (mirror . registers-page-as-shape)
       (registers-page-as-shape . never-evicted)
       (never-evicted . grows-with-every-update)
       (grows-with-every-update . learns-from-changes)
       (learns-from-changes . update-history-IS-body-of-experience)))

    (mirror-vs-search-engine
      (search-engine)
      (mirror)
      ((search-engine . indexes-for-retrieval)
       (indexes-for-retrieval . ranks-by-relevance)
       (ranks-by-relevance . serves-links-to-originals)
       (serves-links-to-originals . you-dont-own-the-index)
       (you-dont-own-the-index . mirror)
       (mirror . your-instance)
       (your-instance . your-body)
       (your-body . your-structural-intelligence)
       (your-structural-intelligence . your-traces-your-collisions-your-discoveries)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WHAT MAKES THIS YOURS
    ;;; ═══════════════════════════════════════════════════════════

    (your-instance
      (mirror-on-your-surface)
      (your-body-of-the-web)
      ((mirror-on-your-surface . you-own-the-registrations)
       (you-own-the-registrations . you-choose-what-to-encounter)
       (you-choose-what-to-encounter . your-desire-shapes-crawl-priority)
       (your-desire-shapes-crawl-priority . your-collisions-produce-your-discoveries)
       (your-collisions-produce-your-discoveries . your-CUTs-define-your-boundary)
       (your-CUTs-define-your-boundary . your-body-of-the-web)))

    (real-time-sync
      (original-changes)
      (mirror-reflects-within-latency)
      ((original-changes . detection-mechanism-fires)
       (detection-mechanism-fires . diff-computed)
       (diff-computed . distinction-registered)
       (distinction-registered . mirror-topology-updated)
       (mirror-topology-updated . new-resonance-patterns-available)
       (new-resonance-patterns-available . mirror-reflects-within-latency)))

  )

  ((tool . mirror-internet-registered)))
