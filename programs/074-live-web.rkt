#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; LIVE WEB — the internet as a live-updating aspect of the body
;;;
;;; Domain objects and transforms. Registered. Demonstrable.
;;; ═══════════════════════════════════════════════════════════════

(live-web

  ((web
    (browser-encounters-pages)
    (body-grows-continuously)
    ((browser-encounters-pages . body-grows-continuously))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DOMAIN OBJECTS
    ;;; ═══════════════════════════════════════════════════════════

    (page-encounter
      (URL-loaded-in-browser)
      (shapes-deposited-in-body)
      ((URL-loaded-in-browser . DOM-parsed-by-browser)
       (DOM-parsed-by-browser . DOM-IS-nested-containment)
       (DOM-IS-nested-containment . headings-ARE-labels)
       (headings-ARE-labels . links-ARE-pairs)
       (links-ARE-pairs . text-nodes-ARE-atoms)
       (text-nodes-ARE-atoms . shapes-deposited-in-body)))

    (link-as-pair
      (anchor-element)
      (source-dot-target)
      ((anchor-element . text-content-IS-source)
       (text-content-IS-source . href-IS-target)
       (href-IS-target . source-dot-target)))

    (heading-as-label
      (h1-through-h6)
      (label-at-nesting-depth)
      ((h1-through-h6 . tag-level-IS-depth)
       (tag-level-IS-depth . text-content-IS-label-name)
       (text-content-IS-label-name . sections-below-ARE-containment)
       (sections-below-ARE-containment . label-at-nesting-depth)))

    (update-as-state-receipt
      (page-content-changed)
      (S1-shape-S2)
      ((page-content-changed . browser-detects-new-content)
       (browser-detects-new-content . diff-IS-the-distinction)
       (diff-IS-the-distinction . old-state-IS-S1)
       (old-state-IS-S1 . new-shapes-IS-encounter)
       (new-shapes-IS-encounter . new-state-IS-S2)
       (new-state-IS-S2 . S1-shape-S2)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; TRANSFORMS
    ;;; ═══════════════════════════════════════════════════════════

    (encounter-on-load
      (browser-fires-DOMContentLoaded)
      (body-receives-page-shapes)
      ((browser-fires-DOMContentLoaded . single-event-IS-single-strike)
       (single-event-IS-single-strike . querySelectorAll-extracts-shapes)
       (querySelectorAll-extracts-shapes . each-heading-registered-as-label)
       (each-heading-registered-as-label . each-link-registered-as-pair)
       (each-link-registered-as-pair . body-receives-page-shapes)))

    (live-update-via-MutationObserver
      (DOM-changes-after-load)
      (body-receives-incremental-shapes)
      ((DOM-changes-after-load . MutationObserver-fires-on-change)
       (MutationObserver-fires-on-change . added-nodes-ARE-new-shapes)
       (added-nodes-ARE-new-shapes . removed-nodes-ARE-state-receipt)
       (removed-nodes-ARE-state-receipt . changed-text-IS-distinction)
       (changed-text-IS-distinction . body-receives-incremental-shapes)))

    (cross-page-collision
      (two-pages-in-body)
      (daughter-particles-between-sites)
      ((two-pages-in-body . page-A-atoms-through-page-B-pairs)
       (page-A-atoms-through-page-B-pairs . trace-finds-shared-structure)
       (trace-finds-shared-structure . reverse-direction-confirms)
       (reverse-direction-confirms . daughter-particles-between-sites)))

    (body-persistence
      (IndexedDB-in-browser)
      (body-survives-tab-close)
      ((IndexedDB-in-browser . key-value-store-in-browser)
       (key-value-store-in-browser . pairs-stored-as-records)
       (pairs-stored-as-records . no-server-needed)
       (no-server-needed . opens-same-body-next-session)
       (opens-same-body-next-session . body-survives-tab-close)))

  )

  ((web . live-web-registered)))
